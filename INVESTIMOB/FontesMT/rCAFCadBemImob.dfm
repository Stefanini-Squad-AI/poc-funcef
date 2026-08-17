inherited RptCAFCadBemImob: TRptCAFCadBemImob
  Left = 317
  Top = 199
  Width = 336
  Caption = 'RptCAFCadBemImob'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Segmento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODTIPIMOVEL, DESCTIPOIMOVEL'
          '   FROM TIPOIMOVEL'
          ' ORDER BY DESCTIPOIMOVEL')
        LookupSettings.Chave = 'CODTIPIMOVEL'
        LookupSettings.Display = 'DESCTIPOIMOVEL'
        LookupSettings.Descricao = 'Segmento'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TIPOIMOVEL'
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
        Caption = 'Imovel Mestre'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDIMOVEL, IMONOME'
          'FROM IMOVEL'
          'WHERE IDIMOVELMESTRE IS NULL '
          'ORDER BY IMONOME')
        LookupSettings.Chave = 'IDIMOVEL'
        LookupSettings.Display = 'IMONOME'
        LookupSettings.Descricao = 'Imóvel Mestre'
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
        Name = 'IMOVELMESTRE'
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
        Caption = 'Imóvel'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT I.IDIMOVEL, IM.IMONOME || '#39' - '#39' || I.IMONOME AS IMONOME'
          'FROM IMOVEL I, IMOVEL IM'
          'WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL'
          'ORDER BY IMONOME')
        LookupSettings.Chave = 'IDIMOVEL'
        LookupSettings.Display = 'IMONOME'
        LookupSettings.Descricao = 'Imóvel'
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
        Name = 'IMOVEL'
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
        Caption = 'Controle'
        Controle = tcComboBox
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
        ComboBoxSettings.Items.Strings = (
          'Total'
          'Físico')
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
        Name = 'CONTROLE'
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
        Caption = 'Classe'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCRICAO, CODHIERARQ, IDCLASSEBEM'
          'FROM CLASSEDEBEM'
          'WHERE (ANASINT = '#39'A'#39')'
          'ORDER BY CODHIERARQ')
        LookupSettings.Chave = 'IDCLASSEBEM'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '50'
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
        Name = 'CLASSE'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'GRUPO'
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
        Caption = 'Localização'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, IDLOCALIZACAO'
          'FROM LOCALIZACAO'
          'ORDER BY NOME'
          '')
        LookupSettings.Chave = 'IDLOCALIZACAO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '45'
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
        Name = 'LOCALIZACAO'
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
        Caption = 'Responsável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME'
          '')
        LookupSettings.Chave = 'IDRESPONSAVEL'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Nome'
        LookupSettings.Tamanho = '60'
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
        Name = 'RESPONSAVEL'
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
        Caption = 'Conjunto'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCCONJUNTO, IDCONJUNTO'
          'FROM CONJUNTO'
          'ORDER BY DESCCONJUNTO')
        LookupSettings.Chave = 'IDCONJUNTO'
        LookupSettings.Display = 'DESCCONJUNTO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '200'
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
        Name = 'CONJUNTO'
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
        Caption = 'Placa'
        Controle = tcMontaSelect
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'PLACA'
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
        MontaSelect = MSBem
        Width = 0
      end
      item
        Caption = 'Data de Entrada Inicial'
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
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DATAINI'
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
        Caption = 'Data de Entrada Final'
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
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DATAFIM'
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
        Caption = 'Movimentados até'
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
        Name = 'DATAMOVIM'
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
        Caption = 'Baixados'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Não'
          'Sim'
          'Ambos')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
        Name = 'BAIXADOS'
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
  inherited sqlBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT B.PLACA, B.DESBEM, B.DATAULTDEP, B.DATAINICIODEP, B.IDNOT' +
        'A, B.COMPLNOTA,'
      
        '       B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS' +
        ' DESCCCUSTO,'
      
        '       L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCG' +
        'RUPO,'
      
        '       C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS V' +
        'ALHISTORICO, DESCTIPOIMOVEL, I.IMOCODIGO,'
      
        '       PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCL' +
        'ASSE, IM.IMONOME AS NOME_MESTRE,'
      
        '       S.DESCSITUACAO, BAIXA.DATABAIXA, I.IMOCODIGO, (IM.IMONOME' +
        ' || '#39' - '#39' || I.IMONOME) AS IMOVEL,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALO' +
        'RG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBE' +
        'M0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPL' +
        'ANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDE' +
        'P0,'
      '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      
        '        SB.REAVVALORG + SB.REAVCMBEM - SB.REAVDEPLANC - SB.REAVC' +
        'MDEP +'
      
        '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM - SB.ULTREAVDEPLANC -' +
        ' SB.ULTREAVCMDEP) AS VALCTB0'
      ''
      'FROM BEM B,'
      '     GRUPO G,'
      '     PLANOGRUPO PG,'
      '     CLASSEDEBEM CB,'
      '     CONJUNTO C,'
      '     LOCALIZACAO L,'
      '     CENTCUST CC,'
      '     PESSOA PR,'
      '     PESSOA PF,'
      
        '     SITUACAO S, IMOVELXBEM IXB, IMOVEL I, IMOVEL IM, TIPOIMOVEL' +
        ' T,'
      ''
      
        '     (SELECT HM.IDPESSOA, HM.IDBEM, HM.DATAMOVIMENTACAO AS DATAB' +
        'AIXA'
      '      FROM   HISTORICOMOVIMENTACAO HM'
      '      WHERE  (HM.IDTIPOMOVIMENTACAO = 06)'
      '        AND  (HM.DATAMOVIMENTACAO <= :DATASLD)) BAIXA,'
      ''
      '     (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM,'
      '             SCB1.MOECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND MOECODIGO = :MOECODIGO'
      ''
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      ''
      '        AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCB1.IDBEM = DTAMAX.IDBEM'
      '        AND SCB1.IDBEM = SCD1.IDBEM'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM ) SB'
      ''
      'WHERE B.DATAINICIODEP <= :DATASLD'
      '  AND G.FLGIMOVEL = 1'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND B.IDCONJUNTO = C.IDCONJUNTO'
      '  AND B.IDPESSOA = C.IDPESSOA'
      '  AND C.IDRESPONSAVEL = PR.IDPESSOA'
      '  AND C.IDLOCALIZACAO = L.IDLOCALIZACAO'
      '  AND C.IDPESSOA = L.IDPESSOA'
      '  AND L.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND L.IDEMPRESA = CC.IDEMPRESA'
      '  AND B.IDGRUPO = PG.IDGRUPO'
      '  AND B.IDPESSOA = PG.IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCLASSEBEM = CB.IDCLASSEBEM'
      
        '  AND B.IDSITUACAO = S.IDSITUACAO  AND I.CODTIPIMOVEL = T.CODTIP' +
        'IMOVEL'
      '  AND B.IDFORNSERV = PF.IDPESSOA(+) AND B.IDBEM = IXB.IDBEM'
      '  AND B.IDBEM = SB.IDBEM(+)  AND IXB.IDIMOVEL = I.IDIMOVEL'
      
        '  AND B.IDBEM = BAIXA.IDBEM(+) AND I.IDIMOVELMESTRE = IM.IDIMOVE' +
        'L'
      'ORDER BY T.DESCTIPOIMOVEL, IM.IMONOME, I.IMONOME'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 246
    Top = 64
  end
  inherited cdsBem: TCMClientDataSet
    Left = 246
    Top = 17
  end
  inherited dsBem: TwwDataSource
    Left = 286
    Top = 110
  end
  inherited ppBem: TppBDEPipeline
    Left = 286
    Top = 64
    object ppBemppField28: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppBemppField29: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
      Sortable = False
    end
    object ppBemppField30: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
      Sortable = False
    end
    object ppBemppField31: TppField
      FieldAlias = 'IMOVEL'
      FieldName = 'IMOVEL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
      Sortable = False
    end
  end
  inherited rpBem: TppReport
    Left = 286
    Top = 16
    DataPipelineName = 'ppBem'
    inherited ppDetailBand1: TppDetailBand
      mmHeight = 29104
      inherited rpBemLabel1: TppLabel
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 9260
      end
      inherited rpBemLabel2: TppLabel
        mmHeight = 3440
        mmLeft = 124090
        mmWidth = 13229
      end
      inherited rpBemDBText2: TppDBText
        DataPipelineName = 'ppBem'
        mmLeft = 138907
        mmWidth = 140229
      end
      inherited rpBemLabel4: TppLabel [3]
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 13229
        mmWidth = 16933
      end
      inherited rpBemDBText4: TppDBText [4]
        DataPipelineName = 'ppBem'
        mmLeft = 170127
        mmTop = 13229
        mmWidth = 52917
      end
      inherited rpBemLabel5: TppLabel [5]
        mmHeight = 3440
        mmLeft = 80433
        mmTop = 13494
        mmWidth = 18256
      end
      inherited rpBemDBText5: TppDBText [6]
        DataPipelineName = 'ppBem'
        mmLeft = 99484
        mmTop = 13229
        mmWidth = 52123
      end
      inherited rpBemLabel6: TppLabel [7]
      end
      inherited rpBemDBText6: TppDBText [8]
        DataPipelineName = 'ppBem'
        mmLeft = 23019
        mmWidth = 98690
      end
      inherited rpBemLabel9: TppLabel [9]
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 17463
        mmWidth = 16140
      end
      inherited rpBemDBText8: TppDBText [10]
        DataPipelineName = 'ppBem'
        mmLeft = 170127
        mmTop = 17463
      end
      inherited rpBemDBText10: TppDBText [11]
        DataPipelineName = 'ppBem'
        mmLeft = 188119
        mmTop = 4498
        mmWidth = 10319
      end
      inherited rpBemDBText11: TppDBText [12]
        DataPipelineName = 'ppBem'
        mmLeft = 255323
        mmTop = 13494
      end
      inherited rpBemLabel11: TppLabel [13]
        mmHeight = 3440
        mmLeft = 225425
        mmTop = 13494
        mmWidth = 20902
      end
      inherited rpBemLabel13: TppLabel [14]
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 13494
        mmWidth = 11377
      end
      inherited rpBemDBText13: TppDBText [15]
        DataPipelineName = 'ppBem'
        mmLeft = 23019
        mmTop = 13494
        mmWidth = 56092
      end
      inherited rpBemLabel14: TppLabel [16]
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 23813
        mmWidth = 23283
      end
      inherited rpBemLabel15: TppLabel [17]
        mmHeight = 3440
        mmLeft = 57415
        mmTop = 23813
        mmWidth = 21696
      end
      inherited rpBemLabel16: TppLabel [18]
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 23813
        mmWidth = 26194
      end
      inherited rpBemLabel17: TppLabel [19]
        mmLeft = 171186
        mmTop = 23813
      end
      inherited rpBemLabel18: TppLabel [20]
        mmHeight = 3440
        mmLeft = 233892
        mmTop = 23813
        mmWidth = 20108
      end
      inherited rpBemDBText14: TppDBText [21]
        DataPipelineName = 'ppBem'
        mmLeft = 29104
        mmTop = 23813
      end
      inherited rpBemDBText15: TppDBText [22]
        DataPipelineName = 'ppBem'
        mmLeft = 80433
        mmTop = 23813
      end
      inherited rpBemDBText16: TppDBText [23]
        DataPipelineName = 'ppBem'
        mmLeft = 144198
        mmTop = 23813
      end
      inherited rpBemDBText17: TppDBText [24]
        DataPipelineName = 'ppBem'
        mmLeft = 207698
        mmTop = 23813
      end
      inherited rpBemDBText18: TppDBText [25]
        DataPipelineName = 'ppBem'
        mmLeft = 255588
        mmTop = 23813
        mmWidth = 24606
      end
      inherited rpBemLabel19: TppLabel [26]
        mmHeight = 3440
        mmLeft = 225425
        mmTop = 18256
        mmWidth = 28840
      end
      inherited rpBemDBText19: TppDBText [27]
        DataPipelineName = 'ppBem'
        mmLeft = 255323
        mmTop = 17992
        mmWidth = 15875
      end
      inherited rpBemLabel20: TppLabel [28]
        mmHeight = 3440
        mmLeft = 271992
        mmTop = 17992
      end
      inherited rpBemLabel21: TppLabel [29]
        mmHeight = 3440
        mmLeft = 80433
        mmTop = 17727
        mmWidth = 11906
      end
      inherited rpBemDBText20: TppDBText [30]
        DataPipelineName = 'ppBem'
        mmLeft = 99484
        mmTop = 17463
        mmWidth = 30163
      end
      inherited rpBemLabel22: TppLabel [31]
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 17992
        mmWidth = 13758
      end
      inherited rpBemLabel23: TppLabel [32]
        mmLeft = 23019
        mmTop = 17992
      end
      inherited rpBemCalc1: TppVariable [33]
        mmLeft = 23019
        mmTop = 9260
      end
      inherited rpBemDataBaixa: TppVariable [34]
        mmTop = 17992
        mmWidth = 33338
      end
      inherited rpBemLabel3: TppLabel [35]
        Caption = 'Bem'
        mmHeight = 3440
        mmLeft = 49477
        mmTop = 9260
        mmWidth = 6085
      end
      inherited rpBemDBText3: TppDBText [36]
        DataPipelineName = 'ppBem'
        mmLeft = 60325
        mmTop = 9260
        mmWidth = 219605
      end
      inherited rpBemLabel7: TppLabel [37]
        mmHeight = 3440
        mmLeft = 4763
        mmWidth = 9260
      end
      object ppLabel1: TppLabel [38]
        UserName = 'Label1'
        Caption = 'Cod. Imóvel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 4763
        mmTop = 5027
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText [39]
        UserName = 'DBText4'
        DataField = 'IMOCODIGO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBem'
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 4763
        mmWidth = 21960
        BandType = 4
      end
      object ppLabel2: TppLabel [40]
        UserName = 'Label2'
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 49477
        mmTop = 5027
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText3: TppDBText [41]
        UserName = 'DBText3'
        DataField = 'IMOVEL'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBem'
        mmHeight = 3704
        mmLeft = 60325
        mmTop = 4763
        mmWidth = 90752
        BandType = 4
      end
      inherited rpBemLabel8: TppLabel [42]
        Visible = False
        mmHeight = 3440
        mmLeft = 220134
        mmTop = 4763
        mmWidth = 16404
      end
      inherited rpBemDBText7: TppDBText [43]
        Visible = False
        DataPipelineName = 'ppBem'
        mmLeft = 241565
        mmTop = 4763
        mmWidth = 6615
      end
      inherited rpBemLabel10: TppLabel [44]
        Visible = False
        mmLeft = 168805
        mmTop = 4763
        mmWidth = 9790
      end
      inherited rpBemDBText9: TppDBText [45]
        Visible = False
        DataPipelineName = 'ppBem'
        mmLeft = 178859
        mmTop = 4498
        mmWidth = 8731
      end
      inherited rpBemDBText12: TppDBText [46]
        Visible = False
        DataPipelineName = 'ppBem'
        mmLeft = 210609
        mmTop = 4763
        mmWidth = 8996
      end
      inherited rpBemLabel12: TppLabel [47]
        Visible = False
        mmHeight = 3440
        mmLeft = 199232
        mmTop = 4763
        mmWidth = 10848
      end
      object ppLine7: TppLine [48]
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 4763
        mmTop = 22754
        mmWidth = 276755
        BandType = 4
      end
      object ppLine5: TppLine [49]
        UserName = 'Line5'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 529
        mmLeft = 4763
        mmTop = 28575
        mmWidth = 276755
        BandType = 4
      end
      inherited rpBemLine1: TppLine [50]
        Visible = False
        mmTop = 24077
      end
      inherited rpBemLine2: TppLine [51]
        Pen.Width = 2
        Visible = False
        Weight = 1.5
        mmTop = 25400
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOIMOVEL'
      DataPipeline = ppBem
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBem'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = ppBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBem'
          mmHeight = 3969
          mmLeft = 17992
          mmTop = 2646
          mmWidth = 103717
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2381
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 7938
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 529
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Total Contábil Segmento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 218811
          mmTop = 4233
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 2646
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line8'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 1852
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284428
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALCTB0'
          DataPipeline = ppBem
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBem'
          mmHeight = 3175
          mmLeft = 255588
          mmTop = 4233
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME_MESTRE'
      DataPipeline = ppBem
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBem'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOME_MESTRE'
          DataPipeline = ppBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBem'
          mmHeight = 3969
          mmLeft = 27517
          mmTop = 1323
          mmWidth = 102923
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Imóvel Mestre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2910
          mmTop = 1058
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Total Contábil Mestre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 223044
          mmTop = 4233
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 2910
          mmTop = 2910
          mmWidth = 278342
          BandType = 5
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line2'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 2117
          mmLeft = 2910
          mmTop = 8731
          mmWidth = 278342
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALCTB0'
          DataPipeline = ppBem
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBem'
          mmHeight = 3175
          mmLeft = 255588
          mmTop = 4233
          mmWidth = 24606
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  inherited cdsParamCaf: TCMClientDataSet
    Left = 24
    Top = 112
  end
  inherited sqlParamCaf: TCMSqlParams
    Left = 24
    Top = 64
  end
  inherited cdsVerUltFec: TCMClientDataSet
    Left = 104
    Top = 112
  end
  inherited sqlVerUltFec: TCMSqlParams
    Left = 104
    Top = 64
  end
  inherited MSBem: TMontaSelect
    Tag = 9
    Left = 168
    Top = 112
  end
end
