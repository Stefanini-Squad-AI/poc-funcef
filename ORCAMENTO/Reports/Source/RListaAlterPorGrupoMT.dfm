inherited RptListaAlterPorGrupoMT: TRptListaAlterPorGrupoMT
  Left = 373
  Top = 216
  Width = 269
  Height = 356
  Caption = 'RptListaAlterPorGrupoMT'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem de Transferências - Especial'
    Params = <
      item
        Caption = 'Grupo Origem'
        Controle = tcMontaSelect
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
        MontaSelect = msGrupoOrigem
        Width = 0
      end
      item
        Caption = 'Grupo Destino'
        Controle = tcMontaSelect
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
        MontaSelect = msGrupoDestino
        Width = 0
      end
      item
        Caption = 'Período Inicial'
        Controle = tcComboBox
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
        ComboBoxSettings.Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = 0
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
        Caption = 'Período Final'
        Controle = tcComboBox
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
        ComboBoxSettings.Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = 0
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
        Caption = 'Exercicio'
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
        Caption = 'Operação'
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
    Formheight = 250
    FormWidth = 350
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptAlterPorGrupo
    LabelEmpresa = lbEmpresa
    LabelSistema = lbSistema
  end
  object Cds: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 80
    Data = {
      050900009619E0BD0100000018000000190005000000030000003103044E4F4D
      450100490000000100055749445448020002001E000E4944475255504F4F5243
      414D454E08000400000000000B475255504F4F524947454D0100490000000100
      055749445448020002004B000E43454E54524553504F524947454D0100490000
      000100055749445448020002002B000E43454E54435553544F524947454D0100
      490000000100055749445448020002002B000B504C414E4F4F524947454D0100
      4900000001000557494454480200020032000B504154524F4F524947454D0100
      490000000100055749445448020002003C000A49444F5045524143414F080004
      00000000000D504552494F444F4F524947454D08000400000000000E50455245
      584552434F524947454D01004900000001000557494454480200020053000F50
      4552494F444F4F524947454D5F31010049000000010005574944544802000200
      09000F45584552434943494F4F524947454D08000400000000000E4944434F4E
      544144455354494E4F0100490000000100055749445448020002001E000C4752
      55504F44455354494E4F0100490000000100055749445448020002004B001149
      44475255504F4F524344455354494E4F08000400000000000F43454E54524553
      5044455354494E4F0100490000000100055749445448020002002B000F43454E
      544355535444455354494E4F0100490000000100055749445448020002002B00
      0C504C414E4F44455354494E4F01004900000001000557494454480200020032
      000C504154524F44455354494E4F010049000000010005574944544802000200
      3C000F504552455845524344455354494E4F0100490000000100055749445448
      0200020053000E504552494F444F44455354494E4F0100490000000100055749
      4454480200020009001045584552434943494F44455354494E4F080004000000
      00000E444154415245464552454E43494108000800000000000C4E554D414C54
      45524143414F08000400000000000D564C52534F4C4943495441444F08000400
      0000000002000D44454641554C545F4F52444552020082000600000001000900
      0C00010015001600044C43494404000100160800000000000000000000094144
      4D20474552414C00000000007AA240133031202D20477275706F206465205465
      73746503202D201030313130202D2041444D20474552414C0C4F7065722E2043
      6F6D756E7305434F4D554D0000000000002240000000000000F03F0831202F20
      32303036074A616E6569726F0000000000589F400D3031303031313030313034
      3032133031202D20477275706F20646520546573746500000000007AA2400320
      2D201030313130202D2041444D20474552414C0C4F7065722E20436F6D756E73
      05434F4D554D0832202F20323030360946657665726569726F0000000000589F
      40000090AA57C9CC4200000000000000400000000000002A4000000000000000
      000941444D20474552414C00000000007AA240133031202D20477275706F2064
      652054657374652530313130202D2041444D20474552414C2020202020202020
      202020202020202020202020201030313130202D2041444D20474552414C0A4F
      7065722E2041646D2E05434F4D554D0000000000002040000000000000F03F08
      31202F2032303036074A616E6569726F0000000000589F400D30313030313130
      303130343032133031202D20477275706F20646520546573746500000000007A
      A24003202D201030313130202D2041444D20474552414C0C4F7065722E20436F
      6D756E7305434F4D554D0832202F20323030360946657665726569726F000000
      0000589F40000090AA57C9CC42000000000000F03F0000000000002840000000
      00000000000941444D20474552414C00000000007AA240133031202D20477275
      706F2064652054657374652530313130202D2041444D20474552414C20202020
      20202020202020202020202020202020201030313130202D2041444D20474552
      414C0A4F7065722E2041646D2E05434F4D554D00000000000022400000000000
      00F03F0831202F2032303036074A616E6569726F0000000000589F400D303130
      30313130303130333032133031202D20477275706F2064652054657374650000
      0000007AA2402530313130202D2041444D20474552414C202020202020202020
      2020202020202020202020201030313130202D2041444D20474552414C0A4F70
      65722E2041646D2E05434F4D554D0832202F2032303036094665766572656972
      6F0000000000589F40000090AA57C9CC4200000000000008400000000000002C
      4000000000000000000941444D20474552414C00000000007AA240133031202D
      20477275706F2064652054657374652530313130202D2041444D20474552414C
      2020202020202020202020202020202020202020201030313130202D2041444D
      20474552414C0A4F7065722E2041646D2E05434F4D554D000000000000244000
      0000000000F03F0831202F2032303036074A616E6569726F0000000000589F40
      0D30313030313130303130343032133031202D20477275706F20646520546573
      746500000000007AA24003202D201030313130202D2041444D20474552414C0C
      4F7065722E20436F6D756E7305434F4D554D0832202F20323030360946657665
      726569726F0000000000589F400000BE3D5AC9CC420000000000001040000000
      0000002E4000000000000000000941444D20474552414C00000000007AA24013
      3031202D20477275706F2064652054657374652530313130202D2041444D2047
      4552414C2020202020202020202020202020202020202020201030313130202D
      2041444D20474552414C0A4F7065722E2041646D2E05434F4D554D0000000000
      002440000000000000F03F0831202F2032303036074A616E6569726F00000000
      00589F400D30313030313130303130333032133031202D20477275706F206465
      20546573746500000000007AA2402530313130202D2041444D20474552414C20
      20202020202020202020202020202020202020201030313130202D2041444D20
      474552414C0A4F7065722E2041646D2E05434F4D554D0832202F203230303609
      46657665726569726F0000000000589F400000BE3D5AC9CC4200000000000014
      400000000000002440}
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 80
  end
  object RptAlterPorGrupo: TppReport
    AutoStop = False
    DataPipeline = pplCds
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
    Left = 56
    Top = 240
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplCds'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object lbEmpresa: TppLabel
        UserName = 'lbEmpresa'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 23283
        mmTop = 1588
        mmWidth = 17992
        BandType = 0
      end
      object lbDescricao: TppLabel
        UserName = 'lbDescricao'
        Caption = 'Listagem de Transferências Orçamentárias - Especial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 7408
        mmWidth = 83873
        BandType = 0
      end
      object lbAdicionais: TppLabel
        UserName = 'lbAdicionais'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 11642
        mmWidth = 13229
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 16933
        mmWidth = 284300
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplCdsImagem
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplCdsImagem'
        mmHeight = 14023
        mmLeft = 2381
        mmTop = 1852
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object shpCorZebra: TppShape
        OnPrint = shpCorZebraPrint
        UserName = 'shpCorZebra'
        Brush.Color = 15461355
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CENTCUSTORIGEM'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 265
        mmTop = 265
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CENTRESPORIGEM'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 32544
        mmTop = 265
        mmWidth = 30956
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 251619
        mmTop = 265
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRSOLICITADO'
        DataPipeline = pplCds
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 265378
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CENTCUSTDESTINO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 119327
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CENTRESPDESTINO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 152665
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'PEREXERCDESTINO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2498
        mmLeft = 227246
        mmTop = 265
        mmWidth = 7705
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'PLANOORIGEM'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 65088
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'PATROORIGEM'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 86784
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'PEREXERCORIGEM'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2498
        mmLeft = 108712
        mmTop = 265
        mmWidth = 7705
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLANODESTINO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 184150
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'PATRODESTINO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 205317
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NUMALTERACAO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2381
        mmLeft = 237596
        mmTop = 529
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 18256
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3440
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object lbSistema: TppLabel
        UserName = 'lbSistema'
        Caption = 'lbSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1852
        mmWidth = 12435
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 1852
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 270405
        mmTop = 1852
        mmWidth = 14023
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Shape = stRoundRect
        mmHeight = 13758
        mmLeft = 3704
        mmTop = 8467
        mmWidth = 276755
        BandType = 7
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 13494
        mmWidth = 18256
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLRSOLICITADO'
        DataPipeline = pplCds
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3969
        mmLeft = 26194
        mmTop = 13494
        mmWidth = 41275
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDOPERACAO'
      DataPipeline = pplCds
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCds'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3641
          mmLeft = 529
          mmTop = 1323
          mmWidth = 14901
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'IDOPERACAO'
          DataPipeline = pplCds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 3704
          mmLeft = 16669
          mmTop = 1323
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPOORIGEM'
      DataPipeline = pplCds
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCds'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15081
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          Brush.Color = clSilver
          mmHeight = 7144
          mmLeft = 119327
          mmTop = 5556
          mmWidth = 115359
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          mmHeight = 7144
          mmLeft = 265
          mmTop = 5556
          mmWidth = 116152
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'GRUPOORIGEM'
          DataPipeline = pplCds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 3175
          mmLeft = 25135
          mmTop = 1323
          mmWidth = 73290
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Grupo de origem:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 1323
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Grupo de destino:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 119327
          mmTop = 1323
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'GRUPODESTINO'
          DataPipeline = pplCds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 3175
          mmLeft = 144198
          mmTop = 1323
          mmWidth = 80433
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 1058
          mmTop = 9260
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Centro de Responsabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 32544
          mmTop = 6615
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 120915
          mmTop = 9260
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Centro de Responsabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 152665
          mmTop = 6615
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Período / Exercício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 224367
          mmTop = 6615
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Data Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 253471
          mmTop = 10319
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Valor solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 267494
          mmTop = 10319
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 65617
          mmTop = 6615
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 85990
          mmTop = 9260
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Período / Exercício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 105834
          mmTop = 6615
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 184150
          mmTop = 6615
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 205317
          mmTop = 9260
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Num. Solicitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 238655
          mmTop = 7673
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRSOLICITADO'
          DataPipeline = pplCds
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 2910
          mmLeft = 256646
          mmTop = 3175
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object pplCds: TppBDEPipeline
    DataSource = ds
    UserName = 'lCds'
    Left = 56
    Top = 184
    object pplCdsppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplCdsppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPOORCAMEN'
      FieldName = 'IDGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplCdsppField3: TppField
      FieldAlias = 'GRUPOORIGEM'
      FieldName = 'GRUPOORIGEM'
      FieldLength = 75
      DisplayWidth = 75
      Position = 2
    end
    object pplCdsppField4: TppField
      FieldAlias = 'CENTRESPORIGEM'
      FieldName = 'CENTRESPORIGEM'
      FieldLength = 43
      DisplayWidth = 43
      Position = 3
    end
    object pplCdsppField5: TppField
      FieldAlias = 'CENTCUSTORIGEM'
      FieldName = 'CENTCUSTORIGEM'
      FieldLength = 43
      DisplayWidth = 43
      Position = 4
    end
    object pplCdsppField6: TppField
      FieldAlias = 'PLANOORIGEM'
      FieldName = 'PLANOORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object pplCdsppField7: TppField
      FieldAlias = 'PATROORIGEM'
      FieldName = 'PATROORIGEM'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplCdsppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAO'
      FieldName = 'IDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplCdsppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERIODOORIGEM'
      FieldName = 'PERIODOORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplCdsppField10: TppField
      FieldAlias = 'PEREXERCORIGEM'
      FieldName = 'PEREXERCORIGEM'
      FieldLength = 83
      DisplayWidth = 83
      Position = 9
    end
    object pplCdsppField11: TppField
      FieldAlias = 'PERIODOORIGEM_1'
      FieldName = 'PERIODOORIGEM_1'
      FieldLength = 9
      DisplayWidth = 9
      Position = 10
    end
    object pplCdsppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'EXERCICIOORIGEM'
      FieldName = 'EXERCICIOORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplCdsppField13: TppField
      FieldAlias = 'IDCONTADESTINO'
      FieldName = 'IDCONTADESTINO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 12
    end
    object pplCdsppField14: TppField
      FieldAlias = 'GRUPODESTINO'
      FieldName = 'GRUPODESTINO'
      FieldLength = 75
      DisplayWidth = 75
      Position = 13
    end
    object pplCdsppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPOORCDESTINO'
      FieldName = 'IDGRUPOORCDESTINO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplCdsppField16: TppField
      FieldAlias = 'CENTRESPDESTINO'
      FieldName = 'CENTRESPDESTINO'
      FieldLength = 43
      DisplayWidth = 43
      Position = 15
    end
    object pplCdsppField17: TppField
      FieldAlias = 'CENTCUSTDESTINO'
      FieldName = 'CENTCUSTDESTINO'
      FieldLength = 43
      DisplayWidth = 43
      Position = 16
    end
    object pplCdsppField18: TppField
      FieldAlias = 'PLANODESTINO'
      FieldName = 'PLANODESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 17
    end
    object pplCdsppField19: TppField
      FieldAlias = 'PATRODESTINO'
      FieldName = 'PATRODESTINO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object pplCdsppField20: TppField
      FieldAlias = 'PEREXERCDESTINO'
      FieldName = 'PEREXERCDESTINO'
      FieldLength = 83
      DisplayWidth = 83
      Position = 19
    end
    object pplCdsppField21: TppField
      FieldAlias = 'PERIODODESTINO'
      FieldName = 'PERIODODESTINO'
      FieldLength = 9
      DisplayWidth = 9
      Position = 20
    end
    object pplCdsppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'EXERCICIODESTINO'
      FieldName = 'EXERCICIODESTINO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplCdsppField23: TppField
      FieldAlias = 'DATAREFERENCIA'
      FieldName = 'DATAREFERENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplCdsppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMALTERACAO'
      FieldName = 'NUMALTERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplCdsppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSOLICITADO'
      FieldName = 'VLRSOLICITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
  end
  object pplCdsImagem: TppBDEPipeline
    DataSource = dsImagem
    UserName = 'lCdsImagem'
    Left = 120
    Top = 184
  end
  object ds: TDataSource
    DataSet = Cds
    Left = 56
    Top = 136
  end
  object dsImagem: TDataSource
    DataSet = CdsImagem
    Left = 120
    Top = 136
  end
  object msGrupoOrigem: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN'
      'G.CODGRUPOORC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 193
    Top = 73
  end
  object msGrupoDestino: TMontaSelect
    Tag = 1
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN'
      'G.CODGRUPOORC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 193
    Top = 129
  end
end
