inherited RptEscalaFerias: TRptEscalaFerias
  Left = 227
  Top = 189
  Width = 285
  Height = 265
  Caption = 'RptEscalaFerias'
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
        Caption = 'DataRef'
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
        Name = 'DataRef'
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
    Report = rpEscalaFerias
    ConnectionType = cntBDE
  end
  object rpEscalaFerias: TppReport
    AutoStop = False
    DataPipeline = ppEscalaFerias
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    CachePages = True
    DeviceType = 'Screen'
    Left = 214
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel34: TppLabel
        UserName = 'Label1'
        Caption = 'RELATÓRIO DE ESCALA DE FÉRIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 9525
        mmWidth = 46038
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESA'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 12171
        mmTop = 1852
        mmWidth = 102923
        BandType = 0
      end
      object rpEscalaFeriasDBText31: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12171
        mmTop = 6085
        mmWidth = 6350
        BandType = 0
      end
      object rpEscalaFeriasDBText32: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12171
        mmTop = 10319
        mmWidth = 30427
        BandType = 0
      end
      object rpEscalaFeriasDBText33: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12171
        mmTop = 14552
        mmWidth = 16140
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 12171
        mmTop = 20108
        mmWidth = 267230
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label2'
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247915
        mmTop = 6085
        mmWidth = 8467
        BandType = 0
      end
      object ppCalc1: TppCalc
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
        mmLeft = 257176
        mmTop = 6085
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label3'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 10319
        mmWidth = 13229
        BandType = 0
      end
      object ppCalc2: TppCalc
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
        mmLeft = 257176
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label4'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252148
        mmTop = 1852
        mmWidth = 4233
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 257176
        mmTop = 1852
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label5'
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 239978
        mmTop = 14552
        mmWidth = 16404
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText6'
        DataField = 'DATA_REF'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 14552
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBText36: TppDBText
        UserName = 'DBText9'
        DataField = 'MATRICULA'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 12171
        mmTop = 1852
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText10'
        DataField = 'EMPREGADO'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 26988
        mmTop = 1852
        mmWidth = 81227
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText11'
        DataField = 'ULT_FERIAS'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText12'
        DataField = 'PER_AQUIS_INI'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText13'
        DataField = 'PER_AQUIS_FIN'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 158221
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText14'
        DataField = 'DATA_APOS'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
      object rpEscalaFeriasLabel2: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = '___ / ___ / ______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 232305
        mmTop = 1852
        mmWidth = 20638
        BandType = 4
      end
      object rpEscalaFeriasLabel3: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '|_______|'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 263526
        mmTop = 1852
        mmWidth = 11906
        BandType = 4
      end
      object rpEscalaFeriasDBText1: TppDBText
        UserName = 'DBText15'
        DataField = 'DATA_LIMITE'
        DataPipeline = ppEscalaFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 206905
        mmTop = 1852
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object rpEscalaFeriasSmryBnd: TppSummaryBand
      AfterPrint = rpEscalaFeriasSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpEscalaFeriasGrp0: TppGroup
      BreakName = 'NOMECENTROCUSTO'
      DataPipeline = ppEscalaFerias
      NewPage = True
      UserName = 'rpEscalaFeriasGrp0'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLabel40: TppLabel
          UserName = 'Label6'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12171
          mmTop = 794
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'NOMECENTROCUSTO'
          DataPipeline = ppEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 53446
          mmTop = 794
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 12171
          mmTop = 10319
          mmWidth = 267230
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 12171
          mmTop = 6615
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 26988
          mmTop = 6615
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Período Aquisitivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 142875
          mmTop = 2910
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'A partir de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 181240
          mmTop = 6615
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Data Program.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 232305
          mmTop = 6615
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Ult. Fer.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 119327
          mmTop = 6615
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppDBText45: TppDBText
          UserName = 'DBText8'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 38100
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'de                 até'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 142875
          mmTop = 6615
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object rpEscalaFeriasLabel1: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Qtde. Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 263526
          mmTop = 6615
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpEscalaFeriasLabel4: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Data Limite'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 206905
          mmTop = 6615
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 12171
          mmTop = 529
          mmWidth = 267230
          BandType = 5
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label18'
          Caption = 'Nº de Funcionários:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 12171
          mmTop = 2117
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object rpEscalaFeriasDBCalc1: TppDBCalc
          UserName = 'rpEscalaFeriasDBCalc1'
          DataField = 'NUM_FUNC'
          DataPipeline = ppEscalaFerias
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpEscalaFeriasGrp0
          Transparent = True
          LookAhead = True
          mmHeight = 3704
          mmLeft = 42333
          mmTop = 2117
          mmWidth = 37835
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppEscalaFerias: TppBDEPipeline
    DataSource = dsEscalaFerias
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'EscalaFerias'
    Left = 214
    Top = 48
  end
  object dsEscalaFerias: TwwDataSource
    DataSet = CdsEscalaFerias
    Left = 214
    Top = 96
  end
  object sqlEscalaFerias: TCMSqlParams
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
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DT_FERIAS_EM_ABERTO,'
      '  '#39'1234567890'#39' AS DT_FERIAS,'
      '  '#39'1234567890'#39' AS ULT_FERIAS,'
      '  '#39'1234567890'#39' AS DATA_REF,'
      '  '#39'1234567890'#39' AS PER_AQUIS_INI,'
      '  '#39'1234567890'#39' AS PER_AQUIS_FIN,'
      '  '#39'1234567890'#39' AS DATA_LIMITE,'
      '  '#39'1234567890'#39' AS DATA_APOS,'
      '  0 AS NUM_FUNC,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsEscalaFerias
    Left = 214
    Top = 190
  end
  object CdsEscalaFerias: TCMClientDataSet
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
        Name = 'DATAADMISSAO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DT_FERIAS_EM_ABERTO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DT_FERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ULT_FERIAS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA_REF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PER_AQUIS_INI'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PER_AQUIS_FIN'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA_LIMITE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATA_APOS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NUM_FUNC'
        DataType = ftFloat
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
    AfterScroll = CdsEscalaFeriasAfterScroll
    Left = 214
    Top = 144
  end
end
