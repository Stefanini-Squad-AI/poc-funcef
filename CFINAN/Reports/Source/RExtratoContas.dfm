inherited RptExtratoContas: TRptExtratoContas
  Left = 388
  Top = 195
  Width = 483
  Height = 454
  Caption = 'RptExtratoContas'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Extrato de Contas'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data &Inicial'
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
        Caption = 'Data &Final'
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
        Caption = 'Con&ta'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  CODPORTADOR,DESCRICAO'
          'FROM'
          '  PORTADORCONTA'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Conta'
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
        Caption = '&Módulo'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT '
          '  IDMODULO,NOMEMODULO'
          'FROM MODULO'
          'ORDER BY NOMEMODULO ')
        LookupSettings.Chave = 'IDMODULO'
        LookupSettings.Display = 'NOMEMODULO'
        LookupSettings.Descricao = 'Módulo'
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
        Caption = 'Stat&us'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Somente os conciliados'
          'Todos menos os na casa'
          'Somente os na casa'
          'Somente os Não Conciliados (Status N + C)'
          'Somente os Não Identificados'
          'Sem os Estornos dos Não Identificados (- Status J)'
          'Todos menos na casa e menos Estornos (- Status J e C)')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 150
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
        Caption = '&Emitir Relatório pela'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Data do &Lançamento'
          'Data da Conciliação')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
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
        Caption = '&Ordenação'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Nenhum'
          'Data + Valor'
          'Data + Núm. Doc.')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
        Caption = '&Moeda'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Corrente'
          'Outra Moeda')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
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
        Caption = 'Imprimir somente as c&ontas com movimento'
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
        Caption = 'Salta Fol&ha por Conta'
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 510
    FormWidth = 430
    Left = 298
  end
  inherited DevRptCM: TExtraOptions
    Left = 120
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpExtratoContas
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 208
  end
  object rpExtratoContas: TppReport
    AutoStop = False
    DataPipeline = ppExtratoContas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 298
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtratoContas'
    object ppHeader: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object pplNomeRelat: TppLabel
        UserName = 'lNomeRelat'
        Caption = 'Extrato de Contas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 124090
        mmTop = 6879
        mmWidth = 36248
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'lblEmpresa'
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
        mmTop = 529
        mmWidth = 28046
        BandType = 0
      end
      object rpExtratoContaLabel10: TppLabel
        UserName = 'rpExtratoContaLabel10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 203994
        mmTop = 4233
        mmWidth = 13494
        BandType = 0
      end
      object lbData: TppLabel
        UserName = 'lbData'
        Caption = 'lbData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218811
        mmTop = 4233
        mmWidth = 7938
        BandType = 0
      end
      object rpExtratoContaLabel11: TppLabel
        UserName = 'rpExtratoContaLabel11'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 206905
        mmTop = 8467
        mmWidth = 10583
        BandType = 0
      end
      object lbStatus: TppLabel
        UserName = 'lbStatus'
        Caption = 'lbStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 218811
        mmTop = 8467
        mmWidth = 10319
        BandType = 0
      end
    end
    object ppDetail: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object dbtData: TppDBText
        UserName = 'dbtData'
        AutoSize = True
        DataField = 'DATA'
        DataPipeline = ppExtratoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 7408
        BandType = 4
      end
      object dbtBordero: TppDBText
        UserName = 'dbtBordero'
        DataField = 'BORDERO'
        DataPipeline = ppExtratoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3704
        mmLeft = 16140
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object dbtHistorico: TppDBText
        UserName = 'dbtHistorico'
        DataField = 'HISTORICO'
        DataPipeline = ppExtratoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3704
        mmLeft = 47890
        mmTop = 265
        mmWidth = 89165
        BandType = 4
      end
      object dbtValor: TppDBText
        UserName = 'dbtValor'
        AutoSize = True
        DataField = 'SALDOREGISTRO'
        DataPipeline = ppExtratoContas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3175
        mmLeft = 231246
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object dbtStatus: TppDBText
        UserName = 'dbtStatus'
        AutoSize = True
        DataField = 'STATUS'
        DataPipeline = ppExtratoContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3175
        mmLeft = 261409
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object rpExtratoContaDBText2: TppDBText
        UserName = 'rpExtratoContaDBText2'
        AutoSize = True
        DataField = 'VALORSAIDA'
        DataPipeline = ppExtratoContas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3175
        mmLeft = 203730
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object rpExtratoContaDBText3: TppDBText
        UserName = 'rpExtratoContaDBText3'
        AutoSize = True
        DataField = 'VALORENTRADA'
        DataPipeline = ppExtratoContas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtratoContas'
        mmHeight = 3175
        mmLeft = 163513
        mmTop = 265
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooter: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object pplblSistema: TppLabel
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 199761
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 243682
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpExtratoContaGroup1: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = ppExtratoContas
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'rpExtratoContaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppExtratoContas'
      object rpHeaderDescricao: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object dbtDescricao: TppDBText
          UserName = 'dbtDescricao'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = ppExtratoContas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3810
          mmLeft = 8202
          mmTop = 1058
          mmWidth = 18965
          BandType = 3
          GroupNo = 0
        end
        object rpExtratoContaLine3: TppLine
          UserName = 'rpExtratoContaLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 10319
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object lblData: TppLabel
          UserName = 'lblData'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6085
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object lblDoc: TppLabel
          UserName = 'lblDoc'
          Caption = 'Nº Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 16140
          mmTop = 6085
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object lblHistorico: TppLabel
          UserName = 'lblHistorico'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 48154
          mmTop = 6085
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object lblValor: TppLabel
          UserName = 'lblValor'
          Caption = 'Saídas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 212196
          mmTop = 6085
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object lblSaldo: TppLabel
          UserName = 'lblSaldo'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 247650
          mmTop = 6085
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object lblStatus: TppLabel
          UserName = 'lblStatus'
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 262467
          mmTop = 6085
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpExtratoContaLabel1: TppLabel
          UserName = 'rpExtratoContaLabel1'
          Caption = 'Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 173832
          mmTop = 6085
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpExtratoContaLine1: TppLine
          UserName = 'rpExtratoContaLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFooterDescricao: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 42069
        mmPrintPosition = 0
        object rpExtratoContaDBCalc2: TppDBCalc
          UserName = 'rpExtratoContaDBCalc2'
          AutoSize = True
          DataField = 'VALORENTRADA'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpExtratoContaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3387
          mmLeft = 152749
          mmTop = 529
          mmWidth = 33782
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBCalc3: TppDBCalc
          UserName = 'rpExtratoContaDBCalc3'
          AutoSize = True
          DataField = 'VALORSAIDA'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpExtratoContaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3440
          mmLeft = 192882
          mmTop = 529
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object plblCheques: TppLabel
          UserName = 'plblBloqueioCheques'
          Caption = 'Total Bloqueios Cheques:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115359
          mmTop = 22225
          mmWidth = 43127
          BandType = 5
          GroupNo = 0
        end
        object plblBloqueioOutros: TppLabel
          UserName = 'plblBloqueioOutros'
          Caption = 'Total Bloqueios Outros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115359
          mmTop = 26988
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object plblBloqueioJudiciais: TppLabel
          UserName = 'plblBloqueioJudiciais'
          Caption = 'Total Bloqueios Judiciais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4191
          mmLeft = 115359
          mmTop = 17463
          mmWidth = 43392
          BandType = 5
          GroupNo = 0
        end
        object pdbtxtVlrBloqCheques: TppDBText
          UserName = 'rpExtratoContaDBTextVlrBloqCheques'
          AutoSize = True
          DataField = 'BLOQCHEQUE'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3704
          mmLeft = 232834
          mmTop = 22225
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBTextBloqOutros: TppDBText
          UserName = 'rpExtratoContaDBTextVlrBloqCheques1'
          AutoSize = True
          DataField = 'BLOQOUTROS'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3704
          mmLeft = 232834
          mmTop = 26988
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBTextBloqJud: TppDBText
          UserName = 'rpExtratoContaDBTextBloqJud'
          AutoSize = True
          DataField = 'BLOQJUD'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3704
          mmLeft = 239978
          mmTop = 17463
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBText1: TppDBText
          UserName = 'rpExtratoContaDBText1'
          DataField = 'SALDOTOTAL'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3440
          mmLeft = 226748
          mmTop = 7938
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBCalc1: TppDBCalc
          UserName = 'rpExtratoContaDBCalc1'
          AutoSize = True
          DataField = 'VALORENTRADA'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpExtratoContaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3440
          mmLeft = 152665
          mmTop = 7938
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaDBCalc4: TppDBCalc
          UserName = 'rpExtratoContaDBCalc4'
          AutoSize = True
          DataField = 'VALORSAIDA'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpExtratoContaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 3440
          mmLeft = 192882
          mmTop = 7938
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaLine2: TppLine
          UserName = 'rpExtratoContaLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object rpExtratoContaLabel2: TppLabel
          UserName = 'rpExtratoContaLabel2'
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115359
          mmTop = 7938
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Total Disponível:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115359
          mmTop = 31750
          mmWidth = 28310
          BandType = 5
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'SALDOTOTAL'
          DataPipeline = ppExtratoContas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppExtratoContas'
          mmHeight = 4233
          mmLeft = 226748
          mmTop = 31750
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsExtratoContas: TwwDataSource
    DataSet = cdsExtratoContas
    Left = 40
    Top = 72
  end
  object ppExtratoContas: TppBDEPipeline
    DataSource = dsExtratoContas
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ExtratoContas'
    Left = 122
    Top = 74
    object ppExtratoContappField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField2: TppField
      FieldAlias = 'BORDERO'
      FieldName = 'BORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField3: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField4: TppField
      FieldAlias = 'CODFINANC'
      FieldName = 'CODFINANC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField5: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField6: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField7: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField8: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField10: TppField
      FieldAlias = 'VALORENTRADA'
      FieldName = 'VALORENTRADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField11: TppField
      FieldAlias = 'VALORSAIDA'
      FieldName = 'VALORSAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField12: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField13: TppField
      FieldAlias = 'SALDOREGISTRO'
      FieldName = 'SALDOREGISTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppExtratoContappField14: TppField
      FieldAlias = 'SALDOTOTAL'
      FieldName = 'SALDOTOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppExtratoContasppField1: TppField
      FieldAlias = 'BLOQCHEQUE'
      FieldName = 'BLOQCHEQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppExtratoContasppField2: TppField
      FieldAlias = 'BLOQJUD'
      FieldName = 'BLOQJUD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppExtratoContasppField3: TppField
      FieldAlias = 'BLOQOUTROS'
      FieldName = 'BLOQOUTROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object cdsExtratoContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 38
    Top = 12
  end
  object qryTotBloqueios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '(SELECT NVL(SUM(DECODE(ENTRADASAIDA, '#39'S'#39', -VALORLANCFINAN, VALOR' +
        'LANCFINAN)), 0)'
      ' FROM MOVIMFINANC'
      ' WHERE DATADISPFINANC > '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3'
      '       AND SITBLOQUEIOLANC = 1'
      '       AND HISTPADFINAN = 14)'
      ' +'
      
        '(SELECT NVL(SUM(DECODE(TIPOLANCTO, '#39'S'#39', -VALORLANCTO, VALORLANCT' +
        'O)), 0)'
      ' FROM MOVFINBLOQJUDICIAIS'
      ' WHERE DATALANCTO <= '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3) AS VALORTOTBLOQ'
      'FROM DUAL'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 43
    Top = 136
    object qryTotBloqueiosVALORTOTBLOQ: TFloatField
      FieldName = 'VALORTOTBLOQ'
    end
  end
  object dsTotBloqueios: TwwDataSource
    DataSet = qryTotBloqueios
    Left = 128
    Top = 136
  end
  object ppBDETotBloqueios: TppBDEPipeline
    DataSource = dsTotBloqueios
    UserName = 'BDESaldoMovimFinanc1'
    Left = 224
    Top = 137
    object ppBDETotBloqueiosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTBLOQ'
      FieldName = 'VALORTOTBLOQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayFormat = '###,###,###,##0.00'
      DisplayWidth = 0
      Position = 0
    end
  end
  object qryTotBloqJud: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(SUM(DECODE(TIPOLANCTO, '#39'S'#39', -VALORLANCTO, VALORLANCTO' +
        ')), 0)  AS VALORTOTBLOQJUD'
      ' FROM MOVFINBLOQJUDICIAIS'
      ' WHERE DATALANCTO <= '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 43
    Top = 190
    object qryTotBloqJudVALORTOTBLOQJUD: TFloatField
      FieldName = 'VALORTOTBLOQJUD'
    end
  end
  object dsTotBloqJud: TwwDataSource
    DataSet = qryTotBloqJud
    Left = 128
    Top = 190
  end
  object qryTotBloqChq: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(SUM(DECODE(ENTRADASAIDA, '#39'S'#39', -VALORLANCFINAN, VALORL' +
        'ANCFINAN)), 0) AS VALORTOTBLOQCHQ'
      ' FROM MOVIMFINANC'
      ' WHERE DATADISPFINANC > '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3'
      '       AND SITBLOQUEIOLANC = 1'
      '       AND HISTPADFINAN = 14'
      '')
    ValidateWithMask = True
    Left = 43
    Top = 252
    object qryTotBloqChqVALORTOTBLOQCHQ: TFloatField
      FieldName = 'VALORTOTBLOQCHQ'
    end
  end
  object dsTotBloqChq: TwwDataSource
    DataSet = qryTotBloqChq
    Left = 128
    Top = 252
  end
  object ppBDETotBloqJud: TppBDEPipeline
    DataSource = dsTotBloqJud
    UserName = 'BDETotBloqJud'
    Left = 226
    Top = 191
    object ppBDETotBloqJudppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTBLOQJUD'
      FieldName = 'VALORTOTBLOQJUD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
  end
  object ppBDETotBloqChq: TppBDEPipeline
    DataSource = dsTotBloqChq
    UserName = 'BDETotBloqChq'
    Left = 224
    Top = 253
    object ppBDETotBloqChqppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTBLOQCHQ'
      FieldName = 'VALORTOTBLOQCHQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayFormat = '###,###,###,##0.00'
      DisplayWidth = 0
      Position = 0
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 312
    Top = 150
  end
  object qryTotBloqOutros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT NVL(SUM(DECODE(ENTRADASAIDA, '#39'S'#39', -VALORLANCFINAN, VALORL' +
        'ANCFINAN)), 0) AS VALORTOTBLOQOUTROS'
      ' FROM MOVIMFINANC'
      ' WHERE DATADISPFINANC > '#39'31/08/2012'#39
      '       AND CODPORTADOR = 3'
      '       AND SITBLOQUEIOLANC = 1'
      '       AND HISTPADFINAN = 19'
      ''
      ' ')
    ValidateWithMask = True
    Left = 43
    Top = 322
    object qryTotBloqOutrosVALORTOTBLOQOUTROS: TFloatField
      FieldName = 'VALORTOTBLOQOUTROS'
    end
  end
  object dsTotBloqOutros: TwwDataSource
    DataSet = qryTotBloqOutros
    Left = 140
    Top = 322
  end
  object ppBDETotBloqOutros: TppBDEPipeline
    DataSource = dsTotBloqOutros
    UserName = 'BDETotBloqChq1'
    Left = 240
    Top = 323
    object ppBDETotBloqOutrosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTBLOQOUTROS'
      FieldName = 'VALORTOTBLOQOUTROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayFormat = '###,###,###,##0.00'
      DisplayWidth = 10
      Position = 0
    end
  end
end
