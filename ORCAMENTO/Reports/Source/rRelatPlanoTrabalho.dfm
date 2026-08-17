inherited rptRelatPlanoTrabalho: TrptRelatPlanoTrabalho
  Left = 395
  Top = 216
  Width = 274
  Height = 324
  Caption = 'rptRelatPlanoTrabalho'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercicio'
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
        Caption = 'Plano de Trabalho'
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
        Caption = 'Centro de Custo'
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
        Caption = 'Centro de Responsabilidade'
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
        Caption = 'Atividade  / Projeto'
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
        Caption = 'Plano Previdenciário'
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
        Caption = 'Patrocinadora'
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
        Caption = 'Cenário'
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
        Caption = 'Valores Divididos Por'
        Controle = tcSpinEdit
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
      end>
    Left = 117
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppPlanoTrabalho
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
    Left = 70
  end
  object ppPlanoTrabalho: TppReport
    AutoStop = False
    DataPipeline = pplPlanoTrabalho
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Orçamento - Plano de Trabalho'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 208
    Top = 44
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplPlanoTrabalho'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 103717
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'lblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 88371
        mmTop = 1588
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Plano de Trabalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 80433
        mmTop = 9525
        mmWidth = 41804
        BandType = 0
      end
      object ricUnidadeGestora: TppRichText
        UserName = 'ricUnidadeGestora'
        Caption = 'ricUnidadeGestora'
        mmHeight = 5027
        mmLeft = 119327
        mmTop = 29633
        mmWidth = 75692
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricAtivProj: TppRichText
        UserName = 'ricAtivProj'
        Caption = 'ricAtivProj'
        mmHeight = 5080
        mmLeft = 1524
        mmTop = 35454
        mmWidth = 194056
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricSubProjeto: TppRichText
        UserName = 'ricSubProjeto'
        Caption = 'ricSubProjeto'
        mmHeight = 5027
        mmLeft = 1524
        mmTop = 41275
        mmWidth = 111654
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricPrioridade: TppRichText
        UserName = 'ricPrioridade'
        Caption = 'ricPrioridade'
        mmHeight = 5080
        mmLeft = 115623
        mmTop = 41275
        mmWidth = 79904
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricObjetivo: TppRichText
        UserName = 'ricObjetivo'
        Caption = 'ricObjetivo'
        mmHeight = 10160
        mmLeft = 1524
        mmTop = 47096
        mmWidth = 194056
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricNecessidade: TppRichText
        UserName = 'ricNecessidade'
        Caption = 'ricNecessidade'
        mmHeight = 10160
        mmLeft = 1524
        mmTop = 64029
        mmWidth = 194056
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricBeneficio: TppRichText
        UserName = 'ricBeneficio'
        Caption = 'ricBeneficio'
        mmHeight = 10160
        mmLeft = 1524
        mmTop = 74613
        mmWidth = 194056
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricConsequencia: TppRichText
        UserName = 'ricConsequencia'
        Caption = 'ricConsequencia'
        mmHeight = 10160
        mmLeft = 1524
        mmTop = 85196
        mmWidth = 194056
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricPlanoTrabalho: TppRichText
        UserName = 'ricPlanoTrabalho'
        Caption = 'ricPlanoTrabalho'
        mmHeight = 5027
        mmLeft = 1588
        mmTop = 29633
        mmWidth = 116332
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Justificativas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 59267
        mmWidth = 21696
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 17198
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Grupo Orçamentário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 97896
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 32808
        mmTop = 97896
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 157957
        mmTop = 97896
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 183092
        mmTop = 97896
        mmWidth = 12171
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 102129
        mmWidth = 197300
        BandType = 0
      end
      object ricExercicio: TppRichText
        UserName = 'ricExercicio'
        Caption = 'ricExercicio'
        mmHeight = 5027
        mmLeft = 11377
        mmTop = 17463
        mmWidth = 48260
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Filtros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 17463
        mmWidth = 7408
        BandType = 0
      end
      object ricCentroCusto: TppRichText
        UserName = 'ricCentroCusto'
        Caption = 'ricCentroCusto'
        mmHeight = 5027
        mmLeft = 61119
        mmTop = 17463
        mmWidth = 66411
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricPlanoPrev: TppRichText
        UserName = 'ricPlanoPrev'
        Caption = 'ricPlanoPrev'
        mmHeight = 5027
        mmLeft = 129117
        mmTop = 17463
        mmWidth = 66411
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricPatrocinadora: TppRichText
        UserName = 'ricPatrocinadora'
        Caption = 'ricPatrocinadora'
        mmHeight = 5027
        mmLeft = 61383
        mmTop = 23548
        mmWidth = 66411
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ricCenario: TppRichText
        UserName = 'ricCenario'
        Caption = 'ricCenario'
        mmHeight = 5027
        mmLeft = 129117
        mmTop = 23548
        mmWidth = 66411
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 96573
        mmWidth = 197300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197300
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 59267
        mmWidth = 197300
        BandType = 0
      end
      object ricDividirPor: TppRichText
        UserName = 'ricDividirPor'
        Caption = 'ricDividirPor'
        mmHeight = 5027
        mmLeft = 11377
        mmTop = 23548
        mmWidth = 48260
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplPlanoTrabalho
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanoTrabalho'
        mmHeight = 3704
        mmLeft = 1585
        mmTop = 1016
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLRORCADO'
        DataPipeline = pplPlanoTrabalho
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPlanoTrabalho'
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 1016
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplPlanoTrabalho
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPlanoTrabalho'
        mmHeight = 3704
        mmLeft = 22860
        mmTop = 1016
        mmWidth = 114300
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRREALIZADO'
        DataPipeline = pplPlanoTrabalho
        DisplayFormat = '#,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPlanoTrabalho'
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        Caption = 'lblSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1588
        mmTop = 529
        mmWidth = 14288
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
        mmHeight = 3440
        mmLeft = 171715
        mmTop = 529
        mmWidth = 24871
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 87577
        mmTop = 528
        mmWidth = 7938
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 76994
        mmTop = 529
        mmWidth = 9525
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDPLANOTRABALHO'
      DataPipeline = pplPlanoTrabalho
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplPlanoTrabalho'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplPlanoTrabalho: TppBDEPipeline
    DataSource = dtsPlanoTrabalho
    UserName = 'lPlanoTrabalho'
    Left = 162
    Top = 44
    object pplPlanoTrabalhoppField1: TppField
      FieldAlias = 'IDPLANOTRABALHO'
      FieldName = 'IDPLANOTRABALHO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplPlanoTrabalhoppField2: TppField
      FieldAlias = 'CODGRUPOORC'
      FieldName = 'CODGRUPOORC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplPlanoTrabalhoppField3: TppField
      FieldAlias = 'NOMEGRUPOORCAMEN'
      FieldName = 'NOMEGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplPlanoTrabalhoppField4: TppField
      FieldAlias = 'VLRORCADO'
      FieldName = 'VLRORCADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplPlanoTrabalhoppField5: TppField
      FieldAlias = 'VLRREALIZADO'
      FieldName = 'VLRREALIZADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dtsPlanoTrabalho: TDataSource
    DataSet = CdsRelatPlanoTrabalho
    Left = 116
    Top = 44
  end
  object sqlRelatPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PT.IDPLANOTRABALHO,'
      '  GO.CODGRUPOORC,'
      '  GO.NOMEGRUPOORCAMEN,'
      '  SUM( SO.VLRORCADO ) VLRORCADO,'
      '  SUM( SO.VLRREALIZADO ) VLRREALIZADO'
      'FROM'
      '  SALDOORCADO      SO,'
      '  CONTASORCAMEN    CO,'
      '  GRUPOORCAMEN     GO,'
      '  PLANOTRABALHOORC PT'
      'WHERE'
      '  PT.IDPESSOA         = -1              AND'
      '  PT.EXERCICIOINI    <= -1              AND'
      '  PT.EXERCICIOFIM    >= -1              AND'
      '  PT.UNIDNEGOC        = -1              AND'
      '  PT.CODCENTRORESPON  = -1              AND'
      '  CO.IDEMPRESA        = PT.IDPESSOA     AND'
      '  CO.UNIDNEGOC        = PT.UNIDNEGOC    AND'
      '  CO.CODCENTRORESPON  = PT.CODCENTRORESPON AND'
      '  CO.IDPLANOPREV      = -1                AND'
      '  CO.IDPATRO          = -1                AND'
      '  SO.IDPLANOORCAMEN   = CO.IDPLANOORCAMEN AND'
      '  SO.IDCONTAORCAMEN   = CO.IDCONTAORCAMEN AND'
      '  SO.EXERCICIO       >= PT.EXERCICIOINI   AND'
      '  SO.PERIODO         >= PT.PERIODOINI     AND'
      '  SO.EXERCICIO       <= PT.EXERCICIOFIM   AND'
      '  SO.PERIODO         <= PT.PERIODOFIM     AND'
      '  GO.IDGRUPOORCAMEN   = CO.IDGRUPOORCAMEN'
      'GROUP BY'
      '  PT.IDPLANOTRABALHO,'
      '  GO.CODGRUPOORC,'
      '  GO.NOMEGRUPOORCAMEN'
      'ORDER BY'
      '  PT.IDPLANOTRABALHO,'
      '  GO.CODGRUPOORC'
      ' ')
    ClientDataSet = CdsRelatPlanoTrabalho
    Left = 24
    Top = 44
  end
  object CdsRelatPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 70
    Top = 44
  end
  object sqlPlanoTrabalho: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PT.IDPLANOTRABALHO,'
      '  PT.DESCRICAO,'
      '  PT.EXERCICIOINI,'
      '  PT.PERIODOINI,'
      '  PT.EXERCICIOFIM,'
      '  PT.PERIODOFIM,'
      '  PT.CODCENTRORESPON,'
      '  PT.OBJETIVO,'
      '  PT.NECESSIDADE,'
      '  PT.BENEFESPERADO,'
      '  PT.CONSEQNAOATEND,'
      '  PT.UNIDNEGOC,'
      
        '  DECODE( PT.PRIORIDADE, '#39'A'#39', '#39' ALTA'#39', DECODE( PT.PRIORIDADE, '#39'B' +
        #39', '#39'BAIXA'#39', '#39'MEDIA'#39' ) ) AS PRIORIDADE,'
      '  CR.NOME AS NOMECR,'
      '  U.UNECODIGO,'
      '  U.NOME AS NOMEATIV'
      'FROM'
      '  PLANOTRABALHOORC PT,'
      '  CENTRESPON CR,'
      '  UNIDNEGOCIO U'
      'WHERE'
      '  PT.IDPLANOTRABALHO    = :IDPLANO             AND'
      '  CR.IDPESSOA       (+) = PT.IDPESSOA          AND'
      '  CR.CODCENTRORESPON(+) = PT.CODCENTRORESPON   AND'
      '  U.IDPESSOA        (+) = PT.IDPESSOA          AND'
      '  U.UNIDNEGOC       (+) = PT.UNIDNEGOC         '
      ' ')
    ClientDataSet = CdsPlanoTrabalho
    Left = 24
    Top = 104
  end
  object CdsPlanoTrabalho: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 104
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
    Top = 137
  end
  object cdsCenario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 137
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
    Top = 169
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 169
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
    Left = 24
    Top = 202
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 202
  end
  object sqlPatrocinadora: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PA.IDPESSOA,'
      '  PE.NOME'
      'FROM'
      '  PATRO PA,'
      '  PESSOA PE'
      'WHERE'
      '  PA.IDPESSOA = :IDPESSOA   AND'
      '  PE.IDPESSOA = PA.IDPESSOA')
    ClientDataSet = cdsPatrocinadora
    Left = 24
    Top = 234
  end
  object cdsPatrocinadora: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 234
  end
  object CdsSubProjeto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 267
  end
  object sqlSubProjeto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  U.UNECODIGO,'
      '  U.NOME'
      'FROM'
      '  UNIDNEGOCIO U'
      'WHERE'
      '  U.IDPESSOA                     = :IDPESSOA AND'
      
        '  RTRIM( U.UNECODIGO )           =  SUBSTR( :UNECODIGO, 1, LENGT' +
        'H( RTRIM( U.UNECODIGO ) ) ) AND'
      '  LENGTH( RTRIM( U.UNECODIGO ) ) < LENGTH( RTRIM( :UNECODIGO ) )'
      'ORDER BY'
      '  UNECODIGO DESC')
    ClientDataSet = CdsSubProjeto
    Left = 24
    Top = 267
  end
  object IdDNSResolver1: TIdDNSResolver
    Port = 53
    ReceiveTimeout = 4000
    Left = 48
    Top = 64
  end
end
