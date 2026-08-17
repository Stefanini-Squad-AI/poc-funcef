inherited RptAcompEscalaFerias: TRptAcompEscalaFerias
  Left = 218
  Top = 184
  Height = 269
  Caption = 'RptAcompEscalaFerias'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
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
        Caption = 'MesRef'
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
        Name = 'MesRef'
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
        Caption = 'AnoRef'
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
        Name = 'AnoRef'
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
        Caption = 'ListaCodCCusto'
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
        Name = 'ListaCodCCusto'
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
        Caption = 'TipoContrato'
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
        Name = 'TipoContrato'
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
        Caption = 'SitFunc'
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
        Name = 'SitFunc'
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
        Caption = 'CorFeriasJaProcessadas'
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
        Name = 'CorFeriasJaProcessadas'
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
        Caption = 'CorFeriasNaoProcessadas'
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
        Name = 'CorFeriasNaoProcessadas'
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
    Report = rpAcompEscalaFerias
    ConnectionType = cntBDE
  end
  object rpAcompEscalaFerias: TppReport
    AutoStop = False
    DataPipeline = ppAcompEscalaFerias
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'AcompEscalaFerias'
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
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpAcompEscalaFeriasBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    Left = 228
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object rpAcompEscalaFeriasLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Período de:                      até:            '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 211403
        mmTop = 14552
        mmWidth = 55563
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label2'
        Caption = 'RELATÓRIO DE ACOMPANHAMENTO DE ESCALA DE FÉRIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 9525
        mmWidth = 78052
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESA'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 17727
        mmTop = 1852
        mmWidth = 102923
        BandType = 0
      end
      object rpAcompEscalaFeriasDBText43: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17727
        mmTop = 6085
        mmWidth = 6350
        BandType = 0
      end
      object rpAcompEscalaFeriasDBText46: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17727
        mmTop = 10319
        mmWidth = 30427
        BandType = 0
      end
      object rpAcompEscalaFeriasDBText47: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 17727
        mmTop = 14552
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label3'
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 219340
        mmTop = 6085
        mmWidth = 8467
        BandType = 0
      end
      object ppCalc3: TppCalc
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
        mmLeft = 228600
        mmTop = 6085
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label4'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 214578
        mmTop = 10319
        mmWidth = 13229
        BandType = 0
      end
      object ppCalc4: TppCalc
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
        mmLeft = 228600
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label5'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 223573
        mmTop = 1852
        mmWidth = 4233
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 228600
        mmTop = 1852
        mmWidth = 3704
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText6'
        DataField = 'DATA_REF_INI'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 228865
        mmTop = 14552
        mmWidth = 15610
        BandType = 0
      end
      object rpAcompEscalaFeriasDBText24: TppDBText
        UserName = 'DBText7'
        DataField = 'DATA_REF_FIN'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 251619
        mmTop = 14552
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      BeforePrint = ppDetailBand9BeforePrint
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpAcompEscalaFeriasShape16: TppShape
        UserName = 'Shape17'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 35454
        mmTop = 0
        mmWidth = 82286
        BandType = 4
      end
      object rpAcompEscalaFeriasShape17: TppShape
        UserName = 'Shape18'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 17727
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object rpAcompEscalaFeriasShape15: TppShape
        UserName = 'Shape19'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 117475
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText22'
        DataField = 'MATRICULA'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 19579
        mmTop = 1058
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText23'
        DataField = 'EMPREGADO'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 37042
        mmTop = 1058
        mmWidth = 80169
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText24'
        DataField = 'PERIODO_01'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 118004
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape18: TppShape
        UserName = 'Shape20'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 129911
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText1: TppDBText
        UserName = 'DBText25'
        DataField = 'PERIODO_02'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 130440
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape19: TppShape
        UserName = 'Shape21'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 142346
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText2: TppDBText
        UserName = 'DBText26'
        DataField = 'PERIODO_03'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 142875
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape20: TppShape
        UserName = 'Shape22'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 154782
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText3: TppDBText
        UserName = 'DBText27'
        DataField = 'PERIODO_04'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 155311
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape21: TppShape
        UserName = 'Shape23'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 167217
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText4: TppDBText
        UserName = 'DBText28'
        DataField = 'PERIODO_05'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 167746
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape22: TppShape
        UserName = 'Shape24'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 179652
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText5: TppDBText
        UserName = 'DBText29'
        DataField = 'PERIODO_06'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 180182
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape23: TppShape
        UserName = 'Shape25'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 192088
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText6: TppDBText
        UserName = 'DBText30'
        DataField = 'PERIODO_07'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 192617
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape24: TppShape
        UserName = 'Shape26'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 204523
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText7: TppDBText
        UserName = 'DBText31'
        DataField = 'PERIODO_08'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 205052
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape25: TppShape
        UserName = 'Shape27'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 216959
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText8: TppDBText
        UserName = 'DBText32'
        DataField = 'PERIODO_09'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 217488
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape26: TppShape
        UserName = 'Shape28'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 229394
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText9: TppDBText
        UserName = 'DBText33'
        DataField = 'PERIODO_10'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 229923
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape27: TppShape
        UserName = 'Shape29'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 241830
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText10: TppDBText
        UserName = 'DBText34'
        DataField = 'PERIODO_11'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 242359
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasShape28: TppShape
        UserName = 'Shape30'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 254265
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpAcompEscalaFeriasDBText11: TppDBText
        UserName = 'DBText35'
        DataField = 'PERIODO_12'
        DataPipeline = ppAcompEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 254794
        mmTop = 1058
        mmWidth = 11642
        BandType = 4
      end
      object rpAcompEscalaFeriasLinePer1: TppLine
        UserName = 'Line1'
        Pen.Color = clBlue
        Pen.Width = 4
        Visible = False
        Weight = 3
        mmHeight = 1323
        mmLeft = 138907
        mmTop = 2117
        mmWidth = 6615
        BandType = 4
      end
      object rpAcompEscalaFeriasLinePer2: TppLine
        UserName = 'Line2'
        Pen.Color = clLime
        Pen.Width = 4
        Visible = False
        Weight = 3
        mmHeight = 1323
        mmLeft = 151342
        mmTop = 2117
        mmWidth = 6615
        BandType = 4
      end
      object rpAcompEscalaFeriasLinePer3: TppLine
        UserName = 'Line3'
        Pen.Color = clBlue
        Pen.Width = 4
        Visible = False
        Weight = 3
        mmHeight = 1323
        mmLeft = 164571
        mmTop = 2117
        mmWidth = 6615
        BandType = 4
      end
      object rpAcompEscalaFeriasLinePer4: TppLine
        UserName = 'Line4'
        Pen.Color = clLime
        Pen.Width = 4
        Visible = False
        Weight = 3
        mmHeight = 1323
        mmLeft = 177007
        mmTop = 2117
        mmWidth = 6615
        BandType = 4
      end
      object rpAcompEscalaFeriasLinePer5: TppLine
        UserName = 'Line5'
        Pen.Color = clBlue
        Pen.Width = 4
        Visible = False
        Weight = 3
        mmHeight = 1323
        mmLeft = 189442
        mmTop = 2117
        mmWidth = 6615
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object rpAcompEscalaFeriasSmryBnd: TppSummaryBand
      AfterPrint = rpAcompEscalaFeriasSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
    object ppGroup7: TppGroup
      BreakName = 'NOMECENTROCUSTO'
      DataPipeline = ppAcompEscalaFerias
      NewPage = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object rpAcompEscalaFeriasShape14: TppShape
          UserName = 'Shape1'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 35454
          mmTop = 5821
          mmWidth = 82286
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape1: TppShape
          UserName = 'Shape2'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 117475
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape13: TppShape
          UserName = 'Shape3'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 17727
          mmTop = 5821
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape9: TppShape
          UserName = 'Shape4'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 254265
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape10: TppShape
          UserName = 'Shape5'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 241830
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape11: TppShape
          UserName = 'Shape6'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 229394
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape12: TppShape
          UserName = 'Shape7'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 216959
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape5: TppShape
          UserName = 'Shape8'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 167217
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape6: TppShape
          UserName = 'Shape9'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 179652
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape7: TppShape
          UserName = 'Shape10'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 192088
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape8: TppShape
          UserName = 'Shape11'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 204523
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape4: TppShape
          UserName = 'Shape12'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 142346
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape3: TppShape
          UserName = 'Shape13'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 154782
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasShape2: TppShape
          UserName = 'Shape14'
          Brush.Style = bsClear
          mmHeight = 5556
          mmLeft = 129911
          mmTop = 5821
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label6'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 794
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBText57: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'NOMECENTROCUSTO'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 59002
          mmTop = 794
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 18256
          mmTop = 6879
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 37042
          mmTop = 6879
          mmWidth = 80169
          BandType = 3
          GroupNo = 0
        end
        object ppDBText58: TppDBText
          UserName = 'DBText9'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 43656
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object AcompEscalaFeriasShapeJaProcess: TppShape
          UserName = 'Shape15'
          Brush.Color = clBlue
          mmHeight = 3704
          mmLeft = 208757
          mmTop = 1058
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object AcompEscalaFeriasShapeNaoProcess: TppShape
          UserName = 'Shape16'
          Brush.Color = clLime
          mmHeight = 3704
          mmLeft = 242359
          mmTop = 1058
          mmWidth = 3704
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasLabel12: TppLabel
          UserName = 'Label9'
          Caption = 'Já Processadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 213519
          mmTop = 1588
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasLabel13: TppLabel
          UserName = 'Label10'
          Caption = 'Não Processadas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 247386
          mmTop = 1588
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText12: TppDBText
          UserName = 'DBText10'
          DataField = 'NOME_MES_01'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 118004
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText13: TppDBText
          UserName = 'DBText11'
          DataField = 'NOME_MES_02'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 130440
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText14: TppDBText
          UserName = 'DBText12'
          DataField = 'NOME_MES_03'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 142875
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText15: TppDBText
          UserName = 'DBText13'
          DataField = 'NOME_MES_04'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 155311
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText16: TppDBText
          UserName = 'DBText14'
          DataField = 'NOME_MES_05'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 167746
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText17: TppDBText
          UserName = 'DBText15'
          DataField = 'NOME_MES_06'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 180182
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText18: TppDBText
          UserName = 'DBText16'
          DataField = 'NOME_MES_07'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 192617
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText19: TppDBText
          UserName = 'DBText17'
          DataField = 'NOME_MES_08'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 205052
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText20: TppDBText
          UserName = 'DBText18'
          DataField = 'NOME_MES_09'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 217488
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText21: TppDBText
          UserName = 'DBText19'
          DataField = 'NOME_MES_10'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 229923
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText22: TppDBText
          UserName = 'DBText20'
          DataField = 'NOME_MES_11'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 242359
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpAcompEscalaFeriasDBText23: TppDBText
          UserName = 'DBText21'
          DataField = 'NOME_MES_12'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 254794
          mmTop = 6879
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine9: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 17727
          mmTop = 1323
          mmWidth = 249238
          BandType = 5
          GroupNo = 0
        end
        object ppLabel69: TppLabel
          UserName = 'Label11'
          Caption = 'Nº de Funcionários:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 2910
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'EMPREGADO'
          DataPipeline = ppAcompEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 46567
          mmTop = 2910
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppAcompEscalaFerias: TppBDEPipeline
    DataSource = dsAcompEscalaFerias
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'AcompEscalaFerias'
    Left = 228
    Top = 48
  end
  object dsAcompEscalaFerias: TwwDataSource
    DataSet = CdsAcompEscalaFerias
    Left = 228
    Top = 96
  end
  object sqlAcompEscalaFerias: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      '  '#39'12345678901234567890'#39' AS CGC,'
      '  '#39'12345678901234567890'#39' AS ESTADUALMUNICIPAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      '  '#39'12345678901234567890'#39' AS UF,'
      '  '#39'12345678901234567890'#39' AS MATRICULA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      '  '#39'12345678901234567890'#39' AS CODCENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS NOMECENTROCUSTO,'
      '  '#39'1234567890'#39' AS DATA_REF_INI, '#39'1234567890'#39' AS DATA_REF_FIN,'
      
        '  0 AS OCORRIDA_01, '#39'1200000012'#39' AS PERIODO_01, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_01, '#39'123'#39' AS NOME_MES_01,'
      
        '  0 AS OCORRIDA_02, '#39'1200000012'#39' AS PERIODO_02, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_02, '#39'123'#39' AS NOME_MES_02,'
      
        '  0 AS OCORRIDA_03, '#39'1200000012'#39' AS PERIODO_03, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_03, '#39'123'#39' AS NOME_MES_03,'
      
        '  0 AS OCORRIDA_04, '#39'1200000012'#39' AS PERIODO_04, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_04, '#39'123'#39' AS NOME_MES_04,'
      
        '  0 AS OCORRIDA_05, '#39'1200000012'#39' AS PERIODO_05, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_05, '#39'123'#39' AS NOME_MES_05,'
      
        '  0 AS OCORRIDA_06, '#39'1200000012'#39' AS PERIODO_06, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_06, '#39'123'#39' AS NOME_MES_06,'
      
        '  0 AS OCORRIDA_07, '#39'1200000012'#39' AS PERIODO_07, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_07, '#39'123'#39' AS NOME_MES_07,'
      
        '  0 AS OCORRIDA_08, '#39'1200000012'#39' AS PERIODO_08, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_08, '#39'123'#39' AS NOME_MES_08,'
      
        '  0 AS OCORRIDA_09, '#39'1200000012'#39' AS PERIODO_09, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_09, '#39'123'#39' AS NOME_MES_09,'
      
        '  0 AS OCORRIDA_10, '#39'1200000012'#39' AS PERIODO_10, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_10, '#39'123'#39' AS NOME_MES_10,'
      
        '  0 AS OCORRIDA_11, '#39'1200000012'#39' AS PERIODO_11, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_11, '#39'123'#39' AS NOME_MES_11,'
      
        '  0 AS OCORRIDA_12, '#39'1200000012'#39' AS PERIODO_12, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_12, '#39'123'#39' AS NOME_MES_12,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsAcompEscalaFerias
    Left = 228
    Top = 190
  end
  object CdsAcompEscalaFerias: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CGC'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ESTADUALMUNICIPAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MATRICULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'CODCENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMECENTROCUSTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'DATA_REF_INI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA_REF_FIN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'OCORRIDA_01'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_01'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_01'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_01'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_02'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_02'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_02'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_02'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_03'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_03'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_03'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_03'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_04'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_04'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_04'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_04'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_05'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_05'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_05'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_05'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_06'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_06'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_06'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_06'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_07'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_07'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_07'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_07'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_08'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_08'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_08'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_08'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_09'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_09'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_09'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_09'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_10'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_10'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_11'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_11'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OCORRIDA_12'
        DataType = ftFloat
      end
      item
        Name = 'PERIODO_12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO_PERIODO_12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 7
      end
      item
        Name = 'NOME_MES_12'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NUM_REGISTRO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'Index1'
        Fields = 'NUM_REGISTRO'
      end>
    IndexName = 'Index1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsAcompEscalaFeriasAfterScroll
    Left = 228
    Top = 144
  end
end
