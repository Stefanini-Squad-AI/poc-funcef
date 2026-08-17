inherited frmAplicResgate: TfrmAplicResgate
  Left = 475
  Top = 218
  Width = 404
  Height = 270
  Caption = 'frmAplicResgate'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de aplicação e resgate'
    Params = <
      item
        Caption = 'Período Inicial'
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
        Caption = 'Período Final'
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
        Caption = 'Banco'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   RAZAOSOCIAL, P.IDPESSOA '
          'FROM '
          '   BANCO B, PESSOA P  '
          'WHERE '
          '   P.IDPESSOA = B.IDPESSOA '
          'ORDER BY '
          '   RAZAOSOCIAL')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'RAZAOSOCIAL'
        LookupSettings.Descricao = 'Banco'
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
        Caption = 'Agencia'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NUMAGENCIA, NOME, AB.IDPESSOA '
          'FROM AGENCIABANCARIA AB, PESSOA P'
          'WHERE AB.IDPESSOA = P.IDPESSOA'
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Agencia'
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
        Caption = 'Portador conta'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '  CODPORTADOR, DESCRICAO '
          'FROM '
          '  PORTADORCONTA'
          'ORDER BY'
          '  DESCRICAO ')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Portador conta'
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
        Caption = 'Histórico'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT histPadFinan,  descricao FROM HISTORICOFINAN')
        LookupSettings.Chave = 'histPadFinan'
        LookupSettings.Display = 'descricao'
        LookupSettings.Descricao = 'Descrição'
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
        Caption = 'Relatório Expandido?'
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
    Formheight = 300
    FormWidth = 320
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppReport1
    LabelSistema = lblSistema
  end
  object cdsPrincipal: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 104
    Data = {
      EE0900009619E0BD01000000180000000A000B0000000300000064010B434F44
      504F525441444F5208000400000000000C44455343504F525441444F52010049
      00000001000557494454480200020032000E56414C4F524C414E4346494E414E
      08000400000000000D444154414C414E4346494E414E08000800000000000948
      4953544F5249434F0100490000000100055749445448020002003C000B4E4F43
      4F4E5441434F525201004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000F000542414E434F010049000000
      01000557494454480200020049000A4E554D4147454E43494101004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000F0005504C414E4F010049000000010005574944544802000200320005
      504154524F0100490000000100055749445448020002003C000100044C434944
      04000100160800000000000000000000000010403042414E434F204D45524944
      494F4E414C20424F52474553204445204D45444549524F532030322E30303137
      3938372E3400000000005082400000282A8BC9CC423C5472616E73662E204241
      4E434F204D45524944494F4E414C20424F5247455320706172612053414E5441
      4E44455220436F6E746120496E76657374690C30322E303031373938372E3416
      303038202D2042414E434F204D45524944494F4E414C03303133104F50455241
      C7D5455320434F4D554E531046554E444143414F204252545052455600000000
      00000000000010403042414E434F204D45524944494F4E414C20424F52474553
      204445204D45444549524F532030322E303031373938372E3400000000008893
      400000282A8BC9CC423C5472616E73662E2042414E434F204D45524944494F4E
      414C20424F5247455320706172612053414E54414E44455220436F6E74612049
      6E76657374690C30322E303031373938372E3416303038202D2042414E434F20
      4D45524944494F4E414C03303133104F50455241C7D5455320434F4D554E5310
      46554E444143414F20425254505245560000000000000000000014401D53414E
      54414E44455220436F6E746120496E76657374696D656E746F73000000000050
      82400000282A8BC9CC423C5472616E73662E2042414E434F204D45524944494F
      4E414C20424F5247455320706172612053414E54414E44455220436F6E746120
      496E766573746909393230323532312E3820333533202D2042414E434F205341
      4E54414E4445522042524153494C20532F4103353037104F50455241C7D54553
      20434F4D554E531046554E444143414F20425254505245560000000000000000
      000014401D53414E54414E44455220436F6E746120496E76657374696D656E74
      6F7300000000008893400000282A8BC9CC423C5472616E73662E2042414E434F
      204D45524944494F4E414C20424F5247455320706172612053414E54414E4445
      5220436F6E746120496E766573746909393230323532312E3820333533202D20
      42414E434F2053414E54414E4445522042524153494C20532F4103353037104F
      50455241C7D5455320434F4D554E531046554E444143414F2042525450524556
      0000000000000000000010403042414E434F204D45524944494F4E414C20424F
      52474553204445204D45444549524F532030322E303031373938372E34000000
      0000209C400000B2E392C9CC423C5472616E73662E2042414E434F204D455249
      44494F4E414C20424F5247455320706172612053414E54414E44455220436F6E
      746120496E76657374690C30322E303031373938372E3416303038202D204241
      4E434F204D45524944494F4E414C03303133104F50455241C7D5455320434F4D
      554E531046554E444143414F2042525450524556000000000000000000001440
      1D53414E54414E44455220436F6E746120496E76657374696D656E746F730000
      000000209C400000B2E392C9CC423C5472616E73662E2042414E434F204D4552
      4944494F4E414C20424F5247455320706172612053414E54414E44455220436F
      6E746120496E766573746909393230323532312E3820333533202D2042414E43
      4F2053414E54414E4445522042524153494C20532F4103353037104F50455241
      C7D5455320434F4D554E531046554E444143414F204252545052455600000000
      00000000000008402542414E524953554C20532F41202D205041422D46435254
      2030362E3037393637382E302E31000000000017F1400000DAC9B1C9CC423C54
      72616E73662E2042414E524953554C20532F41202D205041422D464352542070
      6172612053414E54414E44455220436F6E746120496E76657374690A30363037
      39363738303112303431202D2042414E524953554C20532F410430313030104F
      50455241C7D5455320434F4D554E531046554E444143414F2042525450524556
      0000000000000000000014401D53414E54414E44455220436F6E746120496E76
      657374696D656E746F73000000000017F1400000DAC9B1C9CC423C5472616E73
      662E2042414E524953554C20532F41202D205041422D46435254207061726120
      53414E54414E44455220436F6E746120496E766573746909393230323532312E
      3820333533202D2042414E434F2053414E54414E4445522042524153494C2053
      2F4103353037104F50455241C7D5455320434F4D554E531046554E444143414F
      20425254505245560000000000000000000008402542414E524953554C20532F
      41202D205041422D464352542030362E3037393637382E302E3100000000006A
      D8400000085DB4C9CC423C5472616E73662E2042414E524953554C20532F4120
      2D205041422D4643525420706172612053414E54414E44455220436F6E746120
      496E76657374690A3036303739363738303112303431202D2042414E52495355
      4C20532F410430313030104F50455241C7D5455320434F4D554E531046554E44
      4143414F20425254505245560000000000000000000014401D53414E54414E44
      455220436F6E746120496E76657374696D656E746F7300000000006AD8400000
      085DB4C9CC423C5472616E73662E2042414E524953554C20532F41202D205041
      422D4643525420706172612053414E54414E44455220436F6E746120496E7665
      73746909393230323532312E3820333533202D2042414E434F2053414E54414E
      4445522042524153494C20532F4103353037104F50455241C7D5455320434F4D
      554E531046554E444143414F2042525450524556000000000000000000000840
      2542414E524953554C20532F41202D205041422D464352542030362E30373936
      37382E302E3100000000007097400000CE6FEAC9CC421641504C494341C7D545
      532046494E414E4345495241530A3036303739363738303112303431202D2042
      414E524953554C20532F410430313030104F50455241C7D5455320434F4D554E
      531046554E444143414F2042525450524556}
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppPrincipal
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
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 144
    Top = 72
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppPrincipal'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = ppLogo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppLogo'
        mmHeight = 17727
        mmLeft = 2910
        mmTop = 0
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppLogo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppLogo'
        mmHeight = 4995
        mmLeft = 26458
        mmTop = 2646
        mmWidth = 30649
        BandType = 0
      end
      object LblTitulo: TppLabel
        UserName = 'LblTitulo'
        Caption = 'Relatório de aplicações e resgates'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 26458
        mmTop = 10054
        mmWidth = 69321
        BandType = 0
      end
      object PerIni: TppLabel
        UserName = 'PerIni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 21960
        mmTop = 21696
        mmWidth = 51065
        BandType = 0
      end
      object PerFim: TppLabel
        UserName = 'PerFim'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 21960
        mmTop = 25400
        mmWidth = 51594
        BandType = 0
      end
      object ppPortadorConta: TppLabel
        UserName = 'PerIni1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 21960
        mmTop = 29104
        mmWidth = 51065
        BandType = 0
      end
      object ppBanco: TppLabel
        UserName = 'PerIni2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 119327
        mmTop = 21696
        mmWidth = 21167
        BandType = 0
      end
      object ppAgencia: TppLabel
        UserName = 'Agencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 119327
        mmTop = 25400
        mmWidth = 57150
        BandType = 0
      end
      object pphistorico: TppLabel
        UserName = 'historico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 119327
        mmTop = 29104
        mmWidth = 57415
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'PerIni3'
        Caption = 'Período Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 3736
        mmTop = 21696
        mmWidth = 17526
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'PerFim1'
        Caption = 'Período Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 4763
        mmTop = 25400
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Portador Conta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 2540
        mmTop = 29104
        mmWidth = 18627
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Banco: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 109538
        mmTop = 21696
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Agencia1'
        Caption = 'Agência: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 107686
        mmTop = 25400
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'historico1'
        Caption = 'Histórico: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 106363
        mmTop = 29104
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 1058
        mmWidth = 23813
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 70379
        mmTop = 1058
        mmWidth = 61119
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODPORTADOR'
      DataPipeline = ppPrincipal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPrincipal'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object shpMaozinha: TppShape
          UserName = 'shpMaozinha'
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1058
          mmWidth = 192882
          BandType = 3
          GroupNo = 0
        end
        object ppTitulo: TppShape
          UserName = 'Titulo'
          Brush.Color = 13160660
          Pen.Color = 13160660
          Pen.Style = psClear
          mmHeight = 5821
          mmLeft = 529
          mmTop = 529
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCPORTADOR'
          DataPipeline = ppPrincipal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppPrincipal'
          mmHeight = 3440
          mmLeft = 99484
          mmTop = 1588
          mmWidth = 93134
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'rpSaldoLabel3'
          Caption = 'Conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 88636
          mmTop = 1588
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'rpSaldoLine1'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5556
          mmWidth = 196057
          BandType = 3
          GroupNo = 0
        end
        object rptDetalhe: TppSubReport
          OnPrint = rptDetalhePrint
          UserName = 'rptDetalhe'
          DrillDownComponent = shpMaozinha
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDetalhe'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 7673
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppDetalhe
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
            Left = 200
            Top = 120
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppDetalhe'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppLabel7: TppLabel
                UserName = 'Label7'
                Caption = 'Valor do Lançamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 171980
                mmTop = 529
                mmWidth = 23283
                BandType = 1
              end
              object lblPlanoPatro: TppLabel
                UserName = 'lblPlanoPatro'
                Caption = 'Patrocinadora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 13494
                mmTop = 529
                mmWidth = 15081
                BandType = 1
              end
              object ppLabel31: TppLabel
                UserName = 'Label31'
                Caption = 'Histórico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 92075
                mmTop = 529
                mmWidth = 9525
                BandType = 1
              end
              object ppLine16: TppLine
                UserName = 'Line16'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 11906
                mmTop = 3969
                mmWidth = 183357
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                Caption = 'Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 50800
                mmTop = 529
                mmWidth = 6350
                BandType = 1
              end
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppZebra: TppShape
                OnPrint = ppZebraPrint
                UserName = 'Zebra'
                Brush.Color = 13160660
                Pen.Style = psClear
                mmHeight = 3969
                mmLeft = 12171
                mmTop = 264
                mmWidth = 183621
                BandType = 4
              end
              object ppDBText22: TppDBText
                UserName = 'DBText22'
                DataField = 'VALOR'
                DataPipeline = ppDetalhe
                DisplayFormat = '#,##0.00;(#,##0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDetalhe'
                mmHeight = 2910
                mmLeft = 170127
                mmTop = 529
                mmWidth = 25135
                BandType = 4
              end
              object ppDBText24: TppDBText
                UserName = 'DBText24'
                DataField = 'PLANO'
                DataPipeline = ppDetalhe
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppDetalhe'
                mmHeight = 2910
                mmLeft = 50800
                mmTop = 529
                mmWidth = 40481
                BandType = 4
              end
              object ppDBText4: TppDBText
                UserName = 'DBText4'
                DataField = 'HISTORICO'
                DataPipeline = ppDetalhe
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppDetalhe'
                mmHeight = 2910
                mmLeft = 92075
                mmTop = 529
                mmWidth = 75671
                BandType = 4
              end
              object ppDBText21: TppDBText
                UserName = 'DBText21'
                DataField = 'PATRO'
                DataPipeline = ppDetalhe
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppDetalhe'
                mmHeight = 2910
                mmLeft = 13494
                mmTop = 529
                mmWidth = 35719
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 7144
              mmPrintPosition = 0
              object ppDBCalc1: TppDBCalc
                UserName = 'DBCalc1'
                DataField = 'VALOR'
                DataPipeline = ppDetalhe
                DisplayFormat = '#,##0.00;(#,##0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppDetalhe'
                mmHeight = 2910
                mmLeft = 162719
                mmTop = 1323
                mmWidth = 32544
                BandType = 7
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                Caption = 'Total de Lançamentos: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2910
                mmLeft = 132557
                mmTop = 1323
                mmWidth = 27252
                BandType = 7
              end
            end
          end
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'DATALANCFINAN'
          DataPipeline = ppPrincipal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPrincipal'
          mmHeight = 3440
          mmLeft = 14288
          mmTop = 1588
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 5556
          mmTop = 1588
          mmWidth = 7070
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Nº do doc.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 43127
          mmTop = 1588
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NUMCHQBORDERO'
          DataPipeline = ppPrincipal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppPrincipal'
          mmHeight = 3440
          mmLeft = 60325
          mmTop = 1588
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsPrincipal: TDataSource
    DataSet = cdsPrincipal
    Left = 64
    Top = 136
  end
  object cdsLogo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 104
  end
  object ppLogo: TppDBPipeline
    DataSource = dsLogo
    UserName = 'Logo'
    Left = 32
    Top = 72
    object ppLogoppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppLogoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppLogoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsLogo: TDataSource
    DataSet = cdsLogo
    Left = 32
    Top = 136
  end
  object cdsdetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 104
  end
  object dsdetalhe: TDataSource
    DataSet = cdsdetalhe
    Left = 104
    Top = 136
  end
  object ppDetalhe: TppDBPipeline
    DataSource = dsdetalhe
    UserName = 'Detalhe'
    Left = 108
    Top = 72
    object ppDetalheppField1: TppField
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField2: TppField
      FieldAlias = 'DESCPORTADOR'
      FieldName = 'DESCPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField3: TppField
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField4: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField5: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField6: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField7: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField8: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField9: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDetalheppField10: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object ppPrincipal: TppDBPipeline
    DataSource = dsPrincipal
    CloseDataSource = True
    UserName = 'Principal'
    Left = 68
    Top = 72
    object ppPrincipalppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppPrincipalppField2: TppField
      FieldAlias = 'DESCPORTADOR'
      FieldName = 'DESCPORTADOR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppPrincipalppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppPrincipalppField4: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppPrincipalppField5: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppPrincipalppField6: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppPrincipalppField7: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 73
      DisplayWidth = 73
      Position = 6
    end
    object ppPrincipalppField8: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppPrincipalppField9: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object ppPrincipalppField10: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
  end
end
