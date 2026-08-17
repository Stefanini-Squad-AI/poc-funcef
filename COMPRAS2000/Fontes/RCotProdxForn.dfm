inherited RptCotProdxForn: TRptCotProdxForn
  Left = 162
  Top = 174
  Width = 426
  Height = 214
  Caption = 'RptCotProdxForn'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cotação -  Produtos x Fornecedor'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Nº do Processo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '      CODPROCESSO'
          'FROM'
          '      PROCESSO'
          'WHERE'
          '     (( STATUS = '#39'S'#39') Or (STATUS = '#39'O'#39') or (STATUS = '#39'F'#39' ))'
          'ORDER BY CODPROCESSO')
        LookupSettings.Chave = 'CODPROCESSO'
        LookupSettings.Display = 'CODPROCESSO'
        LookupSettings.Descricao = 'Nº do Processo'
        LookupSettings.Tamanho = '10'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Carimbos/Assinaturas 1º'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Carimbos/Assinaturas 2º'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Carimbos/Assinaturas 3º'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Carimbos/Assinaturas 4º'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Carimbos/Assinaturas 5º'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = ' Calcular por : '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Valor presente'
          'Preço')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 55
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
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO,DESCALMOX '
          'FROM ALMOX'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'Almoxarifado'
        LookupSettings.Tamanho = '40'
        CheckBoxSetings.ValueChecked = 'False'
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
      end>
    Formheight = 310
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = ppCotProdxForn
    LabelEmpresa = ppLabel2
    LabelSistema = ppLabel3
  end
  object pplCotProdxForn: TppBDEPipeline
    DataSource = dsCotProdxForn
    UserName = 'lCotProdxForn'
    Left = 246
    Top = 69
    object pplCotProdxFornppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROCXART'
      FieldName = 'IDPROCXART'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplCotProdxFornppField2: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 1
    end
    object pplCotProdxFornppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEPEDIDA'
      FieldName = 'QTDEPEDIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplCotProdxFornppField4: TppField
      FieldAlias = 'CODMEDIDA'
      FieldName = 'CODMEDIDA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object pplCotProdxFornppField5: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplCotProdxFornppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDE'
      FieldName = 'SALDOQTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplCotProdxFornppField7: TppField
      FieldAlias = 'CODMEDCUSTO'
      FieldName = 'CODMEDCUSTO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 6
    end
    object pplCotProdxFornppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORN1'
      FieldName = 'FORN1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCotProdxFornppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORN2'
      FieldName = 'FORN2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplCotProdxFornppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORN3'
      FieldName = 'FORN3'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplCotProdxFornppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORN4'
      FieldName = 'FORN4'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplCotProdxFornppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORN5'
      FieldName = 'FORN5'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplCotProdxFornppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'FORN6'
      FieldName = 'FORN6'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplCotProdxFornppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMENOR'
      FieldName = 'VLRMENOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplCotProdxFornppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUNVENC'
      FieldName = 'NUNVENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCotProdxFornppField16: TppField
      FieldAlias = 'TELEFONE1'
      FieldName = 'TELEFONE1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object pplCotProdxFornppField17: TppField
      FieldAlias = 'TELEFONE2'
      FieldName = 'TELEFONE2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object pplCotProdxFornppField18: TppField
      FieldAlias = 'TELEFONE3'
      FieldName = 'TELEFONE3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object pplCotProdxFornppField19: TppField
      FieldAlias = 'TELEFONE4'
      FieldName = 'TELEFONE4'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object pplCotProdxFornppField20: TppField
      FieldAlias = 'TELEFONE5'
      FieldName = 'TELEFONE5'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
    object pplCotProdxFornppField21: TppField
      FieldAlias = 'TELEFONE6'
      FieldName = 'TELEFONE6'
      FieldLength = 20
      DisplayWidth = 20
      Position = 20
    end
    object pplCotProdxFornppField22: TppField
      FieldAlias = 'CONDPAG1'
      FieldName = 'CONDPAG1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 21
    end
    object pplCotProdxFornppField23: TppField
      FieldAlias = 'CONDPAG2'
      FieldName = 'CONDPAG2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
    object pplCotProdxFornppField24: TppField
      FieldAlias = 'CONDPAG3'
      FieldName = 'CONDPAG3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 23
    end
    object pplCotProdxFornppField25: TppField
      FieldAlias = 'CONDPAG4'
      FieldName = 'CONDPAG4'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object pplCotProdxFornppField26: TppField
      FieldAlias = 'CONDPAG5'
      FieldName = 'CONDPAG5'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
    object pplCotProdxFornppField27: TppField
      FieldAlias = 'CONDPAG6'
      FieldName = 'CONDPAG6'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object pplCotProdxFornppField28: TppField
      FieldAlias = 'PRAZOENT1'
      FieldName = 'PRAZOENT1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object pplCotProdxFornppField29: TppField
      FieldAlias = 'PRAZOENT2'
      FieldName = 'PRAZOENT2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 28
    end
    object pplCotProdxFornppField30: TppField
      FieldAlias = 'PRAZOENT3'
      FieldName = 'PRAZOENT3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 29
    end
    object pplCotProdxFornppField31: TppField
      FieldAlias = 'PRAZOENT4'
      FieldName = 'PRAZOENT4'
      FieldLength = 20
      DisplayWidth = 20
      Position = 30
    end
    object pplCotProdxFornppField32: TppField
      FieldAlias = 'PRAZOENT5'
      FieldName = 'PRAZOENT5'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object pplCotProdxFornppField33: TppField
      FieldAlias = 'PRAZOENT6'
      FieldName = 'PRAZOENT6'
      FieldLength = 20
      DisplayWidth = 20
      Position = 32
    end
    object pplCotProdxFornppField34: TppField
      FieldAlias = 'JUSTIFICATIVA'
      FieldName = 'JUSTIFICATIVA'
      FieldLength = 216
      DisplayWidth = 216
      Position = 33
    end
  end
  object dsCotProdxForn: TwwDataSource
    DataSet = qryCotProdxForn
    Left = 142
    Top = 69
  end
  object qryCotProdxForn: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      PXA.IDPROCXART,'
      '      PXA.CODARTIGO,'
      '      PXA.QTDEPEDIDA,'
      '      PXA.CODMEDIDA,'
      
        '      DECODE(PXA.JUSTIFICATIVA,NULL,'#39#39','#39'JUSTIFICATIVA : '#39' ||PXA.' +
        'JUSTIFICATIVA) AS  JUSTIFICATIVA,'
      
        '      DECODE(PXA.IDPRODVARI,NULL,P.DESCPROD,PV.DESCPRODVARI) AS ' +
        'DESCRICAO,'
      '      S.SALDOQTDE,'
      '      P.CODMEDCUSTO,'
      '      (0) AS FORN1,'
      '      (0) AS FORN2,'
      '      (0) AS FORN3,'
      '      (0) AS FORN4,'
      '      (0) AS FORN5,'
      '      (0) AS FORN6,'
      '      (0) AS VLRMENOR,'
      '      (0) AS NUNVENC,'
      '      ('#39'                    '#39')AS TELEFONE1,'
      '      ('#39'                    '#39')AS TELEFONE2,'
      '      ('#39'                    '#39')AS TELEFONE3,'
      '      ('#39'                    '#39')AS TELEFONE4,'
      '      ('#39'                    '#39')AS TELEFONE5,'
      '      ('#39'                    '#39')AS TELEFONE6,'
      '      ('#39'                    '#39')AS CONDPAG1,'
      '      ('#39'                    '#39')AS CONDPAG2,'
      '      ('#39'                    '#39')AS CONDPAG3,'
      '      ('#39'                    '#39')AS CONDPAG4,'
      '      ('#39'                    '#39')AS CONDPAG5,'
      '      ('#39'                    '#39')AS CONDPAG6,'
      '      ('#39'                    '#39')AS PRAZOENT1,'
      '      ('#39'                    '#39')AS PRAZOENT2,'
      '      ('#39'                    '#39')AS PRAZOENT3,'
      '      ('#39'                    '#39')AS PRAZOENT4,'
      '      ('#39'                    '#39')AS PRAZOENT5,'
      '      ('#39'                    '#39')AS PRAZOENT6'
      'FROM'
      '      PROCXART PXA,'
      '      SALDO S,'
      '      PRODUTO P,'
      '      ARTIGO A,'
      '      PRODVARI PV'
      'WHERE'
      '      (PXA.CODPROCESSO = :CODPROCESSO)'
      '  AND (S.CODALMOXARIFADO(+) = :CODALMOXARIFADO)'
      '  AND (PXA.CODARTIGO = A.CODARTIGO)'
      '  AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))'
      '  AND (A.CODPRODUTO = P.CODPRODUTO)'
      '  AND (A.CODARTIGO = S.CODARTIGO(+))'
      'ORDER BY DESCRICAO')
    UpdateObject = updCotProdxForn
    ValidateWithMask = True
    Left = 29
    Top = 69
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CODALMOXARIFADO'
        ParamType = ptUnknown
      end>
    object qryCotProdxFornIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryCotProdxFornCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryCotProdxFornQTDEPEDIDA: TFloatField
      FieldName = 'QTDEPEDIDA'
    end
    object qryCotProdxFornCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryCotProdxFornDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryCotProdxFornSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
    end
    object qryCotProdxFornCODMEDCUSTO: TStringField
      FieldName = 'CODMEDCUSTO'
      Size = 4
    end
    object qryCotProdxFornFORN1: TFloatField
      FieldName = 'FORN1'
    end
    object qryCotProdxFornFORN2: TFloatField
      FieldName = 'FORN2'
    end
    object qryCotProdxFornFORN3: TFloatField
      FieldName = 'FORN3'
    end
    object qryCotProdxFornFORN4: TFloatField
      FieldName = 'FORN4'
    end
    object qryCotProdxFornFORN5: TFloatField
      FieldName = 'FORN5'
    end
    object qryCotProdxFornFORN6: TFloatField
      FieldName = 'FORN6'
    end
    object qryCotProdxFornVLRMENOR: TFloatField
      FieldName = 'VLRMENOR'
    end
    object qryCotProdxFornNUNVENC: TFloatField
      FieldName = 'NUNVENC'
    end
    object qryCotProdxFornTELEFONE1: TStringField
      FieldName = 'TELEFONE1'
    end
    object qryCotProdxFornTELEFONE2: TStringField
      FieldName = 'TELEFONE2'
    end
    object qryCotProdxFornTELEFONE3: TStringField
      FieldName = 'TELEFONE3'
    end
    object qryCotProdxFornTELEFONE4: TStringField
      FieldName = 'TELEFONE4'
    end
    object qryCotProdxFornTELEFONE5: TStringField
      FieldName = 'TELEFONE5'
    end
    object qryCotProdxFornTELEFONE6: TStringField
      FieldName = 'TELEFONE6'
    end
    object qryCotProdxFornCONDPAG1: TStringField
      FieldName = 'CONDPAG1'
    end
    object qryCotProdxFornCONDPAG2: TStringField
      FieldName = 'CONDPAG2'
    end
    object qryCotProdxFornCONDPAG3: TStringField
      FieldName = 'CONDPAG3'
    end
    object qryCotProdxFornCONDPAG4: TStringField
      FieldName = 'CONDPAG4'
    end
    object qryCotProdxFornCONDPAG5: TStringField
      FieldName = 'CONDPAG5'
    end
    object qryCotProdxFornCONDPAG6: TStringField
      FieldName = 'CONDPAG6'
    end
    object qryCotProdxFornPRAZOENT1: TStringField
      FieldName = 'PRAZOENT1'
    end
    object qryCotProdxFornPRAZOENT2: TStringField
      FieldName = 'PRAZOENT2'
    end
    object qryCotProdxFornPRAZOENT3: TStringField
      FieldName = 'PRAZOENT3'
    end
    object qryCotProdxFornPRAZOENT4: TStringField
      FieldName = 'PRAZOENT4'
    end
    object qryCotProdxFornPRAZOENT5: TStringField
      FieldName = 'PRAZOENT5'
    end
    object qryCotProdxFornPRAZOENT6: TStringField
      FieldName = 'PRAZOENT6'
    end
    object qryCotProdxFornJUSTIFICATIVA: TStringField
      FieldName = 'JUSTIFICATIVA'
      Size = 216
    end
  end
  object ppCotProdxForn: TppReport
    AutoStop = False
    DataPipeline = pplCotProdxForn
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 358
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCotProdxForn'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Cotação -  Produtos x Fornecedor  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 70379
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
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
      object ppCotProdxFornLabel1: TppLabel
        UserName = 'ppCotProdxFornLabel1'
        Caption = 'Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 15346
        mmWidth = 15610
        BandType = 0
      end
      object ppCotProdxFornLine1: TppLine
        UserName = 'ppCotProdxFornLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25400
        mmWidth = 284300
        BandType = 0
      end
      object LbCodProc: TppLabel
        UserName = 'LbCodProc'
        Caption = 'LbCodProc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16933
        mmTop = 15346
        mmWidth = 14023
        BandType = 0
      end
      object ppCotProdxFornLabel2: TppLabel
        UserName = 'ppCotProdxFornLabel2'
        Caption = 'Itens em Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 2646
        mmTop = 21167
        mmWidth = 20638
        BandType = 0
      end
      object ppCotProdxFornLabel3: TppLabel
        UserName = 'ppCotProdxFornLabel3'
        Caption = 'Qtde Pedida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 76200
        mmTop = 21167
        mmWidth = 14552
        BandType = 0
      end
      object ppCotProdxFornLabel4: TppLabel
        UserName = 'ppCotProdxFornLabel4'
        Caption = 'Saldo em Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 99484
        mmTop = 21167
        mmWidth = 21696
        BandType = 0
      end
      object memForn: TppMemo
        UserName = 'memForn'
        Caption = 'memForn'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 19050
        mmLeft = 190500
        mmTop = 0
        mmWidth = 91811
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppCotProdxFornLine2: TppLine
        UserName = 'ppCotProdxFornLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 21960
        mmLeft = 131234
        mmTop = 19315
        mmWidth = 3969
        BandType = 0
      end
      object LbForn1: TppLabel
        UserName = 'LbForn1'
        AutoSize = False
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 132557
        mmTop = 20373
        mmWidth = 19579
        BandType = 0
      end
      object LbForn2: TppLabel
        UserName = 'LbForn2'
        AutoSize = False
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 20373
        mmWidth = 19579
        BandType = 0
      end
      object LbForn3: TppLabel
        UserName = 'LbForn3'
        AutoSize = False
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 174890
        mmTop = 20373
        mmWidth = 19579
        BandType = 0
      end
      object LbForn4: TppLabel
        UserName = 'LbForn4'
        AutoSize = False
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 196057
        mmTop = 20373
        mmWidth = 19579
        BandType = 0
      end
      object LbForn5: TppLabel
        UserName = 'LbForn5'
        AutoSize = False
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 217223
        mmTop = 20373
        mmWidth = 19579
        BandType = 0
      end
      object LbForn6: TppLabel
        UserName = 'LbForn6'
        AutoSize = False
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 238390
        mmTop = 20373
        mmWidth = 19579
        BandType = 0
      end
      object ppCotProdxFornLabel11: TppLabel
        UserName = 'ppCotProdxFornLabel11'
        Caption = 'Menor Val.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 265378
        mmTop = 21167
        mmWidth = 12700
        BandType = 0
      end
      object lnCol2: TppLine
        UserName = 'lnCol2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 22225
        mmLeft = 152929
        mmTop = 19315
        mmWidth = 3969
        BandType = 0
      end
      object lnCol3: TppLine
        UserName = 'lnCol3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 23548
        mmLeft = 174096
        mmTop = 19315
        mmWidth = 3969
        BandType = 0
      end
      object lnCol4: TppLine
        UserName = 'lnCol4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 22225
        mmLeft = 194998
        mmTop = 19050
        mmWidth = 3969
        BandType = 0
      end
      object lnCol5: TppLine
        UserName = 'lnCol5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 21167
        mmLeft = 216430
        mmTop = 19315
        mmWidth = 3969
        BandType = 0
      end
      object lnCol6: TppLine
        UserName = 'lnCol6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20902
        mmLeft = 237596
        mmTop = 19579
        mmWidth = 3969
        BandType = 0
      end
      object ppCotProdxFornLine9: TppLine
        UserName = 'ppCotProdxFornLine9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 21167
        mmLeft = 259292
        mmTop = 19315
        mmWidth = 3969
        BandType = 0
      end
    end
    object DetCot: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object LbCodArtigo: TppDBText
        UserName = 'LbCodArtigo'
        DataField = 'CODARTIGO'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppCotProdxFornDBText2: TppDBText
        UserName = 'ppCotProdxFornDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 20373
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppCotProdxFornDBText3: TppDBText
        UserName = 'ppCotProdxFornDBText3'
        DataField = 'QTDEPEDIDA'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 74877
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppCotProdxFornDBText4: TppDBText
        UserName = 'ppCotProdxFornDBText4'
        DataField = 'SALDOQTDE'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 105304
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppCotProdxFornDBText5: TppDBText
        UserName = 'ppCotProdxFornDBText5'
        DataField = 'CODMEDCUSTO'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 122767
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object ppCotProdxFornDBText6: TppDBText
        UserName = 'ppCotProdxFornDBText6'
        DataField = 'CODMEDIDA'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 91546
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object LbValForn1: TppDBText
        UserName = 'LbValForn1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'FORN1'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 143934
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object LbValForn2: TppDBText
        UserName = 'LbValForn2'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'FORN2'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 165100
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object LbValForn3: TppDBText
        UserName = 'LbValForn3'
        BlankWhenZero = True
        DataField = 'FORN3'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 177271
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object LbValForn4: TppDBText
        UserName = 'LbValForn4'
        BlankWhenZero = True
        DataField = 'FORN4'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 198438
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object LbValForn5: TppDBText
        UserName = 'LbValForn5'
        BlankWhenZero = True
        DataField = 'FORN5'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 219605
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object LbValForn6: TppDBText
        UserName = 'LbValForn6'
        BlankWhenZero = True
        DataField = 'FORN6'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 240771
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppCotProdxFornDBText13: TppDBText
        UserName = 'ppCotProdxFornDBText13'
        DataField = 'VLRMENOR'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 260880
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppCotProdxFornDBMemo1: TppDBMemo
        UserName = 'ppCotProdxFornDBMemo1'
        CharWrap = True
        DataField = 'JUSTIFICATIVA'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 5821
        mmLeft = 2381
        mmTop = 3440
        mmWidth = 128323
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 80698
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 70115
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
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
        mmTop = 70644
        mmWidth = 43127
        BandType = 8
      end
      object ppCotacaoCTabLabel2: TppLabel
        UserName = 'ppCotacaoCTabLabel2'
        Caption = 'Aprovações:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 4498
        mmWidth = 18256
        BandType = 8
      end
      object RgCotPxF1: TppRegion
        UserName = 'RgCotPxF1'
        Caption = 'RgCotPxF1'
        mmHeight = 25929
        mmLeft = 44979
        mmTop = 5027
        mmWidth = 65088
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object LbCarimbo1: TppLabel
          UserName = 'LbCarimbo1'
          Caption = 'LbCarimbo1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 46831
          mmTop = 6085
          mmWidth = 15081
          BandType = 8
        end
        object rpResumoColetaLabel25: TppLabel
          UserName = 'rpResumoColetaLabel25'
          Caption = 'Data: ____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 14552
          mmWidth = 28046
          BandType = 8
        end
        object rpResumoColetaLabel26: TppLabel
          UserName = 'rpResumoColetaLabel26'
          AutoSize = False
          Caption = '_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 21960
          mmWidth = 57415
          BandType = 8
        end
        object rpResumoColetaLabel27: TppLabel
          UserName = 'rpResumoColetaLabel27'
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 66675
          mmTop = 26194
          mmWidth = 25135
          BandType = 8
        end
      end
      object RgCotPxF2: TppRegion
        UserName = 'RgCotPxF2'
        Caption = 'RgCotPxF2'
        mmHeight = 25929
        mmLeft = 111919
        mmTop = 5027
        mmWidth = 65088
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object LbCarimbo2: TppLabel
          UserName = 'LbCarimbo2'
          Caption = 'lblCarimbo1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 113771
          mmTop = 6085
          mmWidth = 14552
          BandType = 8
        end
        object ppCotProdxFornLabel10: TppLabel
          UserName = 'ppCotProdxFornLabel10'
          Caption = 'Data: ____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 114036
          mmTop = 14552
          mmWidth = 28046
          BandType = 8
        end
        object ppCotProdxFornLabel12: TppLabel
          UserName = 'ppCotProdxFornLabel12'
          AutoSize = False
          Caption = '_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 116681
          mmTop = 21960
          mmWidth = 57415
          BandType = 8
        end
        object ppCotProdxFornLabel13: TppLabel
          UserName = 'ppCotProdxFornLabel13'
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 133615
          mmTop = 26194
          mmWidth = 25135
          BandType = 8
        end
      end
      object RgCotPxF3: TppRegion
        UserName = 'RgCotPxF3'
        Caption = 'RgCotPxF3'
        mmHeight = 25929
        mmLeft = 178594
        mmTop = 5027
        mmWidth = 65088
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object LbCarimbo3: TppLabel
          UserName = 'LbCarimbo3'
          Caption = 'lblCarimbo1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 180446
          mmTop = 6085
          mmWidth = 14552
          BandType = 8
        end
        object ppCotProdxFornLabel15: TppLabel
          UserName = 'ppCotProdxFornLabel15'
          Caption = 'Data: ____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 180711
          mmTop = 14552
          mmWidth = 28046
          BandType = 8
        end
        object ppCotProdxFornLabel16: TppLabel
          UserName = 'ppCotProdxFornLabel16'
          AutoSize = False
          Caption = '_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 183357
          mmTop = 21960
          mmWidth = 57415
          BandType = 8
        end
        object ppCotProdxFornLabel17: TppLabel
          UserName = 'ppCotProdxFornLabel17'
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 200290
          mmTop = 26194
          mmWidth = 25135
          BandType = 8
        end
      end
      object RgCotPxF4: TppRegion
        UserName = 'RgCotPxF4'
        Caption = 'RgCotPxF4'
        mmHeight = 25929
        mmLeft = 79904
        mmTop = 32544
        mmWidth = 65088
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object LbCarimbo4: TppLabel
          UserName = 'LbCarimbo4'
          Caption = 'lblCarimbo1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 81756
          mmTop = 33602
          mmWidth = 14552
          BandType = 8
        end
        object ppCotProdxFornLabel19: TppLabel
          UserName = 'ppCotProdxFornLabel19'
          Caption = 'Data: ____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 82021
          mmTop = 42069
          mmWidth = 28046
          BandType = 8
        end
        object ppCotProdxFornLabel20: TppLabel
          UserName = 'ppCotProdxFornLabel20'
          AutoSize = False
          Caption = '_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 84667
          mmTop = 49477
          mmWidth = 57415
          BandType = 8
        end
        object ppCotProdxFornLabel21: TppLabel
          UserName = 'ppCotProdxFornLabel21'
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 101600
          mmTop = 53711
          mmWidth = 25135
          BandType = 8
        end
      end
      object RgCotPxF5: TppRegion
        UserName = 'RgCotPxF5'
        Caption = 'RgCotPxF5'
        mmHeight = 25929
        mmLeft = 146844
        mmTop = 32544
        mmWidth = 65088
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object LbCarimbo5: TppLabel
          UserName = 'LbCarimbo5'
          Caption = 'lblCarimbo1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 148696
          mmTop = 33602
          mmWidth = 14552
          BandType = 8
        end
        object ppCotProdxFornLabel23: TppLabel
          UserName = 'ppCotProdxFornLabel23'
          Caption = 'Data: ____/____/____'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 148961
          mmTop = 42069
          mmWidth = 28046
          BandType = 8
        end
        object ppCotProdxFornLabel24: TppLabel
          UserName = 'ppCotProdxFornLabel24'
          AutoSize = False
          Caption = '_______________________________'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 151607
          mmTop = 49477
          mmWidth = 57415
          BandType = 8
        end
        object ppCotProdxFornLabel25: TppLabel
          UserName = 'ppCotProdxFornLabel25'
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 168540
          mmTop = 53711
          mmWidth = 25135
          BandType = 8
        end
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 110067
        mmTop = 70644
        mmWidth = 61913
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 70644
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppCotProdxFornSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppCotProdxFornDBCalc1: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc1'
        BlankWhenZero = True
        DataField = 'FORN1'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 132821
        mmTop = 794
        mmWidth = 19579
        BandType = 7
      end
      object ppCotProdxFornDBCalc2: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc2'
        BlankWhenZero = True
        DataField = 'FORN2'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 156104
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppCotProdxFornDBCalc3: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc3'
        BlankWhenZero = True
        DataField = 'FORN3'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 177271
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppCotProdxFornDBCalc4: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc4'
        BlankWhenZero = True
        DataField = 'FORN4'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 198438
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppCotProdxFornDBCalc5: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc5'
        BlankWhenZero = True
        DataField = 'FORN5'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 219605
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppCotProdxFornDBCalc6: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc6'
        BlankWhenZero = True
        DataField = 'FORN6'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 240771
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppCotProdxFornDBCalc7: TppDBCalc
        UserName = 'ppCotProdxFornDBCalc7'
        BlankWhenZero = True
        DataField = 'VLRMENOR'
        DataPipeline = pplCotProdxForn
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 2910
        mmLeft = 260880
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object ppCotProdxFornLine3: TppLine
        UserName = 'ppCotProdxFornLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppCotProdxFornLabel6: TppLabel
        UserName = 'ppCotProdxFornLabel6'
        Caption = 'Total dos Fornecedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 794
        mmWidth = 28575
        BandType = 7
      end
      object ppCotProdxFornLabel5: TppLabel
        UserName = 'ppCotProdxFornLabel5'
        Caption = 'Telefone para Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 4763
        mmWidth = 26458
        BandType = 7
      end
      object ppCotProdxFornLabel7: TppLabel
        UserName = 'ppCotProdxFornLabel7'
        Caption = 'Condições de Pagamento em dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 8467
        mmWidth = 40481
        BandType = 7
      end
      object ppCotProdxFornLabel8: TppLabel
        UserName = 'ppCotProdxFornLabel8'
        Caption = 'Prazo de Entrega em dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 12171
        mmWidth = 30692
        BandType = 7
      end
      object ppCotProdxFornLine4: TppLine
        UserName = 'ppCotProdxFornLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 15875
        mmWidth = 284300
        BandType = 7
      end
      object LbSumCol1: TppLine
        UserName = 'LbSumCol1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 131234
        mmTop = 265
        mmWidth = 3440
        BandType = 7
      end
      object LnSumCol2: TppLine
        UserName = 'LnSumCol2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 152929
        mmTop = 265
        mmWidth = 3440
        BandType = 7
      end
      object LnSumCol3: TppLine
        UserName = 'LnSumCol3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 174096
        mmTop = 265
        mmWidth = 3440
        BandType = 7
      end
      object LnSumCol4: TppLine
        UserName = 'LnSumCol4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 194998
        mmTop = 0
        mmWidth = 3440
        BandType = 7
      end
      object LnSumCol5: TppLine
        UserName = 'LnSumCol5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 216430
        mmTop = 0
        mmWidth = 3440
        BandType = 7
      end
      object LnSumCol6: TppLine
        UserName = 'LnSumCol6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 237596
        mmTop = 0
        mmWidth = 3440
        BandType = 7
      end
      object ppCotProdxFornLine12: TppLine
        UserName = 'ppCotProdxFornLine12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15875
        mmLeft = 259292
        mmTop = 0
        mmWidth = 3440
        BandType = 7
      end
      object ppCotProdxFornDBText1: TppDBText
        UserName = 'ppCotProdxFornDBText1'
        DataField = 'TELEFONE2'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 154252
        mmTop = 4763
        mmWidth = 19050
        BandType = 7
      end
      object ppCotProdxFornDBText7: TppDBText
        UserName = 'ppCotProdxFornDBText7'
        DataField = 'TELEFONE1'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 4763
        mmWidth = 19579
        BandType = 7
      end
      object ppCotProdxFornDBText8: TppDBText
        UserName = 'ppCotProdxFornDBText8'
        DataField = 'TELEFONE3'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 4763
        mmWidth = 19050
        BandType = 7
      end
      object ppCotProdxFornDBText9: TppDBText
        UserName = 'ppCotProdxFornDBText9'
        DataField = 'TELEFONE4'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 196586
        mmTop = 4763
        mmWidth = 19050
        BandType = 7
      end
      object ppCotProdxFornDBText10: TppDBText
        UserName = 'ppCotProdxFornDBText10'
        DataField = 'TELEFONE5'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 217753
        mmTop = 4498
        mmWidth = 19050
        BandType = 7
      end
      object ppCotProdxFornDBText11: TppDBText
        UserName = 'ppCotProdxFornDBText11'
        DataField = 'TELEFONE6'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 238919
        mmTop = 4498
        mmWidth = 19050
        BandType = 7
      end
      object ppCotProdxFornDBText12: TppDBText
        UserName = 'ppCotProdxFornDBText12'
        DataField = 'CONDPAG2'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 154517
        mmTop = 8467
        mmWidth = 18785
        BandType = 7
      end
      object ppCotProdxFornDBText14: TppDBText
        UserName = 'ppCotProdxFornDBText14'
        DataField = 'CONDPAG1'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 8467
        mmWidth = 19579
        BandType = 7
      end
      object ppCotProdxFornDBText15: TppDBText
        UserName = 'ppCotProdxFornDBText15'
        DataField = 'CONDPAG3'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 175684
        mmTop = 8467
        mmWidth = 18785
        BandType = 7
      end
      object ppCotProdxFornDBText16: TppDBText
        UserName = 'ppCotProdxFornDBText16'
        DataField = 'CONDPAG4'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 196850
        mmTop = 8467
        mmWidth = 18785
        BandType = 7
      end
      object ppCotProdxFornDBText17: TppDBText
        UserName = 'ppCotProdxFornDBText17'
        DataField = 'CONDPAG5'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 218017
        mmTop = 8467
        mmWidth = 18785
        BandType = 7
      end
      object ppCotProdxFornDBText18: TppDBText
        UserName = 'ppCotProdxFornDBText18'
        DataField = 'CONDPAG6'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 239184
        mmTop = 8467
        mmWidth = 18785
        BandType = 7
      end
      object ppCotProdxFornDBText19: TppDBText
        UserName = 'ppCotProdxFornDBText19'
        DataField = 'PRAZOENT2'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 154517
        mmTop = 12171
        mmWidth = 18521
        BandType = 7
      end
      object ppCotProdxFornDBText20: TppDBText
        UserName = 'ppCotProdxFornDBText20'
        DataField = 'PRAZOENT1'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 132821
        mmTop = 12171
        mmWidth = 19579
        BandType = 7
      end
      object ppCotProdxFornDBText21: TppDBText
        UserName = 'ppCotProdxFornDBText21'
        DataField = 'PRAZOENT3'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 175948
        mmTop = 12171
        mmWidth = 18521
        BandType = 7
      end
      object ppCotProdxFornDBText22: TppDBText
        UserName = 'ppCotProdxFornDBText22'
        DataField = 'PRAZOENT4'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 197115
        mmTop = 12171
        mmWidth = 18521
        BandType = 7
      end
      object ppCotProdxFornDBText23: TppDBText
        UserName = 'ppCotProdxFornDBText23'
        DataField = 'PRAZOENT5'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 218282
        mmTop = 12171
        mmWidth = 18521
        BandType = 7
      end
      object ppCotProdxFornDBText24: TppDBText
        UserName = 'ppCotProdxFornDBText24'
        DataField = 'PRAZOENT6'
        DataPipeline = pplCotProdxForn
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCotProdxForn'
        mmHeight = 3175
        mmLeft = 239448
        mmTop = 12171
        mmWidth = 18521
        BandType = 7
      end
    end
  end
  object updCotProdxForn: TUpdateSQL
    ModifySQL.Strings = (
      'update PROCXART'
      'set'
      '  FORN1 = :FORN1,'
      '  FORN2 = :FORN2,'
      '  FORN3 = :FORN3,'
      '  FORN4 = :FORN4,'
      '  FORN5 = :FORN5,'
      '  FORN6 = :FORN6'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART')
    InsertSQL.Strings = (
      'insert into PROCXART'
      '  (FORN1, FORN2, FORN3, FORN4, FORN5, FORN6)'
      'values'
      '  (:FORN1, :FORN2, :FORN3, :FORN4, :FORN5, :FORN6)')
    DeleteSQL.Strings = (
      'delete from PROCXART'
      'where'
      '  IDPROCXART = :OLD_IDPROCXART')
    Left = 30
    Top = 126
  end
  object qryCotacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PXA.IDPROCXART,'
      '     C.IDFORCLI,'
      '     C.PROPOSTA,'
      '     (C.PRECOAVALORPRES*C.QTDEFORNECIDA) AS VALTOTPRE,'
      '     C.STATUS,'
      '     C.PRECOAVALORPRES,'
      '     MV.MENORVALOR,'
      '     TF.MENORVALORF,'
      '     TF.VALTOTPREF,'
      '     TF.PERCMIXIDEAL,'
      '     (0) AS POS,'
      '     ('#39'                    '#39') AS TELEFONE,'
      '     ('#39'                    '#39') AS CONDPAG,'
      '     ('#39'                    '#39') AS PRAZOENT'
      'FROM'
      '    COTACOES C,'
      '    PROCXART PXA,'
      '   (SELECT'
      '        C.CODPROCESSO,'
      '        C.IDFORCLI,'
      '        C.PROPOSTA,'
      
        '        SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)) AS MENOR' +
        'VALORF, '
      
        '        SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C' +
        '.QTDEFORNECIDA) AS VALTOTPREF,'
      
        '        DECODE((SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))' +
        ',0,0,(((SUM(DECODE(C.PRECOAVALORPRES,NULL,0,C.PRECOAVALORPRES)*C' +
        '.QTDEFORNECIDA)/SUM(DECODE(MV.MENORVALOR,NULL,0,MV.MENORVALOR)))' +
        '-1)*100)) AS PERCMIXIDEAL'
      '    FROM'
      '        COTACOES C,'
      '       (SELECT C.IDPROCXART,  '
      
        '               SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN' +
        ' AS MENORVALOR'
      '        FROM'
      '               COTACOES C,'
      '              (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN'
      '               FROM'
      '                    COTACOES C'
      '               WHERE'
      '                  (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '                  ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39'))'
      '               GROUP BY IDPROCXART) N'
      '        WHERE'
      '              (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '              ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39')) AND'
      '              (C.IDPROCXART = N.IDPROCXART)'
      '        GROUP BY C.IDPROCXART, N.NUMVEN) MV'
      '    WHERE'
      '           (C.CODPROCESSO  = :pCODPROCESSO)'
      '       AND (C.IDPROCXART = MV.IDPROCXART)'
      '    GROUP BY C.CODPROCESSO, C.IDFORCLI, C.PROPOSTA) TF,'
      '   (SELECT C.IDPROCXART,  '
      
        '           SUM((C.PRECOAVALORPRES*C.QTDEFORNECIDA))/N.NUMVEN AS ' +
        'MENORVALOR'
      '    FROM'
      '           COTACOES C,'
      '           (SELECT C.IDPROCXART, COUNT(*) AS NUMVEN'
      '            FROM'
      '                 COTACOES C'
      '            WHERE'
      '               (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '               ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39'))'
      '            GROUP BY IDPROCXART) N'
      '    WHERE'
      '         (C.CODPROCESSO  = :pCODPROCESSO) AND '
      '         ((C.STATUS = '#39'S'#39') OR (C.STATUS = '#39'C'#39')) AND'
      '         (C.IDPROCXART = N.IDPROCXART)'
      '    GROUP BY C.IDPROCXART, N.NUMVEN'
      '    ) MV'
      'WHERE'
      '      (C.CODPROCESSO  = :pCODPROCESSO)'
      '  AND (PXA.CODPROCESSO = C.CODPROCESSO)'
      '  AND (PXA.IDPROCXART = C.IDPROCXART)'
      '  AND (C.IDPROCXART = MV.IDPROCXART)'
      '  AND (C.CODPROCESSO = TF.CODPROCESSO)'
      '  AND (C.IDFORCLI = TF.IDFORCLI)'
      '  AND (C.PROPOSTA = TF.PROPOSTA)'
      'ORDER BY PXA.IDPROCXART, C.IDFORCLI, C.PROPOSTA')
    UpdateObject = updCotacao
    ValidateWithMask = True
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryCotacaoIDPROCXART: TFloatField
      FieldName = 'IDPROCXART'
    end
    object qryCotacaoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryCotacaoPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
    end
    object qryCotacaoVALTOTPRE: TFloatField
      FieldName = 'VALTOTPRE'
    end
    object qryCotacaoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qryCotacaoMENORVALOR: TFloatField
      FieldName = 'MENORVALOR'
    end
    object qryCotacaoMENORVALORF: TFloatField
      FieldName = 'MENORVALORF'
    end
    object qryCotacaoVALTOTPREF: TFloatField
      FieldName = 'VALTOTPREF'
    end
    object qryCotacaoPERCMIXIDEAL: TFloatField
      FieldName = 'PERCMIXIDEAL'
    end
    object qryCotacaoPOS: TFloatField
      FieldName = 'POS'
    end
    object qryCotacaoPRECOAVALORPRES: TFloatField
      FieldName = 'PRECOAVALORPRES'
    end
    object qryCotacaoTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryCotacaoCONDPAG: TStringField
      FieldName = 'CONDPAG'
    end
    object qryCotacaoPRAZOENT: TStringField
      FieldName = 'PRAZOENT'
    end
  end
  object updCotacao: TUpdateSQL
    Left = 280
    Top = 8
  end
  object qryFornCot: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.PROPOSTA,'
      '     P.RAZAOSOCIAL,'
      '     MIN(C.PRECOAVALORPRES) AS VALOR,'
      '     MAX(TEL.TELEFONE) AS TELEFONE'
      'FROM'
      '    PESSOA P,'
      '    ENDPESS E,'
      '   ('
      
        '    SELECT TP.IDENDERECO,( '#39'( '#39'|| RTRIM(TP.DDD)||'#39' ) '#39'|| RTRIM(T' +
        'P.NUMERO) ) AS TELEFONE'
      '    FROM  TELENDPESS  TP,'
      '          (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '           FROM TELENDPESS'
      '           WHERE (TIPO LIKE '#39'%C%'#39')'
      '           GROUP BY IDENDERECO) C'
      '    WHERE (TP.IDENDERECO = C.IDENDERECO)'
      '      AND (TP.IDTELEFONE = C.IDTELEFONE)'
      '   ) TEL,'
      '    COTACOES C'
      'WHERE'
      '      (C.CODPROCESSO  = :CODPROCESSO)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+) = P.IDENDCOMERCIAL)'
      '  AND (E.IDENDERECO    = TEL.IDENDERECO(+))'
      'GROUP BY C.IDFORCLI,'
      '     '#9'   C.PROPOSTA,'
      '     '#9'   P.RAZAOSOCIAL'
      'ORDER BY VALOR,P.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 344
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
    object qryFornCotIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'COTACOES.IDFORCLI'
    end
    object qryFornCotPROPOSTA: TFloatField
      FieldName = 'PROPOSTA'
      Origin = 'COTACOES.PROPOSTA'
    end
    object qryFornCotRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFornCotVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'COTACOES.PRECOAVALORPRES'
    end
    object qryFornCotTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 30
    end
  end
  object qryPrazo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.PROPOSTA,'
      '     P.RAZAOSOCIAL,'
      '     MIN(C.PRECOAVALORPRES) AS VALOR,'
      '     MAX(TEL.TELEFONE) AS TELEFONE'
      'FROM'
      '    PESSOA P,'
      '    ENDPESS E,'
      '   ('
      
        '    SELECT TP.IDENDERECO,( '#39'( '#39'|| RTRIM(TP.DDD)||'#39' ) '#39'|| RTRIM(T' +
        'P.NUMERO) ) AS TELEFONE'
      '    FROM  TELENDPESS  TP,'
      '          (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '           FROM TELENDPESS'
      '           WHERE (TIPO LIKE '#39'%C%'#39')'
      '           GROUP BY IDENDERECO) C'
      '    WHERE (TP.IDENDERECO = C.IDENDERECO)'
      '      AND (TP.IDTELEFONE = C.IDTELEFONE)'
      '   ) TEL,'
      '    COTACOES C'
      'WHERE'
      '      (C.CODPROCESSO  = :CODPROCESSO)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+) = P.IDENDCOMERCIAL)'
      '  AND (E.IDENDERECO    = TEL.IDENDERECO(+))'
      'GROUP BY C.IDFORCLI,'
      '     '#9'   C.PROPOSTA,'
      '     '#9'   P.RAZAOSOCIAL'
      'ORDER BY VALOR,P.RAZAOSOCIAL')
    ValidateWithMask = True
    Left = 312
    Top = 110
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODPROCESSO'
        ParamType = ptUnknown
      end>
  end
end
