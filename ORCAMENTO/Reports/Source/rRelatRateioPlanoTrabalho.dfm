inherited rptRelatRateioPlanoTrabalho: TrptRelatRateioPlanoTrabalho
  Left = 343
  Top = 162
  Height = 325
  Caption = 'rptRelatRateioPlanoTrabalho'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Plano de Trabalho'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDPLANOTRABALHO'
        LookupSettings.Display = 'IDPLANOTRABALHO'
        LookupSettings.Descricao = 'Plano de Trabalho'
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
        Required = True
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
        Caption = 'Grupo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODGRUPOORC'
        LookupSettings.Display = 'CODGRUPOORC'
        LookupSettings.Descricao = 'Grupo'
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
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'CODCENTROCUSTO'
        LookupSettings.Descricao = 'Centro de Custo'
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
        Caption = 'Plano Previdenciario'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'IDPLANOPREV'
        LookupSettings.Descricao = 'Plano Previdenciário'
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
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Descricao = 'Patrocinadora'
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
        Caption = 'Critério de Rateio'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDCRITERIORATORC'
        LookupSettings.Display = 'IDCRITERIORATORC'
        LookupSettings.Descricao = 'Critério de Rateio'
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
        Caption = 'Cenário'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDCENARIOORCAMEN'
        LookupSettings.Display = 'IDCENARIOORCAMEN'
        LookupSettings.Descricao = 'Cenário'
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
        Caption = 'Exercício'
        Controle = tcLookupCombo
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
        Width = 0
      end
      item
        Caption = 'Plano Orçamentário'
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
    Report = rptRateioPlanoTrabalho
    LabelEmpresa = LblEmpresa
    LabelSistema = LblNomeSistema
  end
  object rptRateioPlanoTrabalho: TppReport
    AutoStop = False
    DataPipeline = pplRateioPlanoTrabalho
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Rateio Por Plano de Trabalho'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
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
    Left = 206
    Top = 64
    Version = '7.04'
    mmColumnWidth = 265250
    DataPipelineName = 'pplRateioPlanoTrabalho'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 61383
      mmPrintPosition = 0
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel207: TppLabel
        UserName = 'ppLabel207'
        Caption = 'Rateio Por Plano De Trabalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 113771
        mmTop = 8731
        mmWidth = 59796
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 14552
        mmWidth = 274140
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Jan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 57414
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Fev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74082
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Abr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 107422
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Mar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 90752
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Mai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 124089
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Jun'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 140759
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Jul'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 157427
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Ago'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 174097
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Set'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 190765
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Out'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 207435
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Nov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 224102
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Dez'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 240772
        mmTop = 52917
        mmWidth = 15748
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 50536
        mmWidth = 274140
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 52388
        mmWidth = 17992
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 57679
        mmWidth = 274140
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 257440
        mmTop = 52917
        mmWidth = 15875
        BandType = 0
      end
      object lblAtividadeProjeto: TppRichText
        UserName = 'lblTeste1'
        Caption = 'lblAtividadeProjeto'
        mmHeight = 4498
        mmLeft = 91811
        mmTop = 21430
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblCentrocusto: TppRichText
        UserName = 'lblCentrocusto'
        Caption = 'lblCentrocusto'
        mmHeight = 4498
        mmLeft = 91811
        mmTop = 27517
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblExercicio: TppRichText
        UserName = 'lblExercicio'
        Caption = 'lblExercicio'
        mmHeight = 4498
        mmLeft = 91811
        mmTop = 33602
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblGrupoOrcamentario: TppRichText
        UserName = 'lblGrupoOrcamentario'
        Caption = 'lblGrupoOrcamentario'
        mmHeight = 4498
        mmLeft = 91811
        mmTop = 39158
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblCenario: TppRichText
        UserName = 'lblCenario'
        Caption = 'lblCenario'
        mmHeight = 4498
        mmLeft = 91811
        mmTop = 44715
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblPlanoTrabalho: TppRichText
        UserName = 'lblPlanoTrabalho'
        Caption = 'lblPlanoTrabalho'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 16140
        mmWidth = 101600
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblPeriodo: TppRichText
        UserName = 'lblPeriodo'
        Caption = 'lblPeriodo'
        mmHeight = 4498
        mmLeft = 184150
        mmTop = 16404
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblCentroRespon: TppRichText
        UserName = 'lblCentroRespon'
        Caption = 'lblCentroRespon'
        mmHeight = 4498
        mmLeft = 184150
        mmTop = 21430
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblPrioridade: TppRichText
        UserName = 'lblPrioridade'
        Caption = 'lblPrioridade'
        mmHeight = 4498
        mmLeft = 184150
        mmTop = 27516
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblPlano: TppRichText
        UserName = 'lblPlano'
        Caption = 'lblPlano'
        mmHeight = 4498
        mmLeft = 184150
        mmTop = 33602
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblPatrocinadora: TppRichText
        UserName = 'lblPatrocinadora'
        Caption = 'lblPatrocinadora'
        mmHeight = 4498
        mmLeft = 184150
        mmTop = 39159
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblCriterioRateio: TppRichText
        UserName = 'lblCriterioRateio'
        Caption = 'lblCriterioRateio'
        mmHeight = 4498
        mmLeft = 184150
        mmTop = 44714
        mmWidth = 88900
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object lblObjetivo: TppRichText
        UserName = 'lblObjetivo'
        Caption = 'lblObjetivo'
        mmHeight = 27252
        mmLeft = 0
        mmTop = 22225
        mmWidth = 89959
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLRORCADO1'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 57414
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRORCADO2'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 74082
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRORCADO3'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 90752
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRORCADO4'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 107422
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRORCADO5'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 124089
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRORCADO6'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 140759
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRORCADO12'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 240772
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRORCADO11'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 224102
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRORCADO10'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 207435
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLRORCADO9'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 190765
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLRORCADO8'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 174097
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'VLRORCADO7'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 157427
        mmTop = 4498
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRRATEIOORI1'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2911
        mmLeft = 57415
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VLRRATEIOORI2'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 74083
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'VLRRATEIOORI3'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 90752
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'VLRRATEIOORI4'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 107421
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'VLRRATEIOORI5'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 124090
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'VLRRATEIOORI6'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 140759
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'VLRRATEIOORI12'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 240771
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'VLRRATEIOORI11'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 224103
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText101'
        DataField = 'VLRRATEIOORI10'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 207434
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'VLRRATEIOORI9'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 190765
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'VLRRATEIOORI8'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 174096
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'VLRRATEIOORI7'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 157427
        mmTop = 794
        mmWidth = 15748
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText21'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplRateioPlanoTrabalho
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 794
        mmWidth = 46038
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText25'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplRateioPlanoTrabalho
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 4498
        mmWidth = 46038
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Rateio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 47890
        mmTop = 794
        mmWidth = 7144
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 46831
        mmTop = 4498
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'VLRRATORITOTAL'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 257440
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'VLRORCADOTOTAL'
        DataPipeline = pplRateioPlanoTrabalho
        DisplayFormat = '##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRateioPlanoTrabalho'
        mmHeight = 2910
        mmLeft = 257440
        mmTop = 4498
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object LblNomeSistema: TppLabel
        UserName = 'LblNomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1588
        mmWidth = 23019
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 245534
        mmTop = 1323
        mmWidth = 27781
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123031
        mmTop = 2117
        mmWidth = 11377
        BandType = 8
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 134938
        mmTop = 2117
        mmWidth = 3175
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 138907
        mmTop = 2117
        mmWidth = 1588
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 265
        mmWidth = 277950
        BandType = 8
      end
    end
  end
  object pplRateioPlanoTrabalho: TppBDEPipeline
    DataSource = dtsRateioPlanoTrabalho
    UserName = 'lRateioPlanoTrabalho'
    Left = 160
    Top = 64
    object pplRateioPlanoTrabalhoppField1: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField2: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField3: TppField
      FieldAlias = 'FLGSINALCONTA'
      FieldName = 'FLGSINALCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField4: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField5: TppField
      FieldAlias = 'IDPLANOORCAMEN'
      FieldName = 'IDPLANOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField6: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField7: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField8: TppField
      FieldAlias = 'IDCRITERIORATORC'
      FieldName = 'IDCRITERIORATORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField9: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField10: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField11: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField12: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField13: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField14: TppField
      FieldAlias = 'VLRORCADO1'
      FieldName = 'VLRORCADO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField15: TppField
      FieldAlias = 'VLRRATEIOORI1'
      FieldName = 'VLRRATEIOORI1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField16: TppField
      FieldAlias = 'VLRORCADO2'
      FieldName = 'VLRORCADO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField17: TppField
      FieldAlias = 'VLRRATEIOORI2'
      FieldName = 'VLRRATEIOORI2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField18: TppField
      FieldAlias = 'VLRORCADO3'
      FieldName = 'VLRORCADO3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField19: TppField
      FieldAlias = 'VLRRATEIOORI3'
      FieldName = 'VLRRATEIOORI3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField20: TppField
      FieldAlias = 'VLRORCADO4'
      FieldName = 'VLRORCADO4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField21: TppField
      FieldAlias = 'VLRRATEIOORI4'
      FieldName = 'VLRRATEIOORI4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField22: TppField
      FieldAlias = 'VLRORCADO5'
      FieldName = 'VLRORCADO5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField23: TppField
      FieldAlias = 'VLRRATEIOORI5'
      FieldName = 'VLRRATEIOORI5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField24: TppField
      FieldAlias = 'VLRORCADO6'
      FieldName = 'VLRORCADO6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField25: TppField
      FieldAlias = 'VLRRATEIOORI6'
      FieldName = 'VLRRATEIOORI6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField26: TppField
      FieldAlias = 'VLRORCADO7'
      FieldName = 'VLRORCADO7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField27: TppField
      FieldAlias = 'VLRRATEIOORI7'
      FieldName = 'VLRRATEIOORI7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField28: TppField
      FieldAlias = 'VLRORCADO8'
      FieldName = 'VLRORCADO8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField29: TppField
      FieldAlias = 'VLRRATEIOORI8'
      FieldName = 'VLRRATEIOORI8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField30: TppField
      FieldAlias = 'VLRORCADO9'
      FieldName = 'VLRORCADO9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField31: TppField
      FieldAlias = 'VLRRATEIOORI9'
      FieldName = 'VLRRATEIOORI9'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField32: TppField
      FieldAlias = 'VLRORCADO10'
      FieldName = 'VLRORCADO10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField33: TppField
      FieldAlias = 'VLRRATEIOORI10'
      FieldName = 'VLRRATEIOORI10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField34: TppField
      FieldAlias = 'VLRORCADO11'
      FieldName = 'VLRORCADO11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField35: TppField
      FieldAlias = 'VLRRATEIOORI11'
      FieldName = 'VLRRATEIOORI11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField36: TppField
      FieldAlias = 'VLRORCADO12'
      FieldName = 'VLRORCADO12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField37: TppField
      FieldAlias = 'VLRRATEIOORI12'
      FieldName = 'VLRRATEIOORI12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField38: TppField
      FieldAlias = 'VLRORCADOTOTAL'
      FieldName = 'VLRORCADOTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField39: TppField
      FieldAlias = 'VLRRATORITOTAL'
      FieldName = 'VLRRATORITOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField40: TppField
      FieldAlias = 'FLGATIVA'
      FieldName = 'FLGATIVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField41: TppField
      FieldAlias = 'ATIVO'
      FieldName = 'ATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField42: TppField
      FieldAlias = 'NOMECRITERIO'
      FieldName = 'NOMECRITERIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField43: TppField
      FieldAlias = 'UNECODIGO'
      FieldName = 'UNECODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField44: TppField
      FieldAlias = 'NOMEATIV'
      FieldName = 'NOMEATIV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField45: TppField
      FieldAlias = 'NOMECR'
      FieldName = 'NOMECR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField46: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField47: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField48: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField49: TppField
      FieldAlias = 'IDPLANOTRABALHO'
      FieldName = 'IDPLANOTRABALHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField50: TppField
      FieldAlias = 'NOMEPLANOTRABALHO'
      FieldName = 'NOMEPLANOTRABALHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField51: TppField
      FieldAlias = 'PRIORIDADE'
      FieldName = 'PRIORIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField52: TppField
      FieldAlias = 'OBJETIVO'
      FieldName = 'OBJETIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField53: TppField
      FieldAlias = 'NECESSIDADE'
      FieldName = 'NECESSIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField54: TppField
      FieldAlias = 'BENEFESPERADO'
      FieldName = 'BENEFESPERADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField55: TppField
      FieldAlias = 'CONSEQNAOATEND'
      FieldName = 'CONSEQNAOATEND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField56: TppField
      FieldAlias = 'EXERCICIOINI'
      FieldName = 'EXERCICIOINI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField57: TppField
      FieldAlias = 'EXERCICIOFIM'
      FieldName = 'EXERCICIOFIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object pplRateioPlanoTrabalhoppField58: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
  end
  object sqlRateioPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT C.CODCENTROCUSTO, CC.NOME AS NOMECC, C.FLGSINALCONTA,'
      '       C.IDCONTAORCAMEN, C.IDPLANOORCAMEN,'
      '       C.NOMECONTAORCAMEN,'
      '       S.EXERCICIO, S.IDCRITERIORATORC, S.IDPESSOA,'
      '       C.CODCENTRORESPON, C.UNIDNEGOC,'
      '       C.IDPLANOPREV, C.IDPATRO,'
      '       SUM(NVL(S.VLRORCADO1,0)) AS VLRORCADO1,'
      '       SUM(NVL(S.VLRRATEIOORI1,0)) AS VLRRATEIOORI1,'
      '       SUM(NVL(S.VLRORCADO2,0)) AS VLRORCADO2,'
      '       SUM(NVL(S.VLRRATEIOORI2,0)) AS VLRRATEIOORI2,'
      '       SUM(NVL(S.VLRORCADO3,0)) AS VLRORCADO3,'
      '       SUM(NVL(S.VLRRATEIOORI3,0)) AS VLRRATEIOORI3,'
      '       SUM(NVL(S.VLRORCADO4,0)) AS VLRORCADO4,'
      '       SUM(NVL(S.VLRRATEIOORI4,0)) AS VLRRATEIOORI4,'
      '       SUM(NVL(S.VLRORCADO5,0)) AS VLRORCADO5,'
      '       SUM(NVL(S.VLRRATEIOORI5,0)) AS VLRRATEIOORI5,'
      '       SUM(NVL(S.VLRORCADO6,0)) AS VLRORCADO6,'
      '       SUM(NVL(S.VLRRATEIOORI6,0)) AS VLRRATEIOORI6,'
      '       SUM(NVL(S.VLRORCADO7,0)) AS VLRORCADO7,'
      '       SUM(NVL(S.VLRRATEIOORI7,0)) AS VLRRATEIOORI7,'
      '       SUM(NVL(S.VLRORCADO8,0)) AS VLRORCADO8,'
      '       SUM(NVL(S.VLRRATEIOORI8,0)) AS VLRRATEIOORI8,'
      '       SUM(NVL(S.VLRORCADO9,0)) AS VLRORCADO9,'
      '       SUM(NVL(S.VLRRATEIOORI9,0)) AS VLRRATEIOORI9,'
      '       SUM(NVL(S.VLRORCADO10,0)) AS VLRORCADO10,'
      '       SUM(NVL(S.VLRRATEIOORI10,0)) AS VLRRATEIOORI10,'
      '       SUM(NVL(S.VLRORCADO11,0)) AS VLRORCADO11,'
      '       SUM(NVL(S.VLRRATEIOORI11,0)) AS VLRRATEIOORI11,'
      '       SUM(NVL(S.VLRORCADO12,0)) AS VLRORCADO12,'
      '       SUM(NVL(S.VLRRATEIOORI12,0)) AS VLRRATEIOORI12,'
      
        '       NVL(SUM(S.VLRORCADO1+S.VLRORCADO2+S.VLRORCADO3+S.VLRORCAD' +
        'O4+S.VLRORCADO5+S.VLRORCADO6+S.VLRORCADO7+'
      
        '       S.VLRORCADO8+S.VLRORCADO9+S.VLRORCADO10+S.VLRORCADO11+S.V' +
        'LRORCADO12),0) AS VLRORCADOTOTAL,'
      
        '       NVL(SUM(S.VLRRATEIOORI1+S.VLRRATEIOORI2+S.VLRRATEIOORI3+S' +
        '.VLRRATEIOORI4+S.VLRRATEIOORI5+S.VLRRATEIOORI6+'
      
        '       S.VLRRATEIOORI7+S.VLRRATEIOORI8+S.VLRRATEIOORI9+S.VLRRATE' +
        'IOORI10+S.VLRRATEIOORI11+S.VLRRATEIOORI12),0) AS VLRRATORITOTAL,'
      '       C.FLGATIVA, CC.ATIVO, CO.DESCRICAO AS NOMECRITERIO,'
      '       U.UNECODIGO, U.NOME AS NOMEATIV,'
      '       CR.NOME AS NOMECR, G.NOMEGRUPOORCAMEN,'
      '       P.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANO,'
      '       O.IDPLANOTRABALHO, O.DESCRICAO AS NOMEPLANOTRABALHO,'
      
        '       DECODE(O.PRIORIDADE,'#39'A'#39','#39' ALTA'#39',DECODE(O.PRIORIDADE,'#39'B'#39','#39 +
        'BAIXA'#39','#39'MEDIA'#39')) AS PRIORIDADE, O.OBJETIVO, O.NECESSIDADE,'
      
        '       O.BENEFESPERADO, O.CONSEQNAOATEND, O.EXERCICIOINI, O.EXER' +
        'CICIOFIM, G.CODGRUPOORC'
      'FROM'
      '('
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '        SUM(S.VLRORCADO) AS VLRORCADO1,'
      '        SUM(S.VLRRATEIOORI) AS VLRRATEIOORI1,'
      '        (0) AS VLRORCADO2,'
      '        (0) AS VLRRATEIOORI2,'
      '        (0) AS VLRORCADO3,'
      '        (0) AS VLRRATEIOORI3,'
      '        (0) AS VLRORCADO4,'
      '        (0) AS VLRRATEIOORI4,'
      '        (0) AS VLRORCADO5,'
      '        (0) AS VLRRATEIOORI5,'
      '        (0) AS VLRORCADO6,'
      '        (0) AS VLRRATEIOORI6,'
      '        (0) AS VLRORCADO7,'
      '        (0) AS VLRRATEIOORI7,'
      '        (0) AS VLRORCADO8,'
      '        (0) AS VLRRATEIOORI8,'
      '        (0) AS VLRORCADO9,'
      '        (0) AS VLRRATEIOORI9,'
      '        (0) AS VLRORCADO10,'
      '        (0) AS VLRRATEIOORI10,'
      '        (0) AS VLRORCADO11,'
      '        (0) AS VLRRATEIOORI11,'
      '        (0) AS VLRORCADO12,'
      '        (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 1)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             SUM(S.VLRORCADO) AS VLRORCADO2,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 2)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             SUM(S.VLRORCADO) AS VLRORCADO3,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 3)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             SUM(S.VLRORCADO) AS VLRORCADO4,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 4)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             SUM(S.VLRORCADO) AS VLRORCADO5,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 5)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             SUM(S.VLRORCADO) AS VLRORCADO6,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 6)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             SUM(S.VLRORCADO) AS VLRORCADO7,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 7)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             SUM(S.VLRORCADO) AS VLRORCADO8,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 8)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             SUM(S.VLRORCADO) AS VLRORCADO9,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 9)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             SUM(S.VLRORCADO) AS VLRORCADO10,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 10)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             SUM(S.VLRORCADO) AS VLRORCADO11,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI11,'
      '             (0) AS VLRORCADO12,'
      '             (0) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 11)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      'UNION ALL'
      
        '(SELECT S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.IDP' +
        'LANOORCAMEN, S.IDPESSOA,'
      '             (0) AS VLRORCADO1,'
      '             (0) AS VLRRATEIOORI1,'
      '             (0) AS VLRORCADO2,'
      '             (0) AS VLRRATEIOORI2,'
      '             (0) AS VLRORCADO3,'
      '             (0) AS VLRRATEIOORI3,'
      '             (0) AS VLRORCADO4,'
      '             (0) AS VLRRATEIOORI4,'
      '             (0) AS VLRORCADO5,'
      '             (0) AS VLRRATEIOORI5,'
      '             (0) AS VLRORCADO6,'
      '             (0) AS VLRRATEIOORI6,'
      '             (0) AS VLRORCADO7,'
      '             (0) AS VLRRATEIOORI7,'
      '             (0) AS VLRORCADO8,'
      '             (0) AS VLRRATEIOORI8,'
      '             (0) AS VLRORCADO9,'
      '             (0) AS VLRRATEIOORI9,'
      '             (0) AS VLRORCADO10,'
      '             (0) AS VLRRATEIOORI10,'
      '             (0) AS VLRORCADO11,'
      '             (0) AS VLRRATEIOORI11,'
      '             SUM(S.VLRORCADO) AS VLRORCADO12,'
      '             SUM(S.VLRRATEIOORI) AS VLRRATEIOORI12'
      'FROM SALDOORCADO S'
      'WHERE (S.PERIODO = 12)'
      
        'GROUP BY S.EXERCICIO, S.IDCRITERIORATORC, S.IDCONTAORCAMEN, S.ID' +
        'PLANOORCAMEN, S.IDPESSOA)'
      '    ) S,'
      '   CONTASORCAMEN C, CENTCUST CC,'
      '   PLANOTRABALHOORC O, CENTRESPON CR, UNIDNEGOCIO U,'
      '   CRITERIORATORC  CO, GRUPOORCAMEN G, PESSOA P,'
      '   PLANPREVCONTABIL PP'
      'WHERE (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN)'
      '  AND (S.IDCRITERIORATORC IS NOT NULL)'
      '  AND (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN)'
      '  AND (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      '  AND (C.CODCENTROCUSTO = CC.CODCENTROCUSTO)'
      '  AND (C.IDEMPRESA = CC.IDEMPRESA)'
      '  AND (C.UNIDNEGOC = U.UNIDNEGOC(+))'
      '  AND (C.IDPESSOA = U.IDPESSOA(+))'
      '  AND (C.IDPATRO = P.IDPESSOA(+))'
      '  AND (S.IDCRITERIORATORC= CO.IDCRITERIORATORC(+))'
      '  AND (O.CODCENTRORESPON = CR.CODCENTRORESPON)'
      '  AND (O.IDPESSOA = CR.IDPESSOA)'
      '  AND (O.UNIDNEGOC = U.UNIDNEGOC)'
      '  AND (O.IDPESSOA = U.IDPESSOA)'
      '  AND (C.IDPLANOPREV = PP.IDPLANOPREV(+))'
      '  AND (CC.STATUSGRUPOCDC = '#39'A'#39')'
      '  AND (S.EXERCICIO >= O.EXERCICIOINI)'
      '  AND (S.EXERCICIO <= O.EXERCICIOFIM)'
      'GROUP BY C.CODCENTROCUSTO, CC.NOME, C.FLGSINALCONTA,'
      '   C.IDCONTAORCAMEN, C.IDPLANOORCAMEN,'
      '   C.NOMECONTAORCAMEN,'
      '   S.EXERCICIO, S.IDCRITERIORATORC,S.IDPESSOA,'
      '   C.CODCENTRORESPON, C.UNIDNEGOC,'
      '   C.IDPLANOPREV, C.IDPATRO,'
      '   C.FLGATIVA, CC.ATIVO,'
      '   U.UNECODIGO, U.NOME,'
      '   CR.NOME, G.NOMEGRUPOORCAMEN,'
      '   P.NOME, PP.NOME, CO.DESCRICAO,'
      '   O.IDPLANOTRABALHO, O.DESCRICAO,'
      '   O.PRIORIDADE, O.OBJETIVO, O.NECESSIDADE,'
      
        '   O.BENEFESPERADO, O.CONSEQNAOATEND, O.EXERCICIOINI, O.EXERCICI' +
        'OFIM, G.CODGRUPOORC'
      
        'ORDER BY IDPESSOA,NOMEPLANOTRABALHO, NOMECRITERIO, NOMEGRUPOORCA' +
        'MEN,'
      '                  CODCENTROCUSTO, EXERCICIO'
      ' '
      ' ')
    ClientDataSet = CdsRateioPlanoTrabalho
    Left = 24
    Top = 68
  end
  object dtsRateioPlanoTrabalho: TDataSource
    DataSet = CdsRateioPlanoTrabalho
    Left = 112
    Top = 64
  end
  object CdsRateioPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 68
  end
  object sqlPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PT.DESCRICAO,'
      '  PT.EXERCICIOINI,'
      '  PT.PERIODOINI,'
      '  PT.EXERCICIOFIM,'
      '  PT.PERIODOFIM,'
      '  PT.CODCENTRORESPON,'
      '  PT.OBJETIVO,'
      '  PT.UNIDNEGOC,'
      '  PT.PRIORIDADE,'
      '  CR.NOME AS NOMECR,'
      '  U.NOME AS NOMEATIV'
      'FROM'
      '  PLANOTRABALHOORC PT,'
      '  CENTRESPON CR,'
      '  UNIDNEGOCIO U'
      'WHERE'
      '  IDPLANOTRABALHO        = :IDPLANO            AND'
      '  CR.IDPESSOA       (+) = PT.IDPESSOA          AND'
      '  CR.CODCENTRORESPON(+) = PT.CODCENTRORESPON   AND'
      '  U.IDPESSOA        (+) = PT.IDPESSOA          AND'
      '  U.UNIDNEGOC       (+) = PT.UNIDNEGOC')
    ClientDataSet = CdsPlanoTrabalho
    Left = 24
    Top = 112
  end
  object CdsPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 112
  end
  object sqlCenario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  C.NOMECENARIO'
      'FROM'
      '  CENARIOORCAMEN C'
      'WHERE'
      '  C.IDCENARIOORCAMEN = :IDCENARIO')
    ClientDataSet = cdsCenario
    Left = 24
    Top = 216
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 216
  end
  object sqlCriterio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO'
      'FROM'
      '  CRITERIORATORC'
      'WHERE'
      '  IDCRITERIORATORC = :IDCRITERIO')
    ClientDataSet = CdsCriterio
    Left = 24
    Top = 184
  end
  object CdsCriterio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 184
  end
  object sqlGrupoOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NOMEGRUPOORCAMEN'
      'FROM'
      '  GRUPOORCAMEN'
      'WHERE'
      '  IDGRUPOORCAMEN = :IDGRUPO')
    ClientDataSet = CdsGrupoOrcamen
    Left = 24
    Top = 144
  end
  object CdsGrupoOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 144
  end
  object sqlPlanoPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  PLANPREVCONTABIL'
      'WHERE'
      '  IDPLANOPREV = :IDPLANO')
    ClientDataSet = CdsPlanoPrev
    Left = 24
    Top = 248
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 248
  end
  object sqlCentroCusto: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  NOME'
      'FROM'
      '  CENTCUST'
      'WHERE'
      '  CODCENTROCUSTO = :IDCENTRO')
    ClientDataSet = CdsCentroCusto
    Left = 124
    Top = 248
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 164
    Top = 248
  end
end
