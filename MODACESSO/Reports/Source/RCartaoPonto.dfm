inherited RptCartaoPonto: TRptCartaoPonto
  Left = 242
  Width = 282
  Height = 284
  Caption = 'RptCartaoPonto'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
        Caption = 'DataRef'
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
        Name = 'DataRef'
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
        Caption = 'SitFunc'
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
        Name = 'SitFunc'
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
        Caption = 'FlgDoisCargos'
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
        Name = 'FlgDoisCargos'
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
        Caption = 'ListaIdCargo'
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
        Name = 'ListaIdCargo'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpCartaoPonto
  end
  object sqlCartaoPonto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS ESTAB,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS CGC,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS ENDERECO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS UF,'
      '  0 AS IDPESSOA,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',40,'#39'1'#39') AS REFERENCIA,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS CARGO,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS C_CUSTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATAADMISSAO,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS NOMEHORARIO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS EMISSAO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS PER_AQUI_INI,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS PER_AQUI_FIN,'
      '  0 AS NUM_DIAS_MES,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA01, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA02, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA03,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA04, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA05, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA06,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA07, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA08, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA09,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA10, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA11, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA12,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA13, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA14, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA15,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA16, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA17, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA18,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA19, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA20, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA21,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA22, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA23, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA24,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA25, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA26, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA27,'
      
        '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA28, LPAD('#39'1'#39',23,'#39'1'#39') AS DIA29, LPAD('#39'1'#39 +
        ',23,'#39'1'#39') AS DIA30,'
      '  LPAD('#39'1'#39',23,'#39'1'#39') AS DIA31,'
      ''
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS01, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS02, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS03,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS04, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS05, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS06,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS07, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS08, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS09,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS10, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS11, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS12,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS13, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS14, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS15,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS16, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS17, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS18,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS19, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS20, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS21,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS22, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS23, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS24,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS25, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS26, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS27,'
      
        '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS28, LPAD('#39'1'#39',13,'#39'1'#39') AS OBS29, LPAD('#39'1'#39 +
        ',13,'#39'1'#39') AS OBS30,'
      '  LPAD('#39'1'#39',13,'#39'1'#39') AS OBS31'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsCartaoPonto
    Left = 217
    Top = 190
  end
  object CdsCartaoPonto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsCartaoPontoAfterScroll
    Left = 217
    Top = 144
  end
  object rpCartaoPonto: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '6350'
      '144150')
    DataPipeline = ppCartaoPonto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
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
    mmColumnWidth = 142150
    DataPipelineName = 'ppCartaoPonto'
    object rpCartaoPontoHdrBnd: TppColumnHeaderBand
      AfterPrint = rpCartaoPontoHdrBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2381
      mmPrintPosition = 0
    end
    object rpCartaoPontoDtlBnd: TppDetailBand
      BeforePrint = rpCartaoPontoDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 193675
      mmPrintPosition = 0
      object rpCartaoPontoShapeDia31_2: TppShape
        UserName = 'rpCartaoPontoShapeDia31_2'
        mmHeight = 4763
        mmLeft = 75142
        mmTop = 138907
        mmWidth = 33338
        BandType = 4
      end
      object rpCartaoPontoShapeDia30_2: TppShape
        UserName = 'rpCartaoPontoShapeDia30_2'
        mmHeight = 4763
        mmLeft = 75142
        mmTop = 134409
        mmWidth = 33338
        BandType = 4
      end
      object rpCartaoPontoShapeDia29_2: TppShape
        UserName = 'rpCartaoPontoShapeDia29_2'
        mmHeight = 4763
        mmLeft = 75142
        mmTop = 129911
        mmWidth = 33338
        BandType = 4
      end
      object rpCartaoPontoShapeDia30_1: TppShape
        UserName = 'rpCartaoPontoShapeDia30_1'
        mmHeight = 4763
        mmLeft = 66940
        mmTop = 134409
        mmWidth = 8467
        BandType = 4
      end
      object rpCartaoPontoShapeDia29_1: TppShape
        UserName = 'rpCartaoPontoShapeDia29_1'
        mmHeight = 4763
        mmLeft = 66940
        mmTop = 129911
        mmWidth = 8467
        BandType = 4
      end
      object rpCartaoPontoShape4: TppShape
        UserName = 'rpCartaoPontoShape4'
        mmHeight = 26723
        mmLeft = 265
        mmTop = 35454
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape2: TppShape
        UserName = 'rpCartaoPontoShape2'
        Brush.Style = bsClear
        mmHeight = 6879
        mmLeft = 265
        mmTop = 20638
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape3: TppShape
        UserName = 'rpCartaoPontoShape3'
        mmHeight = 6879
        mmLeft = 265
        mmTop = 27252
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape5: TppShape
        UserName = 'rpCartaoPontoShape5'
        Brush.Style = bsClear
        mmHeight = 8202
        mmLeft = 265
        mmTop = 63500
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShapeDia31_1: TppShape
        UserName = 'rpCartaoPontoShapeDia31_1'
        mmHeight = 4763
        mmLeft = 66940
        mmTop = 138907
        mmWidth = 8467
        BandType = 4
      end
      object rpCartaoPontoShape6: TppShape
        UserName = 'rpCartaoPontoShape6'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 71438
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape1: TppShape
        UserName = 'rpCartaoPontoShape1'
        mmHeight = 5292
        mmLeft = 65088
        mmTop = 13229
        mmWidth = 66940
        BandType = 4
      end
      object rpCartaoPontoShape7: TppShape
        UserName = 'rpCartaoPontoShape7'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 75936
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape20: TppShape
        UserName = 'rpCartaoPontoShape20'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 134409
        mmWidth = 66940
        BandType = 4
      end
      object rpCartaoPontoShape19: TppShape
        UserName = 'rpCartaoPontoShape19'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 129911
        mmWidth = 66940
        BandType = 4
      end
      object rpCartaoPontoShape18: TppShape
        UserName = 'rpCartaoPontoShape18'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 125413
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape17: TppShape
        UserName = 'rpCartaoPontoShape17'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 120915
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape16: TppShape
        UserName = 'rpCartaoPontoShape16'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 116417
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape15: TppShape
        UserName = 'rpCartaoPontoShape15'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 111919
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape14: TppShape
        UserName = 'rpCartaoPontoShape14'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 107421
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape13: TppShape
        UserName = 'rpCartaoPontoShape13'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 102923
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape12: TppShape
        UserName = 'rpCartaoPontoShape12'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 98425
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape11: TppShape
        UserName = 'rpCartaoPontoShape11'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 93927
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape10: TppShape
        UserName = 'rpCartaoPontoShape10'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 89429
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape9: TppShape
        UserName = 'rpCartaoPontoShape9'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 84931
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoShape8: TppShape
        UserName = 'rpCartaoPontoShape8'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 80433
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoLbl1: TppLabel
        UserName = 'rpCartaoPontoLbl1'
        AutoSize = False
        Caption = 'Cartão de Ponto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 4657
        mmLeft = 65617
        mmTop = 13494
        mmWidth = 65881
        BandType = 4
      end
      object rpCartaoPontoLblDia01: TppLabel
        UserName = 'rpCartaoPontoLblDia01'
        AutoSize = False
        Caption = '01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 71702
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia02: TppLabel
        UserName = 'rpCartaoPontoLblDia02'
        AutoSize = False
        Caption = '02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 76200
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia03: TppLabel
        UserName = 'rpCartaoPontoLblDia03'
        AutoSize = False
        Caption = '03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 80698
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia04: TppLabel
        UserName = 'rpCartaoPontoLblDia04'
        AutoSize = False
        Caption = '04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 85196
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia05: TppLabel
        UserName = 'rpCartaoPontoLblDia05'
        AutoSize = False
        Caption = '05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 89694
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia06: TppLabel
        UserName = 'rpCartaoPontoLblDia06'
        AutoSize = False
        Caption = '06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 94192
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia07: TppLabel
        UserName = 'rpCartaoPontoLblDia07'
        AutoSize = False
        Caption = '07'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 98690
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia08: TppLabel
        UserName = 'rpCartaoPontoLblDia08'
        AutoSize = False
        Caption = '08'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 103188
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia09: TppLabel
        UserName = 'rpCartaoPontoLblDia09'
        AutoSize = False
        Caption = '09'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 107686
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia10: TppLabel
        UserName = 'rpCartaoPontoLblDia10'
        AutoSize = False
        Caption = '10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 112184
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia11: TppLabel
        UserName = 'rpCartaoPontoLblDia11'
        AutoSize = False
        Caption = '11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 116681
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia12: TppLabel
        UserName = 'rpCartaoPontoLblDia12'
        AutoSize = False
        Caption = '12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 121179
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia13: TppLabel
        UserName = 'rpCartaoPontoLblDia13'
        AutoSize = False
        Caption = '13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 125677
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia14: TppLabel
        UserName = 'rpCartaoPontoLblDia14'
        AutoSize = False
        Caption = '14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 130175
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia15: TppLabel
        UserName = 'rpCartaoPontoLblDia15'
        AutoSize = False
        Caption = '15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 134673
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLbl15: TppLabel
        UserName = 'rpCartaoPontoLbl15'
        AutoSize = False
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 65881
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLbl13: TppLabel
        UserName = 'rpCartaoPontoLbl13'
        AutoSize = False
        Caption = 'Entrada   Intervalo    Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 67998
        mmWidth = 30692
        BandType = 4
      end
      object rpCartaoPontoDBTxt6: TppDBText
        UserName = 'rpCartaoPontoDBTxt6'
        DataField = 'CARGO'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 45244
        mmWidth = 94986
        BandType = 4
      end
      object rpCartaoPontoLine8: TppLine
        UserName = 'rpCartaoPontoLine8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 75406
        mmLeft = 8467
        mmTop = 63500
        mmWidth = 794
        BandType = 4
      end
      object rpCartaoPontoLine10: TppLine
        UserName = 'rpCartaoPontoLine10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 75406
        mmLeft = 41540
        mmTop = 63500
        mmWidth = 1058
        BandType = 4
      end
      object rpCartaoPontoDBTxt2: TppDBText
        UserName = 'rpCartaoPontoDBTxt2'
        DataField = 'CGC'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 23813
        mmWidth = 31485
        BandType = 4
      end
      object rpCartaoPontoDBTxt1: TppDBText
        UserName = 'rpCartaoPontoDBTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 23813
        mmWidth = 94986
        BandType = 4
      end
      object rpCartaoPontoDBTxt5: TppDBText
        UserName = 'rpCartaoPontoDBTxt5'
        DataField = 'EMPREGADO'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 38629
        mmWidth = 94986
        BandType = 4
      end
      object rpCartaoPontoDBTxt4: TppDBText
        UserName = 'rpCartaoPontoDBTxt4'
        DataField = 'UF'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 30427
        mmWidth = 31485
        BandType = 4
      end
      object rpCartaoPontoDBTxt3: TppDBText
        UserName = 'rpCartaoPontoDBTxt3'
        DataField = 'ENDERECO'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 30427
        mmWidth = 94986
        BandType = 4
      end
      object rpCartaoPontoDBTxt7: TppDBText
        UserName = 'rpCartaoPontoDBTxt7'
        DataField = 'MATRICULA'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 45244
        mmWidth = 31485
        BandType = 4
      end
      object rpCartaoPontoDBTxt9: TppDBText
        UserName = 'rpCartaoPontoDBTxt9'
        DataField = 'NOMEHORARIO'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 58473
        mmWidth = 94986
        BandType = 4
      end
      object rpCartaoPontoDBTxt8: TppDBText
        UserName = 'rpCartaoPontoDBTxt8'
        DataField = 'C_CUSTO'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 51858
        mmWidth = 94986
        BandType = 4
      end
      object rpCartaoPontoDBTxt10: TppDBText
        UserName = 'rpCartaoPontoDBTxt10'
        AutoSize = True
        DataField = 'REFERENCIA'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 2879
        mmLeft = 99748
        mmTop = 58473
        mmWidth = 15833
        BandType = 4
      end
      object rpCartaoPontoLbl16: TppLabel
        UserName = 'rpCartaoPontoLbl16'
        AutoSize = False
        Caption = 'Observações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 45773
        mmTop = 64294
        mmWidth = 16140
        BandType = 4
      end
      object rpCartaoPontoLbl18: TppLabel
        UserName = 'rpCartaoPontoLbl18'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 77788
        mmTop = 64029
        mmWidth = 27252
        BandType = 4
      end
      object rpCartaoPontoLbl19: TppLabel
        UserName = 'rpCartaoPontoLbl19'
        AutoSize = False
        Caption = 'Entrada   Intervalo    Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 67998
        mmWidth = 30692
        BandType = 4
      end
      object rpCartaoPontoLbl21: TppLabel
        UserName = 'rpCartaoPontoLbl21'
        AutoSize = False
        Caption = 'Observações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 111654
        mmTop = 64294
        mmWidth = 15346
        BandType = 4
      end
      object rpCartaoPontoLbl17: TppLabel
        UserName = 'rpCartaoPontoLbl17'
        AutoSize = False
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 65881
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia16: TppLabel
        UserName = 'rpCartaoPontoLblDia16'
        AutoSize = False
        Caption = '16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 71702
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia17: TppLabel
        UserName = 'rpCartaoPontoLblDia17'
        AutoSize = False
        Caption = '17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 76200
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia18: TppLabel
        UserName = 'rpCartaoPontoLblDia18'
        AutoSize = False
        Caption = '18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 80698
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia19: TppLabel
        UserName = 'rpCartaoPontoLblDia19'
        AutoSize = False
        Caption = '19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 85196
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia20: TppLabel
        UserName = 'rpCartaoPontoLblDia20'
        AutoSize = False
        Caption = '20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 89694
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia21: TppLabel
        UserName = 'rpCartaoPontoLblDia21'
        AutoSize = False
        Caption = '21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 94192
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia22: TppLabel
        UserName = 'rpCartaoPontoLblDia22'
        AutoSize = False
        Caption = '22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 98690
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia23: TppLabel
        UserName = 'rpCartaoPontoLblDia23'
        AutoSize = False
        Caption = '23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 103188
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia24: TppLabel
        UserName = 'rpCartaoPontoLblDia24'
        AutoSize = False
        Caption = '24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 107686
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia25: TppLabel
        UserName = 'rpCartaoPontoLblDia25'
        AutoSize = False
        Caption = '25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 112184
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia26: TppLabel
        UserName = 'rpCartaoPontoLblDia26'
        AutoSize = False
        Caption = '26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 116681
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia27: TppLabel
        UserName = 'rpCartaoPontoLblDia27'
        AutoSize = False
        Caption = '27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 121179
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia28: TppLabel
        UserName = 'rpCartaoPontoLblDia28'
        AutoSize = False
        Caption = '28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 125677
        mmWidth = 7938
        BandType = 4
      end
      object rpCartaoPontoLblDia29: TppLabel
        UserName = 'rpCartaoPontoLblDia29'
        AutoSize = False
        Caption = '29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 130440
        mmWidth = 7408
        BandType = 4
      end
      object rpCartaoPontoLine12: TppLine
        UserName = 'rpCartaoPontoLine12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 66411
        mmLeft = 75142
        mmTop = 63500
        mmWidth = 794
        BandType = 4
      end
      object rpCartaoPontoLine11: TppLine
        UserName = 'rpCartaoPontoLine11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 75671
        mmLeft = 66940
        mmTop = 63500
        mmWidth = 794
        BandType = 4
      end
      object rpCartaoPontoLblDia30: TppLabel
        UserName = 'rpCartaoPontoLblDia30'
        AutoSize = False
        Caption = '30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 134938
        mmWidth = 7408
        BandType = 4
      end
      object rpCartaoPontoLblDia31: TppLabel
        UserName = 'rpCartaoPontoLblDia31'
        AutoSize = False
        Caption = '31'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 139436
        mmWidth = 7408
        BandType = 4
      end
      object rpCartaoPontoLbl7: TppLabel
        UserName = 'rpCartaoPontoLbl7'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 55563
        mmWidth = 22225
        BandType = 4
      end
      object rpCartaoPontoLbl6: TppLabel
        UserName = 'rpCartaoPontoLbl6'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 48948
        mmWidth = 22225
        BandType = 4
      end
      object rpCartaoPontoLbl5: TppLabel
        UserName = 'rpCartaoPontoLbl5'
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 42333
        mmWidth = 22225
        BandType = 4
      end
      object rpCartaoPontoLbl3: TppLabel
        UserName = 'rpCartaoPontoLbl3'
        AutoSize = False
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 27517
        mmWidth = 22225
        BandType = 4
      end
      object rpCartaoPontoLbl2: TppLabel
        UserName = 'rpCartaoPontoLbl2'
        AutoSize = False
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 20902
        mmWidth = 22225
        BandType = 4
      end
      object rpCartaoPontoLine1: TppLine
        UserName = 'rpCartaoPontoLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13229
        mmLeft = 98161
        mmTop = 20902
        mmWidth = 1588
        BandType = 4
      end
      object rpCartaoPontoLbl8: TppLabel
        UserName = 'rpCartaoPontoLbl8'
        AutoSize = False
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 20902
        mmWidth = 28840
        BandType = 4
      end
      object rpCartaoPontoLbl9: TppLabel
        UserName = 'rpCartaoPontoLbl9'
        AutoSize = False
        Caption = 'Estado / UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 27517
        mmWidth = 28840
        BandType = 4
      end
      object rpCartaoPontoLbl4: TppLabel
        UserName = 'rpCartaoPontoLbl4'
        AutoSize = False
        Caption = 'Empregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 35719
        mmWidth = 22225
        BandType = 4
      end
      object rpCartaoPontoLbl10: TppLabel
        UserName = 'rpCartaoPontoLbl10'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 42333
        mmWidth = 28840
        BandType = 4
      end
      object rpCartaoPontoLbl11: TppLabel
        UserName = 'rpCartaoPontoLbl11'
        AutoSize = False
        Caption = 'Mês / Ano de Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 55563
        mmWidth = 28840
        BandType = 4
      end
      object rpCartaoPontoLine3: TppLine
        UserName = 'rpCartaoPontoLine3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 98161
        mmTop = 42333
        mmWidth = 1588
        BandType = 4
      end
      object rpCartaoPontoLine6: TppLine
        UserName = 'rpCartaoPontoLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 98161
        mmTop = 55563
        mmWidth = 1058
        BandType = 4
      end
      object rpCartaoPontoTextDia01: TppDBText
        UserName = 'DBText11'
        DataField = 'DIA01'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 71702
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia02: TppDBText
        UserName = 'DBText12'
        DataField = 'DIA02'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 76200
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia03: TppDBText
        UserName = 'DBText13'
        DataField = 'DIA03'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 80698
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia04: TppDBText
        UserName = 'DBText14'
        DataField = 'DIA04'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 85196
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia05: TppDBText
        UserName = 'DBText15'
        DataField = 'DIA05'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 89694
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia06: TppDBText
        UserName = 'DBText16'
        DataField = 'DIA06'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 94192
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia07: TppDBText
        UserName = 'DBText17'
        DataField = 'DIA07'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 98690
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia08: TppDBText
        UserName = 'DBText18'
        DataField = 'DIA08'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 103188
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia09: TppDBText
        UserName = 'DBText19'
        DataField = 'DIA09'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 107686
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia10: TppDBText
        UserName = 'DBText20'
        DataField = 'DIA10'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 112184
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia11: TppDBText
        UserName = 'DBText21'
        DataField = 'DIA11'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 116681
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia12: TppDBText
        UserName = 'DBText22'
        DataField = 'DIA12'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 121179
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia13: TppDBText
        UserName = 'DBText23'
        DataField = 'DIA13'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 125677
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia14: TppDBText
        UserName = 'DBText24'
        DataField = 'DIA14'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 130175
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia15: TppDBText
        UserName = 'DBText25'
        DataField = 'DIA15'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 8996
        mmTop = 134673
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia16: TppDBText
        UserName = 'DBText26'
        DataField = 'DIA16'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 71702
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia17: TppDBText
        UserName = 'DBText27'
        DataField = 'DIA17'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 76200
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia18: TppDBText
        UserName = 'DBText28'
        DataField = 'DIA18'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 80698
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia19: TppDBText
        UserName = 'DBText29'
        DataField = 'DIA19'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 85196
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia20: TppDBText
        UserName = 'DBText30'
        DataField = 'DIA20'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 89694
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia21: TppDBText
        UserName = 'DBText31'
        DataField = 'DIA21'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 94192
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia22: TppDBText
        UserName = 'DBText32'
        DataField = 'DIA22'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 98690
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia23: TppDBText
        UserName = 'DBText33'
        DataField = 'DIA23'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 103188
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia24: TppDBText
        UserName = 'DBText34'
        DataField = 'DIA24'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 107686
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia25: TppDBText
        UserName = 'DBText35'
        DataField = 'DIA25'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 112184
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia26: TppDBText
        UserName = 'DBText36'
        DataField = 'DIA26'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 116681
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia27: TppDBText
        UserName = 'DBText37'
        DataField = 'DIA27'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 121179
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia28: TppDBText
        UserName = 'DBText38'
        DataField = 'DIA28'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 125677
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia29: TppDBText
        UserName = 'rpCartaoPontoTextDia29'
        DataField = 'DIA29'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 130175
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia30: TppDBText
        UserName = 'rpCartaoPontoTextDia30'
        DataField = 'DIA30'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 134673
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoTextDia31: TppDBText
        UserName = 'rpCartaoPontoTextDia31'
        DataField = 'DIA31'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 75671
        mmTop = 139171
        mmWidth = 32015
        BandType = 4
      end
      object rpCartaoPontoLbl12: TppLabel
        UserName = 'rpCartaoPontoLbl12'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 10848
        mmTop = 64029
        mmWidth = 27252
        BandType = 4
      end
      object rpCartaoPontoLine7: TppLine
        UserName = 'rpCartaoPontoLine7'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 8731
        mmTop = 67204
        mmWidth = 27252
        BandType = 4
      end
      object rpCartaoPontoLine13: TppLine
        UserName = 'rpCartaoPontoLine13'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 75406
        mmTop = 67204
        mmWidth = 27252
        BandType = 4
      end
      object rpCartaoPontoLine2: TppLine
        UserName = 'rpCartaoPontoLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 42069
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoLine4: TppLine
        UserName = 'rpCartaoPontoLine4'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 48683
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoLine5: TppLine
        UserName = 'rpCartaoPontoLine5'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 55298
        mmWidth = 131763
        BandType = 4
      end
      object rpCartaoPontoDBImage1: TppDBImage
        UserName = 'rpCartaoPontoDBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppIMG
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppIMG'
        mmHeight = 15346
        mmLeft = 5027
        mmTop = 4498
        mmWidth = 15610
        BandType = 4
      end
      object rpCartaoPontoShape22: TppShape
        UserName = 'rpCartaoPontoShape22'
        mmHeight = 8202
        mmLeft = 265
        mmTop = 171980
        mmWidth = 132027
        BandType = 4
      end
      object rpCartaoPontoShape21: TppShape
        UserName = 'rpCartaoPontoShape21'
        mmHeight = 19844
        mmLeft = 265
        mmTop = 145257
        mmWidth = 132027
        BandType = 4
      end
      object rpCartaoPontoMemo1: TppMemo
        UserName = 'rpCartaoPontoMemo1'
        Caption = 
          '     A    partir    de    ____ / ____ / ____   o   empregado    ' +
          'passa   a   cumprir   horário   de   trabalho'#13#10#13#10'     de ___ : _' +
          '__ às ___ : ___ com intervalo para repouso e alimentação de ___ ' +
          ': ___ às ___ : ___'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            '     A    partir    de    ____ / ____ / ____   o   empregado    ' +
            'passa   a   cumprir   horário   de   trabalho'
          ''
          
            '     de ___ : ___ às ___ : ___ com intervalo para repouso e alim' +
            'entação de ___ : ___ às ___ : ___')
        Transparent = True
        mmHeight = 11906
        mmLeft = 794
        mmTop = 152136
        mmWidth = 130969
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpCartaoPontoMemo3: TppMemo
        UserName = 'rpCartaoPontoMemo3'
        Caption = 
          'Data  ___/___/____    ______________________________      ______' +
          '_________________________'#13#10'                                     ' +
          '         Assinatura do Empregado                         Assinat' +
          'ura do Empregador'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            'Data  ___/___/____    ______________________________      ______' +
            '_________________________'
          
            '                                              Assinatura do Empr' +
            'egado                         Assinatura do Empregador')
        Transparent = True
        mmHeight = 8731
        mmLeft = 265
        mmTop = 183886
        mmWidth = 132027
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpCartaoPontoLbl23: TppLabel
        UserName = 'rpCartaoPontoLbl23'
        AutoSize = False
        Caption = 'Confirmo a frequência e as informações acima especificadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 794
        mmTop = 166423
        mmWidth = 130969
        BandType = 4
      end
      object rpCartaoPontoMemo2: TppMemo
        UserName = 'rpCartaoPontoMemo2'
        Caption = 
          'INFORMAÇÕES GERAIS - POSIÇÃO:'#13#10'FÉRIAS ADQUIRIDAS - SALDO:       ' +
          '       PERÍODO:                              A'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'INFORMAÇÕES GERAIS - POSIÇÃO:'
          
            'FÉRIAS ADQUIRIDAS - SALDO:              PERÍODO:                ' +
            '              A')
        Transparent = True
        mmHeight = 7144
        mmLeft = 794
        mmTop = 172509
        mmWidth = 130969
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpCartaoPontoLbl22: TppLabel
        UserName = 'rpCartaoPontoLbl22'
        AutoSize = False
        Caption = 'ALTERAÇÃO DE HORÁRIO DE TRABALHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 794
        mmTop = 146844
        mmWidth = 130969
        BandType = 4
      end
      object rpCartaoPontoDBTxt11: TppDBText
        UserName = 'rpCartaoPontoDBTxt11'
        DataField = 'EMISSAO'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3440
        mmLeft = 51594
        mmTop = 172509
        mmWidth = 17198
        BandType = 4
      end
      object rpCartaoPontoSaldo: TppLabel
        OnPrint = rpCartaoPontoSaldoPrint
        UserName = 'Label55'
        AutoSize = False
        Caption = 'rpCartaoPontoSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41804
        mmTop = 176213
        mmWidth = 9260
        BandType = 4
      end
      object rpCartaoPontoIni: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'rpCartaoPontoIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 69056
        mmTop = 176213
        mmWidth = 17727
        BandType = 4
      end
      object rpCartaoPontoFim: TppLabel
        UserName = 'Label57'
        AutoSize = False
        Caption = 'rpCartaoPontoFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 95250
        mmTop = 176213
        mmWidth = 19579
        BandType = 4
      end
      object rpCartaoPontoShapeDia29_4: TppShape
        UserName = 'Shape6'
        mmHeight = 4763
        mmLeft = 108215
        mmTop = 129911
        mmWidth = 23813
        BandType = 4
      end
      object rpCartaoPontoShapeDia30_4: TppShape
        UserName = 'rpCartaoPontoShapeDia30_4'
        mmHeight = 4763
        mmLeft = 108215
        mmTop = 134409
        mmWidth = 23813
        BandType = 4
      end
      object rpCartaoPontoShapeDia31_4: TppShape
        UserName = 'rpCartaoPontoShapeDia31_4'
        mmHeight = 4763
        mmLeft = 108215
        mmTop = 138907
        mmWidth = 23813
        BandType = 4
      end
      object rpCartaoPontoTextObs01: TppDBText
        UserName = 'rpCartaoPontoTextObs01'
        DataField = 'OBS01'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 72231
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs02: TppDBText
        UserName = 'rpCartaoPontoTextObs02'
        DataField = 'OBS02'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 76729
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs03: TppDBText
        UserName = 'rpCartaoPontoTextObs03'
        DataField = 'OBS03'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 81227
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs04: TppDBText
        UserName = 'rpCartaoPontoTextObs04'
        DataField = 'OBS04'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 85725
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs05: TppDBText
        UserName = 'rpCartaoPontoTextObs05'
        DataField = 'OBS05'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 90223
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs06: TppDBText
        UserName = 'rpCartaoPontoTextObs06'
        DataField = 'OBS06'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 94721
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs07: TppDBText
        UserName = 'rpCartaoPontoTextObs07'
        DataField = 'OBS07'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 99219
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs08: TppDBText
        UserName = 'rpCartaoPontoTextObs08'
        DataField = 'OBS08'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 103717
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs09: TppDBText
        UserName = 'rpCartaoPontoTextObs09'
        DataField = 'OBS09'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 108215
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs10: TppDBText
        UserName = 'DBText201'
        DataField = 'OBS10'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 112713
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs11: TppDBText
        UserName = 'DBText10'
        DataField = 'OBS11'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 117211
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs12: TppDBText
        UserName = 'DBText39'
        DataField = 'OBS12'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 121709
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs13: TppDBText
        UserName = 'DBText40'
        DataField = 'OBS13'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 126207
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs14: TppDBText
        UserName = 'DBText41'
        DataField = 'OBS14'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 130704
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs15: TppDBText
        UserName = 'DBText42'
        DataField = 'OBS15'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 42333
        mmTop = 135202
        mmWidth = 24077
        BandType = 4
      end
      object rpCartaoPontoTextObs16: TppDBText
        UserName = 'DBText43'
        DataField = 'OBS16'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 71702
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs17: TppDBText
        UserName = 'DBText44'
        DataField = 'OBS17'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 76200
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs18: TppDBText
        UserName = 'DBText45'
        DataField = 'OBS18'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 80698
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs19: TppDBText
        UserName = 'DBText46'
        DataField = 'OBS19'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 85196
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs20: TppDBText
        UserName = 'DBText47'
        DataField = 'OBS20'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 89694
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs21: TppDBText
        UserName = 'DBText48'
        DataField = 'OBS21'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 94192
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs22: TppDBText
        UserName = 'DBText49'
        DataField = 'OBS22'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 98690
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs23: TppDBText
        UserName = 'DBText50'
        DataField = 'OBS23'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 103188
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs24: TppDBText
        UserName = 'DBText51'
        DataField = 'OBS24'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 107686
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs25: TppDBText
        UserName = 'DBText52'
        DataField = 'OBS25'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 112184
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs26: TppDBText
        UserName = 'DBText101'
        DataField = 'OBS26'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 116681
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs27: TppDBText
        UserName = 'DBText53'
        DataField = 'OBS27'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 121179
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs28: TppDBText
        UserName = 'DBText401'
        DataField = 'OBS28'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 125677
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs29: TppDBText
        UserName = 'DBText54'
        DataField = 'OBS29'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 130175
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs30: TppDBText
        UserName = 'DBText55'
        DataField = 'OBS30'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 134673
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoTextObs31: TppDBText
        UserName = 'DBText56'
        DataField = 'OBS31'
        DataPipeline = ppCartaoPonto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        DataPipelineName = 'ppCartaoPonto'
        mmHeight = 3260
        mmLeft = 109009
        mmTop = 139171
        mmWidth = 22490
        BandType = 4
      end
      object rpCartaoPontoLine15: TppLine
        UserName = 'rpCartaoPontoLine15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 66411
        mmLeft = 108215
        mmTop = 63500
        mmWidth = 265
        BandType = 4
      end
    end
    object rpCartaoPontoColFootBnd: TppColumnFooterBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object rpCartaoPontoSmryBnd: TppSummaryBand
      AfterPrint = rpCartaoPontoSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
    end
  end
  object ppCartaoPonto: TppBDEPipeline
    DataSource = dsCartaoPonto
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'CartaoPonto'
    Left = 217
    Top = 48
    object ppCartaoPontoppField1: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField4: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField5: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField7: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField8: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField9: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField10: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField11: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField12: TppField
      FieldAlias = 'NOMEHORARIO'
      FieldName = 'NOMEHORARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField13: TppField
      FieldAlias = 'EMISSAO'
      FieldName = 'EMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField14: TppField
      FieldAlias = 'PER_AQUI_INI'
      FieldName = 'PER_AQUI_INI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField15: TppField
      FieldAlias = 'PER_AQUI_FIN'
      FieldName = 'PER_AQUI_FIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField16: TppField
      FieldAlias = 'NUM_DIAS_MES'
      FieldName = 'NUM_DIAS_MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField17: TppField
      FieldAlias = 'DIA01'
      FieldName = 'DIA01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField18: TppField
      FieldAlias = 'DIA02'
      FieldName = 'DIA02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField19: TppField
      FieldAlias = 'DIA03'
      FieldName = 'DIA03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField20: TppField
      FieldAlias = 'DIA04'
      FieldName = 'DIA04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField21: TppField
      FieldAlias = 'DIA05'
      FieldName = 'DIA05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField22: TppField
      FieldAlias = 'DIA06'
      FieldName = 'DIA06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField23: TppField
      FieldAlias = 'DIA07'
      FieldName = 'DIA07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField24: TppField
      FieldAlias = 'DIA08'
      FieldName = 'DIA08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField25: TppField
      FieldAlias = 'DIA09'
      FieldName = 'DIA09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField26: TppField
      FieldAlias = 'DIA10'
      FieldName = 'DIA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField27: TppField
      FieldAlias = 'DIA11'
      FieldName = 'DIA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField28: TppField
      FieldAlias = 'DIA12'
      FieldName = 'DIA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField29: TppField
      FieldAlias = 'DIA13'
      FieldName = 'DIA13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField30: TppField
      FieldAlias = 'DIA14'
      FieldName = 'DIA14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField31: TppField
      FieldAlias = 'DIA15'
      FieldName = 'DIA15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField32: TppField
      FieldAlias = 'DIA16'
      FieldName = 'DIA16'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField33: TppField
      FieldAlias = 'DIA17'
      FieldName = 'DIA17'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField34: TppField
      FieldAlias = 'DIA18'
      FieldName = 'DIA18'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField35: TppField
      FieldAlias = 'DIA19'
      FieldName = 'DIA19'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField36: TppField
      FieldAlias = 'DIA20'
      FieldName = 'DIA20'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField37: TppField
      FieldAlias = 'DIA21'
      FieldName = 'DIA21'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField38: TppField
      FieldAlias = 'DIA22'
      FieldName = 'DIA22'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField39: TppField
      FieldAlias = 'DIA23'
      FieldName = 'DIA23'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField40: TppField
      FieldAlias = 'DIA24'
      FieldName = 'DIA24'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField41: TppField
      FieldAlias = 'DIA25'
      FieldName = 'DIA25'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField42: TppField
      FieldAlias = 'DIA26'
      FieldName = 'DIA26'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField43: TppField
      FieldAlias = 'DIA27'
      FieldName = 'DIA27'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField44: TppField
      FieldAlias = 'DIA28'
      FieldName = 'DIA28'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField45: TppField
      FieldAlias = 'DIA29'
      FieldName = 'DIA29'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField46: TppField
      FieldAlias = 'DIA30'
      FieldName = 'DIA30'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField47: TppField
      FieldAlias = 'DIA31'
      FieldName = 'DIA31'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField48: TppField
      FieldAlias = 'OBS01'
      FieldName = 'OBS01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField49: TppField
      FieldAlias = 'OBS02'
      FieldName = 'OBS02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField50: TppField
      FieldAlias = 'OBS03'
      FieldName = 'OBS03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField51: TppField
      FieldAlias = 'OBS04'
      FieldName = 'OBS04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField52: TppField
      FieldAlias = 'OBS05'
      FieldName = 'OBS05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField53: TppField
      FieldAlias = 'OBS06'
      FieldName = 'OBS06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField54: TppField
      FieldAlias = 'OBS07'
      FieldName = 'OBS07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField55: TppField
      FieldAlias = 'OBS08'
      FieldName = 'OBS08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField56: TppField
      FieldAlias = 'OBS09'
      FieldName = 'OBS09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField57: TppField
      FieldAlias = 'OBS10'
      FieldName = 'OBS10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField58: TppField
      FieldAlias = 'OBS11'
      FieldName = 'OBS11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField59: TppField
      FieldAlias = 'OBS12'
      FieldName = 'OBS12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField60: TppField
      FieldAlias = 'OBS13'
      FieldName = 'OBS13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField61: TppField
      FieldAlias = 'OBS14'
      FieldName = 'OBS14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField62: TppField
      FieldAlias = 'OBS15'
      FieldName = 'OBS15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField63: TppField
      FieldAlias = 'OBS16'
      FieldName = 'OBS16'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField64: TppField
      FieldAlias = 'OBS17'
      FieldName = 'OBS17'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField65: TppField
      FieldAlias = 'OBS18'
      FieldName = 'OBS18'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField66: TppField
      FieldAlias = 'OBS19'
      FieldName = 'OBS19'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField67: TppField
      FieldAlias = 'OBS20'
      FieldName = 'OBS20'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField68: TppField
      FieldAlias = 'OBS21'
      FieldName = 'OBS21'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField69: TppField
      FieldAlias = 'OBS22'
      FieldName = 'OBS22'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField70: TppField
      FieldAlias = 'OBS23'
      FieldName = 'OBS23'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField71: TppField
      FieldAlias = 'OBS24'
      FieldName = 'OBS24'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField72: TppField
      FieldAlias = 'OBS25'
      FieldName = 'OBS25'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField73: TppField
      FieldAlias = 'OBS26'
      FieldName = 'OBS26'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField74: TppField
      FieldAlias = 'OBS27'
      FieldName = 'OBS27'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField75: TppField
      FieldAlias = 'OBS28'
      FieldName = 'OBS28'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField76: TppField
      FieldAlias = 'OBS29'
      FieldName = 'OBS29'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField77: TppField
      FieldAlias = 'OBS30'
      FieldName = 'OBS30'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppCartaoPontoppField78: TppField
      FieldAlias = 'OBS31'
      FieldName = 'OBS31'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
  end
  object dsCartaoPonto: TwwDataSource
    DataSet = CdsCartaoPonto
    Left = 217
    Top = 96
  end
  object CdsFeriado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 64
  end
  object CdsDiasExtras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 152
  end
  object CdsFerias: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 160
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 160
  end
  object ppIMG: TppBDEPipeline
    DataSource = dsIMG
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'IMG'
    Left = 88
    Top = 90
    object ppIMGppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsIMG: TwwDataSource
    DataSet = CdsIMG
    Left = 88
    Top = 77
  end
  object CdsIMG: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 64
  end
  object CdsPonto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 112
  end
  object CdsHorarioVariavel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 34
    Top = 199
  end
  object CdsTurnoSem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 208
  end
end
