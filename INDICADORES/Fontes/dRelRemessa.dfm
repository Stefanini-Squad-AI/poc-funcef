inherited dtmRelRemessa: TdtmRelRemessa
  Left = 303
  Top = 198
  Width = 334
  Caption = 'dtmRelRemessa'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
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
        Caption = 'iMes'
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
    Report = ppRemessa
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      D20C00009619E0BD01000000180000000700230000000300000017010F445343
      5F434F4D504554454E4349410100490000000200075355425459504502004900
      0A0046697865644368617200055749445448020002000E0007494D4F4E4F4D45
      0100490000000100055749445448020002003C000D4453435F494E4449434144
      4F520100490000000100055749445448020002003C00084453435F5449504F01
      00490000000100055749445448020002000800095449504F4C414E4341010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020001000C44415441415055524143414F08000800000000000556
      414C4F5208000400000000000100044C43494404000100090800000000000E4A
      616E6569726F202F20323030320E4E6F7274652053686F7070696E6712414C55
      4755C94953204D455320415455414C0852454345495441530152000020CF3CB7
      CC4252B81E85F3C113410000000E4A616E6569726F202F20323030320E4E6F72
      74652053686F7070696E6712414C554755C94953204D455320415455414C0852
      4543454954415301520000000266B7CC42EC51B81E8D46E7400000000E4A616E
      6569726F202F20323030320E4E6F7274652053686F7070696E6712414C554755
      C94953204D455320415455414C08524543454954415301500000CA551BB7CC42
      00000000006A18410000000E4A616E6569726F202F20323030320E4E6F727465
      2053686F7070696E6718414C554755C94953204D455345532041544552494F52
      45530852454345495441530152000020CF3CB7CC42295C8FC2F51FCC40000000
      0E4A616E6569726F202F20323030320E4E6F7274652053686F7070696E671841
      4C554755C94953204D455345532041544552494F524553085245434549544153
      01520000000266B7CC423333333309C900410000000E4A616E6569726F202F20
      323030320E4E6F7274652053686F7070696E6718414C554755C94953204D4553
      45532041544552494F52455308524543454954415301500000CA551BB7CC4200
      000000804F02410000000E4A616E6569726F202F20323030320E4E6F72746520
      53686F7070696E6731434F525245C7C34F204D4F4E4554415249412C204A5552
      4F532045204D554C544153202F204D455320414E544552494F52085245434549
      5441530152000020CF3CB7CC423E0AD7A370FD3E400000000E4A616E6569726F
      202F20323030320E4E6F7274652053686F7070696E6731434F525245C7C34F20
      4D4F4E4554415249412C204A55524F532045204D554C544153202F204D455320
      414E544552494F5208524543454954415301520000000266B7CC42713D0AD7A3
      F47A400000000E4A616E6569726F202F20323030320E4E6F7274652053686F70
      70696E6731434F525245C7C34F204D4F4E4554415249412C204A55524F532045
      204D554C544153202F204D455320414E544552494F5208524543454954415301
      500000CA551BB7CC420000000000407F400000000E4A616E6569726F202F2032
      3030320E4E6F7274652053686F7070696E67054C555641530852454345495441
      530152000020CF3CB7CC428FC2F5281C45C1400000000E4A616E6569726F202F
      20323030320E4E6F7274652053686F7070696E67054C55564153085245434549
      54415301500000CA551BB7CC42000000000088C3400000000E4A616E6569726F
      202F20323030320E4E6F7274652053686F7070696E6713414C554755454C2044
      45204741524147454E530852454345495441530152000020CF3CB7CC4252B81E
      858B9DF3400000000E4A616E6569726F202F20323030320E4E6F727465205368
      6F7070696E6713414C554755454C204445204741524147454E53085245434549
      54415301500000CA551BB7CC42000000000017F1400000000E4A616E6569726F
      202F20323030320E4E6F7274652053686F7070696E67175245435550455241C7
      C34F20444520454E434152474F530852454345495441530152000020CF3CB7CC
      4233333333039BD6400000000E4A616E6569726F202F20323030320E4E6F7274
      652053686F7070696E67175245435550455241C7C34F20444520454E43415247
      4F5308524543454954415301520000000266B7CC4285EB51B83EC4D040000000
      0E4A616E6569726F202F20323030320E4E6F7274652053686F7070696E671752
      45435550455241C7C34F20444520454E434152474F5308524543454954415301
      500000CA551BB7CC42000000000088E3400000000E4A616E6569726F202F2032
      3030320E4E6F7274652053686F7070696E670F4650502045535441545554C152
      494F0844455350455341530152000020CF3CB7CC42B81E85EB91DFC940000000
      0E4A616E6569726F202F20323030320E4E6F7274652053686F7070696E670F46
      50502045535441545554C152494F08444553504553415301520000000266B7CC
      4248E17A14AE23BB400000000E4A616E6569726F202F20323030320E4E6F7274
      652053686F7070696E670F4650502045535441545554C152494F084445535045
      53415301500000CA551BB7CC42000000000088D3400000000E4A616E6569726F
      202F20323030320E4E6F7274652053686F7070696E671F454E432E204C4F4A41
      53204C4956524553204520434F4E545241545541495308444553504553415301
      52000020CF3CB7CC42E17A14AEB7CDD1400000000E4A616E6569726F202F2032
      3030320E4E6F7274652053686F7070696E671F454E432E204C4F4A4153204C49
      56524553204520434F4E54524154554149530844455350455341530152000000
      0266B7CC4233333333330B60400000000E4A616E6569726F202F20323030320E
      4E6F7274652053686F7070696E671F454E432E204C4F4A4153204C4956524553
      204520434F4E545241545541495308444553504553415301500000CA551BB7CC
      42000000000094D1400000000E4A616E6569726F202F20323030320E4E6F7274
      652053686F7070696E6711454E434152474F53204741524147454E5308444553
      50455341530152000020CF3CB7CC42AE47E17AC403D8400000000E4A616E6569
      726F202F20323030320E4E6F7274652053686F7070696E6711454E434152474F
      53204741524147454E5308444553504553415301500000CA551BB7CC42000000
      00006AD8400000000E4A616E6569726F202F20323030320E4E6F727465205368
      6F7070696E6723524554454EC7C34F205041524120434F424552545552412044
      4520454E434152474F530844455350455341530152000020CF3CB7CC423E0AD7
      A380A5D9400000000E4A616E6569726F202F20323030320E4E6F727465205368
      6F7070696E6723524554454EC7C34F205041524120434F424552545552412044
      4520454E434152474F5308444553504553415301520000000266B7CC425C8FC2
      F5985AD9400000000E4A616E6569726F202F20323030320E4E6F727465205368
      6F7070696E6723524554454EC7C34F205041524120434F424552545552412044
      4520454E434152474F5308444553504553415301500000CA551BB7CC42000000
      00006AE8400000000E4A616E6569726F202F20323030320E4E6F727465205368
      6F7070696E671C41554449544F5249412044452056454E444153204445204C4F
      4A41530844455350455341530152000020CF3CB7CC42F6285C8F02A9BA400000
      000E4A616E6569726F202F20323030320E4E6F7274652053686F7070696E671C
      41554449544F5249412044452056454E444153204445204C4F4A415308444553
      504553415301520000000266B7CC428FC2F5281CAFC0400000000E4A616E6569
      726F202F20323030320E4E6F7274652053686F7070696E671C41554449544F52
      49412044452056454E444153204445204C4F4A41530844455350455341530150
      0000CA551BB7CC4200000000004CCD400000000E4A616E6569726F202F203230
      30320E4E6F7274652053686F7070696E67125345525649C74F53204A5552CD44
      49434F530844455350455341530152000020CF3CB7CC42000000000070974000
      00000E4A616E6569726F202F20323030320E4E6F7274652053686F7070696E67
      125345525649C74F53204A5552CD4449434F5308444553504553415301500000
      CA551BB7CC420000000000409F400000000E4A616E6569726F202F2032303032
      0E4E6F7274652053686F7070696E671B494D504F53544F532C20544158415320
      452053494D494C415245530844455350455341530152000020CF3CB7CC425C8F
      C2F578E7D0400000000E4A616E6569726F202F20323030320E4E6F7274652053
      686F7070696E671B494D504F53544F532C20544158415320452053494D494C41
      52455308444553504553415301520000000266B7CC426766666666D4B1400000
      000E4A616E6569726F202F20323030320E4E6F7274652053686F7070696E671B
      494D504F53544F532C20544158415320452053494D494C415245530844455350
      4553415301500000CA551BB7CC42000000000082D440}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      ' SELECT '#39'Janeiro / 2002'#39' AS DSC_COMPETENCIA, '
      '        IM.IMONOME, '
      '        I.DESCRICAO AS DSC_INDICADOR, '
      
        '        DECODE(GI.TIPOVALOR,'#39'R'#39', '#39'RECEITAS'#39', '#39'DESPESAS'#39') AS DSC_' +
        'TIPO, '
      '        GI.TIPOLANCA, '
      '        APNUM.DATAAPURACAO, '
      '        NVL(APNUM.VLRAPURACAONUM,0) AS VALOR '
      '  FROM  IMOVEL IM, '
      '        INDINDICADOR I, '
      '       ( '
      
        '        SELECT DISTINCT AP.IDIMOVEL, AP.IDINDICADOR, I.TIPOVALOR' +
        ', GI.TIPOLANCA, GI.ORDEM '
      
        '          FROM INDAPURACAO AP, INDGRPINDICADOR GI, INDINDICADOR ' +
        'I, INDSUBTIPOINDICADOR ST '
      '         WHERE I.TIPODADO = '#39'N'#39' '
      '           AND AP.IDINDICADOR = GI.IDINDICADOR '
      '           AND GI.IDINDICADOR = I.IDINDICADOR  '
      '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO   '
      
        '           AND ST.IDREPORTS = 3471 AND AP.MESCOMPETENCIA = 1 AND' +
        ' AP.ANOCOMPETENCIA = 2002 AND AP.IDIMOVEL = 1227'
      '        ) GI,'
      '       ( '
      
        '        SELECT AP.IDINDICADOR, AP.TIPOLANCA, AP.DATAAPURACAO, AP' +
        '.VLRAPURACAONUM '
      '          FROM INDAPURACAO AP,         '
      '               INDGRPINDICADOR GI,     '
      '               INDSUBTIPOINDICADOR ST, '
      '               INDINDICADOR I '
      '         WHERE I.TIPODADO = '#39'N'#39' '
      '           AND AP.IDINDICADOR  = I.IDINDICADOR  '
      '           AND AP.IDINDICADOR  = GI.IDINDICADOR '
      '           AND AP.TIPOLANCA    = GI.TIPOLANCA   '
      
        '           AND ST.IDREPORTS = 3471 AND AP.MESCOMPETENCIA = 1 AND' +
        ' AP.ANOCOMPETENCIA = 2002 AND AP.IDIMOVEL = 1227'
      '        ) APNUM '
      ' WHERE GI.IDINDICADOR = APNUM.IDINDICADOR(+) '
      '   AND GI.TIPOLANCA   = APNUM.TIPOLANCA(+)   '
      '   AND GI.IDIMOVEL    = IM.IDIMOVEL          '
      '   AND GI.IDINDICADOR = I.IDINDICADOR        '
      
        'ORDER BY IM.IMONOME, GI.TIPOVALOR DESC, GI.ORDEM, GI.IDINDICADOR' +
        ', GI.TIPOLANCA DESC')
    ClientDataSet = nil
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 181
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'DSC_COMPETENCIA'
      FieldName = 'DSC_COMPETENCIA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplppField3: TppField
      FieldAlias = 'DSC_INDICADOR'
      FieldName = 'DSC_INDICADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplppField4: TppField
      FieldAlias = 'DSC_TIPO'
      FieldName = 'DSC_TIPO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object pplppField5: TppField
      FieldAlias = 'TIPOLANCA'
      FieldName = 'TIPOLANCA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplppField6: TppField
      FieldAlias = 'DATAAPURACAO'
      FieldName = 'DATAAPURACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object ppRemessa: TppReport
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
    Left = 262
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13758
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
        Caption = 'Relatório Financeiro de Remessa de Aluguéis'
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
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3704
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
        mmHeight = 3704
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
        mmLeft = 9260
        mmTop = 265
        mmWidth = 87577
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATAAPURACAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 98690
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VALOR'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 121709
        mmTop = 265
        mmWidth = 20108
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
      BreakName = 'IMONOME'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IMONOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 10583
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Resumo Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 6879
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel1: TppLabel
          UserName = 'OrcamentoLabel1'
          AutoSize = False
          Caption = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 98690
          mmTop = 6879
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Realizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 125148
          mmTop = 6879
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Previsão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 153723
          mmTop = 6879
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'DSC_COMPETENCIA'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4233
          mmLeft = 164042
          mmTop = 794
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Competência: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 134673
          mmTop = 794
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 6879
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'LÍQUIDO A DISTRIBUIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8996
          mmTop = 3704
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object vTotLiquido: TppVariable
          UserName = 'vTotLiquido'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119592
          mmTop = 3704
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DSC_TIPO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DSC_TIPO'
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
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'TOTAL DE '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 9260
          mmTop = 1058
          mmWidth = 14552
          BandType = 5
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DSC_TIPO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 24871
          mmTop = 1058
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
        object vTotGValor: TppVariable
          UserName = 'vTotGValor'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119592
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object vTotGPrev: TppVariable
          UserName = 'vTotGPrev'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 148696
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object fTotPerc: TppVariable
          UserName = 'fTotPerc'
          AutoSize = False
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '#,##0.00%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 1058
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DSC_INDICADOR'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppsCorPrint
          UserName = 'sCor1'
          Brush.Color = clLime
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          StretchWithParent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object dbtPrevisao: TppDBText
          UserName = 'dbtPrevisao'
          BlankWhenZero = True
          DataField = 'VALOR'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 153459
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object vTotValor: TppVariable
          UserName = 'vTotValor'
          AutoSize = False
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 265
          mmWidth = 21960
          BandType = 5
          GroupNo = 2
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 4233
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object fPerc: TppVariable
          UserName = 'fPerc'
          AutoSize = False
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,##0.00%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 265
          mmWidth = 12700
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365067E70726F6365647572652056
        61726961626C65733B0D0A7661720D0A20202073496E64696361646F72416E74
        203A20537472696E673B0D0A20202066546F7452656365697461203A20457874
        656E6465643B0D0A20202066546F7444657370657361203A20457874656E6465
        643B0D0A626567696E0D0A0D0A656E643B0D0A0001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65061A47726F757048656164657242
        616E643341667465725072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F75726365066C70726F6365647572652047726F757048
        656164657242616E643341667465725072696E743B0D0A626567696E0D0A2020
        2073496E64696361646F72416E74203A3D2027273B0D0A20202076546F745661
        6C6F722E4173457874656E646564203A3D20303B0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65061047726F757048656164657242616E643309457665
        6E744E616D65060A41667465725072696E74074576656E74494402170001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D650610446574
        61696C41667465725072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F75726365065570726F6365647572652044657461696C41
        667465725072696E743B0D0A626567696E0D0A20202073496E64696361646F72
        416E74203A3D2070706C5B274453435F494E44494341444F52275D3B0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060644657461696C094576656E74
        4E616D65060A41667465725072696E74074576656E74494402170001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D6506114465746169
        6C4265666F72655072696E740B50726F6772616D54797065070B747450726F63
        656475726506536F757263650C2702000070726F636564757265204465746169
        6C4265666F72655072696E743B0D0A626567696E0D0A20202069662070706C5B
        274453435F494E44494341444F52275D203D2073496E64696361646F72416E74
        207468656E0D0A2020202020202020646274496E64696361646F722E56697369
        626C65203A3D2046616C73650D0A202020656C736520646274496E6469636164
        6F722E56697369626C65203A3D20547275653B0D0A20202069662070706C5B27
        5449504F4C414E4341275D203D20275227207468656E20626567696E0D0A2020
        2020202076546F7456616C6F722E4173457874656E64656420203A3D2076546F
        7456616C6F722E4173457874656E64656420202B202070706C5B2756414C4F52
        275D3B2020200D0A20202020202076546F744756616C6F722E4173457874656E
        646564203A3D2076546F744756616C6F722E4173457874656E646564202B2020
        70706C5B2756414C4F52275D3B2020202020202020200D0A2020202020204465
        7461696C2E56697369626C65203A3D20547275653B0D0A202020656E6420656C
        736520626567696E0D0A20202020202076546F7447507265762E417345787465
        6E646564203A3D2076546F7447507265762E4173457874656E646564202B2020
        70706C5B2756414C4F52275D3B2020202020202020202020200D0A2020202020
        2044657461696C2E56697369626C65203A3D2046616C73653B0D0A202020656E
        643B2020200D0A2020202020202020200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060644657461696C094576656E744E616D65060B4265666F7265
        5072696E74074576656E74494402180001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65061B47726F7570466F6F74657242616E6433
        4265666F72655072696E740B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650C5201000070726F6365647572652047726F757046
        6F6F74657242616E64334265666F72655072696E743B0D0A626567696E0D0A20
        202069662070706C5B275449504F4C414E4341275D203D20275027207468656E
        20626567696E0D0A202020202020646274507265766973616F2E56697369626C
        65203A3D20547275653B0D0A20202020202066506572632E56697369626C6520
        2020202020203A3D20547275653B0D0A20202020202066506572632E56616C75
        65203A3D202876546F7456616C6F722E4173457874656E646564202A20313030
        29202F2070706C5B2756414C4F52275D3B0D0A202020656E6420656C73652062
        6567696E0D0A202020202020646274507265766973616F2E56697369626C6520
        3A3D2046616C73653B0D0A20202020202066506572632E56697369626C652020
        20202020203A3D2046616C73653B0D0A202020656E643B2020200D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65061047726F7570466F6F74657242616E
        6433094576656E744E616D65060B4265666F72655072696E74074576656E7449
        4402180001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65061A47726F757048656164657242616E643241667465725072696E740B50
        726F6772616D54797065070B747450726F63656475726506536F757263650674
        70726F6365647572652047726F757048656164657242616E6432416674657250
        72696E743B0D0A626567696E0D0A20202076546F744756616C6F722E41734578
        74656E646564203A3D20303B0D0A20202076546F7447507265762E4173457874
        656E64656420203A3D20303B0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65061047726F757048656164657242616E6432094576656E744E616D65060A
        41667465725072696E74074576656E74494402170001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65061A47726F7570466F6F746572
        42616E643241667465725072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506BA70726F6365647572652047726F7570
        466F6F74657242616E643241667465725072696E743B0D0A626567696E0D0A20
        202069662070706C5B274453435F5449504F275D203D20275245434549544153
        27207468656E0D0A202020202020202066546F7452656365697461203A3D2076
        546F744756616C6F722E4173457874656E6465640D0A202020656C7365206654
        6F7444657370657361203A3D2076546F744756616C6F722E4173457874656E64
        65643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65061047726F7570
        466F6F74657242616E6432094576656E744E616D65060A41667465725072696E
        74074576656E74494402170001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061B47726F7570466F6F74657242616E64314265666F
        72655072696E740B50726F6772616D54797065070B747450726F636564757265
        06536F75726365066E70726F6365647572652047726F7570466F6F7465724261
        6E64314265666F72655072696E743B0D0A626567696E0D0A20202076546F744C
        69717569646F2E4173457874656E646564203A3D2066546F7452656365697461
        202D2066546F74446573706573613B0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65061047726F7570466F6F74657242616E6431094576656E744E616D
        65060B4265666F72655072696E74074576656E74494402180001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D65061B47726F7570466F
        6F74657242616E64324265666F72655072696E740B50726F6772616D54797065
        070B747450726F63656475726506536F75726365068070726F63656475726520
        47726F7570466F6F74657242616E64324265666F72655072696E743B0D0A6265
        67696E0D0A202066546F74506572632E56616C7565203A3D202876546F744756
        616C6F722E4173457874656E646564202A2031303029202F2076546F74475072
        65762E4173457874656E6465643B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65061047726F7570466F6F74657242616E6432094576656E744E616D65
        060B4265666F72655072696E74074576656E74494402180000}
    end
  end
end
