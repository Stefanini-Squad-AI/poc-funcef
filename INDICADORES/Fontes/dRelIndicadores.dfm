inherited dtmRelIndicadores: TdtmRelIndicadores
  Left = 339
  Top = 232
  Width = 348
  Caption = 'dtmRelIndicadores'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'sTipo'
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
        ComboBoxSettings.Items.Strings = (
          'Desempenho'
          'Despesa'
          'Receita')
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
        Caption = 'bCodigo'
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
    Formheight = 150
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppIndicadores
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      A61000009619E0BD01000000180000000B0039000000030000000C020B494449
      4E44494341444F5208000400000000000944455343524943414F010049000000
      0100055749445448020002003C0007554E494441444501004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      05000C4453435F5449504F4441444F0100490000000100055749445448020002
      0008000D4453435F5449504F56414C4F52010049000000010005574944544802
      0002000A00114453435F504552494F4449434944414445010049000000010005
      57494454480200020003000F4453435F475250415055524143414F0100490000
      000100055749445448020002001000124453435F535542475250415055524143
      414F01004900000001000557494454480200020010000E464C47475250415055
      524143414F01004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200010011464C475355424752504150555241
      43414F01004900000002000753554254595045020049000A0046697865644368
      6172000557494454480200020001000B464C47434F4E545241544F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      4802000200010002000D44454641554C545F4F52444552020082000200000005
      000200044C43494404000100090800000000500500000000000022400341424C
      024D32084E756DE97269636F0A444553454D50454E484F034D656E0153001040
      0400000000000038401A41424F4E4F53202D204441544120444520504147414D
      454E544F04446174610A444553454D50454E484F034D656E0E477275706F2064
      652041626F6E6F014101530010400400000000000037401B41424F4E4F53202D
      20444154412044452056454E43494D454E544F04446174610A444553454D5045
      4E484F034D656E0E477275706F2064652041626F6E6F01410153000050050000
      00000000284010434F4E53554D4F20462E20504F4E5441034B5768084E756DE9
      7269636F0A444553454D50454E484F034D656E014E000050050000000000804B
      400E434F4E53554D4F204DCD4E494D4F024D33084E756DE97269636F0A444553
      454D50454E484F034D656E014E0000500500000000000026400D434F4E53554D
      4F20504F4E5441034B5768084E756DE97269636F0A444553454D50454E484F03
      4D656E014E000050050000000000004C4012434F4E53554D4F20524547495354
      5241444F024D33084E756DE97269636F0A444553454D50454E484F034D656E01
      4E000050050000000000804C4010434F4E53554D4F2053484F5050494E47024D
      33084E756DE97269636F0A444553454D50454E484F034D656E014E0010500500
      000000000041400F444154412044452052454D4553534104446174610A444553
      454D50454E484F034D656E014E000050050000000000002C401044454D414E44
      4120462E20504F4E5441024B57084E756DE97269636F0A444553454D50454E48
      4F034D656E014E000050050000000000002A400D44454D414E444120504F4E54
      41024B57084E756DE97269636F0A444553454D50454E484F034D656E014E0010
      500500000000000033400F4449415320444520434F4E53554D4F084E756DE972
      69636F0A444553454D50454E484F034D656E014E001050050000000000004D40
      0F4449415320444520434F4E53554D4F084E756DE97269636F0A444553454D50
      454E484F034D656E014E0010500500000000000032400D444D435220462E2050
      4F4E5441084E756DE97269636F0A444553454D50454E484F034D656E014E0010
      500500000000000031400A444D435220504F4E5441084E756DE97269636F0A44
      4553454D50454E484F034D656E014E00005005000000000000244011464C5558
      4F204445205645CD43554C4F5302554E084E756DE97269636F0A444553454D50
      454E484F03446961014E0000000000000000000036401846554E43494F4EC152
      494F5320434F4E5452415441444F5303554E44084E756DE97269636F0A444553
      454D50454E484F034D656E1043656E74726F20646520437573746F730E46756E
      E7E36F202F20436172676F01430146014E000000000000000000003540154655
      4E43494F4EC152494F53205052D35052494F5303554E44084E756DE97269636F
      0A444553454D50454E484F034D656E1043656E74726F20646520437573746F73
      0E46756EE7E36F202F20436172676F01430146014E0010400400000000008048
      40194E50732F4E4473202D20414C554755454C2056454E4349444F084E756DE9
      7269636F0A444553454D50454E484F034D656E0D496E6164696D706CEA6E6369
      6101490153001040040000000000004B401D4E50732F4E4473202D2044415441
      2044412050524F564944454E43494104446174610A444553454D50454E484F03
      4D656E0D496E6164696D706CEA6E636961014901530010400400000000000049
      40124E50732F4E4473202D20454E434152474F53084E756DE97269636F0A4445
      53454D50454E484F034D656E0D496E6164696D706CEA6E636961014901530010
      400400000000008049400F4E50732F4E4473202D2046554E444F084E756DE972
      69636F0A444553454D50454E484F034D656E0D496E6164696D706CEA6E636961
      01490153001040040000000000004A400F4E50732F4E4473202D204C55564153
      084E756DE97269636F0A444553454D50454E484F034D656E0D496E6164696D70
      6CEA6E63696101490153001040040000000000004840184E50732F4E4473202D
      204D455345532056454E4349444F53084E756DE97269636F0A444553454D5045
      4E484F034D656E0D496E6164696D706CEA6E6369610149015300104004000000
      0000804A401D4E50732F4E4473202D205449504F2044452050524F564944454E
      4349410843617261637465720A444553454D50454E484F034D656E0D496E6164
      696D706CEA6E63696101490153001050050000000000004E401A504552CD4F44
      4F20444520434F4E53554D4F20444520414755410843617261637465720A4445
      53454D50454E484F034D656E014E0010500500000000000034401D504552494F
      444F20444520434F4E53554D4F20444520454E45524749410843617261637465
      720A444553454D50454E484F034D656E014E0000500500000000000030400D55
      46455220462E20504F4E54410455464552084E756DE97269636F0A444553454D
      50454E484F034D656E014E000050050000000000002E400A5546455220504F4E
      54410455464552084E756DE97269636F0A444553454D50454E484F034D656E01
      4E000050050000000000804D400756414C4F524553025224084E756DE9726963
      6F0A444553454D50454E484F034D656E014E0000500500000000000040400656
      454E444153025224084E756DE97269636F0A444553454D50454E484F034D656E
      0153000040040000000000003A401B41424F4E4F53202D20434F525245C7C34F
      204D4F4E4554C1524941025224084E756DE97269636F0744455350455341034D
      656E0E477275706F2064652041626F6E6F01410153000040040000000000003B
      401641424F4E4F53202D204D554C54412045204A55524F53025224084E756DE9
      7269636F0744455350455341034D656E0E477275706F2064652041626F6E6F01
      4101530000400400000000000039401741424F4E4F53202D2056414C4F522046
      4154555241444F025224084E756DE97269636F0744455350455341034D656E0E
      477275706F2064652041626F6E6F014101530000500500000000008046401C41
      554449544F5249412044452056454E444153204445204C4F4A4153025224084E
      756DE97269636F0744455350455341034C6976014E0000400400000000000010
      401141554449544F5249412045585445524E41025224084E756DE97269636F07
      44455350455341034D656E1043656E74726F20646520437573746F730143014E
      00004004000000000000004013434F4E4455C7C34F2045205245464549C7C34F
      025224084E756DE97269636F0744455350455341034D656E1043656E74726F20
      646520437573746F730143014E0000500500000000000045401F454E432E204C
      4F4A4153204C4956524553204520434F4E5452415455414953025224084E756D
      E97269636F0744455350455341034C6976014E00005005000000000080454011
      454E434152474F53204741524147454E53025224084E756DE97269636F074445
      5350455341034C6976014E0000500500000000008044400F4650502045535441
      545554C152494F025224084E756DE97269636F0744455350455341034C697601
      4E00005005000000000000144018494D504F53544F532C205441584153204520
      4F5554524153025224084E756DE97269636F0744455350455341034D656E014E
      0000500500000000008047401B494D504F53544F532C20544158415320452053
      494D494C41524553025224084E756DE97269636F0744455350455341034C6976
      014E000050050000000000000840154C4956524F532C204A4F524E4149532045
      20494F42025224084E756DE97269636F0744455350455341034D656E014E0000
      5005000000000000F03F164D4154455249414C20444520455343524954D35249
      4F025224084E756DE97269636F0744455350455341034D656E014E0000500500
      0000000000464023524554454EC7C34F205041524120434F4245525455524120
      444520454E434152474F53025224084E756DE97269636F074445535045534103
      4C6976014E000050050000000000004740125345525649C74F53204A5552CD44
      49434F53025224084E756DE97269636F0744455350455341034C6976014E0000
      400400000000000018401F545245494E414D454E544F202F2041504F494F204F
      5045524143494F4E414C025224084E756DE97269636F0744455350455341034D
      656E1043656E74726F20646520437573746F730143014E000040040000000000
      003C401341424F4E4F53202D2056414C4F52205041474F025224084E756DE972
      69636F0752454345495441034D656E0E477275706F2064652041626F6E6F0141
      015300005005000000000080414012414C554755C94953204D45532041545541
      4C025224084E756DE97269636F0752454345495441034C6976014E0000500500
      0000000000424018414C554755C94953204D455345532041544552494F524553
      025224084E756DE97269636F0752454345495441034C6976014E000050050000
      00000080434013414C554755454C204445204741524147454E53025224084E75
      6DE97269636F0752454345495441034C6976014E000050050000000000804040
      0E414C554755454C204DCD4E494D4F025224084E756DE97269636F0752454345
      495441034D656E015300005005000000000080424031434F525245C7C34F204D
      4F4E4554415249412C204A55524F532045204D554C544153202F204D45532041
      4E544552494F52025224084E756DE97269636F0752454345495441034C697601
      4E000050050000000000004340054C55564153025224084E756DE97269636F07
      52454345495441034C6976014E0000500500000000000020400F4F5554524153
      205245434549544153025224084E756DE97269636F0752454345495441034D65
      6E014E000050050000000000001C402252454345495441532046494E202F2043
      4D202F204A55524F53202F204D554C544153025224084E756DE97269636F0752
      454345495441034D656E014E0000500500000000000044401752454355504552
      41C7C34F20444520454E434152474F53025224084E756DE97269636F07524543
      45495441034C6976014E}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT IDINDICADOR,'
      '       DESCRICAO,'
      '       UNIDADE,'
      
        '       DECODE(TIPODADO,'#39'N'#39','#39'Numérico'#39','#39'C'#39','#39'Caracter'#39','#39'Data'#39') AS ' +
        'DSC_TIPODADO,'
      
        '       DECODE(TIPOVALOR,'#39'R'#39','#39'RECEITA'#39','#39'D'#39','#39'DESPESA'#39','#39'DESEMPENHO'#39 +
        ') AS DSC_TIPOVALOR,'
      
        '       DECODE(PERIODICIDADE,'#39'D'#39','#39'Dia'#39','#39'M'#39','#39'Men'#39','#39'Liv'#39') AS DSC_PE' +
        'RIODICIDADE,'
      '       DECODE(FLGGRPAPURACAO,'#39'C'#39','#39'Centro de Custos'#39','
      '                             '#39'F'#39','#39'Função / Cargo'#39','
      '                             '#39'A'#39','#39'Grupo de Abono'#39','
      '                             '#39'I'#39','#39'Inadimplência'#39','
      
        '                             '#39'0'#39','#39'Outros'#39', NULL   )    AS DSC_GR' +
        'PAPURACAO,'
      '       DECODE(FLGSUBGRPAPURACAO,'#39'C'#39','#39'Centro de Custos'#39','
      '                                '#39'F'#39','#39'Função / Cargo'#39','
      '                                '#39'A'#39','#39'Gupo de Abono'#39','
      '                                '#39'I'#39','#39'Inadimplência'#39','
      
        '                                '#39'0'#39','#39'Outros'#39', NULL   ) AS DSC_SU' +
        'BGRPAPURACAO,'
      '       FLGGRPAPURACAO,'
      '       FLGSUBGRPAPURACAO,'
      '       FLGCONTRATO'
      '  FROM INDINDICADOR'
      ''
      'ORDER BY DSC_TIPOVALOR, DESCRICAO'
      ''
      ''
      ' '
      ' '
      ' ')
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 181
    Top = 64
    object pplppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDICADOR'
      FieldName = 'IDINDICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'DSC_TIPODADO'
      FieldName = 'DSC_TIPODADO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'DSC_TIPOVALOR'
      FieldName = 'DSC_TIPOVALOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      FieldAlias = 'DSC_PERIODICIDADE'
      FieldName = 'DSC_PERIODICIDADE'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object pplppField7: TppField
      FieldAlias = 'DSC_GRPAPURACAO'
      FieldName = 'DSC_GRPAPURACAO'
      FieldLength = 16
      DisplayWidth = 16
      Position = 6
    end
    object pplppField8: TppField
      FieldAlias = 'DSC_SUBGRPAPURACAO'
      FieldName = 'DSC_SUBGRPAPURACAO'
      FieldLength = 16
      DisplayWidth = 16
      Position = 7
    end
    object pplppField9: TppField
      FieldAlias = 'FLGGRPAPURACAO'
      FieldName = 'FLGGRPAPURACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object pplppField10: TppField
      FieldAlias = 'FLGSUBGRPAPURACAO'
      FieldName = 'FLGSUBGRPAPURACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object pplppField11: TppField
      FieldAlias = 'FLGCONTRATO'
      FieldName = 'FLGCONTRATO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
  end
  object ppIndicadores: TppReport
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
      mmHeight = 23813
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
        mmTop = 794
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Indicadores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 7408
        mmWidth = 197380
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 13494
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 16669
        mmWidth = 14288
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 23019
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Unid.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 16669
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 16669
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 135202
        mmTop = 18521
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 149754
        mmTop = 18521
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Sub-Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 174625
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 135467
        mmTop = 16404
        mmWidth = 61648
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Informações Obrigatórias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 14552
        mmWidth = 40746
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Per.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 16669
        mmWidth = 7408
        BandType = 0
      end
      object lblCodigo: TppLabel
        UserName = 'lblCodigo'
        AutoSize = False
        Caption = 'Cód.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 16669
        mmWidth = 8996
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 4763
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
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCRICAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 529
        mmWidth = 84402
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'UNIDADE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DSC_TIPODADO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'N'
        BooleanTrue = 'S'
        DataPipeline = ppl
        DataField = 'FLGCONTRATO'
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 139965
        mmTop = 529
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DSC_GRPAPURACAO'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DSC_SUBGRPAPURACAO'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 174625
        mmTop = 529
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DSC_PERIODICIDADE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 529
        mmWidth = 8467
        BandType = 4
      end
      object dbtCodigo: TppDBText
        UserName = 'dbtCodigo'
        DataField = 'IDINDICADOR'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 529
        mmWidth = 8467
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
      BreakName = 'DSC_TIPOVALOR'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DSC_TIPOVALOR'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
      end
    end
  end
end
