inherited rptDiarioResumido: TrptDiarioResumido
  Left = 171
  Top = 197
  Width = 383
  Height = 269
  Caption = 'Diário Resumido'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Diário Resumido'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial:'
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
        Caption = 'Data Final:'
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
        Caption = 'Imprime Planilhas Zeradas'
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
        Caption = 'Planilhas'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todas'
          'Efetivadas'
          'Não Efetivadas')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 1
        RadioGroupSettings.Height = 50
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
        Caption = 'Imprime Diário Consolidado'
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
        Name = 'Imprime Diário Consolidado'
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
        Caption = 'Página Inicial:'
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
        MostraComboCompara = False
        Required = True
        TextDefault = '2'
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
        Caption = 'Junta os Históricos'
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
        Caption = 'Código(s) da(s) Empresa(s):'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Código(s) da(s) Empresa(s):'
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
        Width = 250
      end
      item
        Caption = 'Imprime na Matricial'
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
      end>
    Formheight = 290
    FormWidth = 430
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptDiario
  end
  object sqlDiario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   U.PLNPLANIL,U.LANC,U.PLACONTA, U.IDMODULO, U.PLAGRAU, U.PLACO' +
        'NCORRESP, U.PLANOME,'
      
        '   U.PLNDATDIA, U.LACNUMDOC, U.HISTORICO, U.ORDEMHISTORICO, U.CO' +
        'NTA,'
      
        '   U.DEB, U.CRED, U.CODCENTROCUSTO, U.CODSUBCONTA, U.LACDEBCRE, ' +
        'U.PLNCODIGO, U.LACNUMLAN,'
      '   U.UNIDNEGOC, U.DOCUMENTO, U.MASCARA'
      'FROM ('
      '(SELECT'
      
        '   P.PLNPLANIL,TO_CHAR(P.PLNPLANIL)||'#39'/'#39'||TO_CHAR(L.LACNUMLAN) A' +
        'S LANC,'
      
        '   L.PLACONTA AS CONTA, L.PLACONTA, L.IDMODULO, C.PLAGRAU, C.PLA' +
        'CONCORRESP, C.PLANOME,P.PLNDATDIA,'
      
        '   L.LACNUMDOC, L.LACNUMDOC AS DOCUMENTO, L.UNIDNEGOC, PN.MASCAR' +
        'A,'
      
        '   L.LACHIST1||'#39' '#39'||L.LACHIST2 AS HISTORICO, (1) AS ORDEMHISTORI' +
        'CO,'
      '   (DECODE(L.LACDEBCRE, '#39'D'#39', L.LACVALOR, 0)) AS DEB,'
      '   (DECODE(L.LACDEBCRE, '#39'C'#39', L.LACVALOR, 0)) AS CRED,'
      
        '   L.CODCENTROCUSTO, L.CODSUBCONTA, L.LACDEBCRE, P.PLNCODIGO, L.' +
        'LACNUMLAN'
      'FROM'
      '   LANCAMENTO L, PLANILHA P, PLANOCONTA C, PLANO PN'
      
        'WHERE (P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  AND (C.PLAGRUPO <> '#39'E'#39')'
      '  AND (L.PLANO = C.PLANO(+))'
      '  AND (L.PLACONTA = C.PLACONTA(+))'
      '  AND (PN.PLANO(+) = C.PLANO))'
      'UNION ALL'
      '(SELECT'
      '   P.PLNPLANIL,('#39' '#39') AS LANC,'
      '   ('#39' '#39') AS CONTA, L.PLACONTA, L.IDMODULO, (0) AS PLAGRAU,'
      '   ('#39' '#39') AS PLACONCORRESP, ('#39' '#39') AS PLANOME,P.PLNDATDIA,'
      
        '   L.LACNUMDOC, ('#39' '#39') AS DOCUMENTO, L.UNIDNEGOC, ('#39' '#39') AS MASCAR' +
        'A,'
      
        '   L.LACHIST3||'#39' '#39'||L.LACHIST4 AS HISTORICO, (2) AS ORDEMHISTORI' +
        'CO,'
      '   (0) AS DEB, (0) AS CRED,'
      '   ('#39' '#39') AS CODCENTROCUSTO, (0) AS CODSUBCONTA,'
      '   L.LACDEBCRE, P.PLNCODIGO, L.LACNUMLAN'
      'FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C'
      
        'WHERE (P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  AND ((L.LACHIST3 IS NOT NULL) OR (L.LACHIST4 IS NOT NULL))'
      '  AND (C.PLAGRUPO <> '#39'E'#39')'
      '  AND (L.PLANO = C.PLANO)'
      '  AND (L.PLACONTA = C.PLACONTA)'
      '  AND (P.PLNCODIGO = L.PLNCODIGO))'
      'UNION ALL'
      '(SELECT'
      '   P.PLNPLANIL,('#39' '#39') AS LANC,'
      '   ('#39' '#39') AS CONTA, L.PLACONTA, L.IDMODULO, (0) AS PLAGRAU,'
      '   ('#39' '#39') AS PLACONCORRESP, ('#39' '#39') AS PLANOME, P.PLNDATDIA,'
      
        '   L.LACNUMDOC, ('#39' '#39') AS DOCUMENTO, L.UNIDNEGOC, ('#39' '#39') AS MASCAR' +
        'A,'
      '   L.LACHIST5 AS HISTORICO, (3) AS ORDEMHISTORICO,'
      '   (0) AS DEB, (0) AS CRED,'
      '   ('#39' '#39') AS CODCENTROCUSTO, (0) AS CODSUBCONTA,'
      '   L.LACDEBCRE, P.PLNCODIGO, L.LACNUMLAN'
      'FROM LANCAMENTO L, PLANILHA P, PLANOCONTA C'
      
        'WHERE (P.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') AND TO' +
        '_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.LACHIST5 IS NOT NULL)'
      '  AND (C.PLAGRUPO <> '#39'E'#39')'
      '  AND (L.PLANO = C.PLANO)'
      '  AND (L.PLACONTA = C.PLACONTA)'
      '  AND (P.PLNCODIGO = L.PLNCODIGO) )'
      '  ) U'
      
        'ORDER BY U.PLNDATDIA, U.PLNPLANIL, U.LACNUMLAN, U.LACDEBCRE, U.O' +
        'RDEMHISTORICO'
      ''
      ''
      ''
      ''
      ' ')
    OnFormartParam = sqlDiarioFormartParam
    ClientDataSet = cdsDiario
    Left = 42
    Top = 81
  end
  object cdsDiario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 108
    Top = 81
  end
  object dsDiario: TwwDataSource
    DataSet = cdsDiario
    Left = 183
    Top = 82
  end
  object pplDiario: TppBDEPipeline
    DataSource = dsDiario
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lDiario'
    Left = 247
    Top = 79
    object pplDiarioppField1: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField2: TppField
      FieldAlias = 'LANC'
      FieldName = 'LANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField3: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField4: TppField
      FieldAlias = 'IDMODULO'
      FieldName = 'IDMODULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField5: TppField
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField6: TppField
      FieldAlias = 'PLACONCORRESP'
      FieldName = 'PLACONCORRESP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField7: TppField
      FieldAlias = 'PLNDATDIA'
      FieldName = 'PLNDATDIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField8: TppField
      FieldAlias = 'LACNUMDOC'
      FieldName = 'LACNUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField9: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField10: TppField
      FieldAlias = 'ORDEMHISTORICO'
      FieldName = 'ORDEMHISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField11: TppField
      FieldAlias = 'CONTA'
      FieldName = 'CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField12: TppField
      FieldAlias = 'DEB'
      FieldName = 'DEB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField13: TppField
      FieldAlias = 'CRED'
      FieldName = 'CRED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField14: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField15: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField16: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField17: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField18: TppField
      FieldAlias = 'LACNUMLAN'
      FieldName = 'LACNUMLAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField19: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField20: TppField
      FieldAlias = 'DOCUMENTO'
      FieldName = 'DOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField21: TppField
      FieldAlias = 'MASCARA'
      FieldName = 'MASCARA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplDiarioppField22: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
  end
  object rptDiario: TppReport
    AutoStop = False
    DataPipeline = pplDiario
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
    Left = 317
    Top = 79
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDiario'
    object ppHeaderBand15: TppHeaderBand
      BeforePrint = ppHeaderBand15BeforePrint
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object pplblTituloDiario: TppLabel
        UserName = 'pplblTituloDiario'
        Caption = 'Diário Resumido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 82550
        mmTop = 8731
        mmWidth = 33602
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 197300
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
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'ppLabel95'
        AutoSize = False
        Caption = 'Cód. Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 14288
        mmTop = 21960
        mmWidth = 16933
        BandType = 0
      end
      object ppLine42: TppLine
        UserName = 'ppLine42'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        AutoSize = False
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 21960
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'ppLabel100'
        AutoSize = False
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 36777
        mmTop = 21960
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'ppLabel103'
        AutoSize = False
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 21960
        mmWidth = 10848
        BandType = 0
      end
      object txtLabelTotHead: TppLabel
        UserName = 'txtLabelTotHead'
        AutoSize = False
        Caption = 'Total Transportado : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 30427
        mmWidth = 31221
        BandType = 0
      end
      object txtTotTransportadoD: TppLabel
        OnPrint = txtTotTransportadoDPrint
        UserName = 'txtTotTransportadoD'
        AutoSize = False
        Caption = 'txtTotTransportadoD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 30427
        mmWidth = 23283
        BandType = 0
      end
      object txtTotTransportadoC: TppLabel
        OnPrint = txtTotTransportadoCPrint
        UserName = 'txtTotTransportadoC'
        AutoSize = False
        Caption = 'txtTotTransportadoC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 30427
        mmWidth = 23283
        BandType = 0
      end
      object lblSomaCreCab: TppDBCalc
        UserName = 'lblSomaCreCab'
        DataField = 'CRED'
        DataPipeline = pplDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplDiario'
        mmHeight = 3704
        mmLeft = 90488
        mmTop = 30427
        mmWidth = 23548
        BandType = 0
      end
      object lblSomaDebCab: TppDBCalc
        UserName = 'lblSomaDebCab'
        DataField = 'DEB'
        DataPipeline = pplDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplDiario'
        mmHeight = 3704
        mmLeft = 65088
        mmTop = 30427
        mmWidth = 23813
        BandType = 0
      end
      object rptDiarioLine3: TppLine
        UserName = 'rptDiarioLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34660
        mmWidth = 197300
        BandType = 0
      end
      object rptDiarioLabel4: TppLabel
        UserName = 'rptDiarioLabel4'
        AutoSize = False
        Caption = 'Planil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 21960
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      BeforeGenerate = ppDetailBand7BeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        BlankWhenZero = True
        DataField = 'DEB'
        DataPipeline = pplDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'ppDBText43'
        BlankWhenZero = True
        DataField = 'CRED'
        DataPipeline = pplDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3175
        mmLeft = 173302
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object rptDiarioDBText4: TppDBText
        UserName = 'rptDiarioDBText4'
        DataField = 'LANC'
        DataPipeline = pplDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object dbtxtContaDiario: TppDBText
        UserName = 'dbtxtContaDiario'
        DataField = 'CONTA'
        DataPipeline = pplDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3175
        mmLeft = 14288
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'HISTORICO'
        DataPipeline = pplDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 0
        mmWidth = 110861
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand15: TppFooterBand
      BeforePrint = ppFooterBand15BeforePrint
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object lblContadorDia: TppLabel
        UserName = 'lblContadorDia'
        AutoSize = False
        Caption = 'lblContadorDia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 9790
        mmWidth = 9525
        BandType = 8
      end
      object rptDiarioLabel3: TppLabel
        UserName = 'rptDiarioLabel3'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 9790
        mmWidth = 8996
        BandType = 8
      end
      object txtLabelTot: TppLabel
        UserName = 'txtLabelTot'
        AutoSize = False
        Caption = 'Total a Transportar : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 1852
        mmWidth = 42333
        BandType = 8
      end
      object rptDiarioLine2: TppLine
        UserName = 'rptDiarioLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 7144
        mmWidth = 197300
        BandType = 8
      end
      object lblSomaDebFot: TppDBCalc
        UserName = 'lblSomaDebFot'
        DataField = 'DEB'
        DataPipeline = pplDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplDiario'
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 1852
        mmWidth = 23813
        BandType = 8
      end
      object lblSomaCreFot: TppDBCalc
        UserName = 'lblSomaCreFot'
        DataField = 'CRED'
        DataPipeline = pplDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'pplDiario'
        mmHeight = 3704
        mmLeft = 78846
        mmTop = 1852
        mmWidth = 23548
        BandType = 8
      end
      object rptDiarioLine1: TppLine
        UserName = 'rptDiarioLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object lblCalcContadorDia: TppSystemVariable
        UserName = 'lblCalcContadorDia1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 82815
        mmTop = 9790
        mmWidth = 1588
        BandType = 8
      end
      object lblCalcMaxPagDia: TppSystemVariable
        UserName = 'lblCalcMaxPagDia1'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 86254
        mmTop = 9790
        mmWidth = 1588
        BandType = 8
      end
      object txtTotATransportarD: TppLabel
        OnPrint = txtTotATransportarDPrint
        UserName = 'txtTotATransportarD'
        AutoSize = False
        Caption = 'txtTotATransportarD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 1852
        mmWidth = 23283
        BandType = 8
      end
      object txtTotATransportarC: TppLabel
        OnPrint = txtTotATransportarCPrint
        UserName = 'txtTotATransportarC'
        AutoSize = False
        Caption = 'txtTotATransportarC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 1852
        mmWidth = 23283
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Totais do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 1323
        mmWidth = 35983
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'DEB'
        DataPipeline = pplDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'CRED'
        DataPipeline = pplDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDiario'
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'PLNDATDIA'
      DataPipeline = pplDiario
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDiario'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine43: TppLine
          UserName = 'ppLine43'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4233
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object lblData: TppDBText
          UserName = 'lblData'
          DataField = 'PLNDATDIA'
          DataPipeline = pplDiario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDiario'
          mmHeight = 3704
          mmLeft = 11906
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel108: TppLabel
          UserName = 'ppLabel108'
          AutoSize = False
          Caption = 'Data :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3175
          mmTop = 529
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel111: TppLabel
          UserName = 'ppLabel111'
          AutoSize = False
          Caption = 'Totais do Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 111919
          mmTop = 529
          mmWidth = 35983
          BandType = 5
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'ppLine45'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4498
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rptDiarioDBCalc1: TppDBCalc
          UserName = 'rptDiarioDBCalc1'
          DataField = 'DEB'
          DataPipeline = pplDiario
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDiario'
          mmHeight = 3704
          mmLeft = 149225
          mmTop = 529
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rptDiarioDBCalc2: TppDBCalc
          UserName = 'rptDiarioDBCalc2'
          DataField = 'CRED'
          DataPipeline = pplDiario
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDiario'
          mmHeight = 3704
          mmLeft = 173302
          mmTop = 529
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object giDiario: TGImp
    DataBaseName = 'Basedados'
    TipoFonte = TfNormal
    MostraPrinterSetup = True
    EjetarPagina = True
    Condensado = True
    Sublinhado = False
    SaltodeLinhaCondensado = False
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 224
    Top = 32
  end
end
