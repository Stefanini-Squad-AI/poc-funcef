inherited RptCompSaldo: TRptCompSaldo
  Left = 254
  Top = 218
  Width = 276
  Height = 280
  Caption = 'RptCompSaldo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'ListaIdEstab'
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
        Name = 'ListaIdEstab'
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
        Caption = 'ListaIdFunc'
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
        Name = 'ListaIdFunc'
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
        Caption = 'ListaSitFunc'
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
        Name = 'ListaSitFunc'
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
        Caption = 'ListaTipoContrato'
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
        Name = 'ListaTipoContrato'
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
        Caption = 'CodRubBase'
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
        Name = 'CodRubBase'
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
        Caption = 'CodRubReportada'
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
        Name = 'CodRubReportada'
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
        Caption = 'DataIni'
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
        Name = 'DataIni'
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
        Caption = 'DataFim'
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
        Name = 'DataFim'
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
        Caption = 'Ordenacao'
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
        Name = 'Ordenacao'
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
    Report = rpCompSaldo
    ConnectionType = cntBDE
  end
  object rpCompSaldo: TppReport
    AutoStop = False
    DataPipeline = ppCompSaldo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 210
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object rpCompSaldoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object rpCompSaldoLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'RELATÓRIO DE COMPOSIÇÃO DE SALDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 63500
        mmTop = 21696
        mmWidth = 55827
        BandType = 0
      end
      object rpCompSaldoDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 13758
        BandType = 0
      end
      object rpCompSaldoDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CGCCPF'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 6085
        mmWidth = 11906
        BandType = 0
      end
      object rpCompSaldoDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 10583
        mmWidth = 30427
        BandType = 0
      end
      object rpCompSaldoDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 15081
        mmWidth = 16140
        BandType = 0
      end
      object rpCompSaldoLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 2646
        mmTop = 31485
        mmWidth = 192352
        BandType = 0
      end
      object rpCompSaldoLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 6879
        mmWidth = 8202
        BandType = 0
      end
      object rpCompSaldoCalc1: TppCalc
        UserName = 'Calc1'
        CalcType = ctPageSetDesc
        CustomType = dtString
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 6879
        mmWidth = 7408
        BandType = 0
      end
      object rpCompSaldoLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155046
        mmTop = 11113
        mmWidth = 12171
        BandType = 0
      end
      object rpCompSaldoCalc2: TppCalc
        UserName = 'Calc2'
        CalcType = ctPrintDateTime
        CustomType = dtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 11113
        mmWidth = 22225
        BandType = 0
      end
      object rpCompSaldoLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 27252
        mmWidth = 15610
        BandType = 0
      end
      object rpCompSaldoLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 24871
        mmTop = 27252
        mmWidth = 7673
        BandType = 0
      end
      object rpCompSaldoDBTextRUBBASE: TppDBText
        UserName = 'DBText5'
        DataField = 'NOME_RUB_BASE'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 27252
        mmWidth = 31750
        BandType = 0
      end
      object rpCompSaldoDBTextRUBREPORTADA: TppDBText
        UserName = 'DBText6'
        DataField = 'NOME_RUB_REPORTADA'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 27252
        mmWidth = 31750
        BandType = 0
      end
      object rpCompSaldoLblPeriodo: TppLabel
        UserName = 'Label6'
        Caption = 'Período de:                 até:            '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 21696
        mmWidth = 55298
        BandType = 0
      end
      object rpCompSaldoLabel9: TppLabel
        UserName = 'Label7'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 162719
        mmTop = 2646
        mmWidth = 4498
        BandType = 0
      end
      object rpCompSaldoDBText10: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 2646
        mmWidth = 3704
        BandType = 0
      end
      object rpCompSaldoDBText11: TppDBText
        UserName = 'DBText8'
        DataField = 'PERIODO_INI'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 21960
        mmWidth = 14552
        BandType = 0
      end
      object rpCompSaldoDBText12: TppDBText
        UserName = 'DBText9'
        DataField = 'PERIODO_FIN'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 174361
        mmTop = 21960
        mmWidth = 14552
        BandType = 0
      end
    end
    object rpCompSaldoDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpCompSaldoDBText8: TppDBText
        UserName = 'DBText13'
        DataField = 'MES_RUBRICA'
        DataPipeline = ppCompSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 93663
        mmTop = 794
        mmWidth = 28840
        BandType = 4
      end
      object rpCompSaldoDBText9: TppDBText
        UserName = 'DBText14'
        DataField = 'VALOR_RUB_REPORTADA'
        DataPipeline = ppCompSaldo
        DisplayFormat = '#,0.00;#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 794
        mmWidth = 31485
        BandType = 4
      end
    end
    object rpCompSaldoFootBnd: TppFooterBand
      AfterPrint = rpCompSaldoFootBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
    end
    object ppGroup6: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppCompSaldo
      NewPage = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCompSaldoGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpCompSaldoGrpFootBnd3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpCompSaldoSubReport1: TppSubReport
          OnPrint = rpCompSaldoSubReport1Print
          UserName = 'rpCompSaldoSubReport1'
          ExpandAll = False
          NewPrintJob = False
          PrintBehavior = pbSection
          ResetPageNo = False
          TraverseAllData = False
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpCompSaldoChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppCompSaldoSub
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utMillimeters
            Version = '5.5'
            mmColumnWidth = 0
            object rpCompSaldoSubReport1HdrBnd: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 27517
              mmPrintPosition = 0
              object rpCompSaldoSubReport1Label1: TppLabel
                UserName = 'rpCompSaldoSubReport1Label1'
                AutoSize = False
                Caption = 'RESUMO DE RELATÓRIO DE COMPOSIÇÃO DE SALDO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 104246
                mmTop = 1058
                mmWidth = 76465
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText1: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText1'
                DataField = 'EMPRESA'
                DataPipeline = ppCompSaldo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 15081
                mmTop = 1058
                mmWidth = 87048
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText2: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText2'
                AutoSize = True
                DataField = 'CGCCPF'
                DataPipeline = ppCompSaldo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 15081
                mmTop = 5027
                mmWidth = 11906
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText3: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText3'
                AutoSize = True
                DataField = 'ESTADUALMUNICIPAL'
                DataPipeline = ppCompSaldo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 15081
                mmTop = 9260
                mmWidth = 30163
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText4: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText4'
                AutoSize = True
                DataField = 'ENDERECO'
                DataPipeline = ppCompSaldo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 15081
                mmTop = 13494
                mmWidth = 16140
                BandType = 0
              end
              object rpCompSaldoSubReport1Label2: TppLabel
                UserName = 'rpCompSaldoSubReport1Label2'
                Caption = 'Folha:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 145521
                mmTop = 11377
                mmWidth = 8202
                BandType = 0
              end
              object rpCompSaldoSubReport1Label3: TppLabel
                UserName = 'rpCompSaldoSubReport1Label3'
                Caption = 'Emissão:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 141552
                mmTop = 15875
                mmWidth = 12171
                BandType = 0
              end
              object rpCompSaldoSubReport1Label5: TppLabel
                UserName = 'rpCompSaldoSubReport1Label5'
                Caption = 'Mês de Referência:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 62177
                mmTop = 18521
                mmWidth = 32279
                BandType = 0
              end
              object rpCompSaldoSubReport1Line1: TppLine
                UserName = 'rpCompSaldoSubReport1Line1'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 15081
                mmTop = 26988
                mmWidth = 166159
                BandType = 0
              end
              object rpCompSaldoSubReport1Label4: TppLabel
                UserName = 'rpCompSaldoSubReport1Label4'
                Caption = 'Mês'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 17992
                mmTop = 22225
                mmWidth = 5556
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText6: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText6'
                DataField = 'NOME_RUB_REPORTADA'
                DataPipeline = ppCompSaldoSub
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 146844
                mmTop = 22225
                mmWidth = 31485
                BandType = 0
              end
              object rpCompSaldoSubReport1Label6: TppLabel
                UserName = 'rpCompSaldoSubReport1Label6'
                Caption = 'UF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 149225
                mmTop = 7144
                mmWidth = 4498
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText7: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText7'
                AutoSize = True
                DataField = 'UF'
                DataPipeline = ppCompSaldo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3175
                mmLeft = 154517
                mmTop = 7144
                mmWidth = 3704
                BandType = 0
              end
              object rpCompSaldoSubReport1DBText8: TppDBText
                UserName = 'rpCompSaldoSubReport1DBText8'
                DataField = 'MES_RUBRICA'
                DataPipeline = ppCompSaldoSub
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 95515
                mmTop = 19050
                mmWidth = 23019
                BandType = 0
              end
              object rpCompSaldoSubReport1Calc2: TppSystemVariable
                UserName = 'rpCompSaldoSubReport1Calc2'
                VarType = vtPrintDateTime
                DisplayFormat = 'DD/MM/YYYY HH:MM'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 154517
                mmTop = 15875
                mmWidth = 21696
                BandType = 0
              end
              object rpCompSaldoSubReport1Calc1: TppSystemVariable
                UserName = 'rpCompSaldoSubReport1Calc1'
                VarType = vtPageSet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 154517
                mmTop = 11377
                mmWidth = 7408
                BandType = 0
              end
            end
            object rpCompSaldoSubReport1DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpCompSaldoSubReport1SmryBnd: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 10319
              mmPrintPosition = 0
              object rpCompSaldoSubReport1Label7: TppLabel
                UserName = 'rpCompSaldoSubReport1Label7'
                Caption = 'Total Geral:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 124619
                mmTop = 1852
                mmWidth = 19844
                BandType = 7
              end
              object rpCompSaldoSubReport1DBCalc3: TppDBCalc
                UserName = 'rpCompSaldoSubReport1DBCalc3'
                DataField = 'VALOR_RUB_REPORTADA'
                DataPipeline = ppCompSaldoSub
                DisplayFormat = '#,0.00;#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 146844
                mmTop = 1852
                mmWidth = 31485
                BandType = 7
              end
              object rpCompSaldoSubReport1Line2: TppLine
                UserName = 'rpCompSaldoSubReport1Line2'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 15081
                mmTop = 0
                mmWidth = 166159
                BandType = 7
              end
              object rpCompSaldoSubReport1Line3: TppLine
                UserName = 'rpCompSaldoSubReport1Line3'
                Pen.Width = 2
                Weight = 1.5
                mmHeight = 794
                mmLeft = 15081
                mmTop = 7673
                mmWidth = 166159
                BandType = 7
              end
            end
            object rpCompSaldoChildReport1Group1: TppGroup
              BreakName = 'MES'
              DataPipeline = ppCompSaldoSub
              UserName = 'rpCompSaldoChildReport1Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              object rpCompSaldoSubReport1GrpHdrBnd: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object rpCompSaldoSubReport1GrpFootBnd: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 5821
                mmPrintPosition = 0
                object rpCompSaldoSubReport1DBText5: TppDBText
                  UserName = 'rpCompSaldoSubReport1DBText5'
                  DataField = 'MES_RUBRICA'
                  DataPipeline = ppCompSaldoSub
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 17992
                  mmTop = 794
                  mmWidth = 43656
                  BandType = 5
                  GroupNo = 0
                end
                object rpCompSaldoSubReport1DBCalc1: TppDBCalc
                  UserName = 'rpCompSaldoSubReport1DBCalc1'
                  DataField = 'VALOR_RUB_REPORTADA'
                  DataPipeline = ppCompSaldoSub
                  DisplayFormat = '#,0.00;#,0.00'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  ResetGroup = rpCompSaldoChildReport1Group1
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 146844
                  mmTop = 794
                  mmWidth = 31485
                  BandType = 5
                  GroupNo = 0
                end
              end
            end
          end
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppCompSaldo
      KeepTogether = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCompSaldoGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpCompSaldoGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpCompSaldoLabel7: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 127794
          mmTop = 1323
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object rpCompSaldoDBCalcVALOR_RUB_REPORTADA2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALOR_RUB_REPORTADA'
          DataPipeline = ppCompSaldo
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 1323
          mmWidth = 31485
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'FUNCIONARIO'
      DataPipeline = ppCompSaldo
      KeepTogether = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpCompSaldoGrpHdrBnd3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpCompSaldoDBText5: TppDBText
          UserName = 'DBText10'
          DataField = 'MATRICULA'
          DataPipeline = ppCompSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 1058
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpCompSaldoDBText6: TppDBText
          UserName = 'DBText11'
          DataField = 'FUNCIONARIO'
          DataPipeline = ppCompSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 24871
          mmTop = 1058
          mmWidth = 97631
          BandType = 3
          GroupNo = 2
        end
        object rpCompSaldoDBText7: TppDBText
          UserName = 'DBText12'
          DataField = 'VALOR_RUB_BASE'
          DataPipeline = ppCompSaldo
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 128059
          mmTop = 1058
          mmWidth = 31750
          BandType = 3
          GroupNo = 2
        end
      end
      object rpCompSaldoGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpCompSaldoLine3: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 2381
          mmTop = 0
          mmWidth = 192352
          BandType = 5
          GroupNo = 2
        end
        object rpCompSaldoLine2: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 794
          mmLeft = 2381
          mmTop = 6085
          mmWidth = 192352
          BandType = 5
          GroupNo = 2
        end
        object rpCompSaldoLabel6: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 127794
          mmTop = 1323
          mmWidth = 31750
          BandType = 5
          GroupNo = 2
        end
        object rpCompSaldoDBCalcVALOR_RUB_REPORTADA1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR_RUB_REPORTADA'
          DataPipeline = ppCompSaldo
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162719
          mmTop = 1323
          mmWidth = 31485
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppCompSaldo: TppBDEPipeline
    DataSource = dsCompSaldo
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'CompSaldo'
    Left = 210
    Top = 56
    object ppCompSaldoppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppCompSaldoppField2: TppField
      FieldAlias = 'PERIODO_INI'
      FieldName = 'PERIODO_INI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppCompSaldoppField3: TppField
      FieldAlias = 'PERIODO_FIN'
      FieldName = 'PERIODO_FIN'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppCompSaldoppField4: TppField
      FieldAlias = 'CGCCPF'
      FieldName = 'CGCCPF'
      FieldLength = 44
      DisplayWidth = 44
      Position = 3
    end
    object ppCompSaldoppField5: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 44
      DisplayWidth = 44
      Position = 4
    end
    object ppCompSaldoppField6: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 185
      DisplayWidth = 185
      Position = 5
    end
    object ppCompSaldoppField7: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 6
    end
    object ppCompSaldoppField8: TppField
      FieldAlias = 'FUNCIONARIO'
      FieldName = 'FUNCIONARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppCompSaldoppField9: TppField
      FieldAlias = 'MES_RUBRICA'
      FieldName = 'MES_RUBRICA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 8
    end
    object ppCompSaldoppField10: TppField
      FieldAlias = 'NOME_RUB_REPORTADA'
      FieldName = 'NOME_RUB_REPORTADA'
      FieldLength = 130
      DisplayWidth = 130
      Position = 9
    end
    object ppCompSaldoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RUB_REPORTADA'
      FieldName = 'VALOR_RUB_REPORTADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppCompSaldoppField12: TppField
      FieldAlias = 'NOME_RUB_BASE'
      FieldName = 'NOME_RUB_BASE'
      FieldLength = 130
      DisplayWidth = 130
      Position = 11
    end
    object ppCompSaldoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RUB_BASE'
      FieldName = 'VALOR_RUB_BASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object dsCompSaldo: TwwDataSource
    DataSet = CdsCompSaldo
    Left = 210
    Top = 104
  end
  object ppCompSaldoSub: TppBDEPipeline
    DataSource = dsCompSaldoSub
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CompSaldoSub'
    Left = 48
    Top = 55
    object ppCompSaldoSubppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppCompSaldoSubppField2: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppCompSaldoSubppField3: TppField
      FieldAlias = 'MES_RUBRICA'
      FieldName = 'MES_RUBRICA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 2
    end
    object ppCompSaldoSubppField4: TppField
      FieldAlias = 'NOME_RUB_REPORTADA'
      FieldName = 'NOME_RUB_REPORTADA'
      FieldLength = 130
      DisplayWidth = 130
      Position = 3
    end
    object ppCompSaldoSubppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR_RUB_REPORTADA'
      FieldName = 'VALOR_RUB_REPORTADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object dsCompSaldoSub: TwwDataSource
    DataSet = CdsCompSaldoSub
    Left = 48
    Top = 104
  end
  object sqlCompSaldo: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,'
      '  ('#39'10/10/2000'#39') AS PERIODO_INI,'
      '  ('#39'10/10/2000'#39') AS PERIODO_FIN,'
      '  ('#39'Inscrição'#39' ||'#39' '#39'|| TDO.SIGLADOCUMENTO ||'#39' '#39'||'
      
        '    (SUBSTR(DO.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(DO.NUMDOCUMENTO,' +
        '3,3) ||'#39'.'#39'||'
      
        '     SUBSTR(DO.NUMDOCUMENTO,6,3) ||'#39'/'#39'|| SUBSTR(DO.NUMDOCUMENTO,' +
        '9,4) ||'#39'-'#39'||'
      '     SUBSTR(DO.NUMDOCUMENTO,13,2))) AS CGCCPF,'
      
        '  RTRIM(DECODE(DECODE(ESTADUAL.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscri' +
        'ção'#39' ||'#39' '#39'|| ESTADUAL.SIGLADOCUMENTO ||'#39' '#39'||'
      
        '    ESTADUAL.NUMDOCUMENTO),'#39#39',DECODE(MUNICIPAL.SIGLADOCUMENTO,'#39'M' +
        'UNICIPAL'#39','#39'Inscrição'#39' ||'#39' '#39'||'
      '    MUNICIPAL.SIGLADOCUMENTO ||'#39' '#39'|| MUNICIPAL.NUMDOCUMENTO),'
      
        '    DECODE(ESTADUAL.SIGLADOCUMENTO,'#39'ESTADUAL'#39','#39'Inscrição'#39' ||'#39' '#39'|' +
        '| ESTADUAL.SIGLADOCUMENTO ||'#39' '#39'||'
      '    ESTADUAL.NUMDOCUMENTO))) AS ESTADUALMUNICIPAL,'
      
        '  RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.NUMERO ||'#39#39'|| DECODE(E.COMPLEME' +
        'NTO,'#39' '#39','#39' - '#39' ||'#39#39'|| RTRIM(E.COMPLEMENTO))'
      
        '    ||'#39' - '#39'|| RTRIM(E.BAIRRO) ||'#39' - '#39'|| RTRIM(CIDADES.NOME) ||'#39' ' +
        '- CEP:'#39'|| RTRIM(SUBSTR(E.CEP,1,5)) ||'#39'-'#39'||'
      '    RTRIM(SUBSTR(E.CEP,6,3)) AS ENDERECO,'
      '  FUNC.MATRICULA,'
      '  RTRIM(PF.NOME) AS FUNCIONARIO,'
      
        '  (SUBSTR(RUBREPORTADA.MES,6,2)||'#39'/'#39'||SUBSTR(RUBREPORTADA.MES,1,' +
        '4)) AS MES_RUBRICA,'
      '  (RUBREPORTADA.DESCRICAO) AS NOME_RUB_REPORTADA,'
      '  (RUBREPORTADA.VALOR)     AS VALOR_RUB_REPORTADA,'
      '  (RUBBASE.DESCRICAO)      AS NOME_RUB_BASE,'
      '  NVL(RUBBASE.VALOR,0)     AS VALOR_RUB_BASE'
      'FROM'
      
        '  PESSOA  PJ, PESSOA  PF, FUNCIONARIO FUNC, TIPODOCOFICIAL TDO, ' +
        'DOCPESSOA DO,'
      '  ENDPESS  E, CIDADES,'
      '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, TD.SIGLADOCUMENTO,'
      
        '          SUBSTR(D.NUMDOCUMENTO,1,2) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMEN' +
        'TO,3,3) ||'#39'.'#39'|| SUBSTR(D.NUMDOCUMENTO,6,3) AS NUMDOCUMENTO'
      '   FROM   DOCPESSOA D, TIPODOCOFICIAL TD'
      
        '   WHERE (RTRIM(TD.SIGLADOCUMENTO) = '#39'ESTADUAL:'#39') AND (D.IDDOCUM' +
        'ENTO = TD.IDDOCUMENTO)) ESTADUAL,'
      
        '  (SELECT D.IDPESSOA, TD.CODDOCUMENTO, D.NUMDOCUMENTO, TD.SIGLAD' +
        'OCUMENTO'
      '   FROM   DOCPESSOA D, TIPODOCOFICIAL TD'
      
        '   WHERE (RTRIM(TD.SIGLADOCUMENTO) = '#39'MUNICIPAL:'#39') AND (D.IDDOCU' +
        'MENTO = TD.IDDOCUMENTO)) MUNICIPAL,'
      
        '  (SELECT H.IDPESSOA, P. DESCRICAO, H.MES, (H.VALORPROVENTO) AS ' +
        'VALOR'
      '   FROM   HISTRUBSAL H, PROVDESC P'
      '   WHERE'
      '     (H.IDPESSOA IN (3162)) AND'
      '     (H.IDRUBRICA  = P.IDPROVENTO) AND'
      '     (H.MES       >= '#39'1999/01'#39')    AND'
      '     (H.MES       <= '#39'2000/01'#39')    AND'
      '     (P.IDPROVENTO = 2405)) RUBBASE,'
      
        '  (SELECT H.IDPESSOA, P. DESCRICAO, H.MES, (H.VALORPROVENTO) AS ' +
        'VALOR'
      '   FROM   HISTRUBSAL H, PROVDESC P'
      '   WHERE'
      '     (H.IDPESSOA IN (3162)) AND'
      '     (H.IDRUBRICA  = P.IDPROVENTO) AND'
      '     (H.MES       >= '#39'1999/01'#39')    AND'
      '     (H.MES       <= '#39'2000/01'#39')    AND'
      '     (P.IDPROVENTO = 306)) RUBREPORTADA'
      'WHERE'
      '  (PJ.IDPESSOA = 569) AND'
      '  (PF.IDPESSOA IN (3162)) AND'
      '  (PJ.IDPESSOA      = E.IDPESSOA)        AND'
      '  (RTRIM(TDO.SIGLADOCUMENTO) = '#39'CGC:'#39') AND'
      '  (PJ.IDPESSOA      = DO.IDPESSOA)       AND'
      '  (DO.IDDOCUMENTO   = TDO.IDDOCUMENTO)   AND'
      '  (FUNC.IDESTAB     = PJ.IDPESSOA)       AND'
      '  (FUNC.IDPESSOA    = PF.IDPESSOA)       AND'
      '  (FUNC.IDPESSOA    = RUBREPORTADA.IDPESSOA) AND'
      '  (FUNC.IDPESSOA    = RUBBASE.IDPESSOA)      AND'
      '  (RUBREPORTADA.MES = RUBBASE.MES)           AND'
      '  (PJ.IDPESSOA      = ESTADUAL.IDPESSOA(+))  AND'
      '  (PJ.IDPESSOA      = MUNICIPAL.IDPESSOA(+)) AND'
      '  (E.IDCIDADES      = CIDADES.IDCIDADES(+))'
      'ORDER BY'
      '  EMPRESA, FUNCIONARIO'
      '')
    ClientDataSet = CdsCompSaldo
    Left = 210
    Top = 200
  end
  object CdsCompSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsCompSaldoAfterScroll
    Left = 210
    Top = 152
  end
  object CdsCompSaldoSub: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 152
  end
  object sqlCompSaldoSub: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  RTRIM(PJ.RAZAOSOCIAL) AS EMPRESA,'
      '  RUBREPORTADA.MES,'
      
        '  (DECODE(TO_NUMBER(SUBSTR(RUBREPORTADA.MES,6,2)),1,'#39'Janeiro'#39',2,' +
        #39'Fevereiro'#39',3,'#39'Março'#39',4,'#39'Abril'#39','
      
        '     5,'#39'Maio'#39',6,'#39'Junho'#39',7,'#39'Julho'#39',8,'#39'Agosto'#39',9,'#39'Setembro'#39',10,'#39'Ou' +
        'tubro'#39','
      
        '     11,'#39'Novembro'#39',12,'#39'Dezembro'#39')||'#39'/'#39'||SUBSTR(RUBREPORTADA.MES,' +
        '1,4)) AS MES_RUBRICA,'
      '  (RUBREPORTADA.DESCRICAO) AS NOME_RUB_REPORTADA,'
      '  (RUBREPORTADA.VALOR)     AS VALOR_RUB_REPORTADA'
      'FROM'
      '  PESSOA  PJ, PESSOA  PF, FUNCIONARIO FUNC,'
      
        '  (SELECT H.IDPESSOA, P. DESCRICAO, H.MES, (H.VALORPROVENTO) AS ' +
        'VALOR'
      '   FROM   HISTRUBSAL H, PROVDESC P'
      '   WHERE'
      '     (H.IDPESSOA IN (3162)) AND'
      '     (H.IDRUBRICA  = P.IDPROVENTO) AND'
      '     (H.MES       >= '#39'1999/01'#39')    AND'
      '     (H.MES       <= '#39'2000/01'#39')    AND'
      '     (P.IDPROVENTO = 269)) RUBREPORTADA'
      'WHERE'
      '  (PJ.IDPESSOA = 569) AND'
      '  (PF.IDPESSOA IN (3162)) AND'
      '  (FUNC.IDESTAB  = PJ.IDPESSOA)  AND'
      '  (FUNC.IDPESSOA = PF.IDPESSOA)  AND'
      '  (FUNC.IDPESSOA = RUBREPORTADA.IDPESSOA)'
      'ORDER BY'
      '  EMPRESA, MES')
    ClientDataSet = CdsCompSaldoSub
    Left = 48
    Top = 200
  end
end
