inherited RptAtosGestPag: TRptAtosGestPag
  Left = 395
  Top = 225
  Width = 505
  Height = 423
  Caption = 'RptAtosGestPag'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatório Demonstrativo de Atos de Gestão'
    Params = <
      item
        Caption = 'Plano Cent. Respon.'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDPLANCRESPON'
        LookupSettings.Display = 'DESCPLANCRESPON'
        LookupSettings.Descricao = 'Plano de Centro de Resp.'
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
        Controle = tcMontaSelect
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODCENTRORESPON'
        LookupSettings.Display = 'NOME|ANALITICOSINTET|CODCENTRORESPON'
        LookupSettings.Descricao = 'Nome|A/S|Código Externo'
        LookupSettings.Tamanho = '40|5|20'
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
        Caption = 'Data Vencimento Inicial'
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
        Caption = 'Data Vencimento Final'
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
        Caption = 'Lista Centro de Respon. Sintéticos'
        Controle = tcCheckBox
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
        Caption = '%CPMF'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Required = True
        TextDefault = '0,38'
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
        Controle = tcListBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT IDPLANOPREV, NOME '
          'FROM PLANPREVCONTABIL '
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
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
        ListBoxSettings.MultiSelect = True
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
        Name = 'lsbPlanoPrev'
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
        Caption = 'Exibe documentos com saldo zerado.'
        Controle = tcCheckBox
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
        Caption = 'Tipo de Desembolso'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPRECDES'
        LookupSettings.Display = 'DESCRICAO|CODTIPRECDES'
        LookupSettings.Descricao = 'Tipo de Desembolso|Código'
        LookupSettings.Tamanho = '30|15'
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
        Caption = 'nome planos'
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
    Formheight = 360
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = pprDemap
    LabelEmpresa = ppLabel14
    LabelSistema = ppLabel22
  end
  object DsDemGestPag: TwwDataSource
    DataSet = CdsGestAp
    Left = 352
    Top = 125
  end
  object pprDemap: TppReport
    AutoStop = False
    DataPipeline = PplDemGestPag
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 352
    Top = 13
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PplDemGestPag'
    object ppHeaderBand6: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object MemTitulo: TppMemo
        UserName = 'MemTitulo'
        Caption = 'MemTitulo'
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 265
        mmTop = 8202
        mmWidth = 197115
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object pprDemapRegion1: TppRegion
        UserName = 'pprDemapRegion1'
        Brush.Style = bsClear
        Caption = 'pprDemapRegion1'
        Pen.Style = psClear
        ShiftRelativeTo = MemTitulo
        Transparent = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 13494
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLine11: TppLine
          UserName = 'ppLine11'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 14553
          mmWidth = 197380
          BandType = 0
        end
        object RptDemGestPagLabel9: TppLabel
          UserName = 'RptDemGestPagLabel9'
          Caption = 'Tipo de Desembolso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 1059
          mmTop = 15875
          mmWidth = 27781
          BandType = 0
        end
        object RptDemGestPagLabel10: TppLabel
          UserName = 'RptDemGestPagLabel10'
          Caption = 'Num AP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 60325
          mmTop = 15875
          mmWidth = 11377
          BandType = 0
        end
        object RptDemGestPagLabel11: TppLabel
          UserName = 'RptDemGestPagLabel11'
          Caption = 'Venc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 77258
          mmTop = 15875
          mmWidth = 8202
          BandType = 0
        end
        object RptDemGestPagLabel12: TppLabel
          UserName = 'RptDemGestPagLabel12'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 111919
          mmTop = 15875
          mmWidth = 7144
          BandType = 0
        end
        object pprDemapLabel1: TppLabel
          UserName = 'pprDemapLabel1'
          Caption = 'Histórico Ap'#39's'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 137319
          mmTop = 15875
          mmWidth = 20373
          BandType = 0
        end
        object pprDemapLine1: TppLine
          UserName = 'pprDemapLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 21166
          mmWidth = 197380
          BandType = 0
        end
        object pprDemapLabel2: TppLabel
          UserName = 'pprDemapLabel2'
          Caption = 'CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 128323
          mmTop = 15875
          mmWidth = 8202
          BandType = 0
        end
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptDemGestPagDBText3: TppDBText
        UserName = 'RptDemGestPagDBText3'
        DataField = 'DESCRICAO'
        DataPipeline = PplDemGestPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3704
        mmLeft = 1059
        mmTop = 265
        mmWidth = 59267
        BandType = 4
      end
      object ShpDetalheDoc: TppShape
        UserName = 'ShpDetalheDoc'
        Brush.Color = 12713983
        ParentHeight = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 60061
        mmTop = 0
        mmWidth = 137319
        BandType = 4
      end
      object EdtDDDataLancto: TppDBText
        UserName = 'EdtDDDataLancto'
        DataField = 'DATAVENCTO'
        DataPipeline = PplDemGestPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3704
        mmLeft = 77258
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object EdtDdNumAp: TppDBText
        UserName = 'EdtDdNumAp'
        DataField = 'NUMAPGR'
        DataPipeline = PplDemGestPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3704
        mmLeft = 60854
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object EdtDdValor: TppDBText
        UserName = 'EdtDdValor'
        AutoSize = True
        DataField = 'VRLANCTO'
        DataPipeline = PplDemGestPag
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3175
        mmLeft = 104246
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object EdtDdObs: TppDBMemo
        UserName = 'EdtDdObs'
        CharWrap = True
        DataField = 'OBS'
        DataPipeline = PplDemGestPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3704
        mmLeft = 137319
        mmTop = 265
        mmWidth = 59796
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object LblValCPMF: TppDBText
        UserName = 'LblValCPMF'
        AutoSize = True
        DataField = 'VALCPMF'
        DataPipeline = PplDemGestPag
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3175
        mmLeft = 123031
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptDemGestPagSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object RptDemGestPagLabel8: TppLabel
        UserName = 'RptDemGestPagLabel8'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 1588
        mmWidth = 18785
        BandType = 7
      end
      object pprDemapDBCalc2: TppDBCalc
        UserName = 'pprDemapDBCalc2'
        AutoSize = True
        DataField = 'VRBAIXA'
        DataPipeline = PplDemGestPag
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3260
        mmLeft = 78666
        mmTop = 5821
        mmWidth = 20024
        BandType = 7
      end
      object pprDemapLabel4: TppLabel
        UserName = 'pprDemapLabel4'
        Caption = 'Total de Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 102394
        mmTop = 1588
        mmWidth = 23283
        BandType = 7
      end
      object pprDemapDBCalc3: TppDBCalc
        UserName = 'pprDemapDBCalc3'
        AutoSize = True
        DataField = 'VRLANCTO'
        DataPipeline = PplDemGestPag
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3260
        mmLeft = 102522
        mmTop = 5821
        mmWidth = 23156
        BandType = 7
      end
      object pprDemapLabel5: TppLabel
        UserName = 'pprDemapLabel5'
        Caption = 'SubTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 183886
        mmTop = 1588
        mmWidth = 12700
        BandType = 7
      end
      object pprDemapDBCalc4: TppDBCalc
        UserName = 'pprDemapDBCalc4'
        AutoSize = True
        DataField = 'VRSUBTOTAL'
        DataPipeline = PplDemGestPag
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3260
        mmLeft = 169916
        mmTop = 5821
        mmWidth = 26670
        BandType = 7
      end
      object pprDemapLabel6: TppLabel
        UserName = 'pprDemapLabel6'
        Caption = 'Total de Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76994
        mmTop = 1588
        mmWidth = 21696
        BandType = 7
      end
      object pprDemapLabel7: TppLabel
        UserName = 'pprDemapLabel7'
        Caption = 'Total CPMF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 1588
        mmWidth = 16140
        BandType = 7
      end
      object pprDemapDBCalc5: TppDBCalc
        UserName = 'pprDemapDBCalc5'
        AutoSize = True
        DataField = 'VALCPMF'
        DataPipeline = PplDemGestPag
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PplDemGestPag'
        mmHeight = 3260
        mmLeft = 125985
        mmTop = 5821
        mmWidth = 21124
        BandType = 7
      end
      object pprDemapLine2: TppLine
        UserName = 'pprDemapLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object pprDemapLine3: TppLine
        UserName = 'pprDemapLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10583
        mmWidth = 197300
        BandType = 7
      end
    end
    object RptDemGestPagGroup1: TppGroup
      BreakName = 'CODTIPRECDES'
      DataPipeline = PplDemGestPag
      OutlineSettings.CreateNode = True
      UserName = 'RptDemGestPagGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PplDemGestPag'
      object RptDemGestPagGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object FBandAtosGestao: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object RptDemGestPagShape1: TppShape
          UserName = 'RptDemGestPagShape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 10848
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagDBCalc1: TppDBCalc
          UserName = 'RptDemGestPagDBCalc1'
          AutoSize = True
          DataField = 'VRBAIXA'
          DataPipeline = PplDemGestPag
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptDemGestPagGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PplDemGestPag'
          mmHeight = 3260
          mmLeft = 78666
          mmTop = 5821
          mmWidth = 20024
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagDBText8: TppDBText
          UserName = 'RptDemGestPagDBText8'
          DataField = 'DESCRICAO'
          DataPipeline = PplDemGestPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PplDemGestPag'
          mmHeight = 3704
          mmLeft = 1059
          mmTop = 5821
          mmWidth = 58473
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagLabel2: TppLabel
          UserName = 'RptDemGestPagLabel2'
          Caption = 'Tipo de Desembolso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 1059
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagLabel3: TppLabel
          UserName = 'RptDemGestPagLabel3'
          Caption = 'Total de Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 102394
          mmTop = 1323
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagDBCalc2: TppDBCalc
          UserName = 'RptDemGestPagDBCalc2'
          AutoSize = True
          DataField = 'VRLANCTO'
          DataPipeline = PplDemGestPag
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptDemGestPagGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PplDemGestPag'
          mmHeight = 3260
          mmLeft = 102522
          mmTop = 5821
          mmWidth = 23156
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagLabel4: TppLabel
          UserName = 'RptDemGestPagLabel4'
          Caption = 'SubTotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 183886
          mmTop = 1323
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagDBCalc3: TppDBCalc
          UserName = 'RptDemGestPagDBCalc3'
          AutoSize = True
          DataField = 'VRSUBTOTAL'
          DataPipeline = PplDemGestPag
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptDemGestPagGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PplDemGestPag'
          mmHeight = 3260
          mmLeft = 169916
          mmTop = 5821
          mmWidth = 26670
          BandType = 5
          GroupNo = 0
        end
        object RptDemGestPagLabel1: TppLabel
          UserName = 'RptDemGestPagLabel1'
          Caption = 'Total de Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 76994
          mmTop = 1323
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object pprDemapLabel3: TppLabel
          UserName = 'pprDemapLabel3'
          Caption = 'Total CPMF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 130969
          mmTop = 1323
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object pprDemapDBCalc1: TppDBCalc
          UserName = 'pprDemapDBCalc1'
          AutoSize = True
          DataField = 'VALCPMF'
          DataPipeline = PplDemGestPag
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptDemGestPagGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PplDemGestPag'
          mmHeight = 3260
          mmLeft = 125985
          mmTop = 5821
          mmWidth = 21124
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object PplDemGestPag: TppDBPipeline
    DataSource = DsDemGestPag
    CloseDataSource = True
    UserName = 'PplDemGestPag'
    Left = 350
    Top = 69
    object PplDemGestPagppField1: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField2: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField3: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField4: TppField
      FieldAlias = 'ANASINT'
      FieldName = 'ANASINT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField5: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField6: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField7: TppField
      FieldAlias = 'VRLANCTO'
      FieldName = 'VRLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField8: TppField
      FieldAlias = 'VRBAIXA'
      FieldName = 'VRBAIXA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField9: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField10: TppField
      FieldAlias = 'VRSUBTOTAL'
      FieldName = 'VRSUBTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField11: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField12: TppField
      FieldAlias = 'VALCPMF'
      FieldName = 'VALCPMF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PplDemGestPagppField13: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object CdsGestAp: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftFloat
        Name = 'PERCCPFM'
        ParamType = ptUnknown
        Value = 30
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
        Value = 'P'
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
        Value = 'P'
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
        Value = 'P'
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 1
      end>
    ProviderName = 'DspDemGestPag'
    Left = 352
    Top = 181
    object CdsGestApCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsGestApNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsGestApCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object CdsGestApANASINT: TStringField
      FieldName = 'ANASINT'
      Size = 1
    end
    object CdsGestApDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object CdsGestApDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsGestApVRLANCTO: TFloatField
      FieldName = 'VRLANCTO'
    end
    object CdsGestApVRBAIXA: TFloatField
      FieldName = 'VRBAIXA'
    end
    object CdsGestApOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsGestApVRSUBTOTAL: TFloatField
      FieldName = 'VRSUBTOTAL'
    end
    object CdsGestApCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object CdsGestApVALCPMF: TFloatField
      FieldName = 'VALCPMF'
    end
    object CdsGestApIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
  end
  object SqlGestAp: TCMSqlParams
    SQL.Strings = (
      
        'ELECT  CODDOCUMENTO, NUMAPGR, CODTIPRECDES, ANASINT, DESCRICAO, ' +
        '  DATAVENCTO, OBS,'
      
        '        CODCENTRORESPON, IDPLANOPREV,                           ' +
        '                    '
      
        '        SUM(ROUND(VRLANCTO,2)) AS VRLANCTO,                     ' +
        '                    '
      
        '        SUM(ROUND(VRBAIXA,2)) AS VRBAIXA,                       ' +
        '                    '
      
        '        SUM((ROUND(DECODE(VRLANCTO,NULL,0,VRLANCTO),2)  -       ' +
        '                    '
      
        '             ROUND(DECODE(VRBAIXA,NULL,0,VRBAIXA),2))) AS VRSUBT' +
        'OTAL,'
      
        '        SUM(ROUND((ROUND(VRLANCTO,2) * 0.38 / 100),2)) AS VALCPM' +
        'F              '
      
        'FROM                                                            ' +
        '                    '
      
        '  (                                                             ' +
        '                    '
      
        '--BUSCA OS TIPOS DE DESENBOLSO SINTÉTICOS PARA COMPOR O RELATÓRI' +
        'O'
      
        '  SELECT                                                        ' +
        '                    '
      
        '     (0) AS CODDOCUMENTO, (0) AS NUMAPGR, T.CODTIPRECDES,       ' +
        '  '
      
        '     T.ANASINT, T.DESCRICAO, (SYSDATE) AS DATAVENCTO, ('#39#39') AS OB' +
        'S,'
      '     ('#39'         '#39') AS CODCENTRORESPON, (0) AS IDPLANOPREV,'
      
        '     (0) AS VRLANCTO, (0) AS VRBAIXA                            ' +
        '  '
      
        '  FROM                                                          ' +
        '  '
      
        '     TIPORECEBDESEMB T                                          ' +
        '  '
      
        '  WHERE                                                         ' +
        '  '
      '     T.ANASINT = '#39'S'#39' AND'
      '     T.RECPAG = '#39'P'#39' AND T.IDPESSOA = 2'
      
        'UNION                                                           ' +
        '  '
      
        '  SELECT D.CODDOCUMENTO,                                        ' +
        '  '
      
        '         D.NUMAPGR,                                             ' +
        '  '
      
        '         T.CODTIPRECDES,                                        ' +
        '  '
      
        '         T.ANASINT,                                             ' +
        '  '
      
        '         T.DESCRICAO,                                           ' +
        '  '
      
        '         D.DATAVENCTO,                                          ' +
        '  '
      
        '         D.OBS,                                                 ' +
        '  '
      
        '         R.CODCENTRORESPON,                                     ' +
        '  '
      
        '         R.IDPLANOPREV,                                         ' +
        '  '
      
        '         (R.VALOR) AS VRLANCTO,                                 ' +
        '  '
      
        '         (VWBAIXAEFETIVOS.VALORBAIXA * R.VALOR / L.VALOR) AS VRB' +
        'AIXA'
      
        '    FROM DOCUMENTO D,                                           ' +
        '  '
      
        '         LANCTODOCUM L,                                         ' +
        '  '
      
        '         RATEIODOCUM R,                                         ' +
        '  '
      
        '         CENTRESPON C,                                          ' +
        '  '
      
        '         PLANCENTRESPON  P,                                     ' +
        '  '
      
        '         TIPORECEBDESEMB T,                                     ' +
        '  '
      
        '         VWBAIXAEFETIVOS                                        ' +
        '  '
      '   WHERE D.RECPAG = '#39'P'#39'  AND D.IDPESSOA = 2'
      
        '-- #ADF1                                                        ' +
        '  '
      
        '     AND ( R.CODCENTRORESPON = C.CODCENTRORESPON )              ' +
        '  '
      '     AND ( C.IDPESSOA = 2 )                               '
      
        '     AND ( C.IDPLANCRESPON   = P.IDPLANCRESPON )                ' +
        '  '
      '     AND ( P.IDPLANCRESPON   = 0 )                   '
      '  AND (D.DATAVENCTO >=  TO_DATE('#39'21/05/1990'#39','#39'DD/MM/YYYY'#39'))'
      '  AND (D.DATAVENCTO <=  TO_DATE('#39'21/05/2008'#39','#39'DD/MM/YYYY'#39'))'
      
        '     AND D.NUMFATURA IS NULL                                    ' +
        '  '
      
        '     AND L.ESTORNO IS NULL                                      ' +
        '  '
      
        '     AND D.NUMAPGR IS NOT NULL                                  ' +
        '  '
      
        '     AND D.CODDOCUMENTO = L.CODDOCUMENTO                        ' +
        '  '
      
        '     AND D.OPERACAO = L.OPERACAO                                ' +
        '  '
      
        '     AND D.CODDOCUMENTO = VWBAIXAEFETIVOS.CODDOCUMENTO (+)      ' +
        '  '
      
        '     AND D.RECPAG = VWBAIXAEFETIVOS.RECPAG(+)                   ' +
        '  '
      
        '     AND D.IDPESSOA = VWBAIXAEFETIVOS.IDPESSOA(+)               ' +
        '  '
      
        '     AND R.CODDOCUMENTO = D.CODDOCUMENTO                        ' +
        '  '
      
        #9'   AND R.RECPAG = D.RECPAG                                     ' +
        ' '
      
        #9'   AND R.IDPESSOA = D.IDPESSOA                                 ' +
        ' '
      
        '     AND R.CODTIPRECDES = T.CODTIPRECDES                        ' +
        '  '
      
        '     AND R.IDPESSOA = T.IDPESSOA                                ' +
        '  '
      
        '     AND R.RECPAG = T.RECPAG                                    ' +
        '  '
      
        'UNION                                                           ' +
        '  '
      
        '  SELECT VWLANCPARCELADOS.CODDOCUMENTO,                         ' +
        '  '
      
        '       VWLANCPARCELADOS.NUMAPGR,                                ' +
        '  '
      
        '       VWRATEIOORIGEMPARCELAS.CODTIPRECDES,                     ' +
        '  '
      
        '       VWRATEIOORIGEMPARCELAS.ANASINT,                          ' +
        '  '
      
        '       VWRATEIOORIGEMPARCELAS.DESCTDR,                          ' +
        '  '
      
        '       VWLANCPARCELADOS.DATAVENCTO,                             ' +
        '  '
      
        '       VWLANCPARCELADOS.OBS,                                    ' +
        '  '
      
        '       VWRATEIOORIGEMPARCELAS.CODCENTRORESPON,                  ' +
        '  '
      
        '       VWRATEIOORIGEMPARCELAS.IDPLANOPREV,                      ' +
        '  '
      
        '       (VWLANCPARCELADOS.VALOR * VWRATEIOORIGEMPARCELAS.VALOR) /' +
        '  '
      
        '            VWLANCORIGEMPARCELAS.VALOR AS VRLANCTO,             ' +
        '  '
      
        '       (((VWLANCPARCELADOS.VALOR * VWRATEIOORIGEMPARCELAS.VALOR)' +
        ' /'
      
        '            VWLANCORIGEMPARCELAS.VALOR) * VWLANCPARCELADOS.VALOR' +
        'BAIXA) /'
      
        '               VWLANCPARCELADOS.VALOR AS VRBAIXA                ' +
        '   '
      
        '  FROM VWLANCPARCELADOS,VWRATEIOORIGEMPARCELAS,VWLANCORIGEMPARCE' +
        'LAS'
      
        '  ,      CENTRESPON C,                                          ' +
        '   '
      
        '         PLANCENTRESPON  P                                      ' +
        '   '
      '  WHERE VWLANCPARCELADOS.RECPAG = '#39'P'#39'                          '
      '    AND VWLANCPARCELADOS.IDPESSOA = 2'
      
        '     AND ( VWRATEIOORIGEMPARCELAS.CODCENTRORESPON = C.CODCENTROR' +
        'ESPON ) '
      '     AND ( C.IDPESSOA = 2 )                               '
      
        '     AND ( C.IDPLANCRESPON   = P.IDPLANCRESPON )                ' +
        '  '
      '     AND ( P.IDPLANCRESPON   = 0 )                   '
      
        '    AND VWLANCPARCELADOS.NUMAPGR IS NOT NULL                    ' +
        '   '
      
        '-- #ADF2                                                        ' +
        '   '
      
        '   AND (VWLANCPARCELADOS.DATAVENCTO >=  TO_DATE('#39'21/05/1990'#39','#39'DD' +
        '/MM/YYYY'#39'))'
      
        '   AND (VWLANCPARCELADOS.DATAVENCTO <=  TO_DATE('#39'21/05/2008'#39','#39'DD' +
        '/MM/YYYY'#39'))'
      
        '    AND VWLANCPARCELADOS.NUMFATURA = VWRATEIOORIGEMPARCELAS.NUMF' +
        'ATURA'
      
        '    AND VWLANCPARCELADOS.NUMFATURA = VWLANCORIGEMPARCELAS.NUMFAT' +
        'URA'
      
        '    AND VWLANCPARCELADOS.RECPAG = VWRATEIOORIGEMPARCELAS.RECPAG ' +
        '    '
      
        '    AND VWLANCPARCELADOS.RECPAG = VWLANCORIGEMPARCELAS.RECPAG   ' +
        '    '
      
        '    AND VWLANCPARCELADOS.IDPESSOA = VWRATEIOORIGEMPARCELAS.IDPES' +
        'SOA'
      
        '    AND VWLANCPARCELADOS.IDPESSOA = VWLANCORIGEMPARCELAS.IDPESSO' +
        'A) vvvv'
      ' WHERE (ANASINT = '#39'A'#39')'
      
        ' GROUP BY CODDOCUMENTO, NUMAPGR, CODTIPRECDES, ANASINT, DESCRICA' +
        'O,  DATAVENCTO, OBS, CODCENTRORESPON, IDPLANOPREV ORDER BY CODTI' +
        'PRECDES, DESCRICAO, NUMAPGR'
      '')
    ClientDataSet = CdsGestAp
    Left = 352
    Top = 248
  end
  object SqlCentRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CENTRESPON.CODEXTERNO,'
      '   CENTRESPON.CODCENTRORESPON,'
      '   CENTRESPON.NOME,'
      '   CENTRESPON.ANALITICOSINTET,'
      '   CENTRESPON.IDPLANCRESPON, '
      '   PLANCENTRESPON.DESCPLANCRESPON '
      'FROM'
      '   CENTRESPON, '
      '   PLANCENTRESPON '
      'WHERE '
      '   CENTRESPON.IDPLANCRESPON = PLANCENTRESPON.IDPLANCRESPON AND'
      
        '   ( ( RTRIM(CENTRESPON.CODEXTERNO) = :CODEXTERNO ) OR ( :CODEXT' +
        'ERNO IS NULL  ) ) AND'
      '   ( CENTRESPON.IDPLANCRESPON = :IDPLANCRESPON ) AND'
      '   ( CENTRESPON.IDPESSOA = :IDPESSOA )'
      ' ')
    ClientDataSet = CdsCentRespon
    Left = 112
    Top = 144
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 144
  end
  object SqlSaldoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  Q2.VALORBRUTO, Q1.VALORLIQUIDO'
      'FROM'
      ' (SELECT'
      '     SUM(DECODE(:RECPAG,'#39'P'#39','
      
        '       DECODE(LANCTODOCUM.DEBCRE,'#39'C'#39',LANCTODOCUM.VALOR,-1 * LANC' +
        'TODOCUM.VALOR),'
      
        '       DECODE(LANCTODOCUM.DEBCRE,'#39'C'#39',LANCTODOCUM.VALOR * -1,LANC' +
        'TODOCUM.VALOR))) AS VALORLIQUIDO'
      '  FROM'
      '     LANCTODOCUM'
      '  WHERE'
      '     LANCTODOCUM.CODDOCUMENTO = :CODDOCUMENTO AND'
      '     RTRIM(LANCTODOCUM.OPERACAO) <> '#39'5'#39' AND'
      '     LANCTODOCUM.OPERACAO <> '#39'15'#39') Q1,'
      ' (SELECT'
      '     LANCTODOCUM.VALOR AS VALORBRUTO'
      '  FROM'
      '     DOCUMENTO, LANCTODOCUM'
      '  WHERE'
      '     DOCUMENTO.CODDOCUMENTO = :CODDOCUMENTO AND'
      '     DOCUMENTO.CODDOCUMENTO = LANCTODOCUM.CODDOCUMENTO AND'
      '     DOCUMENTO.OPERACAO = LANCTODOCUM.OPERACAO) Q2'
      ''
      ' ')
    ClientDataSet = CdsSaldoDoc
    Left = 112
    Top = 216
  end
  object CdsSaldoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 216
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    ValidateWithMask = True
    Left = 210
    Top = 8
    object qryAuxNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 43
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qryAuxSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 18
      FieldName = 'SALDOANT'
      DisplayFormat = '#,##0.00'
    end
    object qryAuxRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 18
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '#,##0.00'
    end
    object qryAuxDESEMBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 16
      FieldName = 'DESEMBOLSOS'
      DisplayFormat = '#,##0.00'
    end
    object qryAuxSALDODIA: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 17
      FieldName = 'SALDODIA'
      DisplayFormat = '#,##0.00'
    end
    object qryAuxIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryAuxNOMEPLANO: TStringField
      DisplayWidth = 50
      FieldName = 'NOMEPLANO'
      Visible = False
      Size = 50
    end
    object qryAuxNOMEPATRO: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEPATRO'
      Visible = False
      Size = 60
    end
    object qryAuxDIF: TFloatField
      DisplayWidth = 10
      FieldName = 'DIF'
      Visible = False
    end
    object qryAuxIDPLANO: TFloatField
      FieldName = 'IDPLANO'
      Visible = False
    end
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 88
  end
  object SqlTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT CODTIPRECDES,'
      '       DESCRICAO'
      '  FROM TIPORECEBDESEMB'
      ' WHERE ANASINT  = '#39'A'#39
      '   AND RECPAG   = '#39'P'#39
      '   AND IDPESSOA = :IDPESSOA')
    ClientDataSet = CdsTipoDesemb
    Left = 112
    Top = 88
  end
  object CdsPlanPrev: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 296
    Data = {
      B40100009619E0BD0100000018000000020009000000030000006C000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      44544802000200320002000D44454641554C545F4F5244455202008200010000
      000200044C434944040001000908000000000000000000002C401E42656E6566
      ED63696F20446566696E69646F2052464653412F524546455200000000000000
      0046401A4342545520436F6E747269627569E7E36F20446566696E6964610000
      000000000000F03F05434F4D554D0000000000000000444020464C554D495452
      454E5320436F6E747269627569E7E36F20446566696E69646100000000000000
      0008401B4D455452D420436F6E747269627569E7E36F20446566696E69646100
      000000000000804E401E4D4554524F464F5220436F6E747269627569E7E36F20
      446566696E69646100000000000000C05940194F70657261E7F565732041646D
      696E69737472617469766173000000000000008040401B524546455220436F6E
      747269627569E7E36F20446566696E696461000000000000008042401B524646
      534120436F6E747269627569E7E36F20446566696E696461}
  end
  object SqlPlanPrev: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME '
      'FROM PLANPREVCONTABIL '
      'ORDER BY NOME')
    ClientDataSet = CdsPlanPrev
    Left = 112
    Top = 296
  end
end
