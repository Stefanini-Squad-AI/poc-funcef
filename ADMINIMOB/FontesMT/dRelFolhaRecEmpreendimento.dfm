inherited dtmRelFolhaRecEmpreendimento: TdtmRelFolhaRecEmpreendimento
  Left = 106
  Top = 149
  Width = 354
  Height = 172
  Caption = 'dtmRelFolhaRecEmpreendimento'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'IdImovelMestre'
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
        Name = 'IdImovelMestre'
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
        Caption = 'IdContratoImovel'
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
        Name = 'IdContratoImovel'
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
        Caption = 'sCodTipoImovel'
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
        Name = 'sCodTipoImovel'
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
        Caption = 'dAnoComp'
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
        Name = 'dAnoComp'
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
        Caption = 'dMesComp'
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
        Name = 'dMesComp'
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
        Caption = 'dVencInicial'
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
        Name = 'dVencInicial'
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
        Caption = 'dVencFinal'
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
        Name = 'dVencFinal'
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
        Caption = 'IdModulo'
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
        Name = 'IdModulo'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptFolhaRecEmpreendimento
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  object rptFolhaRecEmpreendimento: TppReport
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
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 248
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
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
        mmTop = 1588
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Folha de Receitas por Empreendimento - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
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
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 16404
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 17198
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Nome Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 32544
        mmTop = 17198
        mmWidth = 73554
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 116681
        mmTop = 17198
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Aluguel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 147109
        mmTop = 17198
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'IPTU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 173038
        mmTop = 17198
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 198967
        mmTop = 17198
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Outras Receitas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 224896
        mmTop = 17198
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 253471
        mmTop = 17198
        mmWidth = 25400
        BandType = 0
      end
    end
    object ppDBandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'ShapeResumoFolha1'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CONNUMERO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 794
        mmWidth = 21430
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CONNOME'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 32545
        mmTop = 794
        mmWidth = 73554
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 116680
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText101'
        DataField = 'VLR_ALUGUEL'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 147109
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_IPTU'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 173038
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLR_SEGURO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 198966
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLR_OUTRO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 224897
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_TOTAL'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 253471
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 65617
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 1323
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243682
        mmTop = 1323
        mmWidth = 35454
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 265
        mmLeft = 0
        mmTop = 5819
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppSResumoSegmento: TppSubReport
        UserName = 'lResumoSegmento'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplResumoSegmento'
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppCResumoSegmento: TppChildReport
          AutoStop = False
          DataPipeline = pplResumoSegmento
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 13229
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 13229
          PrinterSetup.mmPaperHeight = 210080
          PrinterSetup.mmPaperWidth = 297128
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Left = 344
          Top = 208
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplResumoSegmento'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 9260
            mmPrintPosition = 0
            object ppLabel193: TppLabel
              UserName = 'Label193'
              Caption = 'Resumo Geral '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 5027
              mmLeft = 0
              mmTop = 1852
              mmWidth = 29898
              BandType = 1
            end
            object ppLine46: TppLine
              UserName = 'Line46'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 2117
              mmLeft = 0
              mmTop = 0
              mmWidth = 283898
              BandType = 1
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              Pen.Width = 3
              ParentWidth = True
              Weight = 2.25
              mmHeight = 265
              mmLeft = 0
              mmTop = 8996
              mmWidth = 283898
              BandType = 1
            end
          end
          object ppDetailBand11: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppShapeResumoFolha: TppShape
              OnPrint = ppsCorPrint
              UserName = 'ShapeResumoFolha'
              Brush.Color = 13040076
              ParentHeight = True
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 283898
              BandType = 4
            end
            object ppDBText87: TppDBText
              UserName = 'DBText87'
              DataField = 'DESCTIPOIMOVEL'
              DataPipeline = pplResumoSegmento
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'pplResumoSegmento'
              mmHeight = 3440
              mmLeft = 7938
              mmTop = 265
              mmWidth = 65352
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'VLR_ALUGUEL'
              DataPipeline = pplResumoSegmento
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplResumoSegmento'
              mmHeight = 3440
              mmLeft = 147638
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'VLR_IPTU'
              DataPipeline = pplResumoSegmento
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplResumoSegmento'
              mmHeight = 3440
              mmLeft = 173567
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'VLR_SEGURO'
              DataPipeline = pplResumoSegmento
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplResumoSegmento'
              mmHeight = 3440
              mmLeft = 199496
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'VLR_OUTRO'
              DataPipeline = pplResumoSegmento
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplResumoSegmento'
              mmHeight = 3440
              mmLeft = 225425
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'VLR_TOTAL'
              DataPipeline = pplResumoSegmento
              DisplayFormat = '###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplResumoSegmento'
              mmHeight = 3440
              mmLeft = 254001
              mmTop = 265
              mmWidth = 25400
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppRegion2: TppRegion
              UserName = 'Region2'
              mmHeight = 6085
              mmLeft = 111654
              mmTop = 2910
              mmWidth = 170127
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'Total da Carteira: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3387
                mmLeft = 121168
                mmTop = 4233
                mmWidth = 24088
                BandType = 7
              end
              object ppDBCalc6: TppDBCalc
                UserName = 'DBCalc6'
                DataField = 'VLR_ALUGUEL'
                DataPipeline = pplResumoSegmento
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplResumoSegmento'
                mmHeight = 3440
                mmLeft = 147902
                mmTop = 4233
                mmWidth = 25400
                BandType = 7
              end
              object ppDBCalc7: TppDBCalc
                UserName = 'DBCalc7'
                DataField = 'VLR_IPTU'
                DataPipeline = pplResumoSegmento
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplResumoSegmento'
                mmHeight = 3440
                mmLeft = 173831
                mmTop = 4233
                mmWidth = 25400
                BandType = 7
              end
              object ppDBCalc8: TppDBCalc
                UserName = 'DBCalc8'
                DataField = 'VLR_OUTRO'
                DataPipeline = pplResumoSegmento
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplResumoSegmento'
                mmHeight = 3440
                mmLeft = 225689
                mmTop = 4233
                mmWidth = 25400
                BandType = 7
              end
              object ppDBCalc9: TppDBCalc
                UserName = 'DBCalc9'
                DataField = 'VLR_SEGURO'
                DataPipeline = pplResumoSegmento
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplResumoSegmento'
                mmHeight = 3440
                mmLeft = 199760
                mmTop = 4233
                mmWidth = 25400
                BandType = 7
              end
              object ppDBCalc10: TppDBCalc
                UserName = 'DBCalc10'
                DataField = 'VLR_TOTAL'
                DataPipeline = pplResumoSegmento
                DisplayFormat = '###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'pplResumoSegmento'
                mmHeight = 3440
                mmLeft = 254000
                mmTop = 4233
                mmWidth = 25400
                BandType = 7
              end
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 0
              mmWidth = 283898
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppRegion3: TppRegion
          UserName = 'Region3'
          mmHeight = 6085
          mmLeft = 102659
          mmTop = 5821
          mmWidth = 180182
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel16: TppLabel
            UserName = 'Label16'
            Caption = 'Total Geral: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 105039
            mmTop = 7143
            mmWidth = 39952
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc11: TppDBCalc
            UserName = 'DBCalc11'
            DataField = 'VLR_ALUGUEL'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 147373
            mmTop = 7143
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc12: TppDBCalc
            UserName = 'DBCalc12'
            DataField = 'VLR_IPTU'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 173302
            mmTop = 7143
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc13: TppDBCalc
            UserName = 'DBCalc13'
            DataField = 'VLR_OUTRO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 225161
            mmTop = 7143
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc14: TppDBCalc
            UserName = 'DBCalc14'
            DataField = 'VLR_SEGURO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 199232
            mmTop = 7143
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc15: TppDBCalc
            UserName = 'DBCalc15'
            DataField = 'VLR_TOTAL'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 253736
            mmTop = 7143
            mmWidth = 25400
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDIMOVELMESTRE'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOME_MESTRE'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 4763
          mmLeft = 794
          mmTop = 1058
          mmWidth = 71438
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 7408
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 6085
          mmLeft = 102659
          mmTop = 1588
          mmWidth = 180182
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel11: TppLabel
            UserName = 'Label9'
            Caption = 'Total do Empreendimento: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 105040
            mmTop = 2911
            mmWidth = 39952
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc2: TppDBCalc
            UserName = 'DBCalc2'
            DataField = 'VLR_ALUGUEL'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 147109
            mmTop = 2911
            mmWidth = 25400
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc1: TppDBCalc
            UserName = 'DBCalc1'
            DataField = 'VLR_IPTU'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 173038
            mmTop = 2911
            mmWidth = 25400
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc3: TppDBCalc
            UserName = 'DBCalc3'
            DataField = 'VLR_OUTRO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 224896
            mmTop = 2910
            mmWidth = 25400
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc4: TppDBCalc
            UserName = 'DBCalc4'
            DataField = 'VLR_SEGURO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 198967
            mmTop = 2911
            mmWidth = 25400
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc5: TppDBCalc
            UserName = 'DBCalc5'
            DataField = 'VLR_TOTAL'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 253471
            mmTop = 2911
            mmWidth = 25400
            BandType = 5
            GroupNo = 1
          end
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 192
    Top = 72
    object pplppField1: TppField
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplppField2: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplppField3: TppField
      FieldAlias = 'IDCONTRATOIMOVEL'
      FieldName = 'IDCONTRATOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplppField4: TppField
      FieldAlias = 'CONNUMERO'
      FieldName = 'CONNUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplppField5: TppField
      FieldAlias = 'CONNOME'
      FieldName = 'CONNOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplppField6: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplppField7: TppField
      FieldAlias = 'VLR_ALUGUEL'
      FieldName = 'VLR_ALUGUEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplppField8: TppField
      FieldAlias = 'VLR_IPTU'
      FieldName = 'VLR_IPTU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplppField9: TppField
      FieldAlias = 'VLR_SEGURO'
      FieldName = 'VLR_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplppField10: TppField
      FieldAlias = 'VLR_OUTRO'
      FieldName = 'VLR_OUTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplppField11: TppField
      FieldAlias = 'VLR_TOTAL'
      FieldName = 'VLR_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplppField12: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 73
    object cdsIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object cdsIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object cdsCONNUMERO: TStringField
      FieldName = 'CONNUMERO'
    end
    object cdsCONNOME: TStringField
      FieldName = 'CONNOME'
      Size = 60
    end
    object cdsDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object cdsVLR_ALUGUEL: TFloatField
      FieldName = 'VLR_ALUGUEL'
    end
    object cdsVLR_IPTU: TFloatField
      FieldName = 'VLR_IPTU'
    end
    object cdsVLR_SEGURO: TFloatField
      FieldName = 'VLR_SEGURO'
    end
    object cdsVLR_OUTRO: TFloatField
      FieldName = 'VLR_OUTRO'
    end
    object cdsVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object ds: TwwDataSource
    DataSet = cds
    Left = 32
    Top = 84
  end
  object CMSql: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CONT.IDIMOVELMESTRE, CONT.NOME_MESTRE, CONT.IDCONTRATOIMO' +
        'VEL, CONT.CONNUMERO,'
      '       CONT.CONNOME, CONT.DATAVENCIMENTO, CONT.IDPESSOA,'
      '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL,'
      '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU,'
      '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO,'
      '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO,'
      
        '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+SUM(NVL(IPTU.VLR_IPTU,0))' +
        '+SUM(NVL(SEGURO.VLR_SEGURO,0))+SUM(NVL(OUTRO.VLR_OUTRO,0)) AS VL' +
        'R_TOTAL'
      
        '  FROM ( SELECT I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, LI.' +
        'IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,C.CONNUMERO, C.CONNOME, LI.I' +
        'DPESSOA'
      
        '           FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVE' +
        'L C, IMOVEL I, IMOVEL IM'
      '          WHERE ( LI.RECPAG = '#39'R'#39' )'
      '            AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '            AND ( LI.IDIMOVEL = I.IDIMOVEL )'
      '            AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL )'
      '            AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '            AND ( LI.MESCOMPETENCIA = 1 )'
      '            AND ( LI.ANOCOMPETENCIA = 2006 )'
      '            AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      
        '          GROUP BY I.IDIMOVELMESTRE, IM.IMONOME, LI.IDCONTRATOIM' +
        'OVEL, LI.DATAVENCIMENTO, C.CONNUMERO, C.CONNOME, LI.IDPESSOA'
      '       ) CONT,'
      '       ('
      
        '         SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO,'
      
        '                (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC' +
        '),0)) AS VLR_ALUGUEL'
      
        '           FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVE' +
        'L C, '
      
        '                ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS T' +
        'OT_DESC'
      '                    FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '                   WHERE A.CODALTERADOR = T.CODALTERADOR'
      '                     AND T.ACRESDECRES  = '#39'C'#39
      '                   GROUP BY IDDOCUMENTO ) DE'
      '          WHERE ( LI.RECPAG = '#39'R'#39' )'
      '            AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '            AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '            AND ( LI.MESCOMPETENCIA = 1 )'
      '            AND ( LI.ANOCOMPETENCIA = 2006 )'
      '            AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '            AND ( LI.IDDOCUMENTO = DE.IDDOCUMENTO(+) )'
      
        '            AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.ID' +
        'TIPOCUSTORECIMO'
      
        '                                              FROM PROCESSOIMOB ' +
        'P, ITEMXPROCESSOIMOB I'
      
        '                                             WHERE P.IDPROCESSOI' +
        'MOB = I.IDPROCESSOIMOB'
      
        '                                               AND P.IDREPORTS  ' +
        ' = 20340  /* idReport */'
      
        '                                               AND P.TIPOINTERNO' +
        ' = 1      /* Aluguel */'
      
        '                                               AND P.IDMODULO   ' +
        ' = 64     /* uSistema.IdModulo */'
      '                                           ) )'
      
        '          GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.ID' +
        'DOCUMENTO '
      '       ) ALUGUEL,'
      '       ('
      
        '         SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO,'
      
        '                (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC' +
        '),0)) AS VLR_IPTU'
      
        '           FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVE' +
        'L C, '
      
        '                ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS T' +
        'OT_DESC'
      '                    FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '                   WHERE A.CODALTERADOR = T.CODALTERADOR'
      '                     AND T.ACRESDECRES  = '#39'C'#39
      '                   GROUP BY IDDOCUMENTO ) DE'
      '          WHERE ( LI.RECPAG = '#39'R'#39' )'
      '            AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '            AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '            AND ( LI.MESCOMPETENCIA = 1 )'
      '            AND ( LI.ANOCOMPETENCIA = 2006 )'
      '            AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '            AND ( LI.IDDOCUMENTO = DE.IDDOCUMENTO(+) )'
      
        '            AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.ID' +
        'TIPOCUSTORECIMO'
      
        '                                              FROM PROCESSOIMOB ' +
        'P, ITEMXPROCESSOIMOB I'
      
        '                                             WHERE P.IDPROCESSOI' +
        'MOB = I.IDPROCESSOIMOB'
      
        '                                               AND P.IDREPORTS  ' +
        ' = 20340  /* idReport */'
      
        '                                               AND P.TIPOINTERNO' +
        ' = 2      /* IPTU */'
      
        '                                               AND P.IDMODULO   ' +
        ' = 64     /* uSistema.IdModulo */'
      '                                           ) )'
      
        '          GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,  LI.I' +
        'DDOCUMENTO '
      '       ) IPTU,'
      '       ('
      
        '         SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO, '
      
        '                (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC' +
        '),0)) AS VLR_SEGURO'
      
        '           FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVE' +
        'L C, '
      
        '                ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS T' +
        'OT_DESC'
      '                    FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '                   WHERE A.CODALTERADOR = T.CODALTERADOR'
      '                     AND T.ACRESDECRES  = '#39'C'#39
      '                   GROUP BY IDDOCUMENTO ) DE'
      '          WHERE ( LI.RECPAG = '#39'R'#39' )'
      '            AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '            AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '            AND ( LI.MESCOMPETENCIA = 1 )'
      '            AND ( LI.ANOCOMPETENCIA = 2006 )'
      '            AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '            AND ( LI.IDDOCUMENTO = DE.IDDOCUMENTO(+) )'
      
        '            AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.ID' +
        'TIPOCUSTORECIMO'
      
        '                                              FROM PROCESSOIMOB ' +
        'P, ITEMXPROCESSOIMOB I'
      
        '                                             WHERE P.IDPROCESSOI' +
        'MOB = I.IDPROCESSOIMOB'
      
        '                                               AND P.IDREPORTS  ' +
        ' = 20340  /* idReport */'
      
        '                                               AND P.TIPOINTERNO' +
        ' = 3      /* Seguro */'
      
        '                                               AND P.IDMODULO   ' +
        ' = 64     /* uSistema.IdModulo */'
      '                                           ) )'
      
        '          GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.ID' +
        'DOCUMENTO '
      '       ) SEGURO,'
      '       ('
      
        '         SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO,'
      
        '                (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC' +
        '),0)) AS VLR_OUTRO'
      
        '           FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVE' +
        'L C, '
      
        '                ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS T' +
        'OT_DESC'
      '                    FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '                   WHERE A.CODALTERADOR = T.CODALTERADOR'
      '                     AND T.ACRESDECRES  = '#39'C'#39
      '                   GROUP BY IDDOCUMENTO ) DE'
      '          WHERE ( LI.RECPAG = '#39'R'#39' )'
      '            AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '            AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '            AND ( LI.MESCOMPETENCIA = 1 )'
      '            AND ( LI.ANOCOMPETENCIA = 2006 )'
      '            AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '            AND ( LI.IDDOCUMENTO = DE.IDDOCUMENTO(+) )'
      
        '            AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT ' +
        'I.IDTIPOCUSTORECIMO'
      
        '                                                  FROM PROCESSOI' +
        'MOB P, ITEMXPROCESSOIMOB I'
      
        '                                                 WHERE P.IDPROCE' +
        'SSOIMOB = I.IDPROCESSOIMOB'
      
        '                                                   AND P.IDREPOR' +
        'TS   = 20340   /* idReport */'
      
        '                                                   AND P.TIPOINT' +
        'ERNO IN(1,2,3) /* Outras Receitas */'
      
        '                                                   AND P.IDMODUL' +
        'O    = 64      /* uSistema.IdModulo */'
      '                                               ) )'
      
        '          GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.ID' +
        'DOCUMENTO'
      '       ) OUTRO'
      ' WHERE CONT.IDCONTRATOIMOVEL = ALUGUEL.IDCONTRATOIMOVEL(+)'
      '   AND CONT.DATAVENCIMENTO   = ALUGUEL.DATAVENCIMENTO(+)'
      '   AND CONT.IDCONTRATOIMOVEL = IPTU.IDCONTRATOIMOVEL(+)'
      '   AND CONT.DATAVENCIMENTO   = IPTU.DATAVENCIMENTO(+)'
      '   AND CONT.IDCONTRATOIMOVEL = SEGURO.IDCONTRATOIMOVEL(+)'
      '   AND CONT.DATAVENCIMENTO   = SEGURO.DATAVENCIMENTO(+)'
      '   AND CONT.IDCONTRATOIMOVEL = OUTRO.IDCONTRATOIMOVEL(+)'
      '   AND CONT.DATAVENCIMENTO   = OUTRO.DATAVENCIMENTO(+)'
      
        ' GROUP BY CONT.NOME_MESTRE, CONT.IDIMOVELMESTRE, CONT.IDCONTRATO' +
        'IMOVEL, CONT.CONNUMERO,'
      '          CONT.CONNOME, CONT.DATAVENCIMENTO, CONT.IDPESSOA'
      
        'ORDER BY NOME_MESTRE, IDIMOVELMESTRE, CONNUMERO, IDCONTRATOIMOVE' +
        'L, DATAVENCIMENTO'
      ''
      ' ')
    Left = 38
    Top = 95
  end
  object cdsResumoSegmento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 73
    object cdsResumoSegmentoCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsResumoSegmentoDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object cdsResumoSegmentoVLR_ALUGUEL: TFloatField
      FieldName = 'VLR_ALUGUEL'
    end
    object cdsResumoSegmentoVLR_IPTU: TFloatField
      FieldName = 'VLR_IPTU'
    end
    object cdsResumoSegmentoVLR_SEGURO: TFloatField
      FieldName = 'VLR_SEGURO'
    end
    object cdsResumoSegmentoVLR_OUTRO: TFloatField
      FieldName = 'VLR_OUTRO'
    end
    object cdsResumoSegmentoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
  end
  object dsResumoSegmento: TwwDataSource
    DataSet = cdsResumoSegmento
    Left = 112
    Top = 84
  end
  object CMSqlRSeg: TCMSqlParams
    SQL.Strings = (
      'SELECT CONT.CODTIPIMOVEL, CONT.DESCTIPOIMOVEL,'
      '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL,'
      '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU,'
      '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO,'
      '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO,'
      
        '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+SUM(NVL(IPTU.VLR_IPTU,0))' +
        '+'
      
        '       SUM(NVL(SEGURO.VLR_SEGURO,0))+SUM(NVL(OUTRO.VLR_OUTRO,0))' +
        ' AS VLR_TOTAL'
      
        'FROM ( SELECT I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, LI.ID' +
        'CONTRATOIMOVEL,'
      
        '              LI.DATAVENCIMENTO, C.CONNUMERO, C.CONNOME, LI.MESC' +
        'OMPETENCIA,'
      
        '              LI.ANOCOMPETENCIA, LI.CODTIPIMOVEL, T.DESCTIPOIMOV' +
        'EL'
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I, IMOVEL IM,'
      '            TIPOIMOVEL T'
      '       WHERE ( LI.RECPAG           = '#39'R'#39' )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL )'
      '         AND ( C.FLGTIPOCONTRATO   = '#39'L'#39' )'
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) )'
      '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) )'
      
        '       GROUP BY I.IDIMOVELMESTRE, IM.IMONOME, LI.IDCONTRATOIMOVE' +
        'L, LI.DATAVENCIMENTO,'
      
        '                C.CONNUMERO, C.CONNOME, LI.MESCOMPETENCIA, LI.AN' +
        'OCOMPETENCIA,'
      '                LI.CODTIPIMOVEL, T.DESCTIPOIMOVEL ) CONT,'
      ''
      
        '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUM' +
        'ENTO, T.DESCTIPOIMOVEL,'
      
        '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0' +
        ')) AS VLR_ALUGUEL'
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I, IMOVEL IM,'
      '            TIPOIMOVEL T,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DES' +
        'C'
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '            WHERE A.CODALTERADOR = T.CODALTERADOR'
      '              AND T.ACRESDECRES  = '#39'C'#39
      '            GROUP BY IDDOCUMENTO ) DE'
      '       WHERE ( LI.RECPAG           = '#39'R'#39' )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL )'
      '         AND ( C.FLGTIPOCONTRATO   = '#39'L'#39' )'
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) )'
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) )'
      '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIP' +
        'OCUSTORECIMO /**/'
      
        '                                         FROM PROCESSOIMOB P, IT' +
        'EMXPROCESSOIMOB I'
      
        '                                         WHERE P.IDPROCESSOIMOB ' +
        '= I.IDPROCESSOIMOB'
      
        '                                           AND P.IDREPORTS      ' +
        '= 20340'
      
        '                                           AND P.TIPOINTERNO    ' +
        '= 1 /* Aluguel */'
      
        '                                           AND P.IDMODULO       ' +
        '= 64 ) )'
      
        '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO,'
      '                T.DESCTIPOIMOVEL ) ALUGUEL,'
      ''
      
        '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUM' +
        'ENTO, T.DESCTIPOIMOVEL,'
      
        '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0' +
        ')) AS VLR_IPTU'
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I, IMOVEL IM,'
      '            TIPOIMOVEL T,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DES' +
        'C'
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '            WHERE A.CODALTERADOR = T.CODALTERADOR'
      '              AND T.ACRESDECRES  = '#39'C'#39
      '            GROUP BY IDDOCUMENTO ) DE'
      '       WHERE ( LI.RECPAG           = '#39'R'#39' )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL )'
      '         AND ( C.FLGTIPOCONTRATO   = '#39'L'#39' )'
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) )'
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) )'
      '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIP' +
        'OCUSTORECIMO'
      
        '                                         FROM PROCESSOIMOB P, IT' +
        'EMXPROCESSOIMOB I'
      
        '                                         WHERE P.IDPROCESSOIMOB ' +
        '= I.IDPROCESSOIMOB'
      
        '                                           AND P.IDREPORTS   = 2' +
        '0340'
      
        '                                           AND P.TIPOINTERNO = 2' +
        ' /* IPTU */'
      
        '                                           AND P.IDMODULO    = 6' +
        '4 ) )'
      
        '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,  LI.IDDO' +
        'CUMENTO,'
      '                T.DESCTIPOIMOVEL ) IPTU,'
      ''
      
        '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUM' +
        'ENTO, T.DESCTIPOIMOVEL,'
      
        '            (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)' +
        ') AS VLR_SEGURO'
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I, IMOVEL IM,'
      '            TIPOIMOVEL T,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DES' +
        'C'
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '            WHERE A.CODALTERADOR = T.CODALTERADOR'
      '              AND T.ACRESDECRES  = '#39'C'#39
      '            GROUP BY IDDOCUMENTO ) DE'
      '       WHERE ( LI.RECPAG           = '#39'R'#39' )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL )'
      '         AND ( C.FLGTIPOCONTRATO   = '#39'L'#39' )'
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) )'
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) )'
      '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIP' +
        'OCUSTORECIMO'
      
        '                                         FROM PROCESSOIMOB P, IT' +
        'EMXPROCESSOIMOB I'
      
        '                                         WHERE P.IDPROCESSOIMOB ' +
        '= I.IDPROCESSOIMOB'
      
        '                                           AND P.IDREPORTS   = 2' +
        '0340'
      
        '                                           AND P.TIPOINTERNO = 3' +
        ' /* Seguro */'
      
        '                                           AND P.IDMODULO    = 6' +
        '4 ) )'
      
        '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO,'
      '                T.DESCTIPOIMOVEL ) SEGURO,'
      ''
      
        '     ( SELECT LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOCUM' +
        'ENTO, T.DESCTIPOIMOVEL,'
      
        '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0' +
        ')) AS VLR_OUTRO'
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I, IMOVEL IM,'
      '            TIPOIMOVEL T,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DES' +
        'C'
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T'
      '            WHERE A.CODALTERADOR = T.CODALTERADOR'
      '              AND T.ACRESDECRES  = '#39'C'#39
      '            GROUP BY IDDOCUMENTO ) DE'
      '       WHERE ( LI.RECPAG = '#39'R'#39' )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( I.IDIMOVELMESTRE    = IM.IDIMOVEL )'
      '         AND ( C.FLGTIPOCONTRATO   = '#39'L'#39' )'
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) )'
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) )'
      '         AND ( LI.CODTIPIMOVEL     = T.CODTIPIMOVEL(+) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT I.I' +
        'DTIPOCUSTORECIMO'
      
        '                                             FROM PROCESSOIMOB P' +
        ', ITEMXPROCESSOIMOB I'
      
        '                                             WHERE P.IDPROCESSOI' +
        'MOB = I.IDPROCESSOIMOB'
      
        '                                               AND P.IDREPORTS  ' +
        ' = 20340'
      
        '                                               AND P.TIPOINTERNO' +
        ' IN(1,2,3) /* Outras */'
      
        '                                               AND P.IDMODULO   ' +
        ' = 64 ) )'
      
        '       GROUP BY LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO, LI.IDDOC' +
        'UMENTO,'
      '                T.DESCTIPOIMOVEL ) OUTRO'
      ''
      'WHERE 1=1'
      '  AND CONT.IDCONTRATOIMOVEL = ALUGUEL.IDCONTRATOIMOVEL(+)'
      '  AND CONT.DATAVENCIMENTO   = ALUGUEL.DATAVENCIMENTO(+)'
      '  AND CONT.IDCONTRATOIMOVEL = IPTU.IDCONTRATOIMOVEL(+)'
      '  AND CONT.DATAVENCIMENTO   = IPTU.DATAVENCIMENTO(+)'
      '  AND CONT.IDCONTRATOIMOVEL = SEGURO.IDCONTRATOIMOVEL(+)'
      '  AND CONT.DATAVENCIMENTO   = SEGURO.DATAVENCIMENTO(+)'
      '  AND CONT.IDCONTRATOIMOVEL = OUTRO.IDCONTRATOIMOVEL(+)'
      '  AND CONT.DATAVENCIMENTO   = OUTRO.DATAVENCIMENTO(+)'
      'GROUP BY CONT.CODTIPIMOVEL, CONT.DESCTIPOIMOVEL'
      'ORDER BY CODTIPIMOVEL ')
    Left = 118
    Top = 95
  end
  object pplResumoSegmento: TppBDEPipeline
    DataSource = dsResumoSegmento
    UserName = 'pplResumoSegmento'
    Left = 266
    Top = 72
    object pplResumoSegmentoppField1: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplResumoSegmentoppField2: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplResumoSegmentoppField3: TppField
      FieldAlias = 'VLR_ALUGUEL'
      FieldName = 'VLR_ALUGUEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplResumoSegmentoppField4: TppField
      FieldAlias = 'VLR_IPTU'
      FieldName = 'VLR_IPTU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplResumoSegmentoppField5: TppField
      FieldAlias = 'VLR_SEGURO'
      FieldName = 'VLR_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplResumoSegmentoppField6: TppField
      FieldAlias = 'VLR_OUTRO'
      FieldName = 'VLR_OUTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplResumoSegmentoppField7: TppField
      FieldAlias = 'VLR_TOTAL'
      FieldName = 'VLR_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
end
