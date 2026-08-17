inherited cfgRelFuncionario: TcfgRelFuncionario
  Left = 174
  Top = 189
  Caption = 'Parâmetros - Distribuição de Funcionários'
  ClientHeight = 232
  ClientWidth = 520
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 520
    Height = 193
    object Label1: TLabel
      Left = 24
      Top = 64
      Width = 54
      Height = 13
      Caption = 'Indicador'
    end
    inline molImovel1: TmolImovel
      Left = 16
      Top = 16
      Width = 489
      inherited edtImovel: TEdit
        Width = 425
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 432
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 456
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 118
      Width = 113
      Height = 50
      Caption = 'Ano Ref.'
      TabOrder = 1
      object spnAno: TwwDBSpinEdit
        Left = 16
        Top = 20
        Width = 81
        Height = 21
        Increment = 1
        TabOrder = 0
        UnboundDataType = wwDefault
      end
    end
    object dblcIndicador: TwwDBLookupCombo
      Left = 24
      Top = 80
      Width = 473
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'Indicador'#9'F')
      LookupTable = cdsIndicador
      LookupField = 'IDINDICADOR'
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object chkLinhas: TCheckBox
      Left = 153
      Top = 128
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 3
    end
    object chkCorLinha: TCheckBox
      Left = 152
      Top = 152
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cboCorLinha: TfcColorCombo
      Left = 384
      Top = 148
      Width = 113
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 193
    Width = 520
    inherited tb97Fundo: TToolbar97
      Left = 350
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 183
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 32
    Top = 192
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'idImovel'
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
        Name = 'idImovel'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'iAno'
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
        Name = 'iAno'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'idIndicador'
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
        Name = 'idIndicador'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
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
        Name = 'bSeparador'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
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
        Name = 'bCorLinha'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
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
        Name = 'iCorLinha'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Left = 392
    Top = 104
  end
  object cdsIndicador: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 72
    Data = {
      E10B00009619E0BD01000000180000000A003900000003000000E3010B494449
      4E44494341444F5208000400000000000944455343524943414F010049000000
      0100055749445448020002003C00085449504F4441444F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      000100095449504F56414C4F5201004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200010007554E49444144
      4501004900000002000753554254595045020049000A00466978656443686172
      000557494454480200020005000E464C47475250415055524143414F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200010011464C47535542475250415055524143414F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000B464C47434F4E545241544F0100490000000200075355425459
      5045020049000A00466978656443686172000557494454480200020001000D54
      52474454494E434C5553414F08000800000000000F54524755534552494E434C
      5553414F0100490000000100055749445448020002001E000100044C43494404
      0001000908000000000005000000000000F03F164D4154455249414C20444520
      455343524954D352494F014E01440252240153014E014E000000050000000000
      00004013434F4E4455C7C34F2045205245464549C7C34F014E01440252240153
      014E014E000000050000000000000840154C4956524F532C204A4F524E414953
      204520494F42014E01440252240153014E014E00000005000000000000104011
      41554449544F5249412045585445524E41014E01440252240153014E014E0000
      0005000000000000144018494D504F53544F532C2054415841532045204F5554
      524153014E01440252240153014E014E0000000500000000000018401F545245
      494E414D454E544F202F2041504F494F204F5045524143494F4E414C014E0144
      0252240153014E014E000000050000000000001C402252454345495441532046
      494E202F20434D202F204A55524F53202F204D554C544153014E015202522401
      53014E014E0000000500000000000020400F4F55545241532052454345495441
      53014E01520252240153014E014E0000000500000000000022400341424C014E
      0145024D32014E014E015300000005000000000000244011464C55584F204445
      205645CD43554C4F53014E014502554E014E014E014E00000005000000000000
      26400D434F4E53554D4F20504F4E5441014E0145034B5768014E014E014E0000
      0005000000000000284010434F4E53554D4F20462E20504F4E5441014E014503
      4B5768014E014E014E000000050000000000002A400D44454D414E444120504F
      4E5441014E0145024B57014E014E014E000000050000000000002C401044454D
      414E444120462E20504F4E5441014E0145024B57014E014E014E000000050000
      000000002E400A5546455220504F4E5441014E01450455464552014E014E014E
      0000000500000000000030400D5546455220462E20504F4E5441014E01450455
      464552014E014E014E0000010500000000000031400A444D435220504F4E5441
      014E0145014E014E014E0000010500000000000032400D444D435220462E2050
      4F4E5441014E0145014E014E014E0000010500000000000033400F4449415320
      444520434F4E53554D4F014E0145014E014E014E000001050000000000003440
      12504552494F444F20444520434F4E53554D4F01430145014E014E014E000000
      0500000000000035401546554E43494F4EC152494F53205052D35052494F5301
      4E014503554E4401530153014E0000000500000000000036401846554E43494F
      4EC152494F5320434F4E5452415441444F53014E014503554E4401530153014E
      0000010500000000000037401B41424F4E4F53202D2044415441204445205645
      4E43494D454E544F01440145014E014E01530000010500000000000038401A41
      424F4E4F53202D204441544120444520504147414D454E544F01440145014E01
      4E01530000000500000000000039401741424F4E4F53202D2056414C4F522046
      4154555241444F014E0144025224014E014E0153000000050000000000003A40
      1B41424F4E4F53202D20434F525245C7C34F204D4F4E4554C1524941014E0144
      025224014E014E0153000000050000000000003B401641424F4E4F53202D204D
      554C54412045204A55524F53014E0144025224014E014E015300000005000000
      0000003C401341424F4E4F53202D2056414C4F52205041474F014E0152025224
      014E014E01530000000500000000000040400656454E444153014E0145025224
      014E014E01530000000500000000008040400E414C554755454C204DCD4E494D
      4F014E0152025224014E014E01530000010500000000000041400F4441544120
      44452052454D4553534101440145014E014E014E000000050000000000804140
      12414C554755C94953204D455320415455414C014E0152025224014E014E014E
      00000005000000000000424018414C554755C94953204D455345532041544552
      494F524553014E0152025224014E014E014E0000000500000000008042403143
      4F525245C7C34F204D4F4E4554415249412C204A55524F532045204D554C5441
      53202F204D455320414E544552494F52014E0152025224014E014E014E000000
      050000000000004340054C55564153014E0152025224014E014E014E00000005
      000000000080434013414C554755454C204445204741524147454E53014E0152
      025224014E014E014E000000050000000000004440175245435550455241C7C3
      4F20444520454E434152474F53014E0152025224014E014E014E000000050000
      0000008044400F4650502045535441545554C152494F014E0144025224014E01
      4E014E0000000500000000000045401F454E432E204C4F4A4153204C49565245
      53204520434F4E5452415455414953014E0144025224014E014E014E00000005
      000000000080454011454E434152474F53204741524147454E53014E01440252
      24014E014E014E00000005000000000000464023524554454EC7C34F20504152
      4120434F4245525455524120444520454E434152474F53014E0144025224014E
      014E014E0000000500000000008046401C41554449544F524941204445205645
      4E444153204445204C4F4A4153014E0144025224014E014E014E000000050000
      000000004740125345525649C74F53204A5552CD4449434F53014E0144025224
      014E014E014E0000000500000000008047401B494D504F53544F532C20544158
      415320452053494D494C41524553014E0144025224014E014E014E0000010500
      00000000004840184E50732F4E4473202D204D455345532056454E4349444F53
      014E0145014E014E0153000001050000000000804840194E50732F4E4473202D
      20414C554755454C2056454E4349444F014E0145014E014E0153000001050000
      000000004940124E50732F4E4473202D20454E434152474F53014E0145014E01
      4E01530000010500000000008049400F4E50732F4E4473202D2046554E444F01
      4E0145014E014E0153000001050000000000004A400F4E50732F4E4473202D20
      4C55564153014E0145014E014E0153000001050000000000804A401D4E50732F
      4E4473202D205449504F2044452050524F564944454E43494101430145014E01
      4E0153000001050000000000004B401D4E50732F4E4473202D20444154412044
      412050524F564944454E43494101440145014E014E0153000000050000000000
      804B400E434F4E53554D4F204DCD4E494D4F014E0145024D33014E014E014E00
      0000050000000000004C4012434F4E53554D4F205245474953545241444F014E
      0145024D33014E014E014E000000050000000000804C4010434F4E53554D4F20
      53484F5050494E47014E0145024D33014E014E014E000001050000000000004D
      400F4449415320444520434F4E53554D4F014E0145014E014E014E0000000500
      00000000804D400756414C4F524553014E0145025224014E014E014E00000105
      0000000000004E4012504552CD4F444F20444520434F4E53554D4F0143014501
      4E014E014E}
    object cdsIndicadorDESCRICAO: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsIndicadorIDINDICADOR: TFloatField
      FieldName = 'IDINDICADOR'
      Visible = False
    end
  end
end
