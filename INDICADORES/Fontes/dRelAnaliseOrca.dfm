inherited dtmRelAnaliseOrca: TdtmRelAnaliseOrca
  Left = 396
  Top = 46
  Width = 342
  Height = 151
  Caption = 'dtmRelAnaliseOrca'
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
        Name = 'idImovel'
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
        Name = 'iAno'
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
        Caption = 'iOrdem'
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
        Name = 'iOrdem'
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
        Name = 'bSeparador'
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
        Name = 'bCorLinha'
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
        Name = 'iCorLinha'
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
        Name = 'iMesIni'
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
        Caption = 'iQtdeMeses'
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
        Name = 'iQtdeMeses'
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
        Caption = 'sMesIni'
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
        Name = 'sMesIni'
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
        Caption = 'sMesFim'
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
        Name = 'sMesFim'
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
    Report = ppAnaliseOrca
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      9D0C00009619E0BD01000000180000000F001500000003000000950108494449
      4D4F56454C080004000000000007494D4F4E4F4D450100490000000100055749
      445448020002003C000E414E4F434F4D504554454E4349410800040000000000
      0B4944494E44494341444F5208000400000000000D4944475250415055524143
      414F08000400000000000A4453435F43435553544F0100490000000100055749
      445448020002003C000D4453435F494E44494341444F52010049000000010005
      5749445448020002003C000D4453435F5449504F56414C4F5201004900000001
      000557494454480200020008000B564C525F5052455641545508000400000000
      000B564C525F50524556414E5408000400000000000B564C525F5245414C414E
      5408000400000000000D564C525F4449464552454E434108000400000000000D
      5641525F50414E545852414E5408000400000000000D5641525F504154555852
      414E5408000400000000000A4F42534552564143414F01004900000001000557
      49445448020002003C000100044C434944040001000908000000000000000000
      000000003F401B43656E74726F20456D70726573617269616C204D6F75726973
      636F0000000000509F400000000000003C400000000000001C400A5574696C69
      6461646573114167756120652053616E65616D656E746F084445535045534153
      000000000094D140000000000094D140CDCCCCCC1C70D740333333337370B7C0
      EC51B81E85AB404000000000000039C03C507265762E206465207265616A7573
      746520646520313025206520656E63657272616D656E746F20646F2070616761
      6D656E746F206461207061727400000000100000000000003F401B43656E7472
      6F20456D70726573617269616C204D6F75726973636F0000000000509F400000
      0000000039400000000000001C400A5574696C6964616465730C456C65747269
      63696461646508444553504553415300000000C0F1014100000000C0F1014100
      000000A0210041000000000002CD4033333333333324C07B14AE47E17A264000
      000000140000000000003F401B43656E74726F20456D70726573617269616C20
      4D6F75726973636F0000000000509F400000000000003D400000000000001C40
      0A5574696C6964616465730BD36C656F2044696573656C084445535045534153
      0000000000004940000000000000494000000000000000000000000000004940
      00000000000059C000000500100000000000003F401B43656E74726F20456D70
      726573617269616C204D6F75726973636F0000000000509F4000000000000041
      400E41646D696E69737472617469766F084445535045534153713D0AD74B50E2
      40713D0AD74B50E240000000005818E24052B81E85EBF97B400AD7A3703D0AF3
      BF5C8FC2F5285CF33F00000500100000000000003F401B43656E74726F20456D
      70726573617269616C204D6F75726973636F0000000000509F40000000000000
      32400F417220436F6E646963696F6E61646F084445535045534153CDCCCCCC6C
      EECF40CDCCCCCC6CEECF4000000000B0DCD74067666666E695BFC07B14AE47E1
      BA4840EC51B81E858B40C000000500100000000000003F401B43656E74726F20
      456D70726573617269616C204D6F75726973636F0000000000509F4000000000
      00003A4012436F6D62617465206120496E63EA6E64696F084445535045534153
      EC51B81E65B6CE40EC51B81E65B6CE40CDCCCCCCBCD8D5405C8FC2F528F6B9C0
      C3F5285C8F224540F6285C8FC2B53DC000000500100000000000003F401B4365
      6E74726F20456D70726573617269616C204D6F75726973636F0000000000509F
      4000000000000038400B436F6D756E696361E7E36F0844455350455341533333
      33333368A140333333333368A1400000000000F09940CDCCCCCCCCC081400000
      0000008039C05C8FC2F5281C414000000500100000000000003F401B43656E74
      726F20456D70726573617269616C204D6F75726973636F0000000000509F4000
      000000000042400F446573706573617320476572616973084445535045534153
      5C8FC2F528B997405C8FC2F528B9974000000000C0EBB54052B81E85EBFAAFC0
      F6285C8FC2D970405C8FC2F5283C52C000000500100000000000003F401B4365
      6E74726F20456D70726573617269616C204D6F75726973636F0000000000509F
      4000000000000037400A456C657661646F726573084445535045534153CDCCCC
      CC4CA4C140CDCCCCCC4CA4C14067666666E6EDC940333333333393B0C03E0AD7
      A3707D4740F6285C8FC2F53FC000000500100000000000003F401B43656E7472
      6F20456D70726573617269616C204D6F75726973636F0000000000509F400000
      00000080414012466F6C686120646520506167616D656E746F08444553504553
      41533333333333F7AE403333333333F7AE400000000080DAAE403333333333B3
      2C400AD7A3703D0AD7BF0AD7A3703D0AD73F00000500100000000000003F401B
      43656E74726F20456D70726573617269616C204D6F75726973636F0000000000
      509F40000000000000354018477275706F2047657261646F72202F204E6F2D42
      7265616B0844455350455341537B14AE47E12887407B14AE47E1288740000000
      0000A88340D7A3703D0A075C40C3F5285C8F422EC052B81E85EBD13140000005
      00100000000000003F401B43656E74726F20456D70726573617269616C204D6F
      75726973636F0000000000509F40000000000080404008496D706F73746F7308
      44455350455341530000000000C899400000000000C899400000000000959840
      00000000003053409A999999999912C085EB51B81E8513400000050010000000
      0000003F401B43656E74726F20456D70726573617269616C204D6F7572697363
      6F0000000000509F40000000000000344015496E7374616C61E7F5657320456C
      E9747269636173084445535045534153B81E85EBD1CBBC40B81E85EBD1CBBC40
      00000000401FBF403E0AD7A3709B82C0295C8FC2F5282040E17A14AE47E11DC0
      00000500100000000000003F401B43656E74726F20456D70726573617269616C
      204D6F75726973636F0000000000509F40000000000000364017496E7374616C
      61E7F565732048696472E1756C696361730844455350455341536666666626DF
      B0406666666626DFB040000000008055A2409A99999999D19E40F6285C8FC2D5
      46C0333333333303554000000500100000000000003F401B43656E74726F2045
      6D70726573617269616C204D6F75726973636F0000000000509F400000000000
      003140154C696D70657A61206520436F6E7365727661E7E36F08444553504553
      4153CDCCCCCCCC39D440CDCCCCCCCC39D44085EB51B87EDED740C3F5285C8F25
      ADC0C3F5285C8F02324085EB51B81E852EC000000500100000000000003F401B
      43656E74726F20456D70726573617269616C204D6F75726973636F0000000000
      509F400000000000003F40104D616E7574656EE7E36F20436976696C08444553
      504553415348E17A146EA6B44048E17A146EA6B440E17A14AE372ADA408FC2F5
      289C00D5C085EB51B81E6D7940E17A14AE471154C00000050010000000000000
      3F401B43656E74726F20456D70726573617269616C204D6F75726973636F0000
      000000509F400000000000003B400A50616973616769736D6F08444553504553
      4153E17A14AE4772A040E17A14AE4772A0400000000000CD9A400AD7A3703D5E
      784085EB51B81E8532C07B14AE47E1BA364000000500100000000000003F401B
      43656E74726F20456D70726573617269616C204D6F75726973636F0000000000
      509F400000000000003E40095365677572616EE7610844455350455341537B14
      AE4799CEF1407B14AE4799CEF140CDCCCCCCBC11E140295C8FC2758BE240295C
      8FC2F5084AC0295C8FC2F5285B4000000500150000000000003F401B43656E74
      726F20456D70726573617269616C204D6F75726973636F0000000000509F4000
      000000000033401A5375706572766973E36F205072656469616C202820424D53
      2029084445535045534153000000000000000000000000000000000000000000
      000000000000000000000000000500000000000000003F401B43656E74726F20
      456D70726573617269616C204D6F75726973636F0000000000509F4000000000
      008048400856494E4943495553084445535045534153000000000088A3400000
      00000088A340000000000094A1400000000000406F4000000000000024C0B81E
      85EB5138264005746573746500000500110000000000003F401B43656E74726F
      20456D70726573617269616C204D6F75726973636F0000000000509F40000000
      00008042400A436F6E646F6DED6E696F08524543454954415300000000000000
      000000000000000000000000008B411941000000008B4119C100000000000059
      C0}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT IM.IDIMOVEL,'
      '       IM.IMONOME, '
      '       CCI.ANOCOMPETENCIA, '
      '       I.IDINDICADOR, '
      '       GA.IDGRPAPURACAO, '
      '       GA.DESCRICAO AS DSC_CCUSTO, '
      '       I.DESCRICAO  AS DSC_INDICADOR, '
      
        '       DECODE(I.TIPOVALOR,'#39'R'#39','#39'RECEITAS'#39','#39'DESPESAS'#39') AS DSC_TIPO' +
        'VALOR, '
      '       NVL(PREVATU.VLRAPURACAONUM,0)  AS VLR_PREVATU,  '
      '       NVL(PREVANT.VLRAPURACAONUM,0)  AS VLR_PREVANT,  '
      '       NVL(REALANT.VLRAPURACAONUM,0)  AS VLR_REALANT,'
      
        '       NVL(PREVATU.VLRAPURACAONUM,0)-NVL(REALANT.VLRAPURACAONUM,' +
        '0) AS VLR_DIFERENCA,'
      
        '       ROUND(((NVL(REALANT.VLRAPURACAONUM,0) * 100) / PREVANT.VL' +
        'RAPURACAONUM)-100,2) AS VAR_PANTXRANT,'
      
        '       ROUND(((NVL(PREVATU.VLRAPURACAONUM,0) * 100) / REALANT.VL' +
        'RAPURACAONUM)-100,2) AS VAR_PATUXRANT,'
      '       PREVATU.OBSERVACAO'
      'FROM'
      '       IMOVEL IM,'
      '       INDINDICADOR I,'
      '       INDGRPAPURACAO GA,'
      '       ('
      
        '        SELECT DISTINCT AP.IDIMOVEL, NVL(AP.IDGRPAPURACAO,0) AS ' +
        'IDGRPAPURACAO, AP.IDINDICADOR, AP.ANOCOMPETENCIA'
      '          FROM INDGRPINDICADOR GI, INDSUBTIPOINDICADOR ST,'
      '               INDAPURACAO AP,     INDINDICADOR I'
      '         WHERE AP.IDINDICADOR = GI.IDINDICADOR'
      '           AND GI.IDSUBTIPO   = ST.IDSUBTIPO'
      
        '           AND AP.IDINDICADOR = I.IDINDICADOR  AND ST.IDREPORTS ' +
        '= 3435 AND AP.IDIMOVEL = 31 AND AP.ANOCOMPETENCIA IN(2004) AND I' +
        '.TIPOVALOR IN('#39'R'#39','#39'D'#39','#39'E'#39') AND GI.TIPOLANCA IN('#39'P'#39','#39'R'#39')'
      '        ) CCI,'
      '       ('
      
        '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS ID' +
        'GRPAPURACAO,'
      '               MIN(OBSERVACAO) AS OBSERVACAO,  '
      
        '               ROUND((SUM(NVL(VLRAPURACAONUM,0))/4),2) AS VLRAPU' +
        'RACAONUM'
      '          FROM INDAPURACAO'
      '         WHERE TIPOLANCA = '#39'P'#39
      '           AND IDIMOVEL = 31'
      
        '           AND LTRIM(TO_CHAR(MESCOMPETENCIA,'#39'00'#39')) || LTRIM(TO_C' +
        'HAR(ANOCOMPETENCIA,'#39'0000'#39')) IN('#39'012004'#39','#39'022004'#39','#39'032004'#39','#39'04200' +
        '4'#39')'
      '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO'
      '        ) PREVATU,'
      '       ('
      
        '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS ID' +
        'GRPAPURACAO,'
      
        '               ROUND((SUM(NVL(VLRAPURACAONUM,0))/4),2) AS VLRAPU' +
        'RACAONUM'
      '          FROM INDAPURACAO'
      '         WHERE TIPOLANCA = '#39'P'#39
      '           AND IDIMOVEL = 31'
      
        '           AND LTRIM(TO_CHAR(MESCOMPETENCIA,'#39'00'#39')) || LTRIM(TO_C' +
        'HAR(ANOCOMPETENCIA,'#39'0000'#39')) IN('#39'012004'#39','#39'022004'#39','#39'032004'#39','#39'04200' +
        '4'#39')'
      '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO'
      '       ) PREVANT,'
      '       ( '
      
        '        SELECT IDIMOVEL, IDINDICADOR, NVL(IDGRPAPURACAO,0) AS ID' +
        'GRPAPURACAO, '
      
        '               ROUND((SUM(NVL(VLRAPURACAONUM,0))/4),2) AS VLRAPU' +
        'RACAONUM '
      '          FROM INDAPURACAO '
      '         WHERE TIPOLANCA = '#39'R'#39
      '           AND IDIMOVEL = 31'
      
        '           AND LTRIM(TO_CHAR(MESCOMPETENCIA,'#39'00'#39')) || LTRIM(TO_C' +
        'HAR(ANOCOMPETENCIA,'#39'0000'#39')) IN('#39'012004'#39','#39'022004'#39','#39'032004'#39','#39'04200' +
        '4'#39')'
      '         GROUP BY IDIMOVEL, IDINDICADOR, IDGRPAPURACAO  '
      '       ) REALANT '
      'WHERE CCI.IDINDICADOR    = I.IDINDICADOR '
      '  AND CCI.IDIMOVEL       = IM.IDIMOVEL '
      '  AND CCI.IDGRPAPURACAO  = GA.IDGRPAPURACAO(+) '
      '  AND CCI.IDIMOVEL       = PREVATU.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = PREVATU.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = PREVATU.IDINDICADOR(+) '
      '  AND CCI.IDIMOVEL       = PREVANT.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = PREVANT.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = PREVANT.IDINDICADOR(+) '
      '  AND CCI.IDIMOVEL       = REALANT.IDIMOVEL(+) '
      '  AND CCI.IDGRPAPURACAO  = REALANT.IDGRPAPURACAO(+) '
      '  AND CCI.IDINDICADOR    = REALANT.IDINDICADOR(+) '
      ''
      'ORDER BY IMONOME, TIPOVALOR, DSC_CCUSTO, DSC_INDICADOR'
      ''
      ''
      ''
      ''
      ' ')
  end
  inherited ds: TDataSource
    Left = 107
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 184
    Top = 64
    object pplppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
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
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINDICADOR'
      FieldName = 'IDINDICADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRPAPURACAO'
      FieldName = 'IDGRPAPURACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      FieldAlias = 'DSC_CCUSTO'
      FieldName = 'DSC_CCUSTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplppField7: TppField
      FieldAlias = 'DSC_INDICADOR'
      FieldName = 'DSC_INDICADOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplppField8: TppField
      FieldAlias = 'DSC_TIPOVALOR'
      FieldName = 'DSC_TIPOVALOR'
      FieldLength = 8
      DisplayWidth = 8
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREVATU'
      FieldName = 'VLR_PREVATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREVANT'
      FieldName = 'VLR_PREVANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_REALANT'
      FieldName = 'VLR_REALANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_DIFERENCA'
      FieldName = 'VLR_DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAR_PANTXRANT'
      FieldName = 'VAR_PANTXRANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAR_PATUXRANT'
      FieldName = 'VAR_PATUXRANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplppField15: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
  end
  object ppAnaliseOrca: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    object ppOrcamentoHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17198
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
        mmWidth = 284428
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Análise de Variações do Orçamento'
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
        mmWidth = 284428
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
    end
    object ppOrcamentoDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmHeight = 12435
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDscDetalhe: TppDBText
        UserName = 'ppDscDetalhe'
        DataField = 'DSC_INDICADOR'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 0
        mmWidth = 56356
        BandType = 4
      end
      object ppOrcamentoDBText4: TppDBText
        UserName = 'OrcamentoDBText4'
        DataField = 'VLR_REALANT'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 60590
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppOrcamentoDBText6: TppDBText
        UserName = 'OrcamentoDBText6'
        DataField = 'VLR_PREVATU'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 80698
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppOrcamentoDBText7: TppDBText
        UserName = 'OrcamentoDBText7'
        DataField = 'VAR_PATUXRANT'
        DataPipeline = ppl
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 100806
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppVarItem: TppVariable
        UserName = 'VarItem'
        CalcOrder = 0
        DataType = dtExtended
        DisplayFormat = '0.00 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        OnCalc = ppVarItemCalc
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 12435
        mmLeft = 143934
        mmTop = 0
        mmWidth = 138907
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppOrcamentoFooterBand1: TppFooterBand
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
        mmLeft = 529
        mmTop = 3175
        mmWidth = 283898
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
        mmLeft = 257705
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
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppOrcamentoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'IDIMOVEL'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
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
          mmTop = 529
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label5'
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
          mmLeft = 241036
          mmTop = 794
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'ANOCOMPETENCIA'
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
          mmLeft = 270140
          mmTop = 794
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'TOTAL GERAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 14023
          mmTop = 6879
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 12435
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object pVarTotGG: TppVariable
          UserName = 'pVarTotGG'
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 102659
          mmTop = 6879
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object pVlrTotRealGG: TppVariable
          UserName = 'pVlrTotRealGG'
          CalcOrder = 1
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 56092
          mmTop = 6879
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object pVlrTotPrevGG: TppVariable
          UserName = 'pVlrTotPrevGG'
          CalcOrder = 2
          DataType = dtExtended
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 77258
          mmTop = 6879
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DSC_TIPOVALOR'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17992
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DSC_TIPOVALOR'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1058
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppMes1: TppLabel
          UserName = 'Mes1'
          Caption = 'Realizado Per. Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 62177
          mmTop = 9525
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 17198
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label25'
          AutoSize = False
          Caption = 'Média entre: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 234950
          mmTop = 0
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object pplMesIni: TppLabel
          UserName = 'Label26'
          AutoSize = False
          Caption = 'Janeiro '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 264584
          mmTop = 0
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object pplMesFim: TppLabel
          UserName = 'Label27'
          AutoSize = False
          Caption = 'Dezembro '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 264584
          mmTop = 3704
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Previsão Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 80698
          mmTop = 9525
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Variação Perc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 100806
          mmTop = 9525
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Contribuição por Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 6879
          mmLeft = 121179
          mmTop = 9525
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 3440
          mmLeft = 144198
          mmTop = 12965
          mmWidth = 17727
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppOrcamentoLabel18: TppLabel
          UserName = 'Label19'
          Caption = 'TOTAL DE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 14023
          mmTop = 1588
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'DSC_TIPOVALOR'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 29104
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine7: TppLine
          UserName = 'OrcamentoLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine8: TppLine
          UserName = 'OrcamentoLine8'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object pVlrTotGReal: TppDBCalc
          UserName = 'pVlrTotGReal'
          DataField = 'VLR_REALANT'
          DataPipeline = ppl
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 57415
          mmTop = 1588
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object pVlrTotGPrev: TppDBCalc
          UserName = 'pVlrTotGPrev'
          DataField = 'VLR_PREVATU'
          DataPipeline = ppl
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 78581
          mmTop = 1588
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object pVarTotG: TppVariable
          UserName = 'pVarTotG'
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 104775
          mmTop = 1588
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGrpQuebra: TppGroup
      BreakName = 'DSC_CCUSTO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'GrpQuebra'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppOrcamentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDscQuebra: TppDBText
          UserName = 'DscQuebra'
          DataField = 'DSC_CCUSTO'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine3: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3704
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppOrcamentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppOrcamentoLine4: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLine6: TppLine
          UserName = 'OrcamentoLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6085
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppOrcamentoLabel15: TppLabel
          UserName = 'Label16'
          Caption = 'T O T A L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 39688
          mmTop = 1588
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object pVlrTotReal: TppDBCalc
          UserName = 'pVlrTotReal'
          DataField = 'VLR_REALANT'
          DataPipeline = ppl
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGrpQuebra
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 57944
          mmTop = 1588
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
        object pVlrTotPrev: TppDBCalc
          UserName = 'pVlrTotPrev'
          DataField = 'VLR_PREVATU'
          DataPipeline = ppl
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGrpQuebra
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 78317
          mmTop = 1588
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
        object pVarTot: TppVariable
          UserName = 'pVarTot'
          CalcOrder = 0
          DataType = dtExtended
          DisplayFormat = '0.00 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 107156
          mmTop = 1588
          mmWidth = 10583
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365064470726F6365647572652056
        61726961626C65733B0D0A7661720D0A20202073447363446574616C6865203A
        20537472696E673B0D0A626567696E0D0A0D0A656E643B0D0A0001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D6506244F7263616D65
        6E746F47726F7570466F6F74657242616E64314265666F72655072696E740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506E0
        70726F636564757265204F7263616D656E746F47726F7570466F6F7465724261
        6E64314265666F72655072696E743B0D0A626567696E0D0A2020206966207056
        6C72546F745265616C2E56616C7565203C3E2030207468656E0D0A2020202020
        20202070566172546F742E4173457874656E646564203A3D20282870566C7254
        6F74507265762E56616C7565202A2031303029202F2070566C72546F74526561
        6C2E56616C756529202D203130300D0A202020656C73652070566172546F742E
        4173457874656E646564203A3D20303B20202020202020200D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506194F7263616D656E746F47726F7570466F
        6F74657242616E6431094576656E744E616D65060B4265666F72655072696E74
        074576656E74494402180001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061B47726F7570466F6F74657242616E64314265666F72
        655072696E740B50726F6772616D54797065070B747450726F63656475726506
        536F7572636506D770726F6365647572652047726F7570466F6F74657242616E
        64314265666F72655072696E743B0D0A626567696E0D0A20202069662070566C
        72546F74475265616C2E56616C7565203C3E2030207468656E0D0A2020202020
        20202070566172546F74472E4173457874656E646564203A3D20282870566C72
        546F7447507265762E56616C7565202A2031303029202F2070566C72546F7447
        5265616C2E56616C756529202D203130300D0A202020656C7365207056617254
        6F74472E4173457874656E646564203A3D20303B2020200D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65061047726F7570466F6F74657242616E643109
        4576656E744E616D65060B4265666F72655072696E74074576656E7449440218
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1144657461696C4265666F72655072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650CE001000070726F636564757265
        2044657461696C4265666F72655072696E743B0D0A626567696E0D0A20202069
        662070706C5B274453435F5449504F56414C4F52275D203D2027444553504553
        415327207468656E20626567696E0D0A2020202020202070566C72546F745265
        616C47472E4173457874656E646564203A3D202070566C72546F745265616C47
        472E4173457874656E646564202D2070706C5B27564C525F5245414C414E5427
        5D3B0D0A2020202020202070566C72546F745072657647472E4173457874656E
        646564203A3D202070566C72546F745072657647472E4173457874656E646564
        202D2070706C5B27564C525F50524556415455275D3B202020202020200D0A20
        2020656E6420656C736520626567696E0D0A2020202020202070566C72546F74
        5265616C47472E4173457874656E646564203A3D202070566C72546F74526561
        6C47472E4173457874656E646564202B2070706C5B27564C525F5245414C414E
        54275D3B0D0A2020202020202070566C72546F745072657647472E4173457874
        656E646564203A3D202070566C72546F745072657647472E4173457874656E64
        6564202B2070706C5B27564C525F50524556415455275D3B2020202020202020
        2020202020200D0A202020656E643B0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060644657461696C094576656E744E616D65060B4265666F726550
        72696E74074576656E74494402180001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D6506115265706F72744265666F72655072696E74
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        069170726F636564757265205265706F72744265666F72655072696E743B0D0A
        626567696E0D0A20202070566C72546F745265616C47472E4173496E74656765
        72203A3D20303B0D0A20202070566C72546F745072657647472E4173496E7465
        676572203A3D20303B0D0A20202070566172546F7447472E4173496E74656765
        7220202020203A3D20303B0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        6506065265706F7274094576656E744E616D65060B4265666F72655072696E74
        074576656E74494402010001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061B47726F7570466F6F74657242616E64324265666F72
        655072696E740B50726F6772616D54797065070B747450726F63656475726506
        536F7572636506EA70726F6365647572652047726F7570466F6F74657242616E
        64324265666F72655072696E743B0D0A626567696E0D0A20202069662070566C
        72546F745265616C47472E4173457874656E646564203C3E2030207468656E0D
        0A202020202020202070566172546F7447472E4173457874656E646564203A3D
        20313030202D282870566C72546F745072657647472E4173457874656E646564
        202A2031303029202F2070566C72546F745265616C47472E4173457874656E64
        6564290D0A202020656C73652070566172546F7447472E4173457874656E6465
        64203A3D20303B2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        061047726F7570466F6F74657242616E6432094576656E744E616D65060B4265
        666F72655072696E74074576656E74494402180000}
    end
  end
end
