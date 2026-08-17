inherited RptGerencial: TRptGerencial
  Left = 73
  Top = 176
  Width = 642
  Height = 289
  Caption = 'RptGerencial'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
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
        Caption = 'Mes'
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
        Name = 'Mes'
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
        Caption = 'NomeSetorResp'
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
        Name = 'NomeSetorResp'
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
        Caption = 'IdTipoFolha'
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
        Name = 'IdTipoFolha'
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
        Caption = 'ListaIdSitFunc'
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
        Name = 'ListaIdSitFunc'
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
        Caption = 'ListaIdRubricaRelCargoRemCC'
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
        Name = 'ListaIdRubricaRelCargoRemCC'
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
        Caption = 'ListaIdRubricaRelGratifCC'
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
        Name = 'ListaIdRubricaRelGratifCC'
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
        Caption = 'ListaIdRubricaTotFolha'
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
        Name = 'ListaIdRubricaTotFolha'
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
        Caption = 'ListaIdRubricaRelDespPessoal'
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
        Name = 'ListaIdRubricaRelDespPessoal'
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
        Caption = 'OrdemRelDespPessoal'
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
        Name = 'OrdemRelDespPessoal'
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
        Caption = 'OrdemRelDistribPessSal'
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
        Name = 'OrdemRelDistribPessSal'
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
        Caption = 'OrdemRelEmprTempServ'
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
        Name = 'OrdemRelEmprTempServ'
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
        Caption = 'ApanhaDadosTrein'
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
        Name = 'ApanhaDadosTrein'
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
        Caption = 'ConsideraDataTreinInicial'
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
        Name = 'ConsideraDataTreinInicial'
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
        Caption = 'LinhasComplRelDemDespPessoa'
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
        Name = 'LinhasComplRelDemDespPessoa'
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
        Caption = 'LinhasComplRelDemDespPessoaLin6'
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
        Name = 'LinhasComplRelDemDespPessoaLin6'
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
    Report = rpGerencial
    ConnectionType = cntBDE
  end
  object ppGerencial2: TppBDEPipeline
    DataSource = dsGerencial2
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial2'
    Left = 100
    Top = 64
    object ppGerencial2ppField1: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGerencial2ppField2: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGerencial2ppField3: TppField
      FieldAlias = 'REMUNERACAO'
      FieldName = 'REMUNERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsGerencial2: TwwDataSource
    DataSet = CdsGerencial2
    Left = 100
    Top = 112
  end
  object ppGerencial3: TppBDEPipeline
    DataSource = dsGerencial3
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial3'
    Left = 179
    Top = 64
  end
  object dsGerencial3: TwwDataSource
    DataSet = CdsGerencial3
    Left = 179
    Top = 112
  end
  object ppGerencial4: TppBDEPipeline
    DataSource = dsGerencial4
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial4'
    Left = 259
    Top = 64
  end
  object dsGerencial4: TwwDataSource
    DataSet = CdsGerencial4
    Left = 259
    Top = 112
  end
  object ppGerencial5: TppBDEPipeline
    DataSource = dsGerencial5
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial5'
    Left = 338
    Top = 64
  end
  object dsGerencial5: TwwDataSource
    DataSet = CdsGerencial5
    Left = 338
    Top = 112
  end
  object ppGerencial6A: TppBDEPipeline
    DataSource = dsGerencial6A
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppGerencial6A'
    Left = 419
    Top = 64
    object ppGerencial6AppField1: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppGerencial6AppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ADMITIDOS'
      FieldName = 'ADMITIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencial6AppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEMITIDOS'
      FieldName = 'DEMITIDOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsGerencial6A: TwwDataSource
    DataSet = CdsGerencial6A
    Left = 419
    Top = 112
  end
  object ppGerencial6B: TppBDEPipeline
    DataSource = dsGerencial6B
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppGerencial6B'
    Left = 503
    Top = 64
    object ppGerencial6BppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_ESTAGIARIOS'
      FieldName = 'NUM_ESTAGIARIOS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppGerencial6BppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS_ANTERIOR'
      FieldName = 'POS_ANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencial6BppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'POS_ATUAL'
      FieldName = 'POS_ATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object dsGerencial6B: TwwDataSource
    DataSet = CdsGerencial6B
    Left = 503
    Top = 112
  end
  object ppGerencial7: TppBDEPipeline
    DataSource = dsGerencial7
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial7'
    Left = 581
    Top = 64
  end
  object dsGerencial7: TwwDataSource
    DataSet = CdsGerencial7
    Left = 581
    Top = 112
  end
  object ppGerencial1: TppBDEPipeline
    DataSource = dsGerencial1
    OpenDataSource = False
    RefreshAfterPost = True
    SkipWhenNoRecords = False
    UserName = 'Gerencial1'
    Left = 23
    Top = 64
    object ppGerencial1ppField1: TppField
      FieldAlias = 'PROVENTODESCONTO'
      FieldName = 'PROVENTODESCONTO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 0
    end
    object ppGerencial1ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIPOPROVDESC'
      FieldName = 'TIPOPROVDESC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppGerencial1ppField3: TppField
      FieldAlias = 'CODRUBRICA'
      FieldName = 'CODRUBRICA'
      FieldLength = 12
      DisplayWidth = 12
      Position = 2
    end
    object ppGerencial1ppField4: TppField
      FieldAlias = 'TIPOTOT'
      FieldName = 'TIPOTOT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppGerencial1ppField5: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppGerencial1ppField6: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppGerencial1ppField7: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppGerencial1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppGerencial1ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_FOLHA'
      FieldName = 'TOT_FOLHA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppGerencial1ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PARCIAL'
      FieldName = 'TOT_PARCIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppGerencial1ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUM_REGISTRO'
      FieldName = 'NUM_REGISTRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
  end
  object dsGerencial1: TwwDataSource
    DataSet = CdsGerencial1
    Left = 23
    Top = 112
  end
  object rpGerencial: TppReport
    AutoStop = False
    DataPipeline = ppGerencial
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 218
    Top = 14
    Version = '5.5'
    mmColumnWidth = 197300
    object rpGerencialDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpGerencialFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object ppGroup16: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppGerencial
      NewPage = True
      ResetPageNo = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpGerencialGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 189177
        mmPrintPosition = 0
        object rpGerencialLbl1: TppLabel
          UserName = 'rpGerencialLbl1'
          Caption = 'Relatórios Gerenciais da Folha de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 15
          Font.Style = []
          Transparent = True
          mmHeight = 6085
          mmLeft = 44979
          mmTop = 53446
          mmWidth = 109273
          BandType = 3
          GroupNo = 0
        end
        object rpGerencialLblMes: TppLabel
          UserName = 'rpGerencialLblMes'
          Caption = 'Referente ao Mês de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 15
          Font.Style = []
          Transparent = True
          mmHeight = 6085
          mmLeft = 54240
          mmTop = 69056
          mmWidth = 51065
          BandType = 3
          GroupNo = 0
        end
        object rpGerencialMemo1: TppMemo
          UserName = 'Memo1'
          Caption = 
            'RELAÇÃO DOS RELATÓRIOS IMPRESSOS:'#13#10#13#10'A) DEMONSTRATIVO GERAL DE D' +
            'ESPESAS COM PESSOAL'#13#10#13#10'B) RELAÇÃO DE CARGOS COM REMUNERAÇÃO POR ' +
            'CENTRO DE CUSTO'#13#10#13#10'C) DISTRIBUIÇÃO DE CARGOS POR CENTRO DE CUSTO' +
            #13#10#13#10'D) DISTRIBUIÇÃO DE PESSOAL POR SALÁRIO'#13#10#13#10'E) DISTRIBUIÇÃO DE' +
            ' GRATIFICAÇÕES POR CENTRO DE CUSTO'#13#10#13#10'F) CONTRATAÇÕES E DESLIGAM' +
            'ENTOS DE PESSOAL'#13#10#13#10'G) RELAÇÃO DE PESSOAL POR TEMPO DE SERVIÇO'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Lines.Strings = (
            'RELAÇÃO DOS RELATÓRIOS IMPRESSOS:'
            ''
            'A) DEMONSTRATIVO GERAL DE DESPESAS COM PESSOAL'
            ''
            'B) RELAÇÃO DE CARGOS COM REMUNERAÇÃO POR CENTRO DE CUSTO'
            ''
            'C) DISTRIBUIÇÃO DE CARGOS POR CENTRO DE CUSTO'
            ''
            'D) DISTRIBUIÇÃO DE PESSOAL POR SALÁRIO'
            ''
            'E) DISTRIBUIÇÃO DE GRATIFICAÇÕES POR CENTRO DE CUSTO'
            ''
            'F) CONTRATAÇÕES E DESLIGAMENTOS DE PESSOAL'
            ''
            'G) RELAÇÃO DE PESSOAL POR TEMPO DE SERVIÇO')
          Transparent = True
          mmHeight = 64029
          mmLeft = 8996
          mmTop = 109273
          mmWidth = 138642
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpGerencialLblSetor: TppLabel
          UserName = 'rpGerencialLblSetor'
          Caption = 'SETOR RESPONSÁVEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 15
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 6085
          mmLeft = 70379
          mmTop = 82550
          mmWidth = 59002
          BandType = 3
          GroupNo = 0
        end
      end
      object rpGerencialGrpFootBnd: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 36777
        mmPrintPosition = 0
        object rpGerencialSR1: TppSubReport
          OnPrint = rpGerencialSR1Print
          UserName = 'rpGerencialSR1'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR1HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialCR1Lbl1: TppLabel
                UserName = 'rpGerencialCR1Lbl1'
                AutoSize = False
                Caption = 'DEMONSTRATIVO GERAL DE DESPESAS COM PESSOAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 60061
                mmTop = 7144
                mmWidth = 77258
                BandType = 0
              end
              object rpGerencialCR1Lbl3: TppLabel
                UserName = 'rpGerencialCR1Lbl3'
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
                mmLeft = 152136
                mmTop = 7938
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR1Lbl4: TppLabel
                UserName = 'rpGerencialCR1Lbl4'
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
                mmLeft = 152136
                mmTop = 12171
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR1DbTxt2: TppDBText
                UserName = 'rpGerencialCR1DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR1DbTxt4: TppDBText
                UserName = 'rpGerencialCR1DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR1DbTxt1: TppDBText
                UserName = 'rpGerencialCR1DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR1DbTxt3: TppDBText
                UserName = 'rpGerencialCR1DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR1Lbl5: TppLabel
                UserName = 'rpGerencialCR1Lbl5'
                AutoSize = False
                Caption = 'Item: A'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 152136
                mmTop = 16404
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR1Line1: TppLine
                UserName = 'rpGerencialCR1Line1'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 529
                mmLeft = 3175
                mmTop = 27517
                mmWidth = 190765
                BandType = 0
              end
              object rpGerencialCR1Lbl2: TppLabel
                UserName = 'rpGerencialCR1Lbl2'
                AutoSize = False
                Caption = 'TOTAL DA FOLHA DE PAGAMENTO:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 61383
                mmTop = 21167
                mmWidth = 48154
                BandType = 0
              end
              object rpGerencialCR1DbTxt5: TppDBText
                UserName = 'rpGerencialCR1DbTxt5'
                DataField = 'TOT_FOLHA'
                DataPipeline = ppGerencial1
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 110331
                mmTop = 21167
                mmWidth = 21696
                BandType = 0
              end
              object rpGerencialCR1LblRef: TppLabel
                UserName = 'rpGerencialCR1LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 11642
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR1SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR1SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168805
                mmTop = 12171
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR1SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR1SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168805
                mmTop = 7938
                mmWidth = 7938
                BandType = 0
              end
            end
            object rpGerencialCR1DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object rpGerencialCR1DbTxtNomeRubrica: TppDBText
                UserName = 'rpGerencialCR1DbTxtNomeRubrica'
                DataField = 'RUBRICA'
                DataPipeline = ppGerencial1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 33073
                mmTop = 1058
                mmWidth = 104775
                BandType = 4
              end
              object rpGerencialCR1DbTxtValRubrica: TppDBText
                UserName = 'rpGerencialCR1DbTxtValRubrica'
                DataField = 'VALOR'
                DataPipeline = ppGerencial1
                DisplayFormat = '#,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 139171
                mmTop = 1058
                mmWidth = 28840
                BandType = 4
              end
              object rpGerencialCR1DbTxtCodRubrica: TppDBText
                OnPrint = rpGerencialCR1DbTxtCodRubricaPrint
                UserName = 'rpGerencialCR1DbTxtCodRubrica'
                DataField = 'CODRUBRICA'
                DataPipeline = ppGerencial1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 7144
                mmTop = 1058
                mmWidth = 22490
                BandType = 4
              end
            end
            object rpGerencialCR1FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialChildReport7Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial1
              NewPage = True
              ResetPageNo = True
              UserName = 'rpGerencialChildReport7Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialCR1GrpHdrBnd0: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11377
                mmPrintPosition = 0
                object rpGerencialCR1Lbl6: TppLabel
                  UserName = 'rpGerencialCR1Lbl6'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3175
                  mmTop = 794
                  mmWidth = 28310
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR1DbTxt6: TppDBText
                  UserName = 'rpGerencialCR1DbTxt6'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 32808
                  mmTop = 794
                  mmWidth = 13494
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR1LblCodRubrica: TppLabel
                  UserName = 'rpGerencialCR1LblCodRubrica'
                  AutoSize = False
                  Caption = 'Código'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 3175
                  mmTop = 6350
                  mmWidth = 26723
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR1LblNomeRubrica: TppLabel
                  UserName = 'rpGerencialCR1LblNomeRubrica'
                  AutoSize = False
                  Caption = 'Rubrica'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 33073
                  mmTop = 6350
                  mmWidth = 104775
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR1Line2: TppLine
                  UserName = 'rpGerencialCR1Line2'
                  Weight = 0.75
                  mmHeight = 529
                  mmLeft = 3175
                  mmTop = 11113
                  mmWidth = 190765
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR1LblValRubrica: TppLabel
                  UserName = 'rpGerencialCR1LblValRubrica'
                  AutoSize = False
                  Caption = 'Valor'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 139171
                  mmTop = 6350
                  mmWidth = 28840
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialCR1GrpFootBnd0: TppGroupFooterBand
                BeforePrint = rpGerencialCR1GrpFootBnd0BeforePrint
                mmBottomOffset = 0
                mmHeight = 24606
                mmPrintPosition = 0
                object rpGerencialCR1LblT1: TppLabel
                  UserName = 'rpGerencialCR1LblT1'
                  AutoSize = False
                  Caption = 'TOTAL DE DESPESAS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 115094
                  mmTop = 3440
                  mmWidth = 38365
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1LblT2: TppLabel
                  UserName = 'rpGerencialCR1LblT2'
                  AutoSize = False
                  Caption = 'TOTAL DE ABATIMENTOS:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 115094
                  mmTop = 7673
                  mmWidth = 38365
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1Line4: TppLine
                  UserName = 'rpGerencialCR1Line4'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 166423
                  mmTop = 12965
                  mmWidth = 27517
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1LblT3: TppLabel
                  UserName = 'rpGerencialCR1LblT3'
                  AutoSize = False
                  Caption = 'DESPESA LÍQUIDA:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 115094
                  mmTop = 14817
                  mmWidth = 38365
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1LblTotProv: TppLabel
                  UserName = 'rpGerencialCR1LblTotProv'
                  AutoSize = False
                  Caption = 'rpGerencialCR1LblTotProv'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 3440
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1LblTotDesc: TppLabel
                  UserName = 'rpGerencialCR1LblTotDesc'
                  AutoSize = False
                  Caption = 'rpGerencialCR1LblTotDesc'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 7673
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1LblTotLiq: TppLabel
                  UserName = 'rpGerencialCR1LblTotLiq'
                  AutoSize = False
                  Caption = 'rpGerencialCR1LblTotLiq'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 14817
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1Lbl7: TppLabel
                  UserName = 'rpGerencialCR1Lbl7'
                  AutoSize = False
                  Caption = 'PERCENTUAL DA FOLHA:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 115094
                  mmTop = 20108
                  mmWidth = 38365
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR1LblTotPerc: TppLabel
                  UserName = 'rpGerencialCR1LblTotPerc'
                  AutoSize = False
                  Caption = 'rpGerencialCR1LblTotPerc'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 157692
                  mmTop = 20108
                  mmWidth = 36248
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
            object rpGerencialChildReport7Group2: TppGroup
              BreakName = 'PROVENTODESCONTO'
              DataPipeline = ppGerencial1
              UserName = 'rpGerencialChildReport7Group2'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialCR1GrpHdrBnd1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 5556
                mmPrintPosition = 0
                object rpGerencialCR1DbTxtProvDesc: TppDBText
                  UserName = 'rpGerencialCR1DbTxtProvDesc'
                  AutoSize = True
                  DataField = 'PROVENTODESCONTO'
                  DataPipeline = ppGerencial1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 3175
                  mmTop = 1058
                  mmWidth = 32015
                  BandType = 3
                  GroupNo = 1
                end
              end
              object rpGerencialCR1GrpFootBnd1: TppGroupFooterBand
                AfterPrint = rpGerencialCR1GrpFootBnd1AfterPrint
                mmBottomOffset = 0
                mmHeight = 7408
                mmPrintPosition = 0
                object rpGerencialCR1Line3: TppLine
                  UserName = 'rpGerencialCR1Line3'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 529
                  mmLeft = 3175
                  mmTop = 6879
                  mmWidth = 190765
                  BandType = 5
                  GroupNo = 1
                end
                object rpGerencialCR1DbCalc3: TppDBCalc
                  UserName = 'rpGerencialCR1DbCalc3'
                  DataField = 'VALOR'
                  DataPipeline = ppGerencial1
                  DisplayFormat = '#,###,###,##0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport7Group2
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 139171
                  mmTop = 1323
                  mmWidth = 28840
                  BandType = 5
                  GroupNo = 1
                end
                object rpGerencialCR1DbTxt7: TppDBText
                  UserName = 'rpGerencialCR1DbTxt7'
                  AutoSize = True
                  DataField = 'TIPOTOT'
                  DataPipeline = ppGerencial1
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 3175
                  mmTop = 1323
                  mmWidth = 12435
                  BandType = 5
                  GroupNo = 1
                end
              end
            end
          end
        end
        object rpGerencialSR2: TppSubReport
          UserName = 'rpGerencialSR2'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR2HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28046
              mmPrintPosition = 0
              object rpGerencialCR2Lbl1: TppLabel
                UserName = 'rpGerencialCR2Lbl1'
                AutoSize = False
                Caption = 'RELAÇÃO DE CARGOS COM REMUNERAÇÃO POR CENTRO DE CUSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 50271
                mmTop = 7144
                mmWidth = 96838
                BandType = 0
              end
              object rpGerencialCR2Lbl2: TppLabel
                UserName = 'rpGerencialCR2Lbl2'
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
                mmLeft = 153459
                mmTop = 7938
                mmWidth = 14288
                BandType = 0
              end
              object rpGerencialCR2Lbl3: TppLabel
                UserName = 'rpGerencialCR2Lbl3'
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
                mmLeft = 153459
                mmTop = 12171
                mmWidth = 14288
                BandType = 0
              end
              object rpGerencialCR2Lbl4: TppLabel
                UserName = 'rpGerencialCR2Lbl4'
                AutoSize = False
                Caption = 'Item: B'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 16404
                mmWidth = 14288
                BandType = 0
              end
              object rpGerencialCR2DbTxt2: TppDBText
                UserName = 'rpGerencialCR2DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR2DbTxt4: TppDBText
                UserName = 'rpGerencialCR2DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR2DbTxt1: TppDBText
                UserName = 'rpGerencialCR2DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR2DbTxt3: TppDBText
                UserName = 'rpGerencialCR2DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR2LblRef: TppLabel
                UserName = 'rpGerencialCR2LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 11642
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR2SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR2SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 12171
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR2SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR2SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7938
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialCR2DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialCR2DbTxt6: TppDBText
                UserName = 'rpGerencialCR2DbTxt6'
                DataField = 'CARGO'
                DataPipeline = ppGerencial2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 78846
                BandType = 4
              end
              object rpGerencialCR2DbTxt7: TppDBText
                UserName = 'rpGerencialCR2DbTxt7'
                DataField = 'REMUNERACAO'
                DataPipeline = ppGerencial2
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 85725
                mmTop = 794
                mmWidth = 23813
                BandType = 4
              end
            end
            object rpGerencialCR2FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialCR2SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 8731
              mmPrintPosition = 0
              object rpGerencialCR2Line4: TppLine
                UserName = 'rpGerencialCR2Line4'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 3175
                mmTop = 0
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialCR2Lbl9: TppLabel
                UserName = 'rpGerencialCR2Lbl9'
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 3175
                mmTop = 1588
                mmWidth = 7673
                BandType = 7
              end
              object rpGerencialCR2DbCalc4: TppDBCalc
                UserName = 'rpGerencialCR2DbCalc4'
                DataField = 'REMUNERACAO'
                DataPipeline = ppGerencial2
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 12965
                mmTop = 1588
                mmWidth = 26988
                BandType = 7
              end
            end
            object rpGerencialChildReport5Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial2
              UserName = 'rpGerencialChildReport5Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialCR2GrpHdrBand0: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object rpGerencialCR2Lbl6: TppLabel
                  UserName = 'rpGerencialCR2Lbl6'
                  AutoSize = False
                  Caption = 'Cargos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 3175
                  mmTop = 7144
                  mmWidth = 78846
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR2Line2: TppLine
                  UserName = 'rpGerencialCR2Line2'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 11642
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR2Lbl7: TppLabel
                  UserName = 'rpGerencialCR2Lbl7'
                  AutoSize = False
                  Caption = 'Remuneração'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 85725
                  mmTop = 7144
                  mmWidth = 23813
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR2Lbl5: TppLabel
                  UserName = 'rpGerencialCR2Lbl5'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3175
                  mmTop = 1852
                  mmWidth = 28310
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR2DbTxt5: TppDBText
                  UserName = 'rpGerencialCR2DbTxt5'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial2
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 32544
                  mmTop = 1852
                  mmWidth = 13494
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR2Line1: TppLine
                  UserName = 'rpGerencialCR2Line1'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialCR2GrpFootBnd0: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 7144
                mmPrintPosition = 0
                object rpGerencialCR2Line3: TppLine
                  UserName = 'rpGerencialCR2Line3'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR2Lbl8: TppLabel
                  UserName = 'rpGerencialCR2Lbl8'
                  Caption = 'Sub Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3175
                  mmTop = 1058
                  mmWidth = 13494
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR2DbCalc3: TppDBCalc
                  UserName = 'rpGerencialCR2DbCalc3'
                  DataField = 'REMUNERACAO'
                  DataPipeline = ppGerencial2
                  DisplayFormat = '#,0.00;#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport5Group1
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 19050
                  mmTop = 1058
                  mmWidth = 26988
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object rpGerencialSR3: TppSubReport
          UserName = 'rpGerencialSR3'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 9525
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR3HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialCR3Lbl1: TppLabel
                UserName = 'rpGerencialCR3Lbl1'
                AutoSize = False
                Caption = 'DISTRIBUIÇÃO DE CARGOS POR CENTRO DE CUSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 62442
                mmTop = 7144
                mmWidth = 72761
                BandType = 0
              end
              object rpGerencialCR3Lbl2: TppLabel
                UserName = 'rpGerencialCR3Lbl2'
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
                mmLeft = 152929
                mmTop = 7408
                mmWidth = 15081
                BandType = 0
              end
              object rpGerencialCR3Lbl3: TppLabel
                UserName = 'rpGerencialCR3Lbl3'
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
                mmLeft = 152929
                mmTop = 11642
                mmWidth = 15081
                BandType = 0
              end
              object rpGerencialCR3Lbl4: TppLabel
                UserName = 'rpGerencialCR3Lbl4'
                AutoSize = False
                Caption = 'Item: C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 152929
                mmTop = 15875
                mmWidth = 15081
                BandType = 0
              end
              object rpGerencialCR3DbTxt2: TppDBText
                UserName = 'rpGerencialCR3DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR3DbTxt4: TppDBText
                UserName = 'rpGerencialCR3DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR3DbTxt1: TppDBText
                UserName = 'rpGerencialCR3DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR3DbTxt3: TppDBText
                UserName = 'rpGerencialCR3DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR3LblRef: TppLabel
                UserName = 'rpGerencialCR3LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 11642
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR3SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR3SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168805
                mmTop = 11642
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR3SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR3SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168805
                mmTop = 7408
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialCR3DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialCR3DbTxt5: TppDBText
                UserName = 'rpGerencialCR3DbTxt5'
                DataField = 'CARGO'
                DataPipeline = ppGerencial3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 78846
                BandType = 4
              end
              object rpGerencialCR3DbTxt6: TppDBText
                UserName = 'rpGerencialCR3DbTxt6'
                DataField = 'ATIVOS'
                DataPipeline = ppGerencial3
                DisplayFormat = '##00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 85725
                mmTop = 794
                mmWidth = 14552
                BandType = 4
              end
            end
            object rpGerencialCR3FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialCR3SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 16669
              mmPrintPosition = 0
              object rpGerencialCR3Line4: TppLine
                UserName = 'rpGerencialCR3Line4'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 3175
                mmTop = 0
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialCR3Lbl10: TppLabel
                UserName = 'rpGerencialCR3Lbl10'
                AutoSize = False
                Caption = 'Em Licença:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 1588
                mmWidth = 18785
                BandType = 7
              end
              object rpGerencialCR3LblQuantTotLicenca: TppLabel
                OnPrint = rpGerencialCR3LblQuantTotLicencaPrint
                UserName = 'rpGerencialCR3LblQuantTotLicenca'
                AutoSize = False
                Caption = 'rpGerencialCR3LblQuantTotLicenca'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 23019
                mmTop = 1588
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialCR3Lbl11: TppLabel
                UserName = 'rpGerencialCR3Lbl11'
                AutoSize = False
                Caption = 'SubTotal:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 6350
                mmWidth = 18785
                BandType = 7
              end
              object rpGerencialCR3DbCalc4: TppDBCalc
                UserName = 'rpGerencialCR3DbCalc4'
                OnGetText = rpGerencialCR3DbCalc4GetText
                DataField = 'ATIVOS'
                DataPipeline = ppGerencial3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 23019
                mmTop = 6350
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialCR3Lbl12: TppLabel
                UserName = 'rpGerencialCR3Lbl12'
                AutoSize = False
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 10848
                mmWidth = 18785
                BandType = 7
              end
              object rpGerencialCR3LblTotal: TppLabel
                UserName = 'rpGerencialCR3LblTotal'
                AutoSize = False
                Caption = 'rpGerencialCR3LblTotal'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 23019
                mmTop = 10848
                mmWidth = 17198
                BandType = 7
              end
            end
            object rpGerencialChildReport4Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial3
              UserName = 'rpGerencialChildReport4Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialCR3GrpHdrBnd0: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object rpGerencialCR3Lbl6: TppLabel
                  UserName = 'rpGerencialCR3Lbl6'
                  AutoSize = False
                  Caption = 'Cargos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 3175
                  mmTop = 6879
                  mmWidth = 78846
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR3Line2: TppLine
                  UserName = 'rpGerencialCR3Line2'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 11642
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR3Lbl7: TppLabel
                  UserName = 'rpGerencialCR3Lbl7'
                  AutoSize = False
                  Caption = 'Quantidade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 85725
                  mmTop = 6879
                  mmWidth = 14552
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR3Lbl5: TppLabel
                  UserName = 'rpGerencialCR3Lbl5'
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3175
                  mmTop = 1852
                  mmWidth = 28310
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR3DbTxtNomeCentroCusto: TppDBText
                  UserName = 'rpGerencialCR3DbTxtNomeCentroCusto'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 32279
                  mmTop = 1852
                  mmWidth = 13494
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR3Line1: TppLine
                  UserName = 'rpGerencialCR3Line1'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialCR3GrpFootBnd0: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 11113
                mmPrintPosition = 0
                object rpGerencialCR3Line3: TppLine
                  UserName = 'rpGerencialCR3Line3'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR3Lbl8: TppLabel
                  UserName = 'rpGerencialCR3Lbl8'
                  AutoSize = False
                  Caption = 'Sub Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 2910
                  mmTop = 1058
                  mmWidth = 17727
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR3DbCalc3: TppDBCalc
                  UserName = 'rpGerencialCR3DbCalc3'
                  DataField = 'ATIVOS'
                  DataPipeline = ppGerencial3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport4Group1
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 21431
                  mmTop = 1058
                  mmWidth = 17198
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR3Lbl9: TppLabel
                  UserName = 'rpGerencialCR3Lbl9'
                  AutoSize = False
                  Caption = 'Em Licença:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 2910
                  mmTop = 5556
                  mmWidth = 17727
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR3DbTxt7: TppDBText
                  UserName = 'rpGerencialCR3DbTxt7'
                  DataField = 'LICENCA'
                  DataPipeline = ppGerencial3
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 21431
                  mmTop = 5556
                  mmWidth = 17198
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object rpGerencialSR4: TppSubReport
          UserName = 'rpGerencialSR4'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 14288
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial4
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR4HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28046
              mmPrintPosition = 0
              object rpGerencialCR4Lbl5: TppLabel
                UserName = 'rpGerencialCR4Lbl5'
                AutoSize = False
                Caption = 'Salário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 23283
                mmWidth = 26458
                BandType = 0
              end
              object rpGerencialCR4Lbl6: TppLabel
                UserName = 'rpGerencialCR4Lbl6'
                AutoSize = False
                Caption = 'Quantidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 51858
                mmTop = 23283
                mmWidth = 16404
                BandType = 0
              end
              object rpGerencialCR4Line1: TppLine
                UserName = 'rpGerencialCR4Line1'
                Position = lpBottom
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 3175
                mmTop = 26723
                mmWidth = 192617
                BandType = 0
              end
              object rpGerencialCR4Lbl1: TppLabel
                UserName = 'rpGerencialCR4Lbl1'
                AutoSize = False
                Caption = 'RELATÓRIO DE DISTRIBUIÇÃO DE PESSOAL POR SALÁRIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 58473
                mmTop = 7144
                mmWidth = 80169
                BandType = 0
              end
              object rpGerencialCR4Lbl2: TppLabel
                UserName = 'rpGerencialCR4Lbl2'
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
                mmLeft = 153194
                mmTop = 7144
                mmWidth = 14552
                BandType = 0
              end
              object rpGerencialCR4Lbl3: TppLabel
                UserName = 'rpGerencialCR4Lbl3'
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
                mmLeft = 153194
                mmTop = 11377
                mmWidth = 14552
                BandType = 0
              end
              object rpGerencialCR4Lbl4: TppLabel
                UserName = 'rpGerencialCR4Lbl4'
                AutoSize = False
                Caption = 'Item: D'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 153194
                mmTop = 15610
                mmWidth = 14552
                BandType = 0
              end
              object rpGerencialCR4DbTxt2: TppDBText
                UserName = 'rpGerencialCR4DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR4DbTxt4: TppDBText
                UserName = 'rpGerencialCR4DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR4DbTxt1: TppDBText
                UserName = 'rpGerencialCR4DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR4DbTxt3: TppDBText
                UserName = 'rpGerencialCR4DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR4LblRef: TppLabel
                UserName = 'rpGerencialCR4LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 12171
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR4SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR4SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 11377
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR4SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR4SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7144
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialCR4DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object rpGerencialCR4DbTxt5: TppDBText
                UserName = 'rpGerencialCR4DbTxt5'
                DataField = 'SALARIOATUAL'
                DataPipeline = ppGerencial4
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 529
                mmWidth = 26458
                BandType = 4
              end
              object rpGerencialCR4DbTxt6: TppDBText
                UserName = 'rpGerencialCR4DbTxt6'
                DataField = 'NUM_FUNC'
                DataPipeline = ppGerencial4
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 51858
                mmTop = 529
                mmWidth = 16404
                BandType = 4
              end
            end
            object rpGerencialCR4FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialCR4SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object rpGerencialCR4Line2: TppLine
                UserName = 'rpGerencialCR4Line2'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 529
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialCR4Lbl7: TppLabel
                UserName = 'rpGerencialCR4Lbl7'
                AutoSize = False
                Caption = 'Número Total de Empregados:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 3175
                mmTop = 1852
                mmWidth = 44979
                BandType = 7
              end
              object rpGerencialCR4DbCalc3: TppDBCalc
                UserName = 'rpGerencialCR4DbCalc3'
                DataField = 'NUM_FUNC'
                DataPipeline = ppGerencial4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 49213
                mmTop = 2117
                mmWidth = 15875
                BandType = 7
              end
            end
          end
        end
        object rpGerencialSR5: TppSubReport
          UserName = 'rpGerencialSR5'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 19050
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial5
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR5HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialCR5Lbl1: TppLabel
                UserName = 'rpGerencialCR5Lbl1'
                AutoSize = False
                Caption = 'DISTRIBUIÇÃO DE GRATIFICAÇÕES POR CENTRO DE CUSTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 56886
                mmTop = 7144
                mmWidth = 83344
                BandType = 0
              end
              object rpGerencialCR5Lbl2: TppLabel
                UserName = 'rpGerencialCR5Lbl2'
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
                mmLeft = 152929
                mmTop = 7938
                mmWidth = 14817
                BandType = 0
              end
              object rpGerencialCR5Lbl3: TppLabel
                UserName = 'rpGerencialCR5Lbl3'
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
                mmLeft = 152929
                mmTop = 12171
                mmWidth = 14817
                BandType = 0
              end
              object rpGerencialCR5Lbl4: TppLabel
                UserName = 'rpGerencialCR5Lbl4'
                AutoSize = False
                Caption = 'Item: E'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 152929
                mmTop = 16404
                mmWidth = 14817
                BandType = 0
              end
              object rpGerencialCR5DbTxt2: TppDBText
                UserName = 'rpGerencialCR5DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR5DbTxt4: TppDBText
                UserName = 'rpGerencialCR5DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR5DbTxt1: TppDBText
                UserName = 'rpGerencialCR5DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR5DbTxt3: TppDBText
                UserName = 'rpGerencialCR5DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR5LblRef: TppLabel
                UserName = 'rpGerencialCR5LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 12171
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR5SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR5SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 12171
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR5SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR5SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7938
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialCR5DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialCR5DbTxt7: TppDBText
                UserName = 'rpGerencialCR5DbTxt7'
                DataField = 'NUM_GRATIF'
                DataPipeline = ppGerencial5
                DisplayFormat = '##00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 90223
                mmTop = 794
                mmWidth = 14552
                BandType = 4
              end
              object rpGerencialCR5DbTxt6: TppDBText
                UserName = 'rpGerencialCR5DbTxt6'
                DataField = 'CARGO'
                DataPipeline = ppGerencial5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 83608
                BandType = 4
              end
              object rpGerencialCR5DbTxt8: TppDBText
                UserName = 'rpGerencialCR5DbTxt8'
                DataField = 'VAL_GRATIF'
                DataPipeline = ppGerencial5
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 794
                mmWidth = 23813
                BandType = 4
              end
            end
            object rpGerencialCR5FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialCR5SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 8731
              mmPrintPosition = 0
              object rpGerencialCR5Line4: TppLine
                UserName = 'rpGerencialCR5Line4'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 3175
                mmTop = 0
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialCR5Lbl10: TppLabel
                UserName = 'rpGerencialCR5Lbl10'
                AutoSize = False
                Caption = 'Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 71173
                mmTop = 1588
                mmWidth = 15610
                BandType = 7
              end
              object rpGerencialCR5DbCalc3: TppDBCalc
                UserName = 'rpGerencialCR5DbCalc3'
                DataField = 'NUM_GRATIF'
                DataPipeline = ppGerencial5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 90223
                mmTop = 1588
                mmWidth = 14552
                BandType = 7
              end
              object rpGerencialCR5DbCalc4: TppDBCalc
                UserName = 'rpGerencialCR5DbCalc4'
                DataField = 'VAL_GRATIF'
                DataPipeline = ppGerencial5
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 111390
                mmTop = 1588
                mmWidth = 23813
                BandType = 7
              end
            end
            object rpGerencialChildReport6Group1: TppGroup
              BreakName = 'C_CUSTO'
              DataPipeline = ppGerencial5
              UserName = 'rpGerencialChildReport6Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpGerencialCR5GrpHdrBnd0: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object rpGerencialCR5Lbl6: TppLabel
                  UserName = 'rpGerencialCR5Lbl6'
                  AutoSize = False
                  Caption = 'Cargos'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 3175
                  mmTop = 7144
                  mmWidth = 83608
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR5Line2: TppLine
                  UserName = 'rpGerencialCR5Line2'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 11642
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR5Lbl7: TppLabel
                  UserName = 'rpGerencialCR5Lbl7'
                  AutoSize = False
                  Caption = 'Quantidade'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 90223
                  mmTop = 7144
                  mmWidth = 14552
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR5Lbl5: TppLabel
                  UserName = 'rpGerencialCR5Lbl5'
                  AutoSize = False
                  Caption = 'CENTRO DE CUSTO:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 3175
                  mmTop = 1852
                  mmWidth = 28310
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR5DbTxt5: TppDBText
                  UserName = 'rpGerencialCR5DbTxt5'
                  AutoSize = True
                  DataField = 'C_CUSTO'
                  DataPipeline = ppGerencial5
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold, fsItalic]
                  Transparent = True
                  mmHeight = 3175
                  mmLeft = 32544
                  mmTop = 1852
                  mmWidth = 13494
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR5Line1: TppLine
                  UserName = 'rpGerencialCR5Line1'
                  Pen.Width = 2
                  Weight = 1.5
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 3
                  GroupNo = 0
                end
                object rpGerencialCR5Lbl8: TppLabel
                  UserName = 'rpGerencialCR5Lbl8'
                  AutoSize = False
                  Caption = 'Gratificações'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 111390
                  mmTop = 7144
                  mmWidth = 23813
                  BandType = 3
                  GroupNo = 0
                end
              end
              object rpGerencialCR5GrpFootBnd0: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 10319
                mmPrintPosition = 0
                object rpGerencialCR5Line3: TppLine
                  UserName = 'rpGerencialCR5Line3'
                  Weight = 0.75
                  mmHeight = 794
                  mmLeft = 3175
                  mmTop = 0
                  mmWidth = 192617
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR5Lbl9: TppLabel
                  UserName = 'rpGerencialCR5Lbl9'
                  AutoSize = False
                  Caption = 'Sub Total:'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 71173
                  mmTop = 1323
                  mmWidth = 15610
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR5DbCalc1: TppDBCalc
                  UserName = 'rpGerencialCR5DbCalc1'
                  DataField = 'NUM_GRATIF'
                  DataPipeline = ppGerencial5
                  DisplayFormat = '##00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport6Group1
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 90223
                  mmTop = 1323
                  mmWidth = 14552
                  BandType = 5
                  GroupNo = 0
                end
                object rpGerencialCR5DbCalc2: TppDBCalc
                  UserName = 'rpGerencialCR5DbCalc2'
                  DataField = 'VAL_GRATIF'
                  DataPipeline = ppGerencial5
                  DisplayFormat = '#,0.00;#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = []
                  ResetGroup = rpGerencialChildReport6Group1
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 111390
                  mmTop = 1323
                  mmWidth = 23813
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
        object rpGerencialSR6: TppSubReport
          UserName = 'rpGerencialSR6'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 23813
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport6: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial6A
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR6HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28046
              mmPrintPosition = 0
              object rpGerencialCR6Lbl1: TppLabel
                UserName = 'rpGerencialCR6Lbl1'
                AutoSize = False
                Caption = 'CONTRATAÇÕES E DESLIGAMENTOS DE PESSOAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 61913
                mmTop = 7144
                mmWidth = 73554
                BandType = 0
              end
              object rpGerencialCR6Lbl2: TppLabel
                UserName = 'rpGerencialCR6Lbl2'
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
                mmLeft = 149754
                mmTop = 7144
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR6Lbl3: TppLabel
                UserName = 'rpGerencialCR6Lbl3'
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
                mmLeft = 149754
                mmTop = 11377
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR6Lbl5: TppLabel
                UserName = 'rpGerencialCR6Lbl5'
                AutoSize = False
                Caption = 'Cent. Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 3175
                mmTop = 23283
                mmWidth = 51329
                BandType = 0
              end
              object rpGerencialCR6Lbl6: TppLabel
                UserName = 'rpGerencialCR6Lbl6'
                AutoSize = False
                Caption = 'Contratações'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 59531
                mmTop = 23283
                mmWidth = 21960
                BandType = 0
              end
              object rpGerencialCR6Lbl7: TppLabel
                UserName = 'rpGerencialCR6Lbl7'
                AutoSize = False
                Caption = 'Desligamentos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 107686
                mmTop = 23283
                mmWidth = 25665
                BandType = 0
              end
              object rpGerencialCR6Line1: TppLine
                UserName = 'rpGerencialCR6Line1'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 3175
                mmTop = 27781
                mmWidth = 188648
                BandType = 0
              end
              object rpGerencialCR6Lbl4: TppLabel
                UserName = 'rpGerencialCR6Lbl4'
                AutoSize = False
                Caption = 'Item: F'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 149754
                mmTop = 15610
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR6DbTxt2: TppDBText
                UserName = 'rpGerencialCR6DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR6DbTxt4: TppDBText
                UserName = 'rpGerencialCR6DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR6DbTxt1: TppDBText
                UserName = 'rpGerencialCR6DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR6DbTxt3: TppDBText
                UserName = 'rpGerencialCR6DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR6LblRef: TppLabel
                UserName = 'rpGerencialCR6LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 12171
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR6SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR6SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 166423
                mmTop = 11377
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR6SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR6SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 166423
                mmTop = 7144
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialCR6DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialCR6DbTxt5: TppDBText
                UserName = 'rpGerencialCR6DbTxt5'
                DataField = 'C_CUSTO'
                DataPipeline = ppGerencial6A
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 529
                mmWidth = 51329
                BandType = 4
              end
              object rpGerencialCR6DbTxt6: TppDBText
                UserName = 'rpGerencialCR6DbTxt6'
                DataField = 'ADMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 59531
                mmTop = 529
                mmWidth = 21960
                BandType = 4
              end
              object rpGerencialCR6DbTxt7: TppDBText
                UserName = 'rpGerencialCR6DbTxt7'
                DataField = 'DEMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 107686
                mmTop = 529
                mmWidth = 25665
                BandType = 4
              end
            end
            object rpGerencialCR6FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialCR6SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 23548
              mmPrintPosition = 0
              object rpGerencialCR6Lbl9: TppLabel
                UserName = 'rpGerencialCR6Lbl9'
                AutoSize = False
                Caption = 'Total de Funcionários (Posição Anterior) :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 60061
                BandType = 7
              end
              object rpGerencialCR6Lbl10: TppLabel
                UserName = 'rpGerencialCR6Lbl10'
                AutoSize = False
                Caption = 'Total de Funcionários (Posição Atual) :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 7938
                mmTop = 12965
                mmWidth = 55298
                BandType = 7
              end
              object rpGerencialCR6Lbl11: TppLabel
                UserName = 'rpGerencialCR6Lbl11'
                AutoSize = False
                Caption = 'Total Atual de Estagiários :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 24871
                mmTop = 18521
                mmWidth = 38365
                BandType = 7
              end
              object rpGerencialCR6Line2: TppLine
                UserName = 'rpGerencialCR6Line2'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 3175
                mmTop = 0
                mmWidth = 188648
                BandType = 7
              end
              object rpGerencialCR6Lbl8: TppLabel
                UserName = 'rpGerencialCR6Lbl8'
                AutoSize = False
                Caption = 'Totais:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 3175
                mmTop = 2117
                mmWidth = 11642
                BandType = 7
              end
              object rpGerencialCR6DbTxt8: TppDBText
                UserName = 'rpGerencialCR6DbTxt8'
                DataField = 'POS_ANTERIOR'
                DataPipeline = ppGerencial6B
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 65352
                mmTop = 6879
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialCR6DbTxt10: TppDBText
                UserName = 'rpGerencialCR6DbTxt10'
                DataField = 'NUM_ESTAGIARIOS'
                DataPipeline = ppGerencial6B
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 65352
                mmTop = 18521
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialCR6DbTxt9: TppDBText
                UserName = 'rpGerencialCR6DbTxt9'
                DataField = 'POS_ATUAL'
                DataPipeline = ppGerencial6B
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 65352
                mmTop = 12965
                mmWidth = 17198
                BandType = 7
              end
              object rpGerencialCR6DbCalc1: TppDBCalc
                UserName = 'rpGerencialCR6DbCalc1'
                DataField = 'ADMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 59531
                mmTop = 1058
                mmWidth = 21960
                BandType = 7
              end
              object rpGerencialCR6DbCalc2: TppDBCalc
                UserName = 'rpGerencialCR6DbCalc2'
                DataField = 'DEMITIDOS'
                DataPipeline = ppGerencial6A
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 107686
                mmTop = 1058
                mmWidth = 25665
                BandType = 7
              end
            end
          end
        end
        object rpGerencialSR7: TppSubReport
          UserName = 'rpGerencialSR7'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 28575
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpGerencialChildReport7: TppChildReport
            AutoStop = False
            DataPipeline = ppGerencial7
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
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
            Version = '5.5'
            mmColumnWidth = 0
            object rpGerencialCR7HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 28047
              mmPrintPosition = 0
              object rpGerencialCR7Lbl5: TppLabel
                UserName = 'rpGerencialCR7Lbl5'
                AutoSize = False
                Caption = 'Matrícula'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 3175
                mmTop = 23283
                mmWidth = 21167
                BandType = 0
              end
              object rpGerencialCR7Lbl6: TppLabel
                UserName = 'rpGerencialCR7Lbl6'
                AutoSize = False
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 26723
                mmTop = 23283
                mmWidth = 92340
                BandType = 0
              end
              object rpGerencialCR7Line1: TppLine
                UserName = 'rpGerencialCR7Line1'
                Position = lpBottom
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 27252
                mmWidth = 192617
                BandType = 0
              end
              object rpGerencialCR7Lbl1: TppLabel
                UserName = 'rpGerencialCR7Lbl1'
                AutoSize = False
                Caption = 'RELAÇÃO DE PESSOAL POR TEMPO DE SERVIÇO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 64558
                mmTop = 7144
                mmWidth = 68263
                BandType = 0
              end
              object rpGerencialCR7Lbl2: TppLabel
                UserName = 'rpGerencialCR7Lbl2'
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
                mmLeft = 151871
                mmTop = 7144
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR7Lbl3: TppLabel
                UserName = 'rpGerencialCR7Lbl3'
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
                mmLeft = 151871
                mmTop = 11377
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR7Lbl7: TppLabel
                UserName = 'rpGerencialCR7Lbl7'
                AutoSize = False
                Caption = 'Admissão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 123031
                mmTop = 23283
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR7Lbl8: TppLabel
                UserName = 'rpGerencialCR7Lbl8'
                AutoSize = False
                Caption = 'Temp. Serv (Anos - Meses)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 152136
                mmTop = 23283
                mmWidth = 42333
                BandType = 0
              end
              object rpGerencialCR7Lbl4: TppLabel
                UserName = 'rpGerencialCR7Lbl4'
                AutoSize = False
                Caption = 'Item: G'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 151871
                mmTop = 15610
                mmWidth = 15875
                BandType = 0
              end
              object rpGerencialCR7DbTxt2: TppDBText
                UserName = 'rpGerencialCR7DbTxt2'
                AutoSize = True
                DataField = 'CGC'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 7144
                mmWidth = 6350
                BandType = 0
              end
              object rpGerencialCR7DbTxt4: TppDBText
                UserName = 'rpGerencialCR7DbTxt4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 16140
                mmWidth = 16140
                BandType = 0
              end
              object rpGerencialCR7DbTxt1: TppDBText
                UserName = 'rpGerencialCR7DbTxt1'
                AutoSize = True
                DataField = 'EMPRESA'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 2646
                mmWidth = 13758
                BandType = 0
              end
              object rpGerencialCR7DbTxt3: TppDBText
                UserName = 'rpGerencialCR7DbTxt3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppGerencial
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 11642
                mmWidth = 30427
                BandType = 0
              end
              object rpGerencialCR7LblRef: TppLabel
                UserName = 'rpGerencialCR7LblRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 91811
                mmTop = 12435
                mmWidth = 13494
                BandType = 0
              end
              object rpGerencialCR7SysVar2: TppSystemVariable
                UserName = 'rpGerencialCR7SysVar2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 11377
                mmWidth = 22225
                BandType = 0
              end
              object rpGerencialCR7SysVar1: TppSystemVariable
                UserName = 'rpGerencialCR7SysVar1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 168540
                mmTop = 7144
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpGerencialCR7DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object rpGerencialCR7DbTxt5: TppDBText
                UserName = 'rpGerencialCR7DbTxt5'
                DataField = 'MATRICULA'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 794
                mmWidth = 21167
                BandType = 4
              end
              object rpGerencialCR7DbTxt6: TppDBText
                UserName = 'rpGerencialCR7DbTxt6'
                DataField = 'NOME'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 26723
                mmTop = 794
                mmWidth = 92340
                BandType = 4
              end
              object rpGerencialCR7DbTxt7: TppDBText
                UserName = 'rpGerencialCR7DbTxt7'
                DataField = 'DTADMISSAO'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 123031
                mmTop = 794
                mmWidth = 22225
                BandType = 4
              end
              object rpGerencialCR7DbTxt8: TppDBText
                UserName = 'rpGerencialCR7DbTxt8'
                DataField = 'ANO'
                DataPipeline = ppGerencial7
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 170127
                mmTop = 794
                mmWidth = 10319
                BandType = 4
              end
              object rpGerencialCR7DbTxt9: TppDBText
                UserName = 'rpGerencialCR7DbTxt9'
                DataField = 'MES'
                DataPipeline = ppGerencial7
                DisplayFormat = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 183886
                mmTop = 794
                mmWidth = 10319
                BandType = 4
              end
            end
            object rpGerencialCR7FootBnd: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
            object rpGerencialCR7SmryBnd: TppSummaryBand
              AfterPrint = rpGerencialCR7SmryBndAfterPrint
              mmBottomOffset = 0
              mmHeight = 10054
              mmPrintPosition = 0
              object rpGerencialCR7Line2: TppLine
                UserName = 'rpGerencialCR7Line2'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 3175
                mmTop = 1058
                mmWidth = 192617
                BandType = 7
              end
              object rpGerencialCR7Lbl9: TppLabel
                UserName = 'rpGerencialCR7Lbl9'
                AutoSize = False
                Caption = 'Número Total de Empregados:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 3175
                mmTop = 3440
                mmWidth = 45244
                BandType = 7
              end
              object rpGerencialCR7DbCalc1: TppDBCalc
                UserName = 'rpGerencialCR7DbCalc1'
                DataField = 'MES'
                DataPipeline = ppGerencial7
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DBCalcType = dcCount
                mmHeight = 3704
                mmLeft = 49213
                mmTop = 3440
                mmWidth = 15875
                BandType = 7
              end
            end
          end
        end
      end
    end
  end
  object ppGerencial: TppBDEPipeline
    DataSource = dsGerencial
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Gerencial'
    Left = 290
    Top = 6
    object ppGerencialppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField3: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField4: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppGerencialppField5: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsGerencial: TwwDataSource
    DataSet = CdsGerencial
    Left = 354
    Top = 6
  end
  object sqlGerencial: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  RXB.IDRUBPRINC,'
      '  PD.DESCRICAO AS NOME,'
      '  RP.CODPROVDESC AS CODIGO,'
      '  DECODE(RXB.FLGBASECALC,1,'#39'Não'#39',0,'#39'Sim'#39') AS BASECALC,'
      '  DECODE(RXB.FLGTIPOFOLHA,1,'#39'Não'#39',0,'#39'Sim'#39') AS TIPOFOLHA,'
      '  RXB.INDPERIODO AS PER_INCID,'
      '  DECODE(RXB.FLGACAOINCIDE,1,'#39'Não'#39',0,'#39'Sim'#39') AS SOMA,'
      '  PD.NUMPRIORIDADE AS SEQ'
      'FROM'
      '  RUBXRUB RXB, PROVDESC PD, RUBRICAXPESS RP'
      'WHERE'
      '  (RXB.IDRUBPRINC  = 44) AND'
      '  (RP.IDPESSOA     = 1) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (RXB.IDRUBSECUND = PD.IDPROVENTO) AND'
      '  (PD.IDPROVENTO   = RP.IDRUBRICA)'
      'ORDER BY'
      '  CODIGO')
    ClientDataSet = CdsGerencial
    Left = 496
    Top = 5
  end
  object CdsGerencial: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 423
    Top = 6
  end
  object CdsGerencial1: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PROVENTODESCONTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TIPOPROVDESC'
        DataType = ftFloat
      end
      item
        Name = 'CODRUBRICA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TIPOTOT'
        Attributes = [faFixed]
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RUBRICA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'C_CUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'TOT_FOLHA'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PARCIAL'
        DataType = ftFloat
      end
      item
        Name = 'NUM_REGISTRO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IndexCodigoCC'
        Fields = 'CODCENTROCUSTO;TIPOPROVDESC;CODRUBRICA'
      end
      item
        Name = 'IndexNomeCC'
        Fields = 'C_CUSTO;TIPOPROVDESC;CODRUBRICA'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = CdsGerencialAfterScroll
    Left = 23
    Top = 160
    Data = {
      D00100009619E0BD01000000180000000B000000000003000000D0011050524F
      56454E544F444553434F4E544F01004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002000C000C5449504F5052
      4F564445534308000400000000000A434F445255425249434101004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000C00075449504F544F5401004900000002000753554254595045020049
      000A0046697865644368617200055749445448020002001E0007525542524943
      4101004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002003C000E434F4443454E54524F435553544F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200140007435F435553544F01004900000002000753554254595045
      020049000A0046697865644368617200055749445448020002003C000556414C
      4F52080004000000000009544F545F464F4C484108000400000000000B544F54
      5F5041524349414C08000400000000000C4E554D5F524547495354524F080004
      00000000000100044C4349440400010009080000}
  end
  object sqlGerencial1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'123456789012'#39' AS PROVENTODESCONTO,'
      '  0 AS TIPOPROVDESC,'
      '  '#39'123456789012'#39' AS CODRUBRICA,'
      '  '#39'123456789012345678901234567890'#39' AS TIPOTOT,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA,'
      '  '#39'12345678901234567890'#39' AS CODCENTROCUSTO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS C_CUSTO,'
      '  0 AS VALOR,'
      '  0 AS TOT_FOLHA,'
      '  0 AS TOT_PARCIAL,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsGerencial1
    Left = 23
    Top = 208
  end
  object CdsGerencial2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 100
    Top = 160
  end
  object sqlGerencial2: TCMSqlParams
    ClientDataSet = CdsGerencial2
    Left = 100
    Top = 208
  end
  object CdsGerencial3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 179
    Top = 160
  end
  object sqlGerencial3: TCMSqlParams
    ClientDataSet = CdsGerencial3
    Left = 179
    Top = 208
  end
  object CdsGerencial4: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 259
    Top = 160
  end
  object sqlGerencial4: TCMSqlParams
    ClientDataSet = CdsGerencial4
    Left = 259
    Top = 208
  end
  object sqlGerencial5: TCMSqlParams
    ClientDataSet = CdsGerencial5
    Left = 338
    Top = 208
  end
  object CdsGerencial5: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 338
    Top = 160
  end
  object CdsGerencial6A: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 419
    Top = 160
  end
  object sqlGerencial6A: TCMSqlParams
    ClientDataSet = CdsGerencial6A
    Left = 419
    Top = 208
  end
  object sqlGerencial6B: TCMSqlParams
    ClientDataSet = CdsGerencial6B
    Left = 503
    Top = 208
  end
  object CdsGerencial6B: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 503
    Top = 160
  end
  object sqlGerencial7: TCMSqlParams
    ClientDataSet = CdsGerencial7
    Left = 581
    Top = 208
  end
  object CdsGerencial7: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsGerencialAfterScroll
    Left = 581
    Top = 160
  end
end
