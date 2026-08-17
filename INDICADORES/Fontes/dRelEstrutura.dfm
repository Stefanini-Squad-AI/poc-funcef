inherited dtmRelEstrutura: TdtmRelEstrutura
  Left = 305
  Top = 207
  Width = 334
  Caption = 'dtmRelEstrutura'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros - Estrutura de Indicadores'
    Params = <
      item
        Caption = 'idTipo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDTIPO, DESCRICAO'
          'FROM INDTIPOINDICADOR')
        LookupSettings.Chave = 'IDTIPO'
        LookupSettings.Display = 'DESCRICAO'
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
        Caption = 'idSubTipo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDSUBTIPO, DESCRICAO'
          'FROM INDSUBTIPOINDICADOR')
        LookupSettings.Chave = 'IDSUBTIPO'
        LookupSettings.Display = 'DESCRICAO'
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
    Formheight = 200
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppEstrutura
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      F81600009619E0BD010000001800000006004200000003000000E40008445343
      5F5449504F0100490000000100055749445448020002003C000B4453435F5355
      425449504F0100490000000100055749445448020002003C00094453435F5641
      4C4F520100490000000100055749445448020002000A000D4453435F494E4449
      4341444F520100490000000100055749445448020002003C0008464C475F5052
      4556080004000000000008464C475F5245414C080004000000000002000D4445
      4641554C545F4F5244455202008200040000000100020003000400044C434944
      040001000908000000100010434F4E444F4DCD4E494F20434956494C1352454D
      4553534120444520414C554755C949530F444154412044452052454D45535341
      0000000000000000000000000000F03F00000010434F4E444F4DCD4E494F2043
      4956494C1352454D4553534120444520414C554755C949530744657370657361
      1C41554449544F5249412044452056454E444153204445204C4F4A4153000000
      000000F03F000000000000F03F00000010434F4E444F4DCD4E494F2043495649
      4C1352454D4553534120444520414C554755C9495307446573706573611F454E
      432E204C4F4A4153204C4956524553204520434F4E5452415455414953000000
      000000F03F000000000000F03F00000010434F4E444F4DCD4E494F2043495649
      4C1352454D4553534120444520414C554755C94953074465737065736111454E
      434152474F53204741524147454E53000000000000F03F000000000000F03F00
      000010434F4E444F4DCD4E494F20434956494C1352454D455353412044452041
      4C554755C9495307446573706573610F4650502045535441545554C152494F00
      0000000000F03F000000000000F03F00000010434F4E444F4DCD4E494F204349
      56494C1352454D4553534120444520414C554755C9495307446573706573611B
      494D504F53544F532C20544158415320452053494D494C415245530000000000
      00F03F000000000000F03F00000010434F4E444F4DCD4E494F20434956494C13
      52454D4553534120444520414C554755C9495307446573706573612352455445
      4EC7C34F205041524120434F4245525455524120444520454E434152474F5300
      0000000000F03F000000000000F03F00000010434F4E444F4DCD4E494F204349
      56494C1352454D4553534120444520414C554755C94953074465737065736112
      5345525649C74F53204A5552CD4449434F53000000000000F03F000000000000
      F03F00000010434F4E444F4DCD4E494F20434956494C1352454D455353412044
      4520414C554755C94953075265636569746112414C554755C94953204D455320
      415455414C000000000000F03F000000000000F03F00000010434F4E444F4DCD
      4E494F20434956494C1352454D4553534120444520414C554755C94953075265
      636569746118414C554755C94953204D455345532041544552494F5245530000
      00000000F03F000000000000F03F00000010434F4E444F4DCD4E494F20434956
      494C1352454D4553534120444520414C554755C9495307526563656974611341
      4C554755454C204445204741524147454E53000000000000F03F000000000000
      F03F00000010434F4E444F4DCD4E494F20434956494C1352454D455353412044
      4520414C554755C94953075265636569746131434F525245C7C34F204D4F4E45
      54415249412C204A55524F532045204D554C544153202F204D455320414E5445
      52494F52000000000000F03F000000000000F03F00000010434F4E444F4DCD4E
      494F20434956494C1352454D4553534120444520414C554755C9495307526563
      65697461054C55564153000000000000F03F000000000000F03F00000010434F
      4E444F4DCD4E494F20434956494C1352454D4553534120444520414C554755C9
      49530752656365697461175245435550455241C7C34F20444520454E43415247
      4F53000000000000F03F000000000000F03F00000016434F4E444F4DCD4E494F
      204F5045524143494F4E414C1B4F52C7414D454E544F202D20454E434152474F
      5320434F4D554E5307446573706573611141554449544F524941204558544552
      4E41000000000000F03F000000000000F03F00000016434F4E444F4DCD4E494F
      204F5045524143494F4E414C1B4F52C7414D454E544F202D20454E434152474F
      5320434F4D554E53074465737065736113434F4E4455C7C34F20452052454645
      49C7C34F000000000000F03F000000000000F03F00000016434F4E444F4DCD4E
      494F204F5045524143494F4E414C1B4F52C7414D454E544F202D20454E434152
      474F5320434F4D554E53074465737065736118494D504F53544F532C20544158
      41532045204F5554524153000000000000F03F000000000000F03F0000001643
      4F4E444F4DCD4E494F204F5045524143494F4E414C1B4F52C7414D454E544F20
      2D20454E434152474F5320434F4D554E530744657370657361154C4956524F53
      2C204A4F524E414953204520494F42000000000000F03F000000000000F03F00
      000016434F4E444F4DCD4E494F204F5045524143494F4E414C1B4F52C7414D45
      4E544F202D20454E434152474F5320434F4D554E530744657370657361164D41
      54455249414C20444520455343524954D352494F000000000000F03F00000000
      0000F03F00000016434F4E444F4DCD4E494F204F5045524143494F4E414C1B4F
      52C7414D454E544F202D20454E434152474F5320434F4D554E53074465737065
      73611F545245494E414D454E544F202F2041504F494F204F5045524143494F4E
      414C000000000000F03F000000000000F03F00000016434F4E444F4DCD4E494F
      204F5045524143494F4E414C1B4F52C7414D454E544F202D20454E434152474F
      5320434F4D554E5307526563656974610F4F5554524153205245434549544153
      000000000000F03F000000000000F03F00000016434F4E444F4DCD4E494F204F
      5045524143494F4E414C1B4F52C7414D454E544F202D20454E434152474F5320
      434F4D554E5307526563656974612252454345495441532046494E202F20434D
      202F204A55524F53202F204D554C544153000000000000F03F000000000000F0
      3F00100016444553454D50454E484F20444F2053484F5050494E470F434F4E53
      554D4F20444520414755410E434F4E53554D4F204DCD4E494D4F000000000000
      0000000000000000F03F00100016444553454D50454E484F20444F2053484F50
      50494E470F434F4E53554D4F204445204147554112434F4E53554D4F20524547
      4953545241444F0000000000000000000000000000F03F00100016444553454D
      50454E484F20444F2053484F5050494E470F434F4E53554D4F20444520414755
      4110434F4E53554D4F2053484F5050494E470000000000000000000000000000
      F03F00100016444553454D50454E484F20444F2053484F5050494E470F434F4E
      53554D4F20444520414755410F4449415320444520434F4E53554D4F00000000
      00000000000000000000F03F00100016444553454D50454E484F20444F205348
      4F5050494E470F434F4E53554D4F204445204147554112504552CD4F444F2044
      4520434F4E53554D4F0000000000000000000000000000F03F00100016444553
      454D50454E484F20444F2053484F5050494E470F434F4E53554D4F2044452041
      4755410756414C4F5245530000000000000000000000000000F03F0010001644
      4553454D50454E484F20444F2053484F5050494E4712434F4E53554D4F204445
      20454E455247494110434F4E53554D4F20462E20504F4E544100000000000000
      00000000000000F03F00100016444553454D50454E484F20444F2053484F5050
      494E4712434F4E53554D4F20444520454E45524749410D434F4E53554D4F2050
      4F4E54410000000000000000000000000000F03F00100016444553454D50454E
      484F20444F2053484F5050494E4712434F4E53554D4F20444520454E45524749
      411044454D414E444120462E20504F4E54410000000000000000000000000000
      F03F00100016444553454D50454E484F20444F2053484F5050494E4712434F4E
      53554D4F20444520454E45524749410D44454D414E444120504F4E5441000000
      0000000000000000000000F03F00100016444553454D50454E484F20444F2053
      484F5050494E4712434F4E53554D4F20444520454E45524749410F4449415320
      444520434F4E53554D4F0000000000000000000000000000F03F001000164445
      53454D50454E484F20444F2053484F5050494E4712434F4E53554D4F20444520
      454E45524749410D444D435220462E20504F4E54410000000000000000000000
      000000F03F00100016444553454D50454E484F20444F2053484F5050494E4712
      434F4E53554D4F20444520454E45524749410A444D435220504F4E5441000000
      0000000000000000000000F03F00100016444553454D50454E484F20444F2053
      484F5050494E4712434F4E53554D4F20444520454E455247494112504552494F
      444F20444520434F4E53554D4F0000000000000000000000000000F03F001000
      16444553454D50454E484F20444F2053484F5050494E4712434F4E53554D4F20
      444520454E45524749410D5546455220462E20504F4E54410000000000000000
      000000000000F03F00100016444553454D50454E484F20444F2053484F505049
      4E4712434F4E53554D4F20444520454E45524749410A5546455220504F4E5441
      0000000000000000000000000000F03F00100016444553454D50454E484F2044
      4F2053484F5050494E472A444953545249425549C7C34F2044452046554E4349
      4F4E4152494F53204520434F4E5452415441444F531846554E43494F4EC15249
      4F5320434F4E5452415441444F530000000000000000000000000000F03F0010
      0016444553454D50454E484F20444F2053484F5050494E472A44495354524942
      5549C7C34F2044452046554E43494F4E4152494F53204520434F4E5452415441
      444F531546554E43494F4EC152494F53205052D35052494F5300000000000000
      00000000000000F03F00100016444553454D50454E484F20444F2053484F5050
      494E4711464C55584F204445205645CD43554C4F5311464C55584F2044452056
      45CD43554C4F530000000000000000000000000000F03F001000174F50455241
      43494F4E414C20444F2053484F5050494E471041424F4E4F5320452053414EC7
      D545531A41424F4E4F53202D204441544120444520504147414D454E544F0000
      000000000000000000000000F03F001000174F5045524143494F4E414C20444F
      2053484F5050494E471041424F4E4F5320452053414EC7D545531B41424F4E4F
      53202D20444154412044452056454E43494D454E544F00000000000000000000
      00000000F03F000000174F5045524143494F4E414C20444F2053484F5050494E
      471041424F4E4F5320452053414EC7D5455307446573706573611B41424F4E4F
      53202D20434F525245C7C34F204D4F4E4554C152494100000000000000000000
      00000000F03F000000174F5045524143494F4E414C20444F2053484F5050494E
      471041424F4E4F5320452053414EC7D5455307446573706573611641424F4E4F
      53202D204D554C54412045204A55524F530000000000000000000000000000F0
      3F000000174F5045524143494F4E414C20444F2053484F5050494E471041424F
      4E4F5320452053414EC7D5455307446573706573611741424F4E4F53202D2056
      414C4F5220464154555241444F0000000000000000000000000000F03F000000
      174F5045524143494F4E414C20444F2053484F5050494E471041424F4E4F5320
      452053414EC7D5455307526563656974611341424F4E4F53202D2056414C4F52
      205041474F0000000000000000000000000000F03F001000174F504552414349
      4F4E414C20444F2053484F5050494E47124E50732065204E44732056454E4349
      444153194E50732F4E4473202D20414C554755454C2056454E4349444F000000
      0000000000000000000000F03F001000174F5045524143494F4E414C20444F20
      53484F5050494E47124E50732065204E44732056454E43494441531D4E50732F
      4E4473202D20444154412044412050524F564944454E43494100000000000000
      00000000000000F03F001000174F5045524143494F4E414C20444F2053484F50
      50494E47124E50732065204E44732056454E4349444153124E50732F4E447320
      2D20454E434152474F530000000000000000000000000000F03F001000174F50
      45524143494F4E414C20444F2053484F5050494E47124E50732065204E447320
      56454E43494441530F4E50732F4E4473202D2046554E444F0000000000000000
      000000000000F03F001000174F5045524143494F4E414C20444F2053484F5050
      494E47124E50732065204E44732056454E43494441530F4E50732F4E4473202D
      204C555641530000000000000000000000000000F03F001000174F5045524143
      494F4E414C20444F2053484F5050494E47124E50732065204E44732056454E43
      49444153184E50732F4E4473202D204D455345532056454E4349444F53000000
      0000000000000000000000F03F001000174F5045524143494F4E414C20444F20
      53484F5050494E47124E50732065204E44732056454E43494441531D4E50732F
      4E4473202D205449504F2044452050524F564944454E43494100000000000000
      00000000000000F03F001000174F5045524143494F4E414C20444F2053484F50
      50494E4717504552464F524D414E434520444F2053484F5050494E470341424C
      0000000000000000000000000000F03F001000174F5045524143494F4E414C20
      444F2053484F5050494E4717504552464F524D414E434520444F2053484F5050
      494E470656454E4441530000000000000000000000000000F03F000000174F50
      45524143494F4E414C20444F2053484F5050494E4717504552464F524D414E43
      4520444F2053484F5050494E4707526563656974610E414C554755454C204DCD
      4E494D4F0000000000000000000000000000F03F001000174F5045524143494F
      4E414C20444F2053484F5050494E471152414E4B494E472044452056454E4441
      530341424C0000000000000000000000000000F03F001000174F504552414349
      4F4E414C20444F2053484F5050494E471152414E4B494E472044452056454E44
      41530656454E4441530000000000000000000000000000F03F000000174F5045
      524143494F4E414C20444F2053484F5050494E471152414E4B494E4720444520
      56454E44415307526563656974610E414C554755454C204DCD4E494D4F000000
      0000000000000000000000F03F001000174F5045524143494F4E414C20444F20
      53484F5050494E472856454E444153204520414C554755454C20504F52204752
      55504F20444520415449564944414445530341424C0000000000000000000000
      000000F03F001000174F5045524143494F4E414C20444F2053484F5050494E47
      2856454E444153204520414C554755454C20504F5220475255504F2044452041
      5449564944414445530656454E4441530000000000000000000000000000F03F
      000000174F5045524143494F4E414C20444F2053484F5050494E472856454E44
      4153204520414C554755454C20504F5220475255504F20444520415449564944
      4144455307526563656974610E414C554755454C204DCD4E494D4F0000000000
      000000000000000000F03F001000174F5045524143494F4E414C20444F205348
      4F5050494E471956454E444153204520414C554755454C20504F52204C4F4A41
      0341424C0000000000000000000000000000F03F001000174F5045524143494F
      4E414C20444F2053484F5050494E471956454E444153204520414C554755454C
      20504F52204C4F4A410656454E4441530000000000000000000000000000F03F
      000000174F5045524143494F4E414C20444F2053484F5050494E471956454E44
      4153204520414C554755454C20504F52204C4F4A4107526563656974610E414C
      554755454C204DCD4E494D4F0000000000000000000000000000F03F}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      '/* SELECT ESTRUTURA */'
      ''
      'SELECT TI.DESCRICAO AS DSC_TIPO,'
      '       SI.DESCRICAO AS DSC_SUBTIPO,'
      
        '       DECODE(GI.TIPOVALOR, '#39'R'#39', '#39'Receita'#39', '#39'D'#39', '#39'Despesa'#39', '#39'D'#39',' +
        #39'Desempenho'#39',NULL) AS DSC_VALOR,'
      '       GI.DSC_INDICADOR,'
      '       NVL(GI.FLG_PREV,0) AS FLG_PREV,'
      '       NVL(GI.FLG_REAL,0) AS FLG_REAL'
      '  FROM INDTIPOINDICADOR TI,'
      '       INDSUBTIPOINDICADOR SI,'
      '       ('
      
        '        SELECT DISTINCT GI.IDSUBTIPO, GI.IDINDICADOR, GIPREV.FLG' +
        '_PREV, GIREAL.FLG_REAL,'
      
        '                        I.DESCRICAO AS DSC_INDICADOR, I.TIPOVALO' +
        'R'
      '          FROM INDGRPINDICADOR GI,'
      '               INDINDICADOR I,'
      '              ('
      
        '               SELECT DISTINCT IDSUBTIPO, IDINDICADOR, 1 AS FLG_' +
        'PREV'
      '                 FROM INDGRPINDICADOR'
      '                WHERE TIPOLANCA = '#39'P'#39
      '               ) GIPREV,'
      '              ('
      
        '               SELECT DISTINCT IDSUBTIPO, IDINDICADOR, 1 AS FLG_' +
        'REAL'
      '                 FROM INDGRPINDICADOR'
      '                WHERE TIPOLANCA = '#39'R'#39
      '               ) GIREAL'
      '         WHERE GI.IDINDICADOR = I.IDINDICADOR'
      '           AND GI.IDSUBTIPO   = GIPREV.IDSUBTIPO(+)'
      '           AND GI.IDINDICADOR = GIPREV.IDINDICADOR(+)'
      '           AND GI.IDSUBTIPO   = GIREAL.IDSUBTIPO(+)'
      '           AND GI.IDINDICADOR = GIREAL.IDINDICADOR(+)'
      '        ) GI'
      ''
      ' WHERE TI.IDTIPO = SI.IDTIPO'
      '   AND SI.IDSUBTIPO  = GI.IDSUBTIPO(+)'
      ''
      ''
      ' ORDER BY DSC_TIPO, DSC_SUBTIPO, DSC_VALOR, DSC_INDICADOR'
      ''
      ''
      '')
    ClientDataSet = nil
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 176
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'DSC_TIPO'
      FieldName = 'DSC_TIPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'DSC_SUBTIPO'
      FieldName = 'DSC_SUBTIPO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'DSC_VALOR'
      FieldName = 'DSC_VALOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'DSC_INDICADOR'
      FieldName = 'DSC_INDICADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLG_PREV'
      FieldName = 'FLG_PREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLG_REAL'
      FieldName = 'FLG_REAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object ppEstrutura: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
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
        mmTop = 1852
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Estrutura de Indicadores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8466
        mmWidth = 197380
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 14552
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 25929
        mmTop = 15346
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 15346
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 158221
        mmTop = 15346
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 175948
        mmTop = 15346
        mmWidth = 12965
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object dbtIndicador: TppDBText
        UserName = 'dbtIndicador'
        DataField = 'DSC_INDICADOR'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 25929
        mmTop = 265
        mmWidth = 106627
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DSC_VALOR'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 133879
        mmTop = 265
        mmWidth = 22754
        BandType = 4
      end
      object cbPrev: TmyDBCheckBox
        UserName = 'cbPrev'
        BooleanFalse = '0'
        BooleanTrue = '1'
        DataPipeline = ppl
        DataField = 'FLG_PREV'
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 162454
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object cbReal: TmyDBCheckBox
        UserName = 'cbReal'
        BooleanFalse = '0'
        BooleanTrue = '1'
        DataPipeline = ppl
        DataField = 'FLG_REAL'
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 181505
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
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
        mmLeft = 529
        mmTop = 3175
        mmWidth = 196850
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
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
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DSC_TIPO'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DSC_TIPO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 147109
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6879
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DSC_SUBTIPO'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DSC_SUBTIPO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4233
          mmLeft = 9790
          mmTop = 0
          mmWidth = 138113
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506F170726F63656475726520446574
        61696C4265666F72655072696E743B0D0A626567696E0D0A2020206966207070
        6C5B274453435F494E44494341444F52275D203D202727207468656E20626567
        696E0D0A2020202020206362507265762E56697369626C65203A3D2046616C73
        653B0D0A20202020202063625265616C2E56697369626C65203A3D2046616C73
        653B0D0A202020656E6420656C736520626567696E0D0A202020202020636250
        7265762E56697369626C65203A3D20547275653B0D0A20202020202063625265
        616C2E56697369626C65203A3D20547275653B0D0A202020656E643B0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060644657461696C094576656E74
        4E616D65060B4265666F72655072696E74074576656E74494402180000}
    end
  end
end
