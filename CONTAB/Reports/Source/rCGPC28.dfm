inherited RptCGPC28: TRptCGPC28
  Left = 442
  Top = 211
  Width = 295
  Height = 188
  Caption = 'RptCGPC28'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório CGPC28'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercicio'
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
        Name = 'Exercicio'
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
        Caption = 'PlanoPrev'
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
        Name = 'PlanoPrev'
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
        Caption = 'Patro'
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
        Name = 'Patro'
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
        Caption = 'Movimentacao'
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
        Name = 'Movimentacao'
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
        Caption = 'RMil'
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
        Name = 'RMil'
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
        Caption = 'Filtro'
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
        Name = 'Filtro'
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
        Caption = 'PaginaInicial'
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
        Name = 'PaginaInicial'
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
    Left = 116
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptCGPC28
    LabelEmpresa = ppLblEmpresa
    LabelSistema = ppLblSistema
    Left = 72
  end
  object CdsCGPC28: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Sinal1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Descricao1'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'DescricaoFmt1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Atual1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Anterior1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Variacao1'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Sinal2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Descricao2'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'DescricaoFmt2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Atual2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Anterior2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Variacao2'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DspBalancete'
    StoreDefs = True
    Left = 24
    Top = 52
    object CdsCGPC28Sinal1: TStringField
      FieldName = 'Sinal1'
      Size = 10
    end
    object CdsCGPC28Descricao1: TStringField
      FieldName = 'Descricao1'
      Size = 150
    end
    object CdsCGPC28DescricaoFmt1: TStringField
      FieldName = 'DescricaoFmt1'
      Size = 10
    end
    object CdsCGPC28Atual1: TStringField
      FieldName = 'Atual1'
      Size = 30
    end
    object CdsCGPC28Anterior1: TStringField
      FieldName = 'Anterior1'
      Size = 30
    end
    object CdsCGPC28Variacao1: TStringField
      FieldName = 'Variacao1'
    end
    object CdsCGPC28Sinal2: TStringField
      FieldName = 'Sinal2'
      Size = 10
    end
    object CdsCGPC28Descricao2: TStringField
      FieldName = 'Descricao2'
      Size = 150
    end
    object CdsCGPC28DescricaoFmt2: TStringField
      FieldName = 'DescricaoFmt2'
      Size = 10
    end
    object CdsCGPC28Atual2: TStringField
      FieldName = 'Atual2'
      Size = 30
    end
    object CdsCGPC28Anterior2: TStringField
      FieldName = 'Anterior2'
      Size = 30
    end
    object CdsCGPC28Variacao2: TStringField
      FieldName = 'Variacao2'
    end
  end
  object dtsCGPC28: TDataSource
    DataSet = CdsCGPC28
    Left = 56
    Top = 52
  end
  object ppCGPC28: TppDBPipeline
    DataSource = dtsCGPC28
    UserName = 'CGPC28'
    Left = 88
    Top = 52
    object ppCGPC28ppField1: TppField
      FieldAlias = 'Sinal1'
      FieldName = 'Sinal1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField2: TppField
      FieldAlias = 'Descricao1'
      FieldName = 'Descricao1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField3: TppField
      FieldAlias = 'DescricaoFmt1'
      FieldName = 'DescricaoFmt1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField4: TppField
      FieldAlias = 'Atual1'
      FieldName = 'Atual1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField5: TppField
      FieldAlias = 'Anterior1'
      FieldName = 'Anterior1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField6: TppField
      FieldAlias = 'Variacao1'
      FieldName = 'Variacao1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField7: TppField
      FieldAlias = 'Sinal2'
      FieldName = 'Sinal2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField8: TppField
      FieldAlias = 'Descricao2'
      FieldName = 'Descricao2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField9: TppField
      FieldAlias = 'DescricaoFmt2'
      FieldName = 'DescricaoFmt2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField10: TppField
      FieldAlias = 'Atual2'
      FieldName = 'Atual2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField11: TppField
      FieldAlias = 'Anterior2'
      FieldName = 'Anterior2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppCGPC28ppField12: TppField
      FieldAlias = 'Variacao2'
      FieldName = 'Variacao2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object CdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 156
    Top = 8
  end
  object sqlAssinatura: TCMSqlParams
    SQL.Strings = (
      'Select Ordem,'
      '       Departamento,'
      '       Responsavel,'
      
        '       '#39'CPF: '#39'||TRANSLATE('#39'ABC.DEF.GHI-JK'#39', '#39'ABCDEFGHIJK'#39', CPF) ' +
        'as Documento1,'
      
        '       Decode(InStr(Upper(IdentProf),'#39'CRC'#39'), 0, NULL, IdentProf)' +
        ' as Documento2'
      'from (select c.codCentroCusto,'
      '             Decode(Trim(c.CodCentroCusto),'#39'71058'#39',0,'
      '                                           '#39'71122'#39',1,'
      '                                           '#39'71089'#39',2,'
      '                                           '#39'71100'#39',3,'
      '                                           '#39'71065'#39',4,'
      '                                           '#39'71111'#39',5,'
      '                                           '#39'71113'#39',6,'
      '                                           '#39'71114'#39',7,'
      '                                           '#39#39') as Ordem,'
      
        '             Decode(Trim(c.CodCentroCusto),'#39'71058'#39','#39'Diretor(a) P' +
        'residente'#39','
      
        '                                           '#39'71122'#39','#39'Diretor(a) d' +
        'e Investimentos'#39','
      
        '                                           '#39'71089'#39','#39'Diretor(a) d' +
        'e Administração'#39','
      
        '                                           '#39'71100'#39','#39'Diretor(a) d' +
        'e Participações Societárias e Imobiliárias'#39','
      
        '                                           '#39'71065'#39','#39'Diretor(a) d' +
        'e Benefícios'#39','
      
        '                                           '#39'71111'#39','#39'Diretor(a) d' +
        'e Planejamento e Controladoria'#39','
      
        '                                           '#39'71113'#39','#39'Gerente - GE' +
        'COP'#39','
      
        '                                           '#39'71114'#39','#39'Coordenador(' +
        'a) de Contabilidade - DIPEC / GECOP'#39','
      '                                           '#39#39') as Departamento,'
      '             p.nome as Responsavel,'
      '             ( select d.numdocumento'
      '               from docpessoa d,'
      '                    tipodocpessoa t'
      '               where t.iddocumento = d.iddocumento'
      '                 and d.idpessoa = p.idpessoa'
      '                 and t.iddocumento = 2) as CPF,'
      '             ( select d.orgao||'#39': '#39'||d.numdocumento'
      '               from docpessoa d,'
      '                    tipodocpessoa t'
      '               where t.iddocumento = d.iddocumento'
      '                 and d.idpessoa = p.idpessoa'
      '                 and t.iddocumento = 41) as IdentProf,'
      '             r.dtiniciovig,'
      '             r.dtfimvig'
      '      from centcust c,'
      '           respcentcust r,'
      '           pessoa p'
      '      where c.codcentrocusto = r.codcentrocusto'
      '        and r.idpessoa       = p.idpessoa'
      
        '        and (c.codcentrocusto in ('#39'71058'#39','#39'71122'#39','#39'71089'#39','#39'71100' +
        #39','#39'71065'#39','#39'71111'#39','#39'71113'#39','#39'71114'#39'))'
      
        '        and (r.dtiniciovig <= to_date(:DataSelecao,'#39'dd/mm/yyyy'#39')' +
        ')'
      
        '        and (r.dtfimvig >= to_date(:DataSelecao,'#39'dd/mm/yyyy'#39') or' +
        ' r.dtfimvig is Null) ) M'
      'order by ordem'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = CdsAssinatura
    Left = 12
    Top = 88
  end
  object CdsAssinatura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspBalTot'
    Left = 44
    Top = 88
  end
  object ppAssinatura: TppDBPipeline
    DataSource = dtsAssinatura
    UserName = 'Assinatura'
    Left = 108
    Top = 88
  end
  object dtsAssinatura: TDataSource
    DataSet = CdsAssinatura
    Left = 76
    Top = 88
  end
  object rptCGPC28: TppReport
    AutoStop = False
    DataPipeline = ppCGPC28
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 164
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppCGPC28'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppLblTitulo: TppLabel
        UserName = 'LblTitulo'
        Caption = 'Titulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 84112
        mmTop = 7938
        mmWidth = 28914
        BandType = 0
      end
      object ppLineCabT: TppLine
        UserName = 'LineCabT'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19579
        mmWidth = 197300
        BandType = 0
      end
      object ppLblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5842
        mmLeft = 78053
        mmTop = 1323
        mmWidth = 41275
        BandType = 0
      end
      object ppLineCabB: TppLine
        UserName = 'LineCabB'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 29898
        mmWidth = 197300
        BandType = 0
      end
      object ppLblTitulo2: TppLabel
        UserName = 'LblTitulo2'
        Caption = 'Titulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 13758
        mmWidth = 176477
        BandType = 0
      end
      object ppLineCabL: TppLine
        UserName = 'LineCabL'
        Pen.Width = 2
        Position = lpLeft
        Weight = 1.5
        mmHeight = 9525
        mmLeft = 0
        mmTop = 20373
        mmWidth = 529
        BandType = 0
      end
      object ppLineCabR: TppLine
        UserName = 'LineCabR'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 9525
        mmLeft = 196850
        mmTop = 20373
        mmWidth = 529
        BandType = 0
      end
      object ppLabelOpcoes: TppLabel
        UserName = 'LabelOpcoes'
        Caption = 'Movimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 178330
        mmTop = 13758
        mmWidth = 18785
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLineDetL: TppLine
        UserName = 'LineDetL'
        Pen.Width = 2
        Position = lpLeft
        Weight = 1.5
        mmHeight = 6085
        mmLeft = 0
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLineDetR: TppLine
        UserName = 'LineDetR'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 6085
        mmLeft = 196850
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLine48: TppLine
        UserName = 'ppLine48'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 0
        mmTop = 1588
        mmWidth = 10880
        BandType = 8
      end
      object ppLblDataHora: TppSystemVariable
        UserName = 'LblDataHora'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 1588
        mmWidth = 28840
        BandType = 8
      end
      object ppLblPagina: TppLabel
        UserName = 'LblPagina'
        Caption = 'LblPagina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 94192
        mmTop = 1588
        mmWidth = 13589
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppAssinatura'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          Columns = 3
          DataPipeline = ppAssinatura
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297128
          PrinterSetup.mmPaperWidth = 210080
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 168
          Top = 72
          Version = '7.04'
          mmColumnWidth = 65793
          DataPipelineName = 'ppAssinatura'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppColumnHeaderBand1: TppColumnHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            ColumnTraversal = ctLeftToRight
            mmBottomOffset = 0
            mmHeight = 19050
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'RESPONSAVEL'
              DataPipeline = ppAssinatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAssinatura'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 7408
              mmWidth = 65881
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'DEPARTAMENTO'
              DataPipeline = ppAssinatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAssinatura'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 10319
              mmWidth = 65881
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DOCUMENTO1'
              DataPipeline = ppAssinatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAssinatura'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 13229
              mmWidth = 65881
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'DOCUMENTO2'
              DataPipeline = ppAssinatura
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAssinatura'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 16140
              mmWidth = 65881
              BandType = 4
            end
          end
          object ppColumnFooterBand1: TppColumnFooterBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
