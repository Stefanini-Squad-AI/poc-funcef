inherited RptDemonstraBeneficios: TRptDemonstraBeneficios
  Left = 440
  Top = 204
  Width = 667
  Height = 425
  Caption = 'RptDemonstraBeneficios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Tipo demonstrativo'
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
        Name = 'pTipoRel'
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
        Caption = 'Data Operacao'
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
        Name = 'pDataOperacao'
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
        Caption = 'Numero Processo'
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
        Name = 'pNumProcesso'
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
        Caption = 'ID Lote'
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
        Name = 'sIdLote'
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
        Caption = 'Titulo Motivo'
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
        Name = 'sApresentaSituacao'
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
        Caption = 'Situacao'
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
        Name = 'sSituacao'
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
        Caption = 'DataHora Inicio do Processo'
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
        Name = 'sDtHoraIniProcesso'
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
        Caption = 'Motivo'
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
        Name = 'sMotivo'
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
        Caption = 'Pessoa'
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
        Name = 'sIdPessoa'
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
        Caption = 'PerfilInvestimento'
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
        Name = 'sPerfilInvest'
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
    Report = rpDemonstraBeneficios
  end
  object rpDemonstraBeneficios: TppReport
    AutoStop = False
    DataPipeline = ppDemonstra
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4500
    PrinterSetup.mmMarginLeft = 4500
    PrinterSetup.mmMarginRight = 4500
    PrinterSetup.mmMarginTop = 4500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    BeforePrint = rpDemonstraBeneficiosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 76
    Version = '7.04'
    mmColumnWidth = 201000
    DataPipelineName = 'ppDemonstra'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppImage2: TppImage
        UserName = 'Image2'
        DirectDraw = True
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D6170D6A90000424DD6A90000000000003604000028000000C800
          0000D40000000100080000000000A0A50000232E0000232E0000000100000000
          00006A4F4D006B504E006B514F006C514F006D5351006D5250006F5453006F55
          53006E5452006F555400705654007157550072585600735A5800745B5900745B
          5A00765D5B00775E5D00765D5C00785F5E0079615F0078605E007B6361007A62
          60007B6462007C6463007E6765007E6665007D6564007F6866002DA0D5002FA0
          D50030A1D50034A3D60036A4D6003AA5D70039A5D7003CA6D7003EA7D80041A9
          D80041A8D80043A9D90047ABDA004AADDA004DAEDB004FAFDB0057B3DD0055B2
          DC0053B0DC005DB5DE005EB6DE005FB6DF0058B3DD0060B7DF0064B8DF0062B8
          DF0066B9E00069BBE0006BBCE1006DBCE1006EBDE10072BFE20077C1E30074C0
          E3007EC4E5007AC3E40080696700826B6900836C6A00836D6B00826C6A00846E
          6D0086706E0085706E0087716F0088727100897473008B7674008A7574008C77
          76008C7876008D7877008F7B79008D797700927E7D00907C7A0093807F009480
          7F0095828100978583009987850098868400998685009B8887009C8B89009E8C
          8B009F8E8D00A08F8E00A1908F00A2929100A5959300A4949300A7979500A493
          9200A8989700A9999800AA9B9A00A99A9900AB9C9B00AD9E9D00AEA09F00AEA0
          9E00AFA1A000B0A2A100B2A4A300B3A5A400B4A6A500B4A7A600B5A7A600B5A8
          A700B6A9A800B7AAA900B7ABAA00B8ABAA00B9ACAB00BAAEAD00BCB0AF00BEB2
          B100BFB4B30081C5E50084C7E50086C8E6008BCAE70089C9E7008ECBE70096CF
          E90097CFE90095CEE9009AD1EA009ED3EB00A1D4EC00A6D6EC00A9D7ED00AEDA
          EE00ADD9EE00AAD8ED00B2DBEF00B6DEF000B9DFF000C2B7B700C2B7B600C1B5
          B500C3B8B700C3B9B800C5BAB900C5BBBA00C6BBBB00C4B9B900C6BCBB00C8BE
          BD00C8BEBE00CBC2C100CBC2C200CCC3C200CCC3C300CFC6C500CFC7C600CFC6
          C600CDC4C300D0C8C700D1C9C800D2CACA00D3CBCA00D2CAC900D4CDCC00D4CC
          CC00D5CECD00D6CFCF00D7D0D000D8D1D100DAD3D300D9D3D200DCD6D500DBD5
          D500DED8D700DFD9D900DFDAD900C6E5F300CCE7F400CEE8F400D2EAF500D7EC
          F600D4EBF500DBEEF700DBEFF700D9EDF700DDEFF800DEF0F800E0DBDA00E1DC
          DB00E2DDDD00E4E0DF00E7E3E200E6E2E200E6E1E100E8E4E300E9E4E400EAE6
          E600EBE7E700E9E6E500EBE8E800ECE8E800EEEBEB00EFECEC00E6F3F900E7F4
          FA00E7F4F900E3F2F800EAF5FA00EDF7FB00EDF6FB00EEF7FB00F0EDED00F1EF
          EE00F2EFEF00F2F0F000F3F1F100F4F2F200F6F5F500F7F6F500F7F6F600F5F4
          F400F3F9FC00F1F8FC00F5FAFC00F6FBFD00F4F9FC00F9F7F700F8F7F700F9F8
          F800FAF9F900FBFAFA00F8FBFD00F9FCFD00F8FCFD00FBFDFE00FCFBFB00FCFC
          FC00FDFCFC00FDFDFD00FDFEFE00FEFDFD00FEFEFE00FFFFFF00FCFDFE00FCFC
          FB00FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFCE1B097726A666C7499B4E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDF8C99F786C686C779FCCFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD564444444444444444A4FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDE37E4B0200000000000000000004559EEFFDFDFDFDFDFD
          FDFDFDFD524444444444444449F6FDFDFDFDFDFDFDFD6C4444444444444444B6
          FDFDFDFDFDFDFDFDFDFCC665100000000000000000001671D5FDFDFDFDFDFDFD
          FDFDEF4644444444444444444444444444444444444444444444A5FDFDFDEE44
          4444444444444444C9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF87D0D0000000000000000000000000000
          0018A5FDFDFDFDFDFDFDFDFD140000000000000004F6FDFDFDFDFDFDFDB20000
          00000000000000AEFDFDFDFDFDFDFDFDD15B0000000000000000000000000000
          0A7CF9FDFDFDFDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE6540000000000000000
          00000000000000000000006EFCFDFDFDFDFDFDFD140000000000000004F6FDFD
          FDFDFDFDEE1C000000000000000000AEFDFDFDFDFDFDFC9E0A00000000000000
          0000000000000000000059E6FDFDFDFDFDFDED00000000000000000000000000
          000000000000000000009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF95800
          00000000000000000000000000000000000000007CFDFDFDFDFDFDFD14000000
          0000000004F6FDFDFDFDFDFD6C00000000000000000000AEFDFDFDFDFDFD7D01
          0000000000000000000000000000000000000054F1FDFDFDFDFDED0000000000
          0000000000000000000000000000000000009AFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFD980000000000000000000000000000000000000000000005CCFDFD
          FDFDFDFD140000000000000004F6FDFDFDFDFDB80200000000000000000000AE
          FDFDFDFDFDA3000000000000000000000000000000000000000000006CFDFDFD
          FDFDED00000000000000000000000000000000000000000000009AFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDF617000000000000000000000000000000000000
          00000000005EFDFDFDFDFDFD140000000000000004F6FDFDFDFDF14500000000
          00000000000000AEFDFDFDFDD40C000000000000000000000000000000000000
          0000000001C6FDFDFDFDED000000000000000000000000000000000000000000
          00009AFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDAC0000000000000000000258
          747C704C00000000000000000004E3FDFDFDFDFD140000000000000004F6FDFD
          FDFD74000000000000000000000000AEFDFDFDFD60000000000000000000085F
          809F7B4800000000000000000057FDFDFDFDED0000000000000000001D484848
          48484848484848484848A9FDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD66000000
          000000000004B1FDFDFDFDFC7C000000000000000000A1FDFDFDFDFD14000000
          0000000004F6FDFDFDC904000000000000000000000000AEFDFDFDD202000000
          000000000042CDFDFDFDFDF970000000000000000001CFFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFD4B000000000000000066FDFDFDFDFDFDFB4600000000000000006CFD
          FDFDFDFD140000000000000004F6FDFDF74C00000000000000000000000000AE
          FDFDFD78000000000000000008CDFDFDFDFDFDFDFC4D00000000000000007EFD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFC0C0000000000000000A9FDFDFDFDFDFDFD6D0000
          00000000000057FDFDFDFDFD140000000000000004F7FDFD7D00000000000000
          00000000000000AEFDFDFD4E000000000000000065FDFDFDFDFDFDFDFDA80000
          0000000000005BFDFDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000005070707070707070707A4FDFDFDFDFDE4000000000000000000C8FDFD
          FDFDFDFDFD97000000000000000047FDFDFDFDFD14000000000000000DFCFDD1
          070000000000000000000000000000AEFDFDF0040000000000000000AEFDFDFD
          FDFDFDFDFDE300000000000000001BFDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE50000000000000000000807070707070707
          0707CEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDDE00000000
          0000000000CBFDFDFDFDFDFDFD9A000000000000000019FDFDFDFDFD14000000
          0000000014FDFB55000000000000000000000000000000AEFDFDCB0000000000
          00000000E1FDFDFDFDFDFDFDFDFCCFCFCFCFCFCFCFCFD0FCFDFDED0000000000
          000000000C0E0E0E0E0E0E0E0E0E0E58FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000A1FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000042FD9800000000000000000000000000000000AE
          FDFDB000000000000000000AF9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          000000000000000000000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000A1FDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000004AD40C000000000000005300
          00000000000000AEFDFDA1000000000000000011FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDED000000000000000000000000000000000000000051
          FDFDFDFDFDFDE500000000000000000000000000000000000000CDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000A1FDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000051590000
          000000000053980000000000000000AEFDFDA0000000000000000011FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED00000000000000000000000000
          0000000000000051FDFDFDFDFDFDE50000000000000000000000000000000000
          0000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000A1FDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          000000000B0000000000000008CA7E0000000000000000AEFDFDA60000000000
          0000000BFBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED0000000000
          00000000000000000000000000000051FDFDFDFDFDFDE5000000000000000000
          00000000000000000000CDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A0000000000000000485A5A5A5A5A5A5A5A5AB6FDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD140000000000000000000000000000007CFD780000000000000000AE
          FDFDB8000000000000000000E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDED000000000000000000000000000000000000000051FDFDFDFDFDFDE500
          0000000000000000525A5A5A5A5A5A5A5A5ADEFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000000000000004AF6FD7000
          00000000000000AEFDFDE2000000000000000000B3FDFDFDFDFDFDFDFDEE6F6E
          6E6E6E6E6E6E9BFDFDFDED0000000000000000004E565656565656565656566D
          FDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          000005C8FDFD690000000000000000AEFDFDFD1D00000000000000006DFDFDFD
          FDFDFDFDFDC7000000000000000064FDFDFDED000000000000000000B6FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000BAFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000000000071FDFDFD640000000000000000AEFDFDFD6B00000000
          0000000012EEFDFDFDFDFDFDFD7900000000000000009AFDFDFDED0000000000
          00000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE5000000000000000000
          BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000095FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000000043F0FDFDFD640000000000000000AE
          FDFDFDB90000000000000000006DFDFDFDFDFDFDDE110000000000000001D4FD
          FDFDED000000000000000000B6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE500
          0000000000000000BAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A000000000000000066A6A6A6A6
          A6A6A6A6A6A6A6AAFCFDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD14000000000000000000000001B7FDFDFDFD6400
          00000000000000AEFDFDFDFD530000000000000000006ADFFCFDE49915000000
          000000000054FDFDFDFDED0000000000000000007AA6A6A6A6A6A6A6A6A6A6A6
          A6B2FDFDFDFDE50000000000000000007DA6A6A6A6A6A6A6A6A6A6A6B4FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD140000000000000000000000
          69FDFDFDFDFD640000000000000000AEFDFDFDFDC60200000000000000000003
          181B0400000000000000000000B1FDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000000019E4FDFDFDFDFD640000000000000000AEFDFDFDFDFD710000
          000000000000000000000000000000000000000059FCFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFD1A000000000000000000000000000000000000000007
          F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C000000000000000016FD
          FDFDFDFD1400000000000000000000AEFDFDFDFDFDFD640000000000000000AE
          FDFDFDFDFDF758000000000000000000000000000000000000000013DEFDFDFD
          FDFDED0000000000000000000000000000000000000000000045FDFDFDFDE500
          00000000000000000000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A00000000000000000000000000
          0000000000000007F9FDFDD4000000000000000000CAFDFDFDFDFDFDFD9C0000
          00000000000016FDFDFDFDFD1400000000000000000062FCFDFDFDFDFDFD6400
          00000000000000AEFDFDFDFDFDFDF05800000000000000000000000000000000
          00000AB9FDFDFDFDFDFDED000000000000000000000000000000000000000000
          0045FDFDFDFDE50000000000000000000000000000000000000000004DFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD1A0000000000
          00000000000000000000000000000007F9FDFDD4000000000000000000CAFDFD
          FDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000000000000011E2FD
          FDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDF77305000000000000
          00000000000000000016B8FDFDFDFDFDFDFDED00000000000000000000000000
          00000000000000000045FDFDFDFDE50000000000000000000000000000000000
          000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD1A000000000000000000000000000000000000000007F9FDFDD400000000
          0000000000CAFDFDFDFDFDFDFD9C000000000000000016FDFDFDFDFD14000000
          0000000000A8FDFDFDFDFDFDFDFD640000000000000000AEFDFDFDFDFDFDFDFD
          FDCB600400000000000000000000001377E6FDFDFDFDFDFDFDFDED0000000000
          000000000000000000000000000000000045FDFDFDFDE5000000000000000000
          0000000000000000000000004DFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDACA3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A5
          FCFDFDEFA3A3A3A3A3A3A3A3A3E5FDFDFDFDFDFDFDD0A3A3A3A3A3A3A3A3ABFD
          FDFDFDFDA9A3A3A3A3A3A3A3ADFCFDFDFDFDFDFDFDFDC6A3A3A3A3A3A3A3A3DF
          FDFDFDFDFDFDFDFDFDFDFDDF965A1907050911475A78B4F7FDFDFDFDFDFDFDFD
          FDFDF7A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B0FDFDFDFDFFA4
          A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3B3FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCF8F6F9FCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE8DB
          DBDBDBDBDBDBDBDDFCFCDBDBDBDBDBDBDBDBDBE8FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1F6FDFD
          FDEEE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E7FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDDDDBDBDBDBDBDBDBDBE8FDF5DBDBDBDBDBDBDBDBDB
          EBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7400000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E
          1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E
          1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21
          FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3A1E
          1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E1E1E1E1E1E1E1E1E
          87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFD3A1E1E1E1E1E1E1E1E21FCFA211E1E1E1E1E1E1E1E3AFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD271E1E1E1E1E1E1E1E32FDC11E
          1E1E1E1E1E1E1E1E87FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD361E1E1E1E1E1E1E1E22FCFA221E1E1E1E1E
          1E1E1E36FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFA231E1E1E1E
          1E1E1E1E35FDC41E1E1E1E1E1E1E1E1E86FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA231E1E1E1E1E1E1E1E2D
          FCFC2D1E1E1E1E1E1E1E1E23EAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDC01E1E1E1E1E1E1E1E1E41FDEC1F1E1E1E1E1E1E1E1E2EFCFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC851E1E
          1E1E1E1E1E1E1E82FDFD821E1E1E1E1E1E1E1E1E85FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF5351E1E1E1E1E1E1E1E1E8FFDFC341E1E1E1E1E1E1E1E
          1E92FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDEB841E1E1E1E1E1E1E1E1E1EBEFDFDC01E1E1E1E1E1E1E1E1E1E84EBFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDA391E1E1E1E1E1E1E1E1E24E8FDFD8E
          1E1E1E1E1E1E1E1E1E208DFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC413E3E3E3E3E
          3E3E3E3E3E3E3E3E3E3E3C251E1E1E1E1E1E1E1E1E1E3BFCFDFDFC3B1E1E1E1E
          1E1E1E1E1E1E253B3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E41FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDD83E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E38211E1E1E1E1E1E1E
          1E1E1E8AFDFDFDF22B1E1E1E1E1E1E1E1E1E1E2A3D3E3E3E3E3E3E3E3E3E3E3E
          3E3E3E3E88FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E26D7FD
          FDFDFDD6261E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E2EF3FDFDFDFDBC201E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E22BDFDFDFDFDFDFDBD221E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E21FDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDC21E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2AD7FDFDFDFDFDFD901F1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E29BEFDFDFDFDFDFDFDFDBE291E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDC21E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2ED7FDFDFDFDFDFD
          FDFD93211E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E32FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC211E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2040DDFDFDFDFDFDFDFDFDFDFDDB40
          201E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E21FDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDC21E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2487
          F3FDFDFDFDFDFDFDFDFDFDC4391E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E32FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC3731313131313131313131313131313131313131353D8CD6FDFDFDFDFDFD
          FDFDFDFDFDFDFDFDD68C3D333131313131313131313131313131313131313136
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDD93131313131313131313131313131313131
          31313135418FE9FDFDFDFDFDFDFDFDFDFDFDFDFDFCC3873A3231313131313131
          31313131313131313131313182FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC4842F23232F84C5FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBC402C222631
          8ADCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3851F1E1E1E1E1E1E1F84F3FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          DB3A1E1E1E1E1E1E1E248EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3381E1E1E1E
          1E1E1E1E1E1E38F4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDDA2B1E1E1E1E1E1E1E1E1E1E84FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD831E1E1E1E1E1E1E1E1E1E1E1E82FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFE311E1E1E1E1E1E1E1E1E1E1E1E8FFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDBF1E1E1E1E1E1E1E1E1E1E1E1E1E1EBFFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD8F1E1E1E1E1E1E1E1E1E
          1E1E1E1E25E8FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD811E1E1E1E1E1E1E1E1E1E1E1E1E1E
          81FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2F1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E91FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC2A1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E2AFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDDC1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E3DFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F2201E1E1E1E1E1E1E1E1E1E1E1E1E1E20F3FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDBE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E2FFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDEB1F1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EEBFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBD1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E30FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC281E1E1E1E1E1E1E1E1E1E1E1E1E1E
          28FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD71E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E39FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD3F1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E3FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFC2B1E1E1E1E1E1E1E1E1E1E1E1E1E1E8BFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDBB1E1E1E1E1E1E1E1E1E1E1E1E1E1EBBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFD8A1E1E1E1E1E1E1E1E1E1E1E1E1E21DAFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC391E1E1E1E1E1E1E1E1E1E1E1E3AFCFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEA2A1E1E1E1E1E1E1E1E
          1E1E1E1E89FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC2C1E1E1E1E1E1E1E1E1E1E2CDC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDBF
          231E1E1E1E1E1E1E1E1E1E39F5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDC361E1E1E
          1E1E1E1E1E36DCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDC32C1E1E1E1E1E1E1E1E81F2FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFA9436211E1E213894FAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF48D2E1F1E1E233DBDFCFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF3D7D7F3FDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCEAD6DAFE
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7500000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF90700000000000000000000000000
          0000000000ABFDFDFD7500000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9070000000000
          00000000000000000000000000ABFDFDFD750000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDF907000000000000000000000000000000000000ABFDFDFD75000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDF907000000000000000000000000000000000000ABFDFD
          FD7700000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE60000000000000000000000000000
          0000000000B1FDFDFD7B00000000000000000000000000000000000043FCFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDB3000000000000
          00000000000000000000000000C9FDFDFD9E0000000000000000000000000000
          0000000003E3FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD6500000000000000000000000000000000000005EFFDFDFDB9000000000000
          0000000000000000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDCD040000000000000000000000000000000000004CFDFDFD
          FDF00700000000000000000000000000000000000018EEFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF14D000000000000000000000000000000
          0000000074FDFDFDFDFD580000000000000000000000000000000000000066FC
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF15E0000000000000000
          000000000000000000000001CEFDFDFDFDFDA100000000000000000000000000
          0000000000000079FCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD35200
          0000000000000000000000000000000000000056FDFDFDFDFDFDF11500000000
          0000000000000000000000000000000063E4FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDF7C76A0A000000000000000000000000000000000000000000B7FDFDFDFD
          FDFDFD7F0000000000000000000000000000000000000000001179D1F9FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC1C14141414141414141414141414
          1414141414141414141414141414141414141414141414141414141414141414
          1414141414141414141509000000000000000000000000000000000000000000
          00005DFDFDFDFDFDFDFDFDF14200000000000000000000000000000000000000
          000000000C151414141414141414141414141414141414141414141414141414
          141414141414141414141414141414141414141414141414141414145BFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000DD5FDFDFDFDFDFDFDFDFDB40100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000A5FDFDFDFDFDFDFDFDFDFDFD710000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000073FDFDFDFDFDFDFD
          FDFDFDFDFDF85800000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000064
          FCFDFDFDFDFDFDFDFDFDFDFDFDFDEE5100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000069F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE45400000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC060000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000037EFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          F164000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFC06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000001DB6FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFCA00E0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000050FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC0600000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000B76EFFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDDF670500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000050FDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC060000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000001C
          78E2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCF6A0F
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000050FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFC441A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A424C5E7DC7FBFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDF1B373594A1D1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A1A
          1A1A1A1A1A1A1A1A1A1A1A1A5EFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDE7B3967671799BB8F0FDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDEF9D5203000000000000000A5CAAF8FD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF6801200000000000000
          00000000000043AAFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD04E00
          000000000000000000000000000000005FE7FDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDB40F0000000000000000000000000000000000000046D3FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDB40700000000000000000000000000000000000000
          000017D2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCD0E000000000000000000000000
          000000000000000000000043E6FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF1480000000000
          000000000000000000000000000000000000000061FCFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD7C000000000000000000000000000000000000000000000000000000B1FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDE30D00000000000000000000000000000000000000000000
          00000000004BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7D000000000000000000000000000000
          0000000000000000000000000000B5FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFC4700000000000000
          0000000000000000000000000000000000000000000063FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDD3
          00000000000000000000000000000000000000000000000000000000000011F9
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDA1000000000000000000000000000000000000000000000000
          00000000000000D1FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7300000000000000000000000000000000
          000000000000000000000000000000AAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD650000000000000000
          000000000000000000000000000000000000000000000095FDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD60
          000000000000000000000000000000000000000000000000000000000000007F
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFD67000000000000000000000000000000000000000000000000
          0000000000000096FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD7100000000000000000000000000000000
          000000000000000000000000000000A9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA00000000000000000
          0000000000000000000000000000000000000000000000CBFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDCE
          0000000000000000000000000000000000000000000000000000000000000EF8
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFC420000000000000000000000000000000000000000000000
          0000000000005FFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD77000000000000000000000000000000
          0000000000000000000000000000AFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDE009000000000000
          00000000000000000000000000000000000000000046F9FDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FD72000000000000000000000000000000000000000000000000000000A9FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDEE42000000000000000000000000000000000000000000
          000000005BFCFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDC707000000000000000000000000
          00000000000000000000001CE2FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDA703000000
          0000000000000000000000000000000000000ECBFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDA7070000000000000000000000000000000000000014C8FDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDC7420000000000000000000000000000000000
          55DEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDED720A00000000000000
          0000000000001598F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          E079430000000000000000014F98EFFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFCD3A27569656A7BAAE0FCFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFD}
        mmHeight = 17000
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 14000
        BandType = 0
      end
      object lbl_Titulo: TppLabel
        UserName = 'lbl_Titulo'
        AutoSize = False
        Caption = 'DEMONSTRATIVO DE BENEFÍCIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 21167
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'lbl_dataconce1'
        Caption = 'Emissão: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2582
        mmLeft = 165894
        mmTop = 24871
        mmWidth = 10033
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 1058
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 6879
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Brasília  DF CEP 70.712-900 - (061)3329-1700 - www.funcef.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 10054
        mmWidth = 201084
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'CNPJ: 00.436.923/0001-90'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13758
        mmWidth = 201084
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 175948
        mmTop = 24871
        mmWidth = 19812
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 28046
        mmWidth = 199232
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 90488
      mmPrintPosition = 0
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 'Nome do Recebedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 5556
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'NOMERECEBEDOR'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3260
        mmLeft = 34925
        mmTop = 5556
        mmWidth = 38777
        BandType = 4
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'Matrícula: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 10054
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3260
        mmLeft = 18521
        mmTop = 10054
        mmWidth = 10964
        BandType = 4
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        Caption = 'CPF: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 166688
        mmTop = 10054
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'CPF'
        DataPipeline = ppDemonstra
        DisplayFormat = '999.999.999-99;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3175
        mmLeft = 174625
        mmTop = 10054
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel54: TppLabel
        UserName = 'Label103'
        Caption = 'Plano Previdenciário: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 14817
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'NOMEPLANO'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3260
        mmLeft = 34925
        mmTop = 14817
        mmWidth = 52917
        BandType = 4
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'Situação no Plano: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 91017
        mmTop = 14817
        mmWidth = 26416
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText602'
        DataField = 'NOMESITPLANO'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3260
        mmLeft = 118269
        mmTop = 14817
        mmWidth = 44450
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Data de Nascimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 91017
        mmTop = 10054
        mmWidth = 29898
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3260
        mmLeft = 121709
        mmTop = 10054
        mmWidth = 14139
        BandType = 4
      end
      object ppLabel58: TppLabel
        UserName = 'lblCapIsentoIRRF2'
        Caption = 'Isento IRRF: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 166688
        mmTop = 14817
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'lblIsentoIRRF1'
        AutoSize = True
        DataField = 'IRRFISENTO'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3260
        mmLeft = 184415
        mmTop = 14817
        mmWidth = 5038
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 1058
        mmTop = 23813
        mmWidth = 199232
        BandType = 4
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Conta Salário: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 25400
        mmWidth = 20066
        BandType = 4
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'Banco: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 25400
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Conta Preferencial: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3440
        mmTop = 30163
        mmWidth = 26797
        BandType = 4
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'Banco: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 81492
        mmTop = 30163
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'Agência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 138113
        mmTop = 25400
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = 'Agência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 138113
        mmTop = 30163
        mmWidth = 12700
        BandType = 4
      end
      object lbl_banco: TppLabel
        UserName = 'lbl_banco'
        AutoSize = False
        Caption = 'lbl_banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 25400
        mmWidth = 42598
        BandType = 4
      end
      object lbl_agencia: TppLabel
        UserName = 'lbl_agencia'
        Caption = 'lbl_agencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 25400
        mmWidth = 14288
        BandType = 4
      end
      object lbl_conta: TppLabel
        OnPrint = lbl_contaPrint
        UserName = 'lbl_conta'
        AutoSize = False
        Caption = 'lbl_conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 25135
        mmTop = 25400
        mmWidth = 53181
        BandType = 4
      end
      object lbl_conta2: TppLabel
        UserName = 'lbl_conta2'
        AutoSize = False
        Caption = 'lbl_conta2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 32279
        mmTop = 30163
        mmWidth = 46038
        BandType = 4
      end
      object lbl_banco2: TppLabel
        UserName = 'lbl_banco2'
        AutoSize = False
        Caption = 'lbl_banco2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 30163
        mmWidth = 42863
        BandType = 4
      end
      object lbl_agencia2: TppLabel
        UserName = 'lbl_agencia2'
        Caption = 'lbl_agencia2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 30163
        mmWidth = 15346
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1058
        mmTop = 34925
        mmWidth = 199232
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 1058
        mmTop = 34925
        mmWidth = 199232
        BandType = 4
      end
      object SubRelFuncef: TppSubReport
        UserName = 'SubRelFuncef'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBenefFuncef'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 37042
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBenefFuncef
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 328
          Top = 208
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBenefFuncef'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 24077
            mmPrintPosition = 0
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 1323
              mmWidth = 15081
              BandType = 4
            end
            object ppDBNome1: TppDBText
              UserName = 'DBNome1'
              DataField = 'NOME'
              DataPipeline = ppBenefFuncef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3175
              mmLeft = 19579
              mmTop = 1323
              mmWidth = 118534
              BandType = 4
            end
            object lblBSAtu1: TppLabel
              UserName = 'lblBSAtu1'
              Caption = 'Valor Atual do BS:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 10583
              mmWidth = 25400
              BandType = 4
            end
            object ppDbBSAtu1: TppDBText
              UserName = 'DbBSAtu1'
              AutoSize = True
              DataField = 'VLRBSATUAL'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 29104
              mmTop = 10583
              mmWidth = 18246
              BandType = 4
            end
            object lblBSTot1: TppLabel
              UserName = 'lblBSTot1'
              Caption = 'Valor Total do BS:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 14817
              mmWidth = 25135
              BandType = 4
            end
            object ppDbBSTot1: TppDBText
              UserName = 'DbBSTot1'
              AutoSize = True
              DataField = 'VLRBSTOTAL'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 29104
              mmTop = 14817
              mmWidth = 18246
              BandType = 4
            end
            object lblDeficit1: TppLabel
              UserName = 'lblDeficit1'
              Caption = 'Base de Cálculo do Déficit:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 19050
              mmWidth = 38629
              BandType = 4
            end
            object ppDBDeficit1: TppDBText
              UserName = 'DBText501'
              AutoSize = True
              DataField = 'VLRBASEDEFICIT'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 42598
              mmTop = 19050
              mmWidth = 24172
              BandType = 4
            end
            object lblFABAtu1: TppLabel
              UserName = 'lblFABAtu1'
              Caption = 'Valor Atual do FAB:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 80169
              mmTop = 10583
              mmWidth = 28046
              BandType = 4
            end
            object ppDbFABAtu1: TppDBText
              UserName = 'DbFABAtu1'
              AutoSize = True
              DataField = 'VLRFABATUAL'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 108479
              mmTop = 10583
              mmWidth = 19812
              BandType = 4
            end
            object lblFABTot1: TppLabel
              UserName = 'lblFABTot1'
              Caption = 'Valor Total do FAB:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 80169
              mmTop = 14817
              mmWidth = 27781
              BandType = 4
            end
            object ppDbFABTot1: TppDBText
              UserName = 'DbFABTot1'
              AutoSize = True
              DataField = 'VLRFABTOTAL'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 108479
              mmTop = 14817
              mmWidth = 19812
              BandType = 4
            end
            object lblVlrAtual1: TppLabel
              UserName = 'lblVlrAtual1'
              Caption = 'Valor Atual do Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 141552
              mmTop = 10583
              mmWidth = 35983
              BandType = 4
            end
            object ppDbVlrAtual1: TppDBText
              UserName = 'DbVlrAtual1'
              AutoSize = True
              DataField = 'VALORATUAL'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 178065
              mmTop = 10583
              mmWidth = 18330
              BandType = 4
            end
            object lblVlrTotal1: TppLabel
              UserName = 'lblVlrTotal1'
              Caption = 'Valor Total do Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 141552
              mmTop = 14817
              mmWidth = 35190
              BandType = 4
            end
            object ppDbVlrTotal1: TppDBText
              UserName = 'DbVlrTotal1'
              AutoSize = True
              DataField = 'VALORTOTAL'
              DataPipeline = ppBenefFuncef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 177536
              mmTop = 14817
              mmWidth = 18330
              BandType = 4
            end
            object VlrOriginal1: TppLabel
              UserName = 'VlrOriginal1'
              Caption = 'Valor do Benefício Original: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 141552
              mmTop = 19050
              mmWidth = 38894
              BandType = 4
            end
            object lbl_vlrOriginal1: TppLabel
              OnPrint = lbl_vlrOriginal1Print
              UserName = 'lbl_vlrOriginal1'
              Caption = 'lbl_vlrOriginal1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 181240
              mmTop = 19050
              mmWidth = 18669
              BandType = 4
            end
            object lbl_DIB1: TppLabel
              UserName = 'lbl_DIB1'
              Caption = 'DIB: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 6350
              mmWidth = 6085
              BandType = 4
            end
            object ppDIB1: TppDBText
              UserName = 'DBText301'
              AutoSize = True
              DataField = 'DIB'
              DataPipeline = ppBenefFuncef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 10054
              mmTop = 6350
              mmWidth = 4741
              BandType = 4
            end
            object lbl_DIP1: TppLabel
              UserName = 'Label601'
              Caption = 'DIP: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 46302
              mmTop = 6350
              mmWidth = 6085
              BandType = 4
            end
            object ppDIP1: TppDBText
              UserName = 'DIP1'
              AutoSize = True
              DataField = 'DIP'
              DataPipeline = ppBenefFuncef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 52917
              mmTop = 6350
              mmWidth = 4741
              BandType = 4
            end
            object lbl_DIBAnt1: TppLabel
              UserName = 'Label6'
              Caption = 'DIB Anterior: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 80169
              mmTop = 6350
              mmWidth = 18785
              BandType = 4
            end
            object ppDIBAnt1: TppDBText
              UserName = 'DIBAnt1'
              AutoSize = True
              DataField = 'DIBANT'
              DataPipeline = ppBenefFuncef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3175
              mmLeft = 99484
              mmTop = 6350
              mmWidth = 10319
              BandType = 4
            end
            object lbl_DtFinal1: TppLabel
              UserName = 'Label1'
              Caption = 'Data Final:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 141552
              mmTop = 6350
              mmWidth = 14552
              BandType = 4
            end
            object ppDtFinal1: TppDBText
              UserName = 'DtFinal1'
              AutoSize = True
              DataField = 'DATAFINAL'
              DataPipeline = ppBenefFuncef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 156634
              mmTop = 6350
              mmWidth = 15198
              BandType = 4
            end
            object lbl_DtNova1: TppLabel
              UserName = 'lbl_DtNova1'
              Caption = 'Data de Reabertura:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 141552
              mmTop = 1323
              mmWidth = 28840
              BandType = 4
            end
            object ppDtNova1: TppDBText
              UserName = 'DtNova1'
              AutoSize = True
              DataField = 'DATANOVA'
              DataPipeline = ppBenefFuncef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefFuncef'
              mmHeight = 3260
              mmLeft = 170657
              mmTop = 1323
              mmWidth = 14986
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubRelINSS: TppSubReport
        UserName = 'SubRelINSS'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelFuncef
        TraverseAllData = False
        DataPipelineName = 'ppBenefnss'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 42863
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBenefnss
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 344
          Top = 224
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBenefnss'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 18785
            mmPrintPosition = 0
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 1323
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              AutoSize = True
              DataField = 'NOME'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3175
              mmLeft = 19050
              mmTop = 1323
              mmWidth = 115359
              BandType = 4
            end
            object lbl_DER2: TppLabel
              UserName = 'lbl_DER2'
              Caption = 'DER:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 6085
              mmWidth = 6943
              BandType = 4
            end
            object ppDER2: TppDBText
              UserName = 'DER2'
              AutoSize = True
              DataField = 'DER'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3260
              mmLeft = 10583
              mmTop = 6085
              mmWidth = 5969
              BandType = 4
            end
            object lbl_DIP2: TppLabel
              UserName = 'lbl_DIP2'
              Caption = 'DIP: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 78052
              mmTop = 6085
              mmWidth = 5556
              BandType = 4
            end
            object ppDIP2: TppDBText
              UserName = 'DIP2'
              AutoSize = True
              DataField = 'DIP'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3260
              mmLeft = 84138
              mmTop = 6085
              mmWidth = 4741
              BandType = 4
            end
            object lbl_DIBAnt2: TppLabel
              UserName = 'lbl_DIBAnt2'
              Caption = 'DIB Anterior: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 138907
              mmTop = 6085
              mmWidth = 18785
              BandType = 4
            end
            object ppDIBAnt2: TppDBText
              UserName = 'DIBAnt2'
              AutoSize = True
              DataField = 'DIBANT'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3175
              mmLeft = 158221
              mmTop = 6085
              mmWidth = 10319
              BandType = 4
            end
            object lbl_DtFinal2: TppLabel
              UserName = 'lbl_DtFinal2'
              Caption = 'Data Final:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 78052
              mmTop = 10054
              mmWidth = 14552
              BandType = 4
            end
            object ppDtFinal2: TppDBText
              UserName = 'DtFinal2'
              AutoSize = True
              DataField = 'DATAFINAL'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3175
              mmLeft = 93398
              mmTop = 10054
              mmWidth = 15081
              BandType = 4
            end
            object lbl_DtNova2: TppLabel
              UserName = 'Label101'
              Caption = 'Data de Reabertura:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 138907
              mmTop = 1323
              mmWidth = 28840
              BandType = 4
            end
            object ppDtNova2: TppDBText
              UserName = 'DtNova2'
              AutoSize = True
              DataField = 'DATANOVA'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3260
              mmLeft = 168540
              mmTop = 1323
              mmWidth = 14986
              BandType = 4
            end
            object ppDIB2: TppDBText
              UserName = 'DIB2'
              AutoSize = True
              DataField = 'DIB'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3260
              mmLeft = 52917
              mmTop = 6085
              mmWidth = 4741
              BandType = 4
            end
            object lbl_DIB2: TppLabel
              UserName = 'lbl_DIB2'
              Caption = 'DIB: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 46567
              mmTop = 6085
              mmWidth = 5821
              BandType = 4
            end
            object lbl_NumINSS: TppLabel
              UserName = 'Label1302'
              Caption = 'Número do Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 10054
              mmWidth = 31750
              BandType = 4
            end
            object ppNumProcINSS: TppDBText
              UserName = 'NumProcINSS'
              AutoSize = True
              DataField = 'NUMPROCINSS'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3175
              mmLeft = 36248
              mmTop = 10054
              mmWidth = 21167
              BandType = 4
            end
            object ppTempo: TppDBText
              UserName = 'Tempo'
              AutoSize = True
              DataField = 'TEMPOSERVICO'
              DataPipeline = ppBenefnss
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3175
              mmLeft = 166423
              mmTop = 10054
              mmWidth = 22754
              BandType = 4
            end
            object lbl_Tempo: TppLabel
              UserName = 'Label202'
              Caption = 'Tempo de Serviço:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 138907
              mmTop = 10054
              mmWidth = 27252
              BandType = 4
            end
            object lblVlrAtual2: TppLabel
              UserName = 'lblVlrAtual2'
              Caption = 'Valor Atual do Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 14288
              mmWidth = 35719
              BandType = 4
            end
            object ppDbVlrAtual2: TppDBText
              UserName = 'DbVlrAtual2'
              AutoSize = True
              DataField = 'VALORATUAL'
              DataPipeline = ppBenefnss
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3260
              mmLeft = 39952
              mmTop = 14288
              mmWidth = 18330
              BandType = 4
            end
            object lblVlrTotal2: TppLabel
              UserName = 'lblVlrTotal2'
              Caption = 'Valor Total do Benefício:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 78052
              mmTop = 14288
              mmWidth = 35190
              BandType = 4
            end
            object ppDbVlrTotal2: TppDBText
              UserName = 'DbVlrTotal2'
              AutoSize = True
              DataField = 'VALORTOTAL'
              DataPipeline = ppBenefnss
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBenefnss'
              mmHeight = 3260
              mmLeft = 113771
              mmTop = 14288
              mmWidth = 18330
              BandType = 4
            end
            object VlrOriginal2: TppLabel
              UserName = 'VlrOriginal2'
              Caption = 'Valor do Benefício Original: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 138907
              mmTop = 14288
              mmWidth = 38894
              BandType = 4
            end
            object lbl_vlrOriginal2: TppLabel
              OnPrint = lbl_vlrOriginal2Print
              UserName = 'lbl_vlrOriginal2'
              Caption = 'lbl_vlrOriginal2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 178594
              mmTop = 14288
              mmWidth = 18669
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubRelLegenda: TppSubReport
        UserName = 'SubRelLegenda'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelSituacao
        TraverseAllData = False
        DataPipelineName = 'ppLegenda'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 78052
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppLegenda
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppLegenda'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 9525
            mmPrintPosition = 0
            object ppLabel125: TppLabel
              UserName = 'Label125'
              Caption = 'Legenda Plano Contábil:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 1588
              mmWidth = 38100
              BandType = 1
            end
            object ppLabel126: TppLabel
              UserName = 'Label126'
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 5821
              mmWidth = 13229
              BandType = 1
            end
            object ppLabel127: TppLabel
              UserName = 'Label127'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 23813
              mmTop = 5821
              mmWidth = 13494
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText104: TppDBText
              UserName = 'DBText104'
              DataField = 'PLANO'
              DataPipeline = ppLegenda
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppLegenda'
              mmHeight = 3429
              mmLeft = 23813
              mmTop = 529
              mmWidth = 130440
              BandType = 4
            end
            object ppDBText105: TppDBText
              UserName = 'DBText105'
              DataField = 'CODIGO'
              DataPipeline = ppLegenda
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppLegenda'
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubRelSituacao: TppSubReport
        UserName = 'SubRelSituacao'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelTotal
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 72231
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 448
          Top = 328
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14552
            mmPrintPosition = 0
            object ppLine14: TppLine
              UserName = 'Line14'
              ShiftWithParent = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 1058
              mmTop = 1588
              mmWidth = 199232
              BandType = 1
            end
            object ppSituacao: TppLabel
              UserName = 'ppSituacao'
              ShiftWithParent = True
              Caption = 'ppSituacao'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 55563
              mmTop = 3175
              mmWidth = 14182
              BandType = 1
            end
            object lblSituacao: TppLabel
              UserName = 'Label302'
              CharWrap = True
              ShiftWithParent = True
              Caption = 'Situação do Benefício alterada para:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 3175
              mmWidth = 51594
              BandType = 1
            end
            object ppLinSit: TppLine
              UserName = 'LinSit'
              ShiftWithParent = True
              Weight = 0.75
              mmHeight = 265
              mmLeft = 1058
              mmTop = 12171
              mmWidth = 199232
              BandType = 1
            end
            object ppMotivo: TppLabel
              UserName = 'ppSituacao1'
              ShiftWithParent = True
              Caption = 'ppMotivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3260
              mmLeft = 31485
              mmTop = 7673
              mmWidth = 11430
              BandType = 1
            end
            object lblMotivo: TppLabel
              UserName = 'lblMotivo'
              CharWrap = True
              ShiftWithParent = True
              Caption = 'Titulo do Motivo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 3440
              mmTop = 7673
              mmWidth = 22902
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubRelHstBenef: TppSubReport
        OnPrint = SubRelHstBenefPrint
        UserName = 'SubRelHstBenef'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelINSS
        TraverseAllData = False
        DataPipelineName = 'ppHstBenef'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 48683
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppHstBenef
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 304
          Top = 184
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppHstBenef'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21960
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              mmHeight = 6350
              mmLeft = 4233
              mmTop = 15875
              mmWidth = 194734
              BandType = 1
            end
            object ppShape5: TppShape
              UserName = 'Shape5'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 10054
              mmWidth = 194734
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'Referência'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 5556
              mmTop = 17198
              mmWidth = 15000
              BandType = 1
            end
            object ppLabel95: TppLabel
              UserName = 'Label903'
              Caption = 'Pagamento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 23283
              mmTop = 17198
              mmWidth = 16669
              BandType = 1
            end
            object lblBS: TppLabel
              UserName = 'lblBS'
              Caption = 'BS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 142875
              mmTop = 17198
              mmWidth = 3937
              BandType = 1
            end
            object lblValorBeneficio: TppLabel
              UserName = 'lblValorBeneficio'
              Caption = 'Valor Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 157163
              mmTop = 17198
              mmWidth = 21431
              BandType = 1
            end
            object lblBaseDeficit: TppLabel
              UserName = 'lblBaseDeficit'
              Caption = 'Base Déficit'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 180975
              mmTop = 17198
              mmWidth = 17198
              BandType = 1
            end
            object ppLabel108: TppLabel
              UserName = 'Label108'
              Caption = 'Histórico de Pagamento de Benefícios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 5027
              mmTop = 11113
              mmWidth = 193675
              BandType = 1
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 1058
              mmTop = 1852
              mmWidth = 199232
              BandType = 1
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 1058
              mmTop = 7673
              mmWidth = 199232
              BandType = 1
            end
            object ppLabel109: TppLabel
              UserName = 'Label109'
              Caption = ' VALORES A PAGAR / RECEBER '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 5027
              mmTop = 3175
              mmWidth = 193675
              BandType = 1
            end
            object ppLabel110: TppLabel
              UserName = 'Label110'
              Caption = 'Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 42069
              mmTop = 17198
              mmWidth = 12742
              BandType = 1
            end
            object lblFAB: TppLabel
              UserName = 'lblFAB'
              Caption = 'FAB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 125413
              mmTop = 17198
              mmWidth = 5503
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            BeforePrint = ppDetailBand6BeforePrint
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText89: TppDBText
              UserName = 'DBText89'
              DataField = 'MESREFERENCIA'
              DataPipeline = ppHstBenef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 5556
              mmTop = 529
              mmWidth = 15000
              BandType = 4
            end
            object ppDBText90: TppDBText
              UserName = 'DBText90'
              DataField = 'NOME'
              DataPipeline = ppHstBenef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 42598
              mmTop = 529
              mmWidth = 74348
              BandType = 4
            end
            object ppVlrFAB: TppDBText
              UserName = 'VlrFAB'
              OnGetText = ppVlrFABGetText
              AutoSize = True
              DataField = 'VALORFAB'
              DataPipeline = ppHstBenef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 123190
              mmTop = 529
              mmWidth = 12827
              BandType = 4
            end
            object ppvlbenef: TppDBText
              UserName = 'vlbenef'
              AutoSize = True
              DataField = 'VALORPREV'
              DataPipeline = ppHstBenef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 163725
              mmTop = 529
              mmWidth = 14901
              BandType = 4
            end
            object ppVlrDeficit: TppDBText
              UserName = 'VlrDeficit'
              OnGetText = ppVlrDeficitGetText
              AutoSize = True
              DataField = 'VLRBASEDEFICIT'
              DataPipeline = ppHstBenef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 176510
              mmTop = 529
              mmWidth = 20870
              BandType = 4
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 4233
              mmWidth = 194734
              BandType = 4
            end
            object ppShape6: TppShape
              UserName = 'Shape6'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 21960
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape7: TppShape
              UserName = 'Shape7'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 4233
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape8: TppShape
              UserName = 'Shape8'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 117475
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object linha6: TppShape
              UserName = 'linha6'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 179917
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape10: TppShape
              UserName = 'Shape202'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 198702
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText94: TppDBText
              UserName = 'DBText94'
              DataField = 'DATAPAGAMENTO'
              DataPipeline = ppHstBenef
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 23813
              mmTop = 529
              mmWidth = 15000
              BandType = 4
            end
            object ppShape11: TppShape
              UserName = 'Shape11'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 40217
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object linha4: TppShape
              UserName = 'linha4'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 155575
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppVlrBS: TppDBText
              UserName = 'DBText102'
              OnGetText = ppVlrBSGetText
              AutoSize = True
              DataField = 'VALORBS'
              DataPipeline = ppHstBenef
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstBenef'
              mmHeight = 2879
              mmLeft = 142950
              mmTop = 529
              mmWidth = 11472
              BandType = 4
            end
            object linha5: TppShape
              UserName = 'linha5'
              ParentHeight = True
              mmHeight = 4233
              mmLeft = 137319
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line201'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 0
              mmWidth = 194734
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object SubRelHstContrA: TppSubReport
        UserName = 'SubRelHstContrA'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelHstBenef
        TraverseAllData = False
        DataPipelineName = 'ppHstContrib'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 54504
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = ppHstContrib
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 320
          Top = 200
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppHstContrib'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppShape30: TppShape
              UserName = 'Shape30'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 1588
              mmWidth = 194734
              BandType = 1
            end
            object ppLabel117: TppLabel
              UserName = 'Label117'
              Caption = 'Histórico de Contribuições'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3810
              mmLeft = 80698
              mmTop = 2646
              mmWidth = 40725
              BandType = 1
            end
          end
          object ppDetailBand7: TppDetailBand
            BeforePrint = ppDetailBand7BeforePrint
            mmBottomOffset = 0
            mmHeight = 4615
            mmPrintPosition = 0
            object ppHCMesRef: TppDBText
              UserName = 'DBText202'
              DataField = 'MESREFERENCIA'
              DataPipeline = ppHstContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstContrib'
              mmHeight = 2963
              mmLeft = 4763
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object ppHCMesCobr: TppDBText
              UserName = 'HCMesCobr'
              DataField = 'MESCOBRANCA'
              DataPipeline = ppHstContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstContrib'
              mmHeight = 2963
              mmLeft = 27781
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object ppHCNome: TppDBText
              UserName = 'HCNome'
              DataField = 'NOME'
              DataPipeline = ppHstContrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstContrib'
              mmHeight = 2921
              mmLeft = 51065
              mmTop = 794
              mmWidth = 79904
              BandType = 4
            end
            object ppHCVlrPag: TppDBText
              OnPrint = ppHCVlrPagPrint
              UserName = 'HCVlrPag'
              DataField = 'VLRDEVOLVER'
              DataPipeline = ppHstContrib
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstContrib'
              mmHeight = 2963
              mmLeft = 132821
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppHCVlrDesc: TppDBText
              OnPrint = ppHCVlrDescPrint
              UserName = 'HCVlrDesc'
              DataField = 'VLRCOBRAR'
              DataPipeline = ppHstContrib
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstContrib'
              mmHeight = 2879
              mmLeft = 166423
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 4498
              mmWidth = 194734
              BandType = 4
            end
            object ppShape31: TppShape
              UserName = 'Shape31'
              ParentHeight = True
              mmHeight = 4615
              mmLeft = 26723
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape32: TppShape
              UserName = 'Shape32'
              ParentHeight = True
              mmHeight = 4615
              mmLeft = 4233
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape33: TppShape
              UserName = 'Shape33'
              ParentHeight = True
              mmHeight = 4615
              mmLeft = 49742
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape34: TppShape
              UserName = 'Shape34'
              ParentHeight = True
              mmHeight = 4615
              mmLeft = 132027
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape37: TppShape
              UserName = 'Shape37'
              ParentHeight = True
              mmHeight = 4615
              mmLeft = 165894
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape41: TppShape
              UserName = 'Shape41'
              ParentHeight = True
              mmHeight = 4615
              mmLeft = 198702
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 0
              mmWidth = 194734
              BandType = 4
            end
          end
          object ppHCARodape: TppSummaryBand
            BeforePrint = ppHCARodapeBeforePrint
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object lblAvisoContrib: TppLabel
              UserName = 'lblAvisoContrib'
              Caption = 
                '(*) Contribuições Patronais. Estas contribuições serão enviadas ' +
                'para o CAP/CAR. '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 3006
              mmLeft = 4498
              mmTop = 0
              mmWidth = 79925
              BandType = 7
            end
          end
          object ppGroup3: TppGroup
            BreakName = 'IDCONTRIBUICAO'
            DataPipeline = ppHstContrib
            OutlineSettings.CreateNode = True
            UserName = 'Group3'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppHstContrib'
            object ppGroupHeaderBand3: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 6000
              mmPrintPosition = 0
              object ppShape29: TppShape
                UserName = 'Shape29'
                mmHeight = 5027
                mmLeft = 4233
                mmTop = 1323
                mmWidth = 194734
                BandType = 3
                GroupNo = 0
              end
              object lblHCDesc: TppLabel
                UserName = 'lblHCDesc'
                Caption = 'Descontar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 178859
                mmTop = 2117
                mmWidth = 13494
                BandType = 3
                GroupNo = 0
              end
              object lblHCPagar: TppLabel
                UserName = 'lblHCPagar'
                Caption = 'Pagar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 145786
                mmTop = 2117
                mmWidth = 7673
                BandType = 3
                GroupNo = 0
              end
              object lblHCNome: TppLabel
                UserName = 'Label1001'
                Caption = 'Contribuição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 74877
                mmTop = 2117
                mmWidth = 17463
                BandType = 3
                GroupNo = 0
              end
              object lblHCCobr: TppLabel
                UserName = 'lblHCCobr'
                Caption = 'Pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 30427
                mmTop = 2117
                mmWidth = 16669
                BandType = 3
                GroupNo = 0
              end
              object lblHCRef: TppLabel
                UserName = 'lblHCRef'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 8202
                mmTop = 2117
                mmWidth = 14552
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand3: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object SubRelHstContrP: TppSubReport
        UserName = 'SubRelHstContrP'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelHstContrA
        TraverseAllData = False
        DataPipelineName = 'ppHstContribP'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 60325
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = ppHstContribP
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 320
          Top = 184
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppHstContribP'
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'Shape301'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 1588
              mmWidth = 194734
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Histórico de Contribuições'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3810
              mmLeft = 80963
              mmTop = 2646
              mmWidth = 40725
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
            BeforePrint = ppDetailBand8BeforePrint
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'MESREFERENCIA'
              DataPipeline = ppHstContribP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstContribP'
              mmHeight = 2879
              mmLeft = 4763
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'HCMesCobr1'
              DataField = 'MESCOBRANCA'
              DataPipeline = ppHstContribP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstContribP'
              mmHeight = 2879
              mmLeft = 27781
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'HCNome1'
              DataField = 'NOME'
              DataPipeline = ppHstContribP
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppHstContribP'
              mmHeight = 2879
              mmLeft = 51065
              mmTop = 794
              mmWidth = 79904
              BandType = 4
            end
            object ppHCVlrPagP: TppDBText
              OnPrint = ppHCVlrPagPPrint
              UserName = 'HCVlrPag1'
              DataField = 'VLRDEVOLVER'
              DataPipeline = ppHstContribP
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstContribP'
              mmHeight = 2879
              mmLeft = 132821
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppHCVlrDescP: TppDBText
              OnPrint = ppHCVlrDescPPrint
              UserName = 'HCVlrDesc1'
              DataField = 'VLRCOBRAR'
              DataPipeline = ppHstContribP
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppHstContribP'
              mmHeight = 2879
              mmLeft = 166423
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 4498
              mmWidth = 194734
              BandType = 4
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              ParentHeight = True
              mmHeight = 4498
              mmLeft = 26723
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape13: TppShape
              UserName = 'Shape13'
              ParentHeight = True
              mmHeight = 4498
              mmLeft = 4233
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape14: TppShape
              UserName = 'Shape14'
              ParentHeight = True
              mmHeight = 4498
              mmLeft = 49742
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape15: TppShape
              UserName = 'Shape15'
              ParentHeight = True
              mmHeight = 4498
              mmLeft = 132027
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape16: TppShape
              UserName = 'Shape16'
              ParentHeight = True
              mmHeight = 4498
              mmLeft = 165894
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape18: TppShape
              UserName = 'Shape18'
              ParentHeight = True
              mmHeight = 4498
              mmLeft = 198702
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 4233
              mmTop = 0
              mmWidth = 194734
              BandType = 4
            end
          end
          object ppHCPRodade: TppSummaryBand
            BeforePrint = ppHCPRodadeBeforePrint
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object lblAvisoContribP: TppLabel
              UserName = 'lblAvisoContribP'
              Caption = 
                '(*) Contribuições Patronais. Estas contribuições serão enviadas ' +
                'para o CAP/CAR. '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 3006
              mmLeft = 4498
              mmTop = 169
              mmWidth = 79925
              BandType = 7
            end
          end
          object ppGroup4: TppGroup
            BreakName = 'IDCONTRIBUICAO'
            DataPipeline = ppHstContribP
            OutlineSettings.CreateNode = True
            UserName = 'Group4'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppHstContribP'
            object ppGroupHeaderBand4: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 6000
              mmPrintPosition = 0
              object ppLabel6: TppLabel
                UserName = 'lblHCRef1'
                Caption = 'Referência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 8202
                mmTop = 1588
                mmWidth = 14552
                BandType = 3
                GroupNo = 0
              end
              object ppShape1: TppShape
                UserName = 'Shape1'
                mmHeight = 5027
                mmLeft = 4233
                mmTop = 1323
                mmWidth = 194734
                BandType = 3
                GroupNo = 0
              end
              object ppLabel7: TppLabel
                UserName = 'lblHCCobr1'
                Caption = 'Pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 30427
                mmTop = 2117
                mmWidth = 15346
                BandType = 3
                GroupNo = 0
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                Caption = 'Contribuição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 74877
                mmTop = 2117
                mmWidth = 19844
                BandType = 3
                GroupNo = 0
              end
              object ppLabel8: TppLabel
                UserName = 'lblHCPagar1'
                Caption = 'Pagar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 145786
                mmTop = 2117
                mmWidth = 7673
                BandType = 3
                GroupNo = 0
              end
              object ppLabel9: TppLabel
                UserName = 'lblHCDesc1'
                Caption = 'Descontar'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 178859
                mmTop = 2117
                mmWidth = 13494
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand4: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = 'Número do Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3440
        mmTop = 794
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMEROPROCESSO'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object SubRelTotal: TppSubReport
        OnPrint = SubRelTotalPrint
        UserName = 'SubRelTotal'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelHstContrP
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 66146
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 328
          Top = 192
          Version = '7.04'
          mmColumnWidth = 0
          object ppBndTotal: TppTitleBand
            AfterPrint = ppBndTotalAfterPrint
            BeforePrint = ppBndTotalBeforePrint
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object ppLabel119: TppLabel
              UserName = 'Label1'
              CharWrap = True
              ShiftWithParent = True
              AutoSize = False
              Caption = 'Valor Total de Acertos Lançados no Histórico de Benefícios: '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 1588
              mmWidth = 88106
              BandType = 1
            end
            object lbl_totalBenef: TppLabel
              UserName = 'lbl_totalBenef'
              ShiftWithParent = True
              AutoSize = False
              Caption = 'lbl_totalBenef'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 94192
              mmTop = 1588
              mmWidth = 21696
              BandType = 1
            end
            object lbl_totContrib: TppLabel
              UserName = 'lbl_totContrib'
              CharWrap = True
              ShiftWithParent = True
              AutoSize = False
              Caption = 'Valor Total de Acertos Lançados no Histório de Contribuições:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 3440
              mmTop = 5821
              mmWidth = 91017
              BandType = 1
            end
            object lbl_vlrtotContrib: TppLabel
              UserName = 'lbl_vlrtotContrib'
              ShiftWithParent = True
              AutoSize = False
              Caption = 'lbl_vlrtotContrib'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3440
              mmLeft = 94456
              mmTop = 5821
              mmWidth = 21696
              BandType = 1
            end
            object ppLinhaTot: TppLine
              UserName = 'LinhaTot'
              ShiftWithParent = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 1058
              mmTop = 10583
              mmWidth = 199232
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Perfil de Investimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3302
        mmLeft = 3440
        mmTop = 19050
        mmWidth = 33602
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'NOMEPERFIL'
        DataPipeline = ppDemonstra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDemonstra'
        mmHeight = 3302
        mmLeft = 37835
        mmTop = 19050
        mmWidth = 18119
        BandType = 4
      end
      object SubRelAcJud: TppSubReport
        UserName = 'SubRelAcJud'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SubRelLegenda
        TraverseAllData = False
        DataPipelineName = 'ppAcJudDeficit'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 84138
        mmWidth = 201000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReportAcJudDeficit: TppChildReport
          AutoStop = False
          DataPipeline = ppAcJudDeficit
          NoDataBehaviors = [ndBlankReport]
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Demonstrativo de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 4500
          PrinterSetup.mmMarginLeft = 4500
          PrinterSetup.mmMarginRight = 4500
          PrinterSetup.mmMarginTop = 4500
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Left = 324
          Top = 192
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppAcJudDeficit'
          object ppTitleBandAcJudDeficit: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppShapeTitleBandAcJudDeficit1: TppShape
              UserName = 'Shape302'
              mmHeight = 6085
              mmLeft = 4233
              mmTop = 1588
              mmWidth = 194734
              BandType = 1
            end
            object ppLabelTitleBandAcJudDeficit1: TppLabel
              UserName = 'LabelTitleBandAcJudDeficit1'
              Caption = 'Informações da Ação Judicial'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3810
              mmLeft = 81011
              mmTop = 2910
              mmWidth = 44873
              BandType = 1
            end
            object ppShapeTitleBandAcJudDeficit2: TppShape
              UserName = 'ShapeTitleBandAcJudDeficit2'
              mmHeight = 5027
              mmLeft = 4233
              mmTop = 8202
              mmWidth = 194734
              BandType = 1
            end
            object ppLabelAcJudANOMESFIMACJUDDEFICIT: TppLabel
              UserName = 'LabelAcJudANOMESFIMACJUDDEFICIT'
              AutoSize = False
              Caption = 'Ano/Mês Fim'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 175419
              mmTop = 9260
              mmWidth = 21960
              BandType = 1
            end
            object ppLabelAcJudANOMESINIACJUDDEFICIT: TppLabel
              UserName = 'Label101'
              AutoSize = False
              Caption = 'Ano/Mês Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 151077
              mmTop = 9260
              mmWidth = 21960
              BandType = 1
            end
            object ppLabelAcJudPERCACJUDDEFICIT: TppLabel
              UserName = 'LabelAcJudPERCACJUDDEFICIT'
              AutoSize = False
              Caption = 'Percentual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 133350
              mmTop = 9260
              mmWidth = 15875
              BandType = 1
            end
            object ppLabelAcJudNOME: TppLabel
              UserName = 'LabelAcJudNOME'
              Caption = 'Contribuição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 5292
              mmTop = 9260
              mmWidth = 17463
              BandType = 1
            end
            object ppLineTitleBandAcJudDeficit3: TppLine
              UserName = 'LineTitleBandAcJudDeficit3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 174096
              mmTop = 8202
              mmWidth = 265
              BandType = 1
            end
            object ppLineTitleBandAcJudDeficit2: TppLine
              UserName = 'LineTitleBandAcJudDeficit2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 150019
              mmTop = 8202
              mmWidth = 265
              BandType = 1
            end
            object ppLineTitleBandAcJudDeficit1: TppLine
              UserName = 'LineTitleBandAcJudDeficit1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 132292
              mmTop = 8202
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBandAcJudDeficit: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShapeDetailBandAcJudDeficit1: TppShape
              UserName = 'ShapeDetailBandAcJudDeficit1'
              mmHeight = 4498
              mmLeft = 4233
              mmTop = 0
              mmWidth = 194734
              BandType = 4
            end
            object ppLineDetailBandAcJudDeficit3: TppLine
              UserName = 'LineDetailBandAcJudDeficit3'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 174096
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLineDetailBandAcJudDeficit2: TppLine
              UserName = 'LineDetailBandAcJudDeficit2'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 150019
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLineDetailBandAcJudDeficit1: TppLine
              UserName = 'LineDetailBandAcJudDeficit1'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 132292
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBTextAcJudANOMESINIACJUDDEFICIT: TppDBText
              UserName = 'DBTextAcJudANOMESINIACJUDDEFICIT'
              DataField = 'ANOMESINIACJUDDEFICIT'
              DataPipeline = ppAcJudDeficit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 151077
              mmTop = 794
              mmWidth = 21960
              BandType = 4
            end
            object ppDBTextAcJudANOMESFIMACJUDDEFICIT: TppDBText
              UserName = 'DBText101'
              DataField = 'ANOMESFIMACJUDDEFICIT'
              DataPipeline = ppAcJudDeficit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 175419
              mmTop = 794
              mmWidth = 21960
              BandType = 4
            end
            object ppDBTextAcJudPERCACJUDDEFICIT: TppDBText
              UserName = 'HCPvlrPag1'
              DataField = 'PERCACJUDDEFICIT'
              DataPipeline = ppAcJudDeficit
              DisplayFormat = ',0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 133350
              mmTop = 794
              mmWidth = 15875
              BandType = 4
            end
            object ppDBTextAcJudNOME: TppDBText
              UserName = 'DBTextAcJudNOME'
              DataField = 'NOME'
              DataPipeline = ppAcJudDeficit
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppAcJudDeficit'
              mmHeight = 2910
              mmLeft = 5292
              mmTop = 794
              mmWidth = 123296
              BandType = 4
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 1058
        mmTop = 12171
        mmWidth = 199232
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2582
        mmLeft = 182298
        mmTop = 12435
        mmWidth = 13589
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'FUNCEF/DIBEN/GEBEN/CCOBE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 265
        mmTop = 15346
        mmWidth = 201084
        BandType = 8
      end
      object lbl_Rodape: TppLabel
        UserName = 'lbl_Rodape'
        Caption = 'DEMONSTRATIVO DE REABERTURA DE BENEFÍCIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2582
        mmLeft = 1058
        mmTop = 12700
        mmWidth = 52663
        BandType = 8
      end
      object lbl_usuario: TppLabel
        UserName = 'lbl_usuario'
        AutoSize = False
        Caption = 'lbl_usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3387
        mmLeft = 138113
        mmTop = 6085
        mmWidth = 54240
        BandType = 8
      end
      object lblNomUsuario: TppLine
        UserName = 'lblNomUsuario'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 138113
        mmTop = 5556
        mmWidth = 54240
        BandType = 8
      end
      object ppLabelLote: TppLabel
        UserName = 'LabelLote'
        Caption = 'LabelLote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 2646
        mmTop = 1058
        mmWidth = 11472
        BandType = 8
      end
      object ppLabelVersao: TppLabel
        UserName = 'LabelVersao'
        Caption = 'LabelVersao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 2646
        mmTop = 4233
        mmWidth = 14393
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMEROPROCESSO'
      DataPipeline = ppDemonstra
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstra'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = ppDemonstra
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstra'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand2AfterPrint
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
      end
    end
  end
  object sqlDemonstra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       REC.NUMEROPROCESSO,'
      '       REC.IDPESSOA,'
      '       REC.CPF,'
      '       REC.MATRICULA,'
      '       REC.TIPORECEBE,'
      '       REC.IDRECEBEDOR,               '
      '       REC.NOMERECEBEDOR,'
      '       REC.DATANASC,'
      '       REC.FONTEPAGADORA,'
      '       TIT.*'
      'FROM'
      '       (SELECT BF.NUMEROPROCESSO,'
      '               BF.IDPESSOA,'
      '               DP.IDTITULAR,'
      '               P.NUMDOCUMENTO AS CPF,'
      '               DP.MATRICULA,               '
      
        '               DECODE(DP.IDTITULAR, DP.IDPESSOA, '#39'APOSENTADO'#39', '#39 +
        'PENSIONISTA'#39') AS TIPORECEBE,'
      
        '               DECODE(BTIT.IDRESPONSAVEL, NULL, BF.IDPESSOA, IDR' +
        'ESPONSAVEL) AS IDRECEBEDOR,               '
      '               P.NOME AS NOMERECEBEDOR,'
      '               PF.DATANASC,'
      
        '               BF.IDPLANOPREV, BF.SEQPROPOSTA, BF.IDPESSJUR, BF.' +
        'FONTEPAGADORA, BTIT.IDPLANOORIGEM               '
      
        '        FROM   BENEFBFCIARIO BF, PESSOA P, DEPENTIT DP, PESSOAFI' +
        'SICA PF,'
      '               BFCIARIOTITPLAN BTIT'
      '        WHERE  BF.NUMEROPROCESSO in ( &NUMEROPROCESSO )'
      '        AND    BF.IDPESSOA       = :pIDPESSOA'
      '        AND    BF.IDTITULAR      = BTIT.IDTITULAR'
      '        AND    BF.IDPESSJUR      = BTIT.IDPESSJUR'
      '        AND    BF.IDPLANOPREV    = BTIT.IDPLANOPREV'
      '        AND    BF.IDPLANOORIGEM  = BTIT.IDPLANOORIGEM'
      '        AND    BF.IDPESSOA       = BTIT.IDPESSOA'
      '        AND    BF.IDBENEFICIO    = BTIT.IDBENEFICIO'
      '        AND    BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA'
      '        AND    DP.IDTITULAR      = BTIT.IDTITULAR'
      '        AND    DP.IDPESSOA       = BTIT.IDPESSOA'
      
        '        AND    PF.IDPESSOA       = DECODE(BTIT.IDRESPONSAVEL, NU' +
        'LL, BF.IDPESSOA, BTIT.IDRESPONSAVEL)'
      
        '        AND    P.IDPESSOA        = DECODE(BTIT.IDRESPONSAVEL, NU' +
        'LL, BF.IDPESSOA, BTIT.IDRESPONSAVEL)'
      '       ) REC,'
      '       (SELECT P.IDPESSOA AS IDTITULAR,'
      '               PL.NOME AS NOMEPLANO,'
      '               SPLANO.DESCRICAO AS NOMESITPLANO,'
      
        '               DECODE(PF.FLGISENTOIRRF, 1, '#39'SIM'#39', '#39'NÃO'#39') AS IRRF' +
        'ISENTO,'
      '               PP.IDPLANOPREV, PP.SEQPROPOSTA, PP.IDPESSJUR,'
      '               E.MATRICULA AS MATRICULATIT,'
      
        '               (SELECT NOME FROM PERFILINVEST P WHERE IDPERFILIN' +
        'VEST = :pIDPERFIL) AS NOMEPERFIL'
      
        '        FROM   PESSOA P, PLANPREV PL, PESSOAFISICA PF, SITPLANOP' +
        'REV SPLANO, PARTPREVPLAN PP, ELEGPATRO E'
      '        WHERE  PP.IDPESSOA    = P.IDPESSOA'
      '        AND    E.IDPESSOA     = PP.IDPESSOA'
      '        AND    PF.IDPESSOA    = PP.IDPESSOA'
      '        AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      '        AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      '        AND    EXISTS (SELECT 1'
      '                         FROM BENEFBFCIARIO B'
      '                        WHERE E.IDPESSJUR = B.IDPESSJUR'
      '                          AND E.IDPESSOA  = B.IDTITULAR'
      
        '                          AND B.NUMEROPROCESSO in ( &NUMEROPROCE' +
        'SSO ) )'
      '       ) TIT'
      'WHERE TIT.IDTITULAR   = REC.IDTITULAR'
      '  and TIT.SEQPROPOSTA = REC.SEQPROPOSTA'
      '  and TIT.IDPESSJUR   = REC.IDPESSJUR'
      ' -- and TIT.IDPLANOPREV = REC.IDPLANOPREV'
      
        ' and  TIT.IDPLANOPREV = DECODE(REC.IDPLANOPREV,REC.IDPLANOORIGEM' +
        ',REC.IDPLANOPREV,REC.IDPLANOORIGEM)'
      'ORDER BY REC.NUMEROPROCESSO'
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 96
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPERFIL'
        ParamType = ptUnknown
      end>
    object sqlDemonstraNUMEROPROCESSO: TFloatField
      FieldName = 'NUMEROPROCESSO'
    end
    object sqlDemonstraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object sqlDemonstraCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 18
    end
    object sqlDemonstraMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object sqlDemonstraTIPORECEBE: TStringField
      FieldName = 'TIPORECEBE'
      Size = 11
    end
    object sqlDemonstraIDRECEBEDOR: TFloatField
      FieldName = 'IDRECEBEDOR'
    end
    object sqlDemonstraNOMERECEBEDOR: TStringField
      FieldName = 'NOMERECEBEDOR'
      Size = 60
    end
    object sqlDemonstraDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object sqlDemonstraIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object sqlDemonstraNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object sqlDemonstraNOMESITPLANO: TStringField
      FieldName = 'NOMESITPLANO'
      Size = 50
    end
    object sqlDemonstraIRRFISENTO: TStringField
      FieldName = 'IRRFISENTO'
      Size = 3
    end
    object sqlDemonstraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object sqlDemonstraSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object sqlDemonstraIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object sqlDemonstraFONTEPAGADORA: TFloatField
      FieldName = 'FONTEPAGADORA'
    end
    object sqlDemonstraMATRICULATIT: TStringField
      FieldName = 'MATRICULATIT'
      Size = 13
    end
    object sqlDemonstraNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 60
    end
  end
  object dsDemonstra: TwwDataSource
    AutoEdit = False
    DataSet = sqlDemonstra
    Left = 96
    Top = 168
  end
  object ppDemonstra: TppBDEPipeline
    DataSource = dsDemonstra
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppDemonstra'
    Left = 96
    Top = 136
    object ppDemonstrappField1: TppField
      FieldAlias = 'NUMEROPROCESSO'
      FieldName = 'NUMEROPROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField3: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField4: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField5: TppField
      FieldAlias = 'TIPORECEBE'
      FieldName = 'TIPORECEBE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField6: TppField
      FieldAlias = 'IDRECEBEDOR'
      FieldName = 'IDRECEBEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField7: TppField
      FieldAlias = 'NOMERECEBEDOR'
      FieldName = 'NOMERECEBEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField8: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField9: TppField
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField10: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField11: TppField
      FieldAlias = 'NOMESITPLANO'
      FieldName = 'NOMESITPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField12: TppField
      FieldAlias = 'IRRFISENTO'
      FieldName = 'IRRFISENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField13: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField14: TppField
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField15: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField16: TppField
      FieldAlias = 'FONTEPAGADORA'
      FieldName = 'FONTEPAGADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField17: TppField
      FieldAlias = 'MATRICULATIT'
      FieldName = 'MATRICULATIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDemonstrappField18: TppField
      FieldAlias = 'NOMEPERFIL'
      FieldName = 'NOMEPERFIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object qryBenefFuncef: TwwQuery
    AfterScroll = qryBenefFuncefAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT bf.IDBENEFICIO,'
      '       bf.idpessoa,'
      '       bf.idpessjur,'
      '       B.NOME,'
      '       BF.VALORATUAL,'
      '       BF.VALORTOTAL,'
      '       BF.VLRBSATUAL,'
      '       BF.VLRBSTOTAL,'
      '       BF.VLRFABATUAL,'
      '       BF.VLRFABTOTAL,'
      '       BF.VLRBASEDEFICIT,'
      '       BF.DataInicioFUND AS DIB,'
      '       BF.DataInicio AS DIP,'
      '       BF.DIBBENEFANT AS DIBANT,'
      '       BF.DATAFINAL AS DATAFINAL,'
      '       TO_DATE(:DATANOVA,'#39'DD/MM/YYYY'#39') AS DATANOVA,'
      '       NVL(BPP.FLGAPRESENTABSFAB, 0) AS FLGAPRESENTABSFAB,'
      '       NVL(BPP.FLGAPRESENTADEFICIT, 0) AS FLGAPRESENTADEFICIT,'
      '       BF.VALORNADIB'
      '  FROM BENEFBFCIARIO   BF,'
      '       BENEFICIO       B,'
      '       BENEFPLANPREV   BPP'
      ' WHERE BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      '   AND BF.IDPESSOA       = :IDPESSOA'
      '   AND BPP.IDBENEFICIO  = BF.IDBENEFICIO'
      '   AND BPP.IDPLANOPREV  = BF.IDPLANOPREV'
      '   AND B.IDBENEFICIO    = BF.IDBENEFICIO'
      '   and bf.fontepagadora = 1'
      ' ORDER BY BF.IDPESSOA, B.NOME'
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 24
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'DATANOVA'
        ParamType = ptUnknown
        Value = #39'12/12/2015'#39
      end
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryBenefFuncefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryBenefFuncefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBenefFuncefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryBenefFuncefNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBenefFuncefVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
    end
    object qryBenefFuncefVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object qryBenefFuncefVLRBSATUAL: TFloatField
      FieldName = 'VLRBSATUAL'
    end
    object qryBenefFuncefVLRBSTOTAL: TFloatField
      FieldName = 'VLRBSTOTAL'
    end
    object qryBenefFuncefVLRFABATUAL: TFloatField
      FieldName = 'VLRFABATUAL'
    end
    object qryBenefFuncefVLRFABTOTAL: TFloatField
      FieldName = 'VLRFABTOTAL'
    end
    object qryBenefFuncefVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
    end
    object qryBenefFuncefDIB: TDateTimeField
      FieldName = 'DIB'
    end
    object qryBenefFuncefDIP: TDateTimeField
      FieldName = 'DIP'
    end
    object qryBenefFuncefDIBANT: TDateTimeField
      FieldName = 'DIBANT'
    end
    object qryBenefFuncefDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryBenefFuncefFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
    end
    object qryBenefFuncefFLGAPRESENTADEFICIT: TFloatField
      FieldName = 'FLGAPRESENTADEFICIT'
    end
    object qryBenefFuncefVALORNADIB: TFloatField
      FieldName = 'VALORNADIB'
    end
    object qryBenefFuncefDATANOVA: TDateTimeField
      FieldName = 'DATANOVA'
    end
  end
  object dsBenefFuncef: TwwDataSource
    AutoEdit = False
    DataSet = qryBenefFuncef
    Left = 24
    Top = 168
  end
  object qryBenefInss: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT bf.IDBENEFICIO,'
      '       bf.idpessoa,'
      '       bf.idpessjur,'
      '       B.NOME,'
      '       BF.VALORATUAL,'
      '       BF.VALORTOTAL,'
      '       BF.VLRBSATUAL,'
      '       BF.VLRBSTOTAL,'
      '       BF.VLRFABATUAL,'
      '       BF.VLRFABTOTAL,'
      '       BF.VLRBASEDEFICIT,'
      '       BF.DataRequerimento AS DER,'
      '       BF.DataInicioFUND AS DIB,'
      '       BF.DataInicio AS DIP,'
      '       BF.DIBBENEFANT AS DIBANT,'
      '       BF.DATAFINAL AS DATAFINAL,'
      '       TO_DATE(:DATANOVA,'#39'DD/MM/YYYY'#39') AS DATANOVA,'
      '       BF.NUMPROCINSS,'
      
        '       TO_CHAR(NVL(BF.TEMPOSERVICOANOS, NVL(EL.TEMPOSERVTOTAL,0)' +
        ')) || '#39' anos '#39' ||'
      
        '       TO_CHAR(NVL(BF.TEMPOSERVICOMES, NVL(EL.TEMPOSERVTOTMES,0)' +
        ')) || '#39' meses '#39' ||'
      
        '       TO_CHAR(NVL(BF.TEMPOSERVICODIAS, NVL(EL.TEMPOSERVTOTDIA,0' +
        '))) || '#39' dias'#39' AS TEMPOSERVICO,'
      '       BF.VALORNADIB'
      '  FROM BENEFBFCIARIO   BF,'
      '       BENEFICIO       B,'
      '       ELEGPATRO       EL'
      ' WHERE BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      '   AND BF.IDPESSOA       = :IDPESSOA'
      '   AND EL.IDPESSOA       = BF.IDTITULAR'
      '   AND EL.IDPESSJUR      = BF.IDPESSJUR'
      '   AND B.IDBENEFICIO     = BF.IDBENEFICIO'
      '   and bf.fontepagadora  = 2'
      ' ORDER BY BF.IDPESSOA, B.NOME'
      ''
      ' '
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 60
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'DATANOVA'
        ParamType = ptUnknown
        Value = #39'12/12/2015'#39
      end
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qryBenefInssIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryBenefInssIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBenefInssIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryBenefInssNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryBenefInssVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
    end
    object qryBenefInssVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
    end
    object qryBenefInssVLRBSATUAL: TFloatField
      FieldName = 'VLRBSATUAL'
    end
    object qryBenefInssVLRBSTOTAL: TFloatField
      FieldName = 'VLRBSTOTAL'
    end
    object qryBenefInssVLRFABATUAL: TFloatField
      FieldName = 'VLRFABATUAL'
    end
    object qryBenefInssVLRFABTOTAL: TFloatField
      FieldName = 'VLRFABTOTAL'
    end
    object qryBenefInssVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
    end
    object qryBenefInssDER: TDateTimeField
      FieldName = 'DER'
    end
    object qryBenefInssDIB: TDateTimeField
      FieldName = 'DIB'
    end
    object qryBenefInssDIP: TDateTimeField
      FieldName = 'DIP'
    end
    object qryBenefInssDIBANT: TDateTimeField
      FieldName = 'DIBANT'
    end
    object qryBenefInssDATAFINAL: TDateTimeField
      FieldName = 'DATAFINAL'
    end
    object qryBenefInssNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Size = 15
    end
    object qryBenefInssTEMPOSERVICO: TStringField
      FieldName = 'TEMPOSERVICO'
      Size = 138
    end
    object qryBenefInssVALORNADIB: TFloatField
      FieldName = 'VALORNADIB'
    end
    object qryBenefInssDATANOVA: TDateTimeField
      FieldName = 'DATANOVA'
    end
  end
  object dsBenefInss: TwwDataSource
    AutoEdit = False
    DataSet = qryBenefInss
    Left = 60
    Top = 168
  end
  object ppBenefnss: TppBDEPipeline
    DataSource = dsBenefInss
    UserName = 'ppBenefnss'
    Left = 60
    Top = 136
    object ppBenefnssppField1: TppField
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField3: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField5: TppField
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField6: TppField
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField7: TppField
      FieldAlias = 'VLRBSATUAL'
      FieldName = 'VLRBSATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField8: TppField
      FieldAlias = 'VLRBSTOTAL'
      FieldName = 'VLRBSTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField9: TppField
      FieldAlias = 'VLRFABATUAL'
      FieldName = 'VLRFABATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField10: TppField
      FieldAlias = 'VLRFABTOTAL'
      FieldName = 'VLRFABTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField11: TppField
      FieldAlias = 'VLRBASEDEFICIT'
      FieldName = 'VLRBASEDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField12: TppField
      FieldAlias = 'DER'
      FieldName = 'DER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField13: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField14: TppField
      FieldAlias = 'DIP'
      FieldName = 'DIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField15: TppField
      FieldAlias = 'DIBANT'
      FieldName = 'DIBANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField16: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField17: TppField
      FieldAlias = 'DATANOVA'
      FieldName = 'DATANOVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField18: TppField
      FieldAlias = 'NUMPROCINSS'
      FieldName = 'NUMPROCINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField19: TppField
      FieldAlias = 'TEMPOSERVICO'
      FieldName = 'TEMPOSERVICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBenefnssppField20: TppField
      FieldAlias = 'VALORNADIB'
      FieldName = 'VALORNADIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
  end
  object ppBenefFuncef: TppBDEPipeline
    DataSource = dsBenefFuncef
    UserName = 'ppBenefFuncef'
    Left = 24
    Top = 136
    object ppBenefFuncefppField1: TppField
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField3: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField5: TppField
      FieldAlias = 'VALORATUAL'
      FieldName = 'VALORATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField6: TppField
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField7: TppField
      FieldAlias = 'VLRBSATUAL'
      FieldName = 'VLRBSATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField8: TppField
      FieldAlias = 'VLRBSTOTAL'
      FieldName = 'VLRBSTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField9: TppField
      FieldAlias = 'VLRFABATUAL'
      FieldName = 'VLRFABATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField10: TppField
      FieldAlias = 'VLRFABTOTAL'
      FieldName = 'VLRFABTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField11: TppField
      FieldAlias = 'VLRBASEDEFICIT'
      FieldName = 'VLRBASEDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField12: TppField
      FieldAlias = 'DIB'
      FieldName = 'DIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField13: TppField
      FieldAlias = 'DIP'
      FieldName = 'DIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField14: TppField
      FieldAlias = 'DIBANT'
      FieldName = 'DIBANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField15: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField16: TppField
      FieldAlias = 'DATANOVA'
      FieldName = 'DATANOVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField17: TppField
      FieldAlias = 'FLGAPRESENTABSFAB'
      FieldName = 'FLGAPRESENTABSFAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField18: TppField
      FieldAlias = 'FLGAPRESENTADEFICIT'
      FieldName = 'FLGAPRESENTADEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBenefFuncefppField19: TppField
      FieldAlias = 'VALORNADIB'
      FieldName = 'VALORNADIB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object qryLegenda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT distinct(SELECT BF.IDPLANPREVCONTAB'
      '         FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC'
      '         WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB'
      '         and    BF.IDPLANOPREV      = H.IDPLANOPREV'
      '         AND    BF.IDPESSOA         = H.IDPESSOA'
      '         AND BF.IDBENEFICIO         = H.IDBENEFICIO'
      '         AND BF.NUMEROPROCESSO      = H.NUMEROPROCESSO'
      '         AND BF.IDPESSJUR           = H.IDPESSJUR'
      '         AND BF.IDTITULAR           = H.IDTITULAR'
      '         AND BF.IDPLANOORIGEM       = H.IDPLANOORIGEM'
      '         AND BF.SEQPROPOSTA         = H.SEQPROPOSTA'
      '         AND rownum <= 1 ) as  Codigo,'
      '        (SELECT PPC.NOME'
      '         FROM   BENEFBFCIARIO BF, PLANPREVCONTABIL PPC'
      '         WHERE  PPC.IDPLANOPREV  = BF.IDPLANPREVCONTAB'
      '         and    BF.IDPLANOPREV      =  H.IDPLANOPREV'
      '         AND    BF.IDPESSOA         =  H.IDPESSOA'
      '         AND BF.IDBENEFICIO         = H.IDBENEFICIO'
      '         AND BF.NUMEROPROCESSO      = H.NUMEROPROCESSO'
      '         AND BF.IDPESSJUR           = H.IDPESSJUR'
      '         AND BF.IDTITULAR           = H.IDTITULAR'
      '         AND BF.IDPLANOORIGEM       = H.IDPLANOORIGEM'
      '         AND BF.SEQPROPOSTA         = H.SEQPROPOSTA'
      '         and rownum <= 1) as  Plano'
      ' FROM   BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BPP '
      ' WHERE  H.IDLOTE           = :IDLOTE'
      ' AND    H.IDPESSJUR        = :IDPESSJUR'
      ' AND    H.IDPESSOA         = :IDPESSOA'
      ' AND    H.SEQPROPOSTA      = 1'
      ' AND    BPP.IDBENEFICIO = H.IDBENEFICIO'
      ' AND    BPP.IDPLANOPREV = H.IDPLANOPREV'
      ' AND    H.FLGDEVOLUCAO     = 0 '
      ' AND    H.FLGENVIADO       = 0'
      ' AND    B.IDBENEFICIO      = H.IDBENEFICIO'
      ' ORDER BY 1, 2')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 132
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryLegendaCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object qryLegendaPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
  end
  object dsLegenda: TwwDataSource
    AutoEdit = False
    DataSet = qryLegenda
    Left = 132
    Top = 168
  end
  object ppLegenda: TppBDEPipeline
    DataSource = dsLegenda
    UserName = 'ppLegenda'
    Left = 132
    Top = 136
    object ppLegendappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppLegendappField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
  end
  object dsHstBenef: TwwDataSource
    AutoEdit = False
    DataSet = qryHstBenef
    Left = 168
    Top = 168
  end
  object qryHstBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.NOME,'
      '       H.MESREFERENCIA,'
      '       H.DATAPAGAMENTO,'
      '       H.VALORFAB,'
      '       H.VALORBS,'
      '       H.VLRBASEDEFICIT,'
      
        '       DECODE(H.FLGDEVOLUCAO, 1, (H.VALORPREV * -1), H.VALORPREV' +
        ') VALORPREV,'
      '       BP.FLGAPRESENTABSFAB,'
      '       BP.FLGAPRESENTADEFICIT'
      '  FROM BENEFICIO B, HSTBENEFBFCIARIO H, BENEFPLANPREV BP'
      ' WHERE B.IDBENEFICIO       = H.IDBENEFICIO'
      '   AND BP.IDBENEFICIO      = H.IDBENEFICIO'
      '   AND BP.IDPLANOPREV      = H.IDPLANOPREV'
      '   AND H.SEQPROPOSTA       = 1'
      '   AND NVL(H.FLGENVIADO,0) IN (0, 8, 9)'
      '   AND H.FLGCONCESSAO      = 1'
      '   AND H.IDPESSOA         = :idpessoa'
      '   AND H.NUMEROPROCESSO   = :NUMEROPROCESSO'
      '   AND H.IDLOTE           = :IDLOTE'
      ' ORDER BY B.NOME, H.MESREFERENCIA'
      ' '
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 168
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '250732'
      end
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = '887139'
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
    object qryHstBenefNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHstBenefMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryHstBenefDATAPAGAMENTO: TDateTimeField
      FieldName = 'DATAPAGAMENTO'
    end
    object qryHstBenefVALORFAB: TFloatField
      FieldName = 'VALORFAB'
    end
    object qryHstBenefVALORBS: TFloatField
      FieldName = 'VALORBS'
    end
    object qryHstBenefVLRBASEDEFICIT: TFloatField
      FieldName = 'VLRBASEDEFICIT'
    end
    object qryHstBenefVALORPREV: TFloatField
      FieldName = 'VALORPREV'
    end
    object qryHstBenefFLGAPRESENTABSFAB: TFloatField
      FieldName = 'FLGAPRESENTABSFAB'
    end
    object qryHstBenefFLGAPRESENTADEFICIT: TFloatField
      FieldName = 'FLGAPRESENTADEFICIT'
    end
  end
  object qryHstContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT C.IDCONTRIBUICAO, C.NOME, CP.FLGPAGADOR, HST.MESREFERENCI' +
        'A, HST.MESCOBRANCA,'
      
        '       DECODE(HST.FLGDEVOLUCAO, 1, HST.VALORESPERADO, 0) AS VLRD' +
        'EVOLVER,'
      
        '       DECODE(HST.FLGDEVOLUCAO, 0, HST.VALORESPERADO, 0) AS VLRC' +
        'OBRAR'
      '  FROM CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST'
      ' WHERE HST.IDPESSJUR       = :IDPESSJUR'
      '   AND HST.IDPLANOPREV     = :IDPLANOPREV'
      '   AND HST.SEQPROPOSTA     = :SEQPROPOSTA'
      '   AND HST.IDLOTE          = :IDLOTE'
      '   AND HST.IDPESSOA        = :IDPESSOA'
      '   AND hst.trgdtinclusao   >= :DTINICIOPROCESSO'
      '   AND HST.FLGDESCFOLHA    = 1'
      '   AND HST.FLGCONCESSAO    = 1'
      '   AND C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO'
      '   AND CP.IDPLANOPREV      = HST.IDPLANOPREV'
      '   AND CP.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO'
      ' ORDER BY C.IDCONTRIBUICAO, HST.MESREFERENCIA   -- sig32303'
      '  '
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 204
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DTINICIOPROCESSO'
        ParamType = ptUnknown
      end>
    object qryHstContribIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryHstContribNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHstContribFLGPAGADOR: TStringField
      FieldName = 'FLGPAGADOR'
      FixedChar = True
      Size = 1
    end
    object qryHstContribMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryHstContribMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryHstContribVLRDEVOLVER: TFloatField
      FieldName = 'VLRDEVOLVER'
    end
    object qryHstContribVLRCOBRAR: TFloatField
      FieldName = 'VLRCOBRAR'
    end
  end
  object dsHstContrib: TwwDataSource
    AutoEdit = False
    DataSet = qryHstContrib
    Left = 204
    Top = 168
  end
  object ppHstBenef: TppBDEPipeline
    DataSource = dsHstBenef
    UserName = 'ppHstBenef'
    Left = 168
    Top = 136
    object ppHstBenefppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppHstBenefppField2: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppHstBenefppField3: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppHstBenefppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORFAB'
      FieldName = 'VALORFAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppHstBenefppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORBS'
      FieldName = 'VALORBS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppHstBenefppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBASEDEFICIT'
      FieldName = 'VLRBASEDEFICIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppHstBenefppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPREV'
      FieldName = 'VALORPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppHstBenefppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAPRESENTABSFAB'
      FieldName = 'FLGAPRESENTABSFAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppHstBenefppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGAPRESENTADEFICIT'
      FieldName = 'FLGAPRESENTADEFICIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object ppHstContrib: TppBDEPipeline
    DataSource = dsHstContrib
    UserName = 'HstContrib'
    Left = 204
    Top = 136
    object ppHstContribppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppHstContribppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppHstContribppField3: TppField
      FieldAlias = 'FLGPAGADOR'
      FieldName = 'FLGPAGADOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppHstContribppField4: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppHstContribppField5: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
    object ppHstContribppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDEVOLVER'
      FieldName = 'VLRDEVOLVER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppHstContribppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOBRAR'
      FieldName = 'VLRCOBRAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object qryHstContribP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        ' SELECT C.IDCONTRIBUICAO, C.NOME, CP.FLGPAGADOR, HST.MESREFERENC' +
        'IA, HST.MESCOBRANCA,'
      
        '        DECODE(HST.FLGDEVOLUCAO, 1, HST.VALORESPERADO, 0) AS VLR' +
        'DEVOLVER,'
      
        '        DECODE(HST.FLGDEVOLUCAO, 0, HST.VALORESPERADO, 0) AS VLR' +
        'COBRAR'
      ' FROM   CONTRIBUICAO C, CONTPREV CP, HSTCONTRIBPREV HST'
      ' WHERE  HST.IDPESSJUR       = :IDPESSJUR'
      ' AND    HST.IDPLANOPREV     = :IDPLANOPREV'
      ' AND    HST.SEQPROPOSTA     = :SEQPROPOSTA'
      ' AND    HST.IDLOTE          = :IDLOTE'
      ' AND    HST.IDPESSOA        = :IDPESSOA'
      ' AND    hst.trgdtinclusao   >= :DTINICIOPROCESSO '
      ' AND    HST.FLGDESCFOLHA    = 1'
      ' AND    HST.FLGCONCESSAO    = 1'
      ' AND    HST.SITRECEBIMENTO   <= 1'
      ' AND    CP.IDPLANOPREV      = HST.IDPLANOPREV'
      ' AND    CP.IDCONTRIBUICAO   = HST.IDCONTRIBUICAO'
      ' AND    C.IDCONTRIBUICAO    = HST.IDCONTRIBUICAO'
      ' ORDER BY C.IDCONTRIBUICAO, HST.MESREFERENCIA    -- sig32303'
      ''
      ''
      ' ')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 240
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftDateTime
        Name = 'DTINICIOPROCESSO'
        ParamType = ptUnknown
      end>
    object qryHstContribPIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryHstContribPNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryHstContribPFLGPAGADOR: TStringField
      FieldName = 'FLGPAGADOR'
      FixedChar = True
      Size = 1
    end
    object qryHstContribPMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryHstContribPMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryHstContribPVLRDEVOLVER: TFloatField
      FieldName = 'VLRDEVOLVER'
    end
    object qryHstContribPVLRCOBRAR: TFloatField
      FieldName = 'VLRCOBRAR'
    end
  end
  object dsHstContribP: TwwDataSource
    AutoEdit = False
    DataSet = qryHstContribP
    Left = 240
    Top = 168
  end
  object ppHstContribP: TppBDEPipeline
    DataSource = dsHstContribP
    UserName = 'ppHstContribP'
    Left = 240
    Top = 136
    object ppHstContribPppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppHstContribPppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppHstContribPppField3: TppField
      FieldAlias = 'FLGPAGADOR'
      FieldName = 'FLGPAGADOR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppHstContribPppField4: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppHstContribPppField5: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
    object ppHstContribPppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDEVOLVER'
      FieldName = 'VLRDEVOLVER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppHstContribPppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOBRAR'
      FieldName = 'VLRCOBRAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object ppAcJudDeficit: TppBDEPipeline
    DataSource = dsAcJudDeficit
    UserName = 'ppAcJudDeficit'
    Left = 276
    Top = 136
    object ppAcJudDeficitppField1: TppField
      FieldAlias = 'IDCONTRIBUICAO'
      FieldName = 'IDCONTRIBUICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField3: TppField
      FieldAlias = 'PERCACJUDDEFICIT'
      FieldName = 'PERCACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField4: TppField
      FieldAlias = 'ANOMESINIACJUDDEFICIT'
      FieldName = 'ANOMESINIACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAcJudDeficitppField5: TppField
      FieldAlias = 'ANOMESFIMACJUDDEFICIT'
      FieldName = 'ANOMESFIMACJUDDEFICIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsAcJudDeficit: TwwDataSource
    AutoEdit = False
    DataSet = qryAcJudDeficit
    Left = 276
    Top = 168
  end
  object qryAcJudDeficit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME'
      '      ,AC.PERCACJUDDEFICIT '
      '      ,AC.ANOMESINIACJUDDEFICIT'
      '      ,AC.ANOMESFIMACJUDDEFICIT'
      '  FROM CONTRIBUICAO CO'
      '      ,CONTRIBNUCLEOACJUDDEFICIT AC'
      ' WHERE AC.IDCONTRIBUICAO = CO.IDCONTRIBUICAO'
      'UNION'
      'SELECT DISTINCT CO.IDCONTRIBUICAO, CO.NOME'
      '      ,AC.PERCACJUDDEFICIT '
      '      ,AC.ANOMESINIACJUDDEFICIT'
      '      ,AC.ANOMESFIMACJUDDEFICIT'
      '  FROM CONTRIBUICAO CO'
      '      ,CONTRIBPARTPACJUDDEFICIT AC'
      ' WHERE AC.IDCONTRIBUICAO = CO.IDCONTRIBUICAO'
      ' ORDER BY 1, 4')
    ValidateWithMask = True
    Left = 276
    Top = 200
    object qryAcJudDeficitIDCONTRIBUICAO: TFloatField
      FieldName = 'IDCONTRIBUICAO'
    end
    object qryAcJudDeficitNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAcJudDeficitPERCACJUDDEFICIT: TFloatField
      FieldName = 'PERCACJUDDEFICIT'
    end
    object qryAcJudDeficitANOMESINIACJUDDEFICIT: TStringField
      FieldName = 'ANOMESINIACJUDDEFICIT'
      Size = 7
    end
    object qryAcJudDeficitANOMESFIMACJUDDEFICIT: TStringField
      FieldName = 'ANOMESFIMACJUDDEFICIT'
      Size = 7
    end
  end
  object qryAuxLote: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 53
    Top = 66
  end
end
