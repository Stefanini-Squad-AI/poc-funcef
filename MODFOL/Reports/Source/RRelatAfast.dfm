inherited RptRelatAfast: TRptRelatAfast
  Left = 490
  Top = 150
  Width = 297
  Height = 340
  Caption = 'RptRelatAfast'
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
        Caption = 'DataInicial'
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
        Name = 'DataInicial'
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
        Caption = 'DataFinal'
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
        Name = 'DataFinal'
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
        Caption = 'ListaIdAfast'
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
        Name = 'ListaIdAfast'
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
        Caption = 'ListaIdRetorno'
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
        Name = 'ListaIdRetorno'
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
        Caption = 'Ordem'
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
        Name = 'Ordem'
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
    Report = rpRelatAfast
  end
  object rpRelatAfast: TppReport
    AutoStop = False
    DataPipeline = ppRelatAfast
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Afastamentos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 7350
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 222
    Top = 6
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRelatAfast'
    object rpRelatAfastHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 53975
      mmPrintPosition = 0
      object rpRelatAfastLbl5: TppLabel
        UserName = 'rpRelatAfastLbl5'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235215
        mmTop = 38894
        mmWidth = 13758
        BandType = 0
      end
      object rpRelatAfastDBTxt6: TppDBText
        UserName = 'rpRelatAfastDBTxt6'
        DataField = 'REFERENCIA'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3704
        mmLeft = 249767
        mmTop = 38894
        mmWidth = 34131
        BandType = 0
      end
      object plnRelatAfastLine2: TppLine
        UserName = 'plnRelatAfastLine2'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 1323
        mmTop = 52123
        mmWidth = 282311
        BandType = 0
      end
      object rpRelatAfastLbl6: TppLabel
        UserName = 'rpRelatAfastLbl6'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 50006
        mmWidth = 12435
        BandType = 0
      end
      object rpRelatAfastLbl8: TppLabel
        UserName = 'rpRelatAfastLbl8'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 116152
        mmTop = 50006
        mmWidth = 21696
        BandType = 0
      end
      object rpRelatAfastLbl7: TppLabel
        UserName = 'rpRelatAfastLblNome1'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16140
        mmTop = 50006
        mmWidth = 47096
        BandType = 0
      end
      object rpRelatAfastLbl11: TppLabel
        UserName = 'rpRelatAfastLbl11'
        AutoSize = False
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 224632
        mmTop = 50006
        mmWidth = 57944
        BandType = 0
      end
      object rpRelatAfastLbl9: TppLabel
        UserName = 'rpRelatAfastLbl9'
        AutoSize = False
        Caption = 'Motivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 156898
        mmTop = 50006
        mmWidth = 50536
        BandType = 0
      end
      object rpRelatAfastLbl12: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 210609
        mmTop = 50006
        mmWidth = 11906
        BandType = 0
      end
      object rpRelatAfastLbl10: TppLabel
        UserName = 'rpRelatAfastLbl10'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 139965
        mmTop = 50006
        mmWidth = 11113
        BandType = 0
      end
      object rpRelatAfastLbl15: TppLabel
        UserName = 'rpRelatAfastLbl15'
        AutoSize = False
        Caption = 'Retorno'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 2910
        mmLeft = 212196
        mmTop = 46302
        mmWidth = 71438
        BandType = 0
      end
      object rpRelatAfastLbl14: TppLabel
        UserName = 'rpRelatAfastLbl14'
        AutoSize = False
        Caption = 'Afastamento'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 2910
        mmLeft = 140229
        mmTop = 46302
        mmWidth = 70644
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Data admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 64029
        mmTop = 50006
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label4'
        Caption = 'Cargo / Função'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 82550
        mmTop = 50006
        mmWidth = 23813
        BandType = 0
      end
      object rpRelatAfastLbl4: TppLabel
        UserName = 'rpRelatAfastLbl4'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 245005
        mmTop = 33338
        mmWidth = 14023
        BandType = 0
      end
      object rpRelatAfastSysVar2: TppSystemVariable
        UserName = 'rpRelatAfastSysVar2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 260086
        mmTop = 33338
        mmWidth = 25400
        BandType = 0
      end
      object rpRelatAfastLbl1: TppLabel
        UserName = 'rpRelatAfastLbl1'
        Caption = 'RELAÇÃO DE AFASTAMENTOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 119327
        mmTop = 28046
        mmWidth = 42333
        BandType = 0
      end
      object pdbmgIMAGEM: TppDBImage
        UserName = 'pdbmgIMAGEM'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 18785
        mmLeft = 4498
        mmTop = 1852
        mmWidth = 19844
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 26194
        mmTop = 3704
        mmWidth = 236803
        BandType = 0
      end
      object lblEnd1: TppLabel
        UserName = 'lblEnd1'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A. Edifício Corporate Financial Center 12 e' +
          ' 13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 8996
        mmWidth = 236803
        BandType = 0
      end
      object lblEnd2: TppLabel
        UserName = 'lblEnd2'
        AutoSize = False
        Caption = 
          'Brasília  DF.  CEP 70.712-900 - (061)3329-1700 - www.funcef.com.' +
          'br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 26194
        mmTop = 12965
        mmWidth = 236803
        BandType = 0
      end
      object pdbmgIMAGEM1: TppDBImage
        UserName = 'pdbmgIMAGEM1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 18785
        mmLeft = 4498
        mmTop = 1852
        mmWidth = 19844
        BandType = 0
      end
      object lblCNPJ: TppLabel
        OnPrint = lblCNPJPrint
        UserName = 'lblCNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3683
        mmLeft = 129117
        mmTop = 17198
        mmWidth = 69596
        BandType = 0
      end
      object pln1: TppLine
        UserName = 'pln1'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 1323
        mmTop = 36248
        mmWidth = 282311
        BandType = 0
      end
    end
    object rpRelatAfastDtlBand: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpRelatAfastDBTxt7: TppDBText
        UserName = 'rpRelatAfastDBTxt7'
        DataField = 'MATRICULA'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object rpRelatAfastDBTxt8: TppDBText
        UserName = 'rpRelatAfastDBTxt8'
        DataField = 'EMPREGADO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3175
        mmLeft = 15346
        mmTop = 794
        mmWidth = 48154
        BandType = 4
      end
      object rpRelatAfastDBTxt10: TppDBText
        UserName = 'rpRelatAfastDBTxt10'
        DataField = 'DESC_AFASTAMENTO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3440
        mmLeft = 157163
        mmTop = 529
        mmWidth = 50800
        BandType = 4
      end
      object rpRelatAfastDBTxt12: TppDBText
        UserName = 'rpRelatAfastDBTxt12'
        DataField = 'DESC_RETORNO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3440
        mmLeft = 225161
        mmTop = 529
        mmWidth = 56886
        BandType = 4
      end
      object rpRelatAfastDBTxt13: TppDBText
        UserName = 'rpRelatAfastDBTxt13'
        DataField = 'DATA_RETORNO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3440
        mmLeft = 210873
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
      object rpRelatAfastDBTxt11: TppDBText
        UserName = 'rpRelatAfastDBTxt11'
        DataField = 'DATA_AFASTAMENTO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3175
        mmLeft = 140759
        mmTop = 793
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATA_ADMISSAO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3440
        mmLeft = 64294
        mmTop = 793
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CARGO_FUNCAO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 794
        mmWidth = 32279
        BandType = 4
      end
      object rpRelatAfastDBTxt9: TppDBText
        UserName = 'rpRelatAfastDBTxt9'
        DataField = 'NOME_CCUSTO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3175
        mmLeft = 116417
        mmTop = 794
        mmWidth = 24077
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label5'
        Caption = 'Relação de Afastamento / Folha de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 0
        mmTop = 1588
        mmWidth = 59690
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label6'
        Caption = 'FUNCEF / DIATI / GEAPE / COPES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 121444
        mmTop = 13494
        mmWidth = 45508
        BandType = 8
      end
      object plnRelatAfastLine4: TppLine
        UserName = 'plnRelatAfastLine4'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 529
        mmTop = 265
        mmWidth = 282311
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 259292
        mmTop = 1588
        mmWidth = 13758
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 273580
        mmTop = 1588
        mmWidth = 9525
        BandType = 8
      end
    end
    object rpRelatAfastSmryBnd: TppSummaryBand
      AfterPrint = rpRelatAfastSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object rpRelatAfastLbl13: TppLabel
        UserName = 'rpRelatAfastLbl13'
        AutoSize = False
        Caption = 'Nº Total de Ocorrências:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 6085
        mmWidth = 35719
        BandType = 7
      end
      object rpRelatAfastDBCalc1: TppDBCalc
        UserName = 'rpRelatAfastDBCalc1'
        DataField = 'EMPREGADO'
        DataPipeline = ppRelatAfast
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppRelatAfast'
        mmHeight = 3440
        mmLeft = 36777
        mmTop = 6085
        mmWidth = 31485
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDESTAB'
      DataPipeline = ppRelatAfast
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelatAfast'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelatAfastGrupoEstab: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object plnRelatAfastLine3: TppLine
          UserName = 'plnRelatAfastLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 794
          mmTop = 0
          mmWidth = 282046
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Nº de Ocorrências:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1323
          mmTop = 2645
          mmWidth = 35719
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'EMPREGADO'
          DataPipeline = ppRelatAfast
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppRelatAfast'
          mmHeight = 3440
          mmLeft = 38100
          mmTop = 2645
          mmWidth = 31485
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object daDataModule1: TdaDataModule
    end
    object rcdmdl1: TraCodeModule
      ProgramStream = {00}
    end
    object prmtrlst1: TppParameterList
    end
  end
  object ppRelatAfast: TppBDEPipeline
    DataSource = dsRelatAfast
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'RelatAfast'
    Left = 222
    Top = 56
  end
  object dsRelatAfast: TDataSource
    DataSet = CdsRelatAfast
    Left = 222
    Top = 104
  end
  object sqlRelatAfast: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS ESTAB,'
      '  0 AS IDESTAB,'
      '  LPAD('#39'1'#39',50,'#39'1'#39') AS INSCRICAO,'
      '  LPAD('#39'1'#39',200,'#39'1'#39') AS ENDERECO,'
      '  '#39'11'#39' AS UF,'
      '  LPAD('#39'1'#39',18,'#39'1'#39') AS CNPJ,'
      '  LPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_ADMISSAO,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS CARGO_FUNCAO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS NOME_CCUSTO,'
      '  LPAD('#39'1'#39',23,'#39'1'#39') AS REFERENCIA,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS DESC_AFASTAMENTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_AFASTAMENTO,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS DESC_RETORNO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_RETORNO'
      'FROM'
      '  PARAMRH'
      'WHERE'
      '  (1 = 2)'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsRelatAfast
    Left = 222
    Top = 198
  end
  object CdsRelatAfast: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ESTAB'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IDESTAB'
        DataType = ftFloat
      end
      item
        Name = 'INSCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'EMPREGADO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_ADMISSAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CARGO_FUNCAO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NOME_CCUSTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 23
      end
      item
        Name = 'DESC_AFASTAMENTO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_AFASTAMENTO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESC_RETORNO'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'DATA_RETORNO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'CdsRelatAfastIndex1'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = CdsRelatAfastAfterScroll
    Left = 222
    Top = 152
    Data = {
      1E0200009619E0BD0100000018000000100000000000030000001E0205455354
      4142010049000000010005574944544802000200640007494445535441420800
      04000000000009494E5343524943414F01004900000001000557494454480200
      0200320008454E44455245434F010049000000010005574944544802000200C8
      0002554601004900000002000753554254595045020049000A00466978656443
      6861720005574944544802000200020004434E504A0100490000000100055749
      445448020002001200094D4154524943554C4101004900000001000557494454
      48020002000D0009454D5052454741444F010049000000010005574944544802
      00020064000D444154415F41444D495353414F01004900000001000557494454
      48020002000A000C434152474F5F46554E43414F010049000000010005574944
      54480200020064000B4E4F4D455F43435553544F010049000000010005574944
      5448020002001E000A5245464552454E43494101004900000001000557494454
      4802000200170010444553435F4146415354414D454E544F0100490000000100
      05574944544802000200640010444154415F4146415354414D454E544F010049
      0000000100055749445448020002000A000C444553435F5245544F524E4F0100
      4900000001000557494454480200020064000C444154415F5245544F524E4F01
      00490000000100055749445448020002000A000100044C434944040001000908
      0000}
  end
  object sqlAfast: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS ESTAB,'
      '  LPAD('#39'1'#39',50,'#39'1'#39') AS ESTADUALMUNICIPAL,'
      '  LPAD('#39'1'#39',200,'#39'1'#39') AS ENDERECO,'
      '  '#39'11'#39' AS UF,'
      '  LPAD('#39'1'#39',18,'#39'1'#39') AS CNPJ,  '
      '  LPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_ADMISSAO,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS CARGO_FUNCAO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS NOME_CCUSTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DESC_AFASTAMENTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_AFASTAMENTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DESC_RETORNO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_RETORNO'
      'FROM'
      '  PARAMRH'
      'WHERE'
      '  (1 = 2)'
      ' '
      ' '
      ' ')
    ClientDataSet = CdsAfast
    Left = 70
    Top = 198
  end
  object CdsAfast: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CdsRelatAfastAfterScroll
    Left = 70
    Top = 152
    Data = {
      F70100009619E0BD01000000180000000E000000000003000000F70105455354
      4142010049000000010005574944544802000200640011455354414455414C4D
      554E49434950414C010049000000010005574944544802000200320008454E44
      455245434F010049000000010005574944544802000200C80002554601004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200020004434E504A01004900000001000557494454480200020012
      00094D4154524943554C410100490000000100055749445448020002000D0009
      454D5052454741444F01004900000001000557494454480200020064000D4441
      54415F41444D495353414F0100490000000100055749445448020002000A000C
      434152474F5F46554E43414F0100490000000100055749445448020002006400
      0B4E4F4D455F43435553544F0100490000000100055749445448020002001E00
      10444553435F4146415354414D454E544F010049000000010005574944544802
      0002000A0010444154415F4146415354414D454E544F01004900000001000557
      49445448020002000A000C444553435F5245544F524E4F010049000000010005
      5749445448020002000A000C444154415F5245544F524E4F0100490000000100
      055749445448020002000A000100044C4349440400010009080000}
  end
  object sqlRetorno: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS ESTAB,'
      '  LPAD('#39'1'#39',50,'#39'1'#39') AS ESTADUALMUNICIPAL,'
      '  LPAD('#39'1'#39',200,'#39'1'#39') AS ENDERECO,'
      '  '#39'11'#39' AS UF,'
      '  LPAD('#39'1'#39',18,'#39'1'#39') AS CNPJ, '
      '  LPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_ADMISSAO,'
      '  LPAD('#39'1'#39',100,'#39'1'#39') AS CARGO_FUNCAO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS NOME_CCUSTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DESC_AFASTAMENTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_AFASTAMENTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DESC_RETORNO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATA_RETORNO'
      'FROM'
      '  PARAMRH'
      'WHERE'
      '  (1 = 2)'
      ' '
      ' ')
    ClientDataSet = CdsRetorno
    Left = 150
    Top = 198
  end
  object CdsRetorno: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CdsRelatAfastAfterScroll
    Left = 150
    Top = 152
    Data = {
      F70100009619E0BD01000000180000000E000000000003000000F70105455354
      4142010049000000010005574944544802000200640011455354414455414C4D
      554E49434950414C010049000000010005574944544802000200320008454E44
      455245434F010049000000010005574944544802000200C80002554601004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200020004434E504A01004900000001000557494454480200020012
      00094D4154524943554C410100490000000100055749445448020002000D0009
      454D5052454741444F01004900000001000557494454480200020064000D4441
      54415F41444D495353414F0100490000000100055749445448020002000A000C
      434152474F5F46554E43414F0100490000000100055749445448020002006400
      0B4E4F4D455F43435553544F0100490000000100055749445448020002001E00
      10444553435F4146415354414D454E544F010049000000010005574944544802
      0002000A0010444154415F4146415354414D454E544F01004900000001000557
      49445448020002000A000C444553435F5245544F524E4F010049000000010005
      5749445448020002000A000C444154415F5245544F524E4F0100490000000100
      055749445448020002000A000100044C4349440400010009080000}
  end
  object sqlCargoFuncao: TCMSqlParams
    SQL.Strings = (
      'SELECT TITULO FROM CARGO WHERE IDCARGO = :IDCARGO')
    ClientDataSet = cdsCargoFuncao
    Left = 32
    Top = 72
  end
  object cdsCargoFuncao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 72
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 70
    Top = 255
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'BLOCO1'
      FieldName = 'BLOCO1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'BLOCO2'
      FieldName = 'BLOCO2'
      FieldLength = 8
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 142
    Top = 255
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '       P.RAZAOSOCIAL,'
      '       I.IMAGEM,'
      '       E.NOME AS BLOCO1,'
      
        '       C.NOME || '#39' '#39' || C.CODESTADO || '#39' CEP '#39' || E.CEP || '#39' - (' +
        #39' ||'
      
        '       TRIM(T.DDD) || '#39')'#39' || T.NUMERO || '#39' - '#39' || P.HOMEPAGE AS ' +
        'BLOCO2'
      '  FROM PESSOA     P,'
      '       ENDPESS    E,'
      '       IMAGENS    I,'
      '       CIDADES    C,'
      '       TELENDPESS T'
      ' WHERE (P.IDPESSOA = 1)'
      '   AND (E.IDPESSOA(+) = P.IDPESSOA)'
      '   AND (E.IDCIDADES = C.IDCIDADES(+))'
      '   AND (I.IDIMAGEM(+) = P.IDIMAGEM)'
      '   AND (E.IDENDERECO = T.IDENDERECO(+))'
      '   AND (T.TIPO = '#39'C'#39')')
    ValidateWithMask = True
    Left = 222
    Top = 255
    object qryFundacaoBLOCO1: TStringField
      FieldName = 'BLOCO1'
      Size = 40
    end
    object qryFundacaoBLOCO2: TMemoField
      FieldName = 'BLOCO2'
      BlobType = ftMemo
      Size = 350
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
end
