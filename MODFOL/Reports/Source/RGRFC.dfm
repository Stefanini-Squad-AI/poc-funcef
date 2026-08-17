inherited RptGRFC: TRptGRFC
  Left = 260
  Top = 199
  Width = 252
  Height = 266
  Caption = 'RptGRFC'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'IdEstab'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'IdEstab'
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
      end
      item
        Caption = 'DataEmissao'
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
        Name = 'DataEmissao'
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
        Caption = 'NomeResponsavel'
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
        Name = 'NomeResponsavel'
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
        Caption = 'FGTSRecolhidoMesAnt'
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
        Name = 'FGTSRecolhidoMesAnt'
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
        Caption = 'ReferenteDissidio'
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
        Name = 'ReferenteDissidio'
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
        Caption = 'DataDissidio'
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
        Name = 'DataDissidio'
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
        Caption = 'PercentualRec'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'PercentualRec'
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
        Caption = 'ListaIdRubrica1'
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
        Name = 'ListaIdRubrica1'
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
        Caption = 'ListaIdRubrica2'
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
        Name = 'ListaIdRubrica2'
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
        Caption = 'ListaIdRubrica3'
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
        Name = 'ListaIdRubrica3'
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
        Caption = 'ListaIdRubrica4'
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
        Name = 'ListaIdRubrica4'
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
        Caption = 'ListaIdRubrica5'
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
        Name = 'ListaIdRubrica5'
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
        Caption = 'IndiceRecAtrasoRecolh1'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'IndiceRecAtrasoRecolh1'
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
        Caption = 'IndiceRecAtrasoRecolh2'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'IndiceRecAtrasoRecolh2'
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
        Caption = 'IndiceRecAtrasoMultaRes'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'IndiceRecAtrasoMultaRes'
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
    Report = rpGRFC
    ConnectionType = cntBDE
  end
  object rpGRFC: TppReport
    AutoStop = False
    DataPipeline = ppGRFC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Impresso GRFC'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 198
    Version = '5.5'
    mmColumnWidth = 197300
    object rpGRFCDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 280723
      mmPrintPosition = 0
      object rpGRFCShape4: TppShape
        UserName = 'rpGRFCShape4'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 8202
        mmTop = 80169
        mmWidth = 61119
        BandType = 4
      end
      object rpGRFCShape5: TppShape
        UserName = 'rpGRFCShape5'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 8202
        mmTop = 89959
        mmWidth = 39952
        BandType = 4
      end
      object rpGRFCShape3: TppShape
        UserName = 'rpGRFCShape3'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 8202
        mmTop = 48419
        mmWidth = 51065
        BandType = 4
      end
      object rpGRFCShape1: TppShape
        UserName = 'rpGRFCShape1'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 4498
        mmLeft = 139436
        mmTop = 23283
        mmWidth = 48419
        BandType = 4
      end
      object rpGRFCShape2: TppShape
        UserName = 'rpGRFCShape2'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 37306
        mmLeft = 139436
        mmTop = 30427
        mmWidth = 48419
        BandType = 4
      end
      object rpGRFCLbl5: TppLabel
        UserName = 'rpGRFCLbl5'
        AutoSize = False
        Caption = '02 - Razão social/nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 37306
        mmWidth = 127000
        BandType = 4
      end
      object rpGRFCLbl7: TppLabel
        UserName = 'rpGRFCLbl7'
        AutoSize = False
        Caption = '04 - Pessoa para contato/DDD/telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 60590
        mmTop = 48948
        mmWidth = 42069
        BandType = 4
      end
      object rpGRFCLine7: TppLine
        UserName = 'rpGRFCLine7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 48419
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl6: TppLabel
        UserName = 'rpGRFCLbl6'
        AutoSize = False
        Caption = '03 - CNPJ/CEI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 48948
        mmWidth = 48683
        BandType = 4
      end
      object rpGRFCLine16: TppLine
        UserName = 'rpGRFCLine16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 37571
        mmLeft = 139171
        mmTop = 30427
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine17: TppLine
        UserName = 'rpGRFCLine17'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 139171
        mmTop = 67733
        mmWidth = 48948
        BandType = 4
      end
      object rpGRFCLbl4: TppLabel
        UserName = 'rpGRFCLbl4'
        AutoSize = False
        Caption = '01 - Carimbo CIEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 140759
        mmTop = 31221
        mmWidth = 23548
        BandType = 4
      end
      object rpGRFCLbl3: TppLabel
        UserName = 'rpGRFCLbl3'
        AutoSize = False
        Caption = '00 - Para uso da CAIXA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 140759
        mmTop = 20638
        mmWidth = 23548
        BandType = 4
      end
      object rpGRFCLine18: TppLine
        UserName = 'rpGRFCLine18'
        Position = lpRight
        Weight = 0.75
        mmHeight = 37571
        mmLeft = 186796
        mmTop = 30427
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine6: TppLine
        UserName = 'rpGRFCLine6'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 136525
        mmTop = 36777
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine12: TppLine
        UserName = 'rpGRFCLine12'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 136525
        mmTop = 48419
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl1: TppLabel
        UserName = 'rpGRFCLbl1'
        AutoSize = False
        Caption = 
          'G R F C - Guia de Recolhimento Rescisório do FGTS e da Contribui' +
          'ção Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 13229
        mmWidth = 132027
        BandType = 4
      end
      object rpGRFCLbl2: TppLabel
        UserName = 'rpGRFCLbl2'
        Caption = 'Dados do Empregador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 7408
        mmTop = 29104
        mmWidth = 22490
        BandType = 4
      end
      object rpGRFCLine5: TppLine
        UserName = 'rpGRFCLine5'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7938
        mmTop = 44715
        mmWidth = 129911
        BandType = 4
      end
      object rpGRFCDBTxt1: TppDBText
        UserName = 'rpGRFCDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 41275
        mmWidth = 127000
        BandType = 4
      end
      object rpGRFCDBTxt3: TppDBText
        UserName = 'rpGRFCDBTxt3'
        DataField = 'CONTATO_NOME'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 60590
        mmTop = 52652
        mmWidth = 32015
        BandType = 4
      end
      object rpGRFCDBTxt4: TppDBText
        UserName = 'rpGRFCDBTxt4'
        DataField = 'DDD'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 95250
        mmTop = 52652
        mmWidth = 7673
        BandType = 4
      end
      object rpGRFCDBTxt5: TppDBText
        UserName = 'rpGRFCDBTxt5'
        DataField = 'TELEFONE'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 105304
        mmTop = 52652
        mmWidth = 31221
        BandType = 4
      end
      object rpGRFCDBTxt2: TppDBText
        UserName = 'rpGRFCDBTxt2'
        DataField = 'INSCRICAO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 52652
        mmWidth = 48683
        BandType = 4
      end
      object rpGRFCLine8: TppLine
        UserName = 'rpGRFCLine8'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7938
        mmTop = 56092
        mmWidth = 129911
        BandType = 4
      end
      object rpGRFCLine4: TppLine
        UserName = 'rpGRFCLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 36777
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine9: TppLine
        UserName = 'rpGRFCLine9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 59267
        mmTop = 48419
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine10: TppLine
        UserName = 'rpGRFCLine10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 93927
        mmTop = 52123
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine11: TppLine
        UserName = 'rpGRFCLine11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 103981
        mmTop = 52123
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl8: TppLabel
        UserName = 'rpGRFCLbl8'
        AutoSize = False
        Caption = '05 - Endereço (logradouro, nº, andar, apartamento)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 60325
        mmWidth = 127000
        BandType = 4
      end
      object rpGRFCDBTxt6: TppDBText
        UserName = 'rpGRFCDBTxt6'
        DataField = 'ENDERECO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 64294
        mmWidth = 127000
        BandType = 4
      end
      object rpGRFCLine13: TppLine
        UserName = 'rpGRFCLine13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 59796
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine14: TppLine
        UserName = 'rpGRFCLine14'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7938
        mmTop = 66675
        mmWidth = 129911
        BandType = 4
      end
      object rpGRFCLine15: TppLine
        UserName = 'rpGRFCLine15'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 136525
        mmTop = 59796
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine19: TppLine
        UserName = 'rpGRFCLine19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 70115
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl9: TppLabel
        UserName = 'rpGRFCLbl9'
        AutoSize = False
        Caption = '06 - Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 70908
        mmWidth = 58738
        BandType = 4
      end
      object rpGRFCDBTxt7: TppDBText
        UserName = 'rpGRFCDBTxt7'
        DataField = 'BAIRRO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 74348
        mmWidth = 58738
        BandType = 4
      end
      object rpGRFCLine20: TppLine
        UserName = 'rpGRFCLine20'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 76729
        mmWidth = 179917
        BandType = 4
      end
      object rpGRFCLbl12: TppLabel
        UserName = 'rpGRFCLbl12'
        AutoSize = False
        Caption = '09 - CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 140759
        mmTop = 70908
        mmWidth = 45773
        BandType = 4
      end
      object rpGRFCDBTxt10: TppDBText
        UserName = 'rpGRFCDBTxt10'
        DataField = 'CEP'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 140759
        mmTop = 74348
        mmWidth = 45773
        BandType = 4
      end
      object rpGRFCLbl10: TppLabel
        UserName = 'rpGRFCLbl10'
        AutoSize = False
        Caption = '07 - Município'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 70644
        mmTop = 70908
        mmWidth = 54240
        BandType = 4
      end
      object rpGRFCLine27: TppLine
        UserName = 'rpGRFCLine27'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 69321
        mmTop = 80169
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCDBTxt8: TppDBText
        UserName = 'rpGRFCDBTxt8'
        DataField = 'CIDADE'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 70644
        mmTop = 74348
        mmWidth = 54240
        BandType = 4
      end
      object rpGRFCLbl11: TppLabel
        UserName = 'rpGRFCLbl11'
        AutoSize = False
        Caption = '08 - UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 127794
        mmTop = 70644
        mmWidth = 10054
        BandType = 4
      end
      object rpGRFCDBTxt9: TppDBText
        UserName = 'rpGRFCDBTxt9'
        DataField = 'UF'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 127794
        mmTop = 74348
        mmWidth = 10054
        BandType = 4
      end
      object rpGRFCLine21: TppLine
        UserName = 'rpGRFCLine21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 69321
        mmTop = 70115
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine22: TppLine
        UserName = 'rpGRFCLine22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 126207
        mmTop = 70115
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine23: TppLine
        UserName = 'rpGRFCLine23'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 139171
        mmTop = 70115
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine24: TppLine
        UserName = 'rpGRFCLine24'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 70115
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl13: TppLabel
        UserName = 'rpGRFCLbl13'
        AutoSize = False
        Caption = '10 - Tomador de serviço (CNPJ/CEI)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 80963
        mmWidth = 58738
        BandType = 4
      end
      object rpGRFCDBTxt11: TppDBText
        UserName = 'rpGRFCDBTxt11'
        DataField = 'INSCRICAO_TOMADOR'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 84402
        mmWidth = 58738
        BandType = 4
      end
      object rpGRFCLine25: TppLine
        UserName = 'rpGRFCLine25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 80169
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl14: TppLabel
        UserName = 'rpGRFCLbl14'
        AutoSize = False
        Caption = '11 - Tomador de serviço (razão social)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 70644
        mmTop = 80963
        mmWidth = 115888
        BandType = 4
      end
      object rpGRFCDBTxt12: TppDBText
        UserName = 'rpGRFCDBTxt12'
        DataField = 'NOME_TOMADOR'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 70644
        mmTop = 84402
        mmWidth = 115888
        BandType = 4
      end
      object rpGRFCLine26: TppLine
        UserName = 'rpGRFCLine26'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 86784
        mmWidth = 179917
        BandType = 4
      end
      object rpGRFCLine28: TppLine
        UserName = 'rpGRFCLine28'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 80169
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl15: TppLabel
        UserName = 'rpGRFCLbl15'
        AutoSize = False
        Caption = '12 - FPAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 90752
        mmWidth = 17463
        BandType = 4
      end
      object rpGRFCLbl16: TppLabel
        UserName = 'rpGRFCLbl16'
        AutoSize = False
        Caption = '13 - SIMPLES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 29104
        mmTop = 90752
        mmWidth = 17727
        BandType = 4
      end
      object rpGRFCLbl17: TppLabel
        UserName = 'rpGRFCLbl17'
        AutoSize = False
        Caption = '14 - CNAE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 49477
        mmTop = 90752
        mmWidth = 28575
        BandType = 4
      end
      object rpGRFCLine31: TppLine
        UserName = 'rpGRFCLine31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 27781
        mmTop = 89959
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine29: TppLine
        UserName = 'rpGRFCLine29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 89959
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine32: TppLine
        UserName = 'rpGRFCLine32'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 48154
        mmTop = 89959
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine33: TppLine
        UserName = 'rpGRFCLine33'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 78052
        mmTop = 89959
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine1: TppLine
        UserName = 'rpGRFCLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 139171
        mmTop = 19844
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine3: TppLine
        UserName = 'rpGRFCLine3'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 19844
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine2: TppLine
        UserName = 'rpGRFCLine2'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 139171
        mmTop = 26723
        mmWidth = 48948
        BandType = 4
      end
      object rpGRFCImg1: TppImage
        UserName = 'rpGRFCImg1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617076210000424D762100000000000036000000280000006500
          00001C000000010018000000000040210000C40E0000C40E0000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FFFFFFFF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FFFFFF0066FF0066FF0066FF0066FF0066FF0066FF0066FF0066FF
          0066FF0066FFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF
          FFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFF
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFF0066FF0066
          FF0066FF0066FF0066FF0066FF0066FF0066FF0066FFFFFFFFFFFFFFFFFFFFFF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFF
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FFFFFFFFFFFFFFFFFF0066FF0066FF0066FF0066FF0066FF0066FF
          0066FF0066FF0066FF006600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFF
          FFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFF
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFF
          FF0066FF0066FF0066FF0066FF0066FF0066FF0066FF0066FF0066FF006600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0066FF0066FF0066FF
          0066FF0066FF0066FF0066FF0066FF006600FF6600FF6600FF6600FF6600FF66
          00FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF6600FF6600FFFFFFFFFF
          FFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFF
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0066FF0066FF0066FF0066FF0066FF0066FF0066FF00
          66FF006600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF6600FFFFFFFFFFFFFFFFFFFF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0066FF
          0066FF0066FF0066FF0066FF0066FF0066FF0066FF006600FF6600FF6600FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF
          FFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFF
          FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF0066FF0066FF0066FF0066FF0066FF0066FF00
          66FF0066FF0066FF006600006600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FFFFFFFF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF66000066000066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66000066FF0066
          FF0066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          6600FF6600FF6600FF6600FF6600FF6600FFFFFFFF6600FF6600FF6600FF6600
          FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFF6600FF6600FF6600FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF66000066000066FF0066FF0066FF0066FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF66000066000066FF0066FF0066
          FF0066FF0066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF66000066000066FF0066FF0066FF0066FF0066FF0066FF0066FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF66000066FF0066FF0066FF0066
          FF0066FF0066FF0066FF0066FF0066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFF
          FFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF
          6600FFFFFFFFFFFF0066FF0066FF0066FF0066FF0066FF0066FF0066FF0066FF
          0066FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF66
          00FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600FF66
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6600FF6600FF6600FF
          6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFFFF6600FF6600FF6600
          FF6600FF6600FF6600FF6600FF6600FF6600FFFFFFFFFFFFFFFFFF0066FF0066
          FF0066FF0066FF0066FF0066FF0066FF0066FF0066FF0066FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF6600FF6600FF6600FF6600FF6600FF6600FF6600FF6600
          FF6600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00}
        mmHeight = 12700
        mmLeft = 8731
        mmTop = 9790
        mmWidth = 41275
        BandType = 4
      end
      object rpGRFCShape10: TppShape
        UserName = 'rpGRFCShape10'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 151871
        mmTop = 174625
        mmWidth = 35983
        BandType = 4
      end
      object rpGRFCShape8: TppShape
        UserName = 'rpGRFCShape8'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 8202
        mmTop = 147902
        mmWidth = 179652
        BandType = 4
      end
      object rpGRFCShape6: TppShape
        UserName = 'rpGRFCShape6'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 8202
        mmTop = 118534
        mmWidth = 129911
        BandType = 4
      end
      object rpGRFCShape7: TppShape
        UserName = 'rpGRFCShape7'
        Brush.Color = 13948116
        Pen.Color = 13158600
        mmHeight = 7673
        mmLeft = 154782
        mmTop = 118534
        mmWidth = 33073
        BandType = 4
      end
      object rpGRFCDBTxt13: TppDBText
        UserName = 'rpGRFCDBTxt13'
        DataField = 'FPAS'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 94192
        mmWidth = 17463
        BandType = 4
      end
      object rpGRFCDBTxt14: TppDBText
        UserName = 'rpGRFCDBTxt14'
        DataField = 'SIMPLES'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 29104
        mmTop = 94192
        mmWidth = 17727
        BandType = 4
      end
      object rpGRFCDBTxt15: TppDBText
        UserName = 'rpGRFCDBTxt15'
        DataField = 'CNAE'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 49477
        mmTop = 94192
        mmWidth = 28575
        BandType = 4
      end
      object rpGRFCLine30: TppLine
        UserName = 'rpGRFCLine30'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7938
        mmTop = 96573
        mmWidth = 71173
        BandType = 4
      end
      object rpGRFCLbl18: TppLabel
        UserName = 'rpGRFCLbl18'
        AutoSize = False
        Caption = 'Dados do Trabalhador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 7408
        mmTop = 103188
        mmWidth = 28310
        BandType = 4
      end
      object rpGRFCLine34: TppLine
        UserName = 'rpGRFCLine34'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 108215
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl19: TppLabel
        UserName = 'rpGRFCLbl19'
        AutoSize = False
        Caption = '15 - Nome do trabalhador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 109009
        mmWidth = 24342
        BandType = 4
      end
      object rpGRFCLine35: TppLine
        UserName = 'rpGRFCLine35'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 114829
        mmWidth = 179917
        BandType = 4
      end
      object rpGRFCDBTxt16: TppDBText
        UserName = 'rpGRFCDBTxt16'
        DataField = 'EMPREGADO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 112448
        mmWidth = 177271
        BandType = 4
      end
      object rpGRFCLine36: TppLine
        UserName = 'rpGRFCLine36'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 108215
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl20: TppLabel
        UserName = 'rpGRFCLbl20'
        AutoSize = False
        Caption = '16 - Nº do PIS/PASEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 118534
        mmWidth = 34925
        BandType = 4
      end
      object rpGRFCDBTextPIS: TppDBText
        UserName = 'rpGRFCDBTextPIS'
        DataField = 'PIS'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 122767
        mmWidth = 34925
        BandType = 4
      end
      object rpGRFCDBTxt17: TppDBText
        UserName = 'rpGRFCDBTxt17'
        DataField = 'DATAADMISSAO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 46831
        mmTop = 122767
        mmWidth = 22490
        BandType = 4
      end
      object rpGRFCLbl21: TppLabel
        UserName = 'rpGRFCLbl21'
        AutoSize = False
        Caption = '17 - Data admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 46831
        mmTop = 118534
        mmWidth = 22490
        BandType = 4
      end
      object rpGRFCLbl22: TppLabel
        UserName = 'rpGRFCLbl22'
        AutoSize = False
        Caption = '18 - Cat.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 71702
        mmTop = 118534
        mmWidth = 8467
        BandType = 4
      end
      object rpGRFCDBTxt18: TppDBText
        UserName = 'rpGRFCDBTxt18'
        DataField = 'CATEGORIA'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 71702
        mmTop = 122767
        mmWidth = 8467
        BandType = 4
      end
      object rpGRFCLbl23: TppLabel
        UserName = 'rpGRFCLbl23'
        AutoSize = False
        Caption = '19 - Data movimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 82550
        mmTop = 118534
        mmWidth = 24606
        BandType = 4
      end
      object rpGRFCDBTxt19: TppDBText
        UserName = 'rpGRFCDBTxt19'
        DataField = 'DATADESLIGAMENTO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 82550
        mmTop = 122767
        mmWidth = 22754
        BandType = 4
      end
      object rpGRFCLbl24: TppLabel
        UserName = 'rpGRFCLbl24'
        AutoSize = False
        Caption = 'Cód.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 107686
        mmTop = 118534
        mmWidth = 8731
        BandType = 4
      end
      object rpGRFCLine37: TppLine
        UserName = 'rpGRFCLine37'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine38: TppLine
        UserName = 'rpGRFCLine38'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 125148
        mmWidth = 129911
        BandType = 4
      end
      object rpGRFCLine39: TppLine
        UserName = 'rpGRFCLine39'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 45508
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine40: TppLine
        UserName = 'rpGRFCLine40'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 70379
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine41: TppLine
        UserName = 'rpGRFCLine41'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 81227
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine42: TppLine
        UserName = 'rpGRFCLine42'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5556
        mmLeft = 106363
        mmTop = 120915
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine43: TppLine
        UserName = 'rpGRFCLine43'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 117475
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine44: TppLine
        UserName = 'rpGRFCLine44'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 137054
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl25: TppLabel
        UserName = 'rpGRFCLbl25'
        AutoSize = False
        Caption = '20 - Aviso prévio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 118798
        mmTop = 118534
        mmWidth = 18256
        BandType = 4
      end
      object rpGRFCDBTxt21: TppDBText
        UserName = 'rpGRFCDBTxt21'
        DataField = 'TIPO_AVISO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 118798
        mmTop = 122767
        mmWidth = 18256
        BandType = 4
      end
      object rpGRFCMemo1: TppMemo
        UserName = 'rpGRFCMemo1'
        Caption = '8'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Lines.Strings = (
          '1 - Trabalhado'
          '2 - Indenizado')
        Transparent = True
        mmHeight = 7408
        mmLeft = 139436
        mmTop = 118534
        mmWidth = 14023
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGRFCLine45: TppLine
        UserName = 'rpGRFCLine45'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 154517
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCDBTxt22: TppDBText
        UserName = 'rpGRFCDBTxt22'
        DataField = 'DISSIDIO'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 156104
        mmTop = 123031
        mmWidth = 30427
        BandType = 4
      end
      object rpGRFCLine46: TppLine
        UserName = 'rpGRFCLine46'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 154782
        mmTop = 125148
        mmWidth = 33073
        BandType = 4
      end
      object rpGRFCLine47: TppLine
        UserName = 'rpGRFCLine47'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 118534
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCMemo2: TppMemo
        UserName = 'rpGRFCMemo2'
        Caption = '8'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Lines.Strings = (
          '21 - Rec. dissídio/Acordo'
          'Data homologação/publicação')
        Transparent = True
        mmHeight = 4498
        mmLeft = 155575
        mmTop = 118534
        mmWidth = 29369
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGRFCLbl26: TppLabel
        UserName = 'rpGRFCLbl26'
        AutoSize = False
        Caption = '22 - Data de nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 129117
        mmWidth = 34925
        BandType = 4
      end
      object rpGRFCDBTxt23: TppDBText
        UserName = 'rpGRFCDBTxt23'
        DataField = 'DATANASC'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 132557
        mmWidth = 34925
        BandType = 4
      end
      object rpGRFCLbl27: TppLabel
        UserName = 'rpGRFCLbl27'
        AutoSize = False
        Caption = '23 - Carteira de Trabalho (nº/série)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 46831
        mmTop = 129117
        mmWidth = 50271
        BandType = 4
      end
      object rpGRFCDBTextCTPS_NUM: TppDBText
        UserName = 'rpGRFCDBTextCTPS_NUM'
        DataField = 'CTPS_NUM'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 46831
        mmTop = 132557
        mmWidth = 28840
        BandType = 4
      end
      object rpGRFCDBTxt24: TppDBText
        UserName = 'rpGRFCDBTxt24'
        DataField = 'CTPS_UF'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 76729
        mmTop = 132557
        mmWidth = 20373
        BandType = 4
      end
      object rpGRFCLbl28: TppLabel
        UserName = 'rpGRFCLbl28'
        AutoSize = False
        Caption = '24 - Data Opção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 99748
        mmTop = 129117
        mmWidth = 37042
        BandType = 4
      end
      object rpGRFCDBTxt25: TppDBText
        UserName = 'rpGRFCDBTxt25'
        DataField = 'DATAOPCAOFGTS'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 99748
        mmTop = 132557
        mmWidth = 37042
        BandType = 4
      end
      object rpGRFCLine48: TppLine
        UserName = 'rpGRFCLine48'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 128323
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine49: TppLine
        UserName = 'rpGRFCLine49'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 134938
        mmWidth = 129911
        BandType = 4
      end
      object rpGRFCLine50: TppLine
        UserName = 'rpGRFCLine50'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 45508
        mmTop = 128323
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine51: TppLine
        UserName = 'rpGRFCLine51'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 98425
        mmTop = 128323
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine52: TppLine
        UserName = 'rpGRFCLine52'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 137054
        mmTop = 128323
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCMemo3: TppMemo
        UserName = 'rpGRFCMemo3'
        Caption = '8'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Lines.Strings = (
          'Campo obrigatório para'
          'admissão anterior a 05/10/1988')
        Transparent = True
        mmHeight = 7408
        mmLeft = 139436
        mmTop = 128323
        mmWidth = 30427
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGRFCLbl30: TppLabel
        UserName = 'rpGRFCLbl30'
        AutoSize = False
        Caption = '25 - Mês anterior à rescisão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 9260
        mmTop = 148696
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCLbl31: TppLabel
        UserName = 'rpGRFCLbl31'
        AutoSize = False
        Caption = '26 - Mês de rescisão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 45244
        mmTop = 148696
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCLbl29: TppLabel
        UserName = 'rpGRFCLbl29'
        AutoSize = False
        Caption = 'Informação de remuneração/saldo fins rescisórios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 142346
        mmWidth = 64823
        BandType = 4
      end
      object rpGRFCLine53: TppLine
        UserName = 'rpGRFCLine53'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 147902
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine54: TppLine
        UserName = 'rpGRFCLine54'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 154517
        mmWidth = 179917
        BandType = 4
      end
      object rpGRFCLine59: TppLine
        UserName = 'rpGRFCLine59'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 147902
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine55: TppLine
        UserName = 'rpGRFCLine55'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 43921
        mmTop = 147902
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine56: TppLine
        UserName = 'rpGRFCLine56'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 79640
        mmTop = 147902
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine57: TppLine
        UserName = 'rpGRFCLine57'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 115359
        mmTop = 147902
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine58: TppLine
        UserName = 'rpGRFCLine58'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 151607
        mmTop = 147902
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl32: TppLabel
        UserName = 'rpGRFCLbl32'
        AutoSize = False
        Caption = '27 - Aviso prévio indenizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 81227
        mmTop = 148696
        mmWidth = 32808
        BandType = 4
      end
      object rpGRFCLbl33: TppLabel
        UserName = 'rpGRFCLbl33'
        AutoSize = False
        Caption = '28 - Saldo para fins rescisórios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 116946
        mmTop = 148696
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCLbl34: TppLabel
        UserName = 'rpGRFCLbl34'
        AutoSize = False
        Caption = '29 - Somatório (campos 25 a 28)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 152929
        mmTop = 148696
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCShape9: TppShape
        UserName = 'rpGRFCShape9'
        Brush.Color = 13948116
        mmHeight = 6879
        mmLeft = 7938
        mmTop = 157957
        mmWidth = 179917
        BandType = 4
      end
      object rpGRFCMemo4: TppMemo
        UserName = 'rpGRFCMemo4'
        Caption = 
          'Os valores lançados nos campos abaixo devem contemplar, além daq' +
          'ueles devidos ao trabalhador, a Contribuição Social de que trata' +
          ' a Lei Complementar'#13#10'110/2001, bem como todos os encargos legais' +
          ' por recolhimento em atraso, quando for o caso.'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Lines.Strings = (
          
            '  Os valores lançados nos campos abaixo devem contemplar, além d' +
            'aqueles devidos ao trabalhador, a Contribuição Social de que tra' +
            'ta a Lei Complementar'
          
            '  110/2001, bem como todos os encargos legais por recolhimento e' +
            'm atraso, quando for o caso.')
        Transparent = True
        mmHeight = 6350
        mmLeft = 8202
        mmTop = 158221
        mmWidth = 179388
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGRFCLbl35: TppLabel
        UserName = 'rpGRFCLbl35'
        AutoSize = False
        Caption = 'Valores a recolher'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 7673
        mmTop = 170127
        mmWidth = 26458
        BandType = 4
      end
      object rpGRFCLbl36: TppLabel
        UserName = 'rpGRFCLbl36'
        AutoSize = False
        Caption = '30 - Mês anterior à rescisão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 9260
        mmTop = 175419
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCLbl37: TppLabel
        UserName = 'rpGRFCLbl37'
        AutoSize = False
        Caption = '31 - Mês de rescisão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 45244
        mmTop = 175419
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCLine60: TppLine
        UserName = 'rpGRFCLine60'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 7938
        mmTop = 174625
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine61: TppLine
        UserName = 'rpGRFCLine61'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 181240
        mmWidth = 179917
        BandType = 4
      end
      object rpGRFCLine62: TppLine
        UserName = 'rpGRFCLine62'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 43921
        mmTop = 174361
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine63: TppLine
        UserName = 'rpGRFCLine63'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 79640
        mmTop = 174625
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine64: TppLine
        UserName = 'rpGRFCLine64'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 115359
        mmTop = 174625
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLine65: TppLine
        UserName = 'rpGRFCLine65'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 151607
        mmTop = 174625
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCLbl38: TppLabel
        UserName = 'rpGRFCLbl38'
        AutoSize = False
        Caption = '32 - Aviso prévio indenizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 81227
        mmTop = 175419
        mmWidth = 32808
        BandType = 4
      end
      object rpGRFCLbl39: TppLabel
        UserName = 'rpGRFCLbl39'
        AutoSize = False
        Caption = '33 - Multa rescisória'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 116946
        mmTop = 175419
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCLbl40: TppLabel
        UserName = 'rpGRFCLbl40'
        AutoSize = False
        Caption = '34 - Total a recolher'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 152929
        mmTop = 175419
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCLine66: TppLine
        UserName = 'rpGRFCLine66'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 186796
        mmTop = 174625
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCDBTxt20: TppDBText
        UserName = 'rpGRFCDBTxt20'
        DataField = 'CODIGO_MOV'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 107686
        mmTop = 122767
        mmWidth = 8731
        BandType = 4
      end
      object rpGRFCDBTxt36: TppDBText
        UserName = 'rpGRFCDBTxt36'
        DataField = 'LOCAL_DATA'
        DataPipeline = ppGRFC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 7938
        mmTop = 191823
        mmWidth = 60590
        BandType = 4
      end
      object rpGRFCLine67: TppLine
        UserName = 'rpGRFCLine67'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7938
        mmTop = 194734
        mmWidth = 63500
        BandType = 4
      end
      object rpGRFCLbl41: TppLabel
        UserName = 'rpGRFCLbl41'
        AutoSize = False
        Caption = 'Local e data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 7938
        mmTop = 196850
        mmWidth = 17198
        BandType = 4
      end
      object rpGRFCLine68: TppLine
        UserName = 'rpGRFCLine68'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 7938
        mmTop = 216694
        mmWidth = 63500
        BandType = 4
      end
      object rpGRFCLbl42: TppLabel
        UserName = 'rpGRFCLbl42'
        AutoSize = False
        Caption = 'Assinatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 7938
        mmTop = 218811
        mmWidth = 17198
        BandType = 4
      end
      object rpGRFCLbl43: TppLabel
        UserName = 'rpGRFCLbl43'
        AutoSize = False
        Caption = 'Autenticação mecânica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 105304
        mmTop = 209550
        mmWidth = 26988
        BandType = 4
      end
      object rpGRFCLine69: TppLine
        UserName = 'rpGRFCLine69'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15346
        mmLeft = 103717
        mmTop = 208757
        mmWidth = 1323
        BandType = 4
      end
      object rpGRFCDBTxt26: TppDBText
        UserName = 'rpGRFCDBTxt26'
        DataField = 'REM_MES_ANT'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 8996
        mmTop = 152136
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCDBTxt27: TppDBText
        UserName = 'rpGRFCDBTxt27'
        DataField = 'REM_MES_RES'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 45244
        mmTop = 152136
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCDBTxt28: TppDBText
        UserName = 'rpGRFCDBTxt28'
        DataField = 'AVISO_PREVIO'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 81227
        mmTop = 152136
        mmWidth = 32808
        BandType = 4
      end
      object rpGRFCDBTxt29: TppDBText
        UserName = 'rpGRFCDBTxt29'
        DataField = 'SALDO_RES'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 116946
        mmTop = 152136
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCDBTxt30: TppDBText
        UserName = 'rpGRFCDBTxt30'
        DataField = 'SOMA25A28'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 152929
        mmTop = 152136
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCDBTxt31: TppDBText
        UserName = 'rpGRFCDBTxt31'
        DataField = 'REM_MES_ANT2'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 9260
        mmTop = 178859
        mmWidth = 33602
        BandType = 4
      end
      object rpGRFCDBTxt32: TppDBText
        UserName = 'rpGRFCDBTxt32'
        DataField = 'REM_MES_RES2'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 45244
        mmTop = 178859
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCDBTxt33: TppDBText
        UserName = 'rpGRFCDBTxt33'
        DataField = 'AVISO_PREVIO2'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 81227
        mmTop = 178859
        mmWidth = 32808
        BandType = 4
      end
      object rpGRFCDBTxt34: TppDBText
        UserName = 'rpGRFCDBTxt34'
        DataField = 'MULTA_RES'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 116946
        mmTop = 178859
        mmWidth = 33338
        BandType = 4
      end
      object rpGRFCDBTxt35: TppDBText
        UserName = 'rpGRFCDBTxt35'
        DataField = 'TOTAL_REC'
        DataPipeline = ppGRFC
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 152929
        mmTop = 178859
        mmWidth = 33602
        BandType = 4
      end
    end
    object rpGRFCSmryBnd: TppSummaryBand
      AfterPrint = rpGRFCSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
  end
  object ppGRFC: TppBDEPipeline
    DataSource = dsGRFC
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'GRFC'
    Left = 198
    Top = 48
  end
  object dsGRFC: TwwDataSource
    DataSet = CdsGRFC
    Left = 198
    Top = 96
  end
  object sqlGRFC: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' CONTATO_NOME,'
      '  '#39'123'#39' AS DDD,'
      '  '#39'12345678901234567890'#39' AS TELEFONE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      '  '#39'12345678901234567890'#39' AS BAIRRO,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS CIDADE,'
      '  '#39'123'#39' AS UF,'
      '  '#39'12345678'#39' AS CEP,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO_TOMADOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' NOME_TOMADOR,'
      '  0 AS FPAS,'
      '  0 AS SIMPLES,'
      '  0 AS CNAE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' EMPREGADO,'
      '  '#39'123456789012345678'#39' AS PIS,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  0 AS CATEGORIA,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      '  '#39'12'#39' AS CODIGO_MOV,'
      '  0 AS TIPO_AVISO,'
      '  '#39'1234567890'#39' AS DISSIDIO,'
      '  '#39'1234567890'#39' AS DATANASC,'
      '  '#39'123456789012345678'#39' AS CTPS_NUM,'
      '  '#39'123'#39' AS CTPS_UF,'
      '  '#39'1234567890'#39' AS DATAOPCAOFGTS,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS LOCAL_DATA,'
      '  0 AS REM_MES_ANT,'
      '  0 AS REM_MES_RES,'
      '  0 AS AVISO_PREVIO,'
      '  0 AS SALDO_RES,'
      '  0 AS SOMA25A28,'
      '  0 AS MULTA_RES,'
      '  0 AS REM_MES_ANT2,'
      '  0 AS REM_MES_RES2,'
      '  0 AS AVISO_PREVIO2,'
      '  0 AS TOTAL_REC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsGRFC
    Left = 198
    Top = 190
  end
  object CdsGRFC: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'INSCRICAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CONTATO_NOME'
        Attributes = [faFixed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'DDD'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TELEFONE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'BAIRRO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CEP'
        Attributes = [faFixed]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'INSCRICAO_TOMADOR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 25
      end
      item
        Name = 'NOME_TOMADOR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'FPAS'
        DataType = ftFloat
      end
      item
        Name = 'SIMPLES'
        DataType = ftFloat
      end
      item
        Name = 'CNAE'
        DataType = ftFloat
      end
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'PIS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DATAADMISSAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CATEGORIA'
        DataType = ftFloat
      end
      item
        Name = 'DATADESLIGAMENTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODIGO_MOV'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPO_AVISO'
        DataType = ftFloat
      end
      item
        Name = 'DISSIDIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATANASC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CTPS_NUM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CTPS_UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DATAOPCAOFGTS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LOCAL_DATA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'REM_MES_ANT'
        DataType = ftFloat
      end
      item
        Name = 'REM_MES_RES'
        DataType = ftFloat
      end
      item
        Name = 'AVISO_PREVIO'
        DataType = ftFloat
      end
      item
        Name = 'SALDO_RES'
        DataType = ftFloat
      end
      item
        Name = 'SOMA25A28'
        DataType = ftFloat
      end
      item
        Name = 'MULTA_RES'
        DataType = ftFloat
      end
      item
        Name = 'REM_MES_ANT2'
        DataType = ftFloat
      end
      item
        Name = 'REM_MES_RES2'
        DataType = ftFloat
      end
      item
        Name = 'AVISO_PREVIO2'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL_REC'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'Index1'
        Fields = 'EMPREGADO'
      end>
    IndexName = 'Index1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsGRFCAfterScroll
    Left = 198
    Top = 144
  end
end
