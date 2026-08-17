inherited dtmRelMovFinan: TdtmRelMovFinan
  Left = 316
  Top = 249
  Caption = 'dtmRelMovFinan'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'sTipoImovel'
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
        Caption = 'iMesIni'
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
        Caption = 'iAnoIni'
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
        Caption = 'iMesFim'
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
        Caption = 'iAnoFim'
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
        Caption = 'dSldCtb'
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
        Caption = 'bPrevRec'
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
        Caption = 'bPrevDesp'
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
        Caption = 'bSeparador'
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
        Caption = 'bCorLinha'
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
        Caption = 'iCorLinha'
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
    Report = ppMovFinan
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      DD0100009619E0BD01000000180000000F000000000003000000DD010C434F44
      544950494D4F56454C01004900000001000557494454480200020005000E4445
      53435449504F494D4F56454C0100490000000100055749445448020002001900
      10444553435F434F4D504554454E434941010049000000010005574944544802
      000200110006414E4F4D45530100490000000100055749445448020002000800
      0E4D4553434F4D504554454E43494108000400000000000E414E4F434F4D5045
      54454E43494108000400000000000B4E4F4D455F4D4553545245010049000000
      0100055749445448020002003C000E4944494D4F56454C4D4553545245080004
      000000000002554601004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020002000A564C525F52454156414C08
      000400000000000C564C525F434F4E544142494C08000400000000000C544F54
      5F5245435F434F4D5008000400000000000C544F545F5245435F56454E430800
      0400000000000C544F545F5041475F434F4D5008000400000000000C544F545F
      5041475F56454E43080004000000000002000D44454641554C545F4F52444552
      0200820006000000020001000600050007000800044C43494404000100090800
      00}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT MEST.CODTIPIMOVEL,'
      '       MEST.DESCTIPOIMOVEL,'
      
        '       TO_CHAR( TO_DATE('#39'01/'#39'||TO_CHAR(MEST.MESCOMPETENCIA,'#39'00'#39')' +
        '||'#39'/'#39'||TO_CHAR(MEST.ANOCOMPETENCIA,'#39'0000'#39'),'#39'DD/MM/YYYY'#39'),'
      
        '                '#39'MONTH'#39' ) || '#39' / '#39' || TO_CHAR(MEST.ANOCOMPETENCI' +
        'A,'#39'0000'#39') AS DESC_COMPETENCIA,'
      
        '       TO_CHAR(MEST.ANOCOMPETENCIA,'#39'0000'#39') || TO_CHAR(MEST.MESCO' +
        'MPETENCIA,'#39'00'#39') AS ANOMES,'
      '       MEST.MESCOMPETENCIA,'
      '       MEST.ANOCOMPETENCIA,'
      '       MEST.NOME_MESTRE,'
      '       MEST.IDIMOVELMESTRE,'
      '       '#39'SP'#39' AS UF,'
      '       REAV.VLR_REAVAL,'
      '       SLDCTB.VLR_CONTABIL,'
      '       RECC.TOT_REC_COMP,'
      '       RECV.TOT_REC_VENC,'
      '       PAGC.TOT_PAG_COMP,'
      '       PAGV.TOT_PAG_VENC'
      '       '
      '  FROM ('
      '         SELECT L.CODTIPIMOVEL,'
      '                L.MESCOMPETENCIA,                   '
      '                L.ANOCOMPETENCIA,                  '
      '                L.IDIMOVELMESTRE,'
      '                L.NOME_MESTRE, '
      '                T.DESCTIPOIMOVEL'
      '           FROM VWLANCAMENTO L,'
      '                TIPOIMOVEL T'
      '          WHERE ( L.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '            AND ( (L.TOT_RECEBIDO > 0) OR (L.TOT_PAGO > 0) )'
      
        '            AND ( (TO_NUMBER(TO_CHAR(L.ANOCOMPETENCIA,'#39'0000'#39') ||' +
        ' TRIM(TO_CHAR(L.MESCOMPETENCIA,'#39'00'#39'))) BETWEEN 200307 AND 200308' +
        ') OR'
      ''
      
        '                  ( ((TO_NUMBER(TO_CHAR(L.DATAVENCIMENTO,'#39'YYYYMM' +
        #39')) BETWEEN 200307 AND 200308) AND RECPAG = '#39'R'#39') OR'
      
        '                    ((TO_NUMBER(TO_CHAR(L.DATAVENCIMENTO,'#39'YYYYMM' +
        #39')) BETWEEN 200307 AND 200308) AND RECPAG = '#39'P'#39') ) )'
      
        '          GROUP BY L.CODTIPIMOVEL, L.MESCOMPETENCIA, L.ANOCOMPET' +
        'ENCIA, L.IDIMOVELMESTRE, L.NOME_MESTRE, T.DESCTIPOIMOVEL'
      '       ) MEST,'
      '       ('
      '         SELECT CODTIPIMOVEL,'
      '                IDIMOVELMESTRE,'
      '                SUM( IMOVLRREAVAL ) AS VLR_REAVAL'
      '           FROM IMOVEL'
      '          WHERE FLGATIVO = 1'
      '            AND IDIMOVELMESTRE IS NOT NULL'
      '          GROUP BY CODTIPIMOVEL, IDIMOVELMESTRE'
      '       ) REAV,'
      '       ('
      '         SELECT I.CODTIPIMOVEL,'
      '                I.IDIMOVELMESTRE,'
      
        '                SUM(SCB.VALORG + SCB.REAVVALORG + SCB.ULTREAVVAL' +
        'ORG +'
      
        '                    SCB.CMBEM + SCB.REAVCMBEM + SCB.ULTREAVCMBEM' +
        ' -'
      
        '                    SCB.DEPLANC - SCB.REAVDEPLANC - SCB.ULTREAVD' +
        'EPLANC -'
      
        '                    SCB.CMDEP - SCB.REAVCMDEP - SCB.ULTREAVCMDEP' +
        ') AS VLR_CONTABIL'
      '           FROM IMOVEL I,'
      '                IMOVELXBEM IXB,'
      '                SALDOCONTABBEM SCB,'
      '                ('
      '                 SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '                   FROM SALDOCONTABBEM'
      '                  WHERE ( IDPESSOA = 1 )'
      
        '                    AND ( IDBEM IN (SELECT IDBEM FROM IMOVELXBEM' +
        ') )'
      
        '                    AND ( DATASLDBEM <= TO_DATE('#39'01/01/2003'#39','#39'DD' +
        '/MM/YYYY'#39') )'
      '                  GROUP BY IDBEM, IDPESSOA'
      '                ) DTAMAX'
      '          WHERE (SCB.IDPESSOA = 1)'
      '            AND (I.FLGATIVO = 1)'
      '            AND (SCB.IDBEM = DTAMAX.IDBEM)'
      '            AND (SCB.DATASLDBEM = DTAMAX.DATA)'
      '            AND (SCB.IDPESSOA = DTAMAX.IDPESSOA)'
      '            AND (I.IDIMOVEL = IXB.IDIMOVEL)'
      '            AND (IXB.IDPESSOA = SCB.IDPESSOA)'
      '            AND (IXB.IDBEM = SCB.IDBEM)'
      '          GROUP BY I.CODTIPIMOVEL, I.IDIMOVELMESTRE'
      '       ) SLDCTB,'
      '       ('
      '         SELECT CODTIPIMOVEL,'
      '                MESCOMPETENCIA,'
      '                ANOCOMPETENCIA,'
      '                IDIMOVELMESTRE,'
      
        '                SUM( (TOT_RECEBIDO * VLRLANCRECEB / TOT_RECEBER)' +
        ' ) AS TOT_REC_COMP'
      '           FROM VWLANCAMENTO'
      '          WHERE RECPAG = '#39'R'#39
      '            AND TOT_RECEBIDO > 0'
      
        '            AND TO_NUMBER(TO_CHAR(ANOCOMPETENCIA,'#39'0000'#39') || TRIM' +
        '(TO_CHAR(MESCOMPETENCIA,'#39'00'#39'))) BETWEEN 200307 AND 200308'
      
        '          GROUP BY CODTIPIMOVEL, MESCOMPETENCIA, ANOCOMPETENCIA,' +
        ' IDIMOVELMESTRE'
      '       ) RECC,'
      '       ('
      '         SELECT CODTIPIMOVEL,'
      
        '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'MM'#39'))   AS MES' +
        'COMPETENCIA,'
      
        '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'YYYY'#39')) AS ANO' +
        'COMPETENCIA,'
      '                IDIMOVELMESTRE,'
      
        '                SUM( (TOT_RECEBIDO * VLRLANCRECEB / TOT_RECEBER)' +
        ' ) AS TOT_REC_VENC'
      '           FROM VWLANCAMENTO'
      '          WHERE RECPAG = '#39'R'#39
      '            AND TOT_RECEBIDO > 0'
      
        '            AND TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'YYYYMM'#39')) BETW' +
        'EEN 200307 AND 200308'
      
        '          GROUP BY CODTIPIMOVEL, TO_NUMBER(TO_CHAR(DATAVENCIMENT' +
        'O,'#39'MM'#39')),'
      
        '                   TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'YYYY'#39')), ID' +
        'IMOVELMESTRE'
      '       ) RECV,'
      '       ('
      '         SELECT CODTIPIMOVEL,'
      '                MESCOMPETENCIA,'
      '                ANOCOMPETENCIA,'
      '                IDIMOVELMESTRE,'
      
        '                SUM( (TOT_PAGO * VLRLANCPAGAR / TOT_PAGAR) ) AS ' +
        'TOT_PAG_COMP'
      '           FROM VWLANCAMENTO'
      '          WHERE RECPAG = '#39'P'#39
      '            AND TOT_PAGO > 0'
      
        '            AND TO_NUMBER(TO_CHAR(ANOCOMPETENCIA,'#39'0000'#39') || TRIM' +
        '(TO_CHAR(MESCOMPETENCIA,'#39'00'#39'))) BETWEEN 200307 AND 200308'
      
        '          GROUP BY CODTIPIMOVEL, MESCOMPETENCIA, ANOCOMPETENCIA,' +
        ' IDIMOVELMESTRE'
      '       ) PAGC,'
      '       ('
      '         SELECT CODTIPIMOVEL,'
      
        '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'MM'#39'))   AS MES' +
        'COMPETENCIA,'
      
        '                TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'YYYY'#39')) AS ANO' +
        'COMPETENCIA,'
      '                IDIMOVELMESTRE,'
      
        '                SUM( (TOT_PAGO * VLRLANCPAGAR / TOT_PAGAR) ) AS ' +
        'TOT_PAG_VENC'
      '           FROM VWLANCAMENTO'
      '          WHERE RECPAG = '#39'P'#39
      '            AND TOT_PAGO > 0'
      
        '            AND TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'YYYYMM'#39')) BETW' +
        'EEN 200307 AND 200308'
      
        '          GROUP BY CODTIPIMOVEL, TO_NUMBER(TO_CHAR(DATAVENCIMENT' +
        'O,'#39'MM'#39')),'
      
        '                   TO_NUMBER(TO_CHAR(DATAVENCIMENTO,'#39'YYYY'#39')), ID' +
        'IMOVELMESTRE'
      '       ) PAGV'
      ''
      ' WHERE MEST.CODTIPIMOVEL   = REAV.CODTIPIMOVEL(+)'
      '   AND MEST.IDIMOVELMESTRE = REAV.IDIMOVELMESTRE(+)'
      '   AND MEST.CODTIPIMOVEL   = SLDCTB.CODTIPIMOVEL(+)'
      '   AND MEST.IDIMOVELMESTRE = SLDCTB.IDIMOVELMESTRE(+)'
      '   AND MEST.CODTIPIMOVEL   = RECC.CODTIPIMOVEL(+)'
      '   AND MEST.IDIMOVELMESTRE = RECC.IDIMOVELMESTRE(+)   '
      '   AND MEST.MESCOMPETENCIA = RECC.MESCOMPETENCIA(+)'
      '   AND MEST.ANOCOMPETENCIA = RECC.ANOCOMPETENCIA(+)'
      '   AND MEST.CODTIPIMOVEL   = RECV.CODTIPIMOVEL(+)'
      '   AND MEST.IDIMOVELMESTRE = RECV.IDIMOVELMESTRE(+)   '
      '   AND MEST.MESCOMPETENCIA = RECV.MESCOMPETENCIA(+)'
      '   AND MEST.ANOCOMPETENCIA = RECV.ANOCOMPETENCIA(+)'
      '   AND MEST.CODTIPIMOVEL   = PAGC.CODTIPIMOVEL(+)'
      '   AND MEST.IDIMOVELMESTRE = PAGC.IDIMOVELMESTRE(+)   '
      '   AND MEST.MESCOMPETENCIA = PAGC.MESCOMPETENCIA(+)'
      '   AND MEST.ANOCOMPETENCIA = PAGC.ANOCOMPETENCIA(+)'
      '   AND MEST.CODTIPIMOVEL   = PAGV.CODTIPIMOVEL(+)'
      '   AND MEST.IDIMOVELMESTRE = PAGV.IDIMOVELMESTRE(+)   '
      '   AND MEST.MESCOMPETENCIA = PAGV.MESCOMPETENCIA(+)'
      '   AND MEST.ANOCOMPETENCIA = PAGV.ANOCOMPETENCIA(+)'
      ''
      
        ' ORDER BY MEST.DESCTIPOIMOVEL, MEST.CODTIPIMOVEL, MEST.ANOCOMPET' +
        'ENCIA, MEST.MESCOMPETENCIA,'
      '          MEST.NOME_MESTRE,  MEST.IDIMOVELMESTRE'
      '         '
      ''
      ' '
      ' '
      ' ')
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 176
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 5
      DisplayWidth = 5
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'DESC_COMPETENCIA'
      FieldName = 'DESC_COMPETENCIA'
      FieldLength = 17
      DisplayWidth = 17
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'ANOMES'
      FieldName = 'ANOMES'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REAVAL'
      FieldName = 'VLR_REAVAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_CONTABIL'
      FieldName = 'VLR_CONTABIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_COMP'
      FieldName = 'TOT_REC_COMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_REC_VENC'
      FieldName = 'TOT_REC_VENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAG_COMP'
      FieldName = 'TOT_PAG_COMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_PAG_VENC'
      FieldName = 'TOT_PAG_VENC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
  end
  object ppMovFinan: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Contabilização Diária'
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
    DeviceType = 'Screen'
    Left = 264
    Top = 64
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284163
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Movimentação Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 283898
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284300
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 32014
        mmWidth = 284300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 22754
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Ultima Reavaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 163777
        mmTop = 23813
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Competência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 27781
        mmWidth = 23019
        BandType = 0
      end
      object lblCabDesp: TppLabel
        UserName = 'lblCabDesp'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 211138
        mmTop = 27781
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Competência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 237067
        mmTop = 27781
        mmWidth = 23019
        BandType = 0
      end
      object lblCabRec: TppLabel
        UserName = 'lblCabRec'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 260351
        mmTop = 27781
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Valor Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 141288
        mmTop = 23813
        mmWidth = 14023
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 187855
        mmTop = 25665
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Despesas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 201613
        mmTop = 23548
        mmWidth = 19315
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 237861
        mmTop = 25665
        mmWidth = 45508
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Receitas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 251619
        mmTop = 23548
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 7938
        mmTop = 23548
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 27781
        mmWidth = 33867
        BandType = 0
      end
      object lblSldCtb: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Saldo Contábil em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 228336
        mmTop = 17992
        mmWidth = 54769
        BandType = 0
      end
      object lblReceita: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Receitas Previstas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 15875
        mmWidth = 37306
        BandType = 0
      end
      object lblDespesas: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Despesas Previstas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 19579
        mmWidth = 36777
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Localização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 111390
        mmTop = 27781
        mmWidth = 18785
        BandType = 0
      end
      object ppLogoMovFinan: TppImage
        UserName = 'ppLogoMovFinan'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object dbtTipoCustoRecImo: TppDBText
        UserName = 'dbtTipoCustoRecImo'
        DataField = 'NOME_MESTRE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 18256
        mmTop = 265
        mmWidth = 89165
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_CONTABIL'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 130969
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText5'
        DataField = 'VLR_REAVAL'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156898
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText6'
        DataField = 'TOT_PAG_COMP'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 189707
        mmTop = 264
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText7'
        DataField = 'TOT_PAG_VENC'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 212990
        mmTop = 264
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TOT_REC_COMP'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 238919
        mmTop = 264
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TOT_REC_VENC'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 262203
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'dbtTipoCustoRecImo1'
        DataField = 'UF'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111390
        mmTop = 265
        mmWidth = 12171
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2381
        mmWidth = 283898
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 255323
        mmTop = 2381
        mmWidth = 28840
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'LblSistema'
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
        mmTop = 2381
        mmWidth = 284163
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppRegion3: TppRegion
        UserName = 'Region3'
        mmHeight = 7673
        mmLeft = 148167
        mmTop = 6350
        mmWidth = 136261
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'TOT_PAG_COMP'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 189707
          mmTop = 8467
          mmWidth = 21167
          BandType = 7
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'TOT_PAG_VENC'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 212990
          mmTop = 8467
          mmWidth = 21167
          BandType = 7
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'TOT_REC_COMP'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 238919
          mmTop = 8467
          mmWidth = 21167
          BandType = 7
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'TOT_REC_VENC'
          DataPipeline = ppl
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 262203
          mmTop = 8467
          mmWidth = 21167
          BandType = 7
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 150813
          mmTop = 8202
          mmWidth = 17463
          BandType = 7
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODTIPIMOVEL'
      DataPipeline = ppl
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText7: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 0
          mmWidth = 96573
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label15'
          Caption = 'Segmento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppRegion2: TppRegion
          UserName = 'Region2'
          mmHeight = 7673
          mmLeft = 148167
          mmTop = 2381
          mmWidth = 136261
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBCalc13: TppDBCalc
            UserName = 'DBCalc13'
            DataField = 'TOT_PAG_COMP'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 189707
            mmTop = 4233
            mmWidth = 21167
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc14: TppDBCalc
            UserName = 'DBCalc14'
            DataField = 'TOT_PAG_VENC'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 212990
            mmTop = 4233
            mmWidth = 21167
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc15: TppDBCalc
            UserName = 'DBCalc15'
            DataField = 'TOT_REC_COMP'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 238919
            mmTop = 4233
            mmWidth = 21167
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc16: TppDBCalc
            UserName = 'DBCalc16'
            DataField = 'TOT_REC_VENC'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 262203
            mmTop = 4233
            mmWidth = 21167
            BandType = 5
            GroupNo = 0
          end
          object ppLabel3: TppLabel
            UserName = 'Label3'
            Caption = 'Total do Segmento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsItalic]
            Transparent = True
            mmHeight = 4233
            mmLeft = 150813
            mmTop = 3968
            mmWidth = 29898
            BandType = 5
            GroupNo = 0
          end
        end
        object ppLine8: TppLine
          UserName = 'Line9'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ANOMES'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'DESC_COMPETENCIA'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7938
          mmTop = 529
          mmWidth = 65881
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 7673
          mmLeft = 148167
          mmTop = 1852
          mmWidth = 136261
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBCalc4: TppDBCalc
            UserName = 'DBCalc4'
            DataField = 'TOT_PAG_COMP'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 189707
            mmTop = 3704
            mmWidth = 21167
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc3: TppDBCalc
            UserName = 'DBCalc3'
            DataField = 'TOT_PAG_VENC'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 212990
            mmTop = 3704
            mmWidth = 21167
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc2: TppDBCalc
            UserName = 'DBCalc2'
            DataField = 'TOT_REC_COMP'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 238919
            mmTop = 3704
            mmWidth = 21167
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc1: TppDBCalc
            UserName = 'DBCalc1'
            DataField = 'TOT_REC_VENC'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3969
            mmLeft = 262203
            mmTop = 3704
            mmWidth = 21167
            BandType = 5
            GroupNo = 1
          end
          object ppLabel2: TppLabel
            UserName = 'Label2'
            Caption = 'Total do Período'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsItalic]
            Transparent = True
            mmHeight = 4233
            mmLeft = 150813
            mmTop = 3439
            mmWidth = 26194
            BandType = 5
            GroupNo = 1
          end
        end
        object ppLine7: TppLine
          UserName = 'Line8'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
