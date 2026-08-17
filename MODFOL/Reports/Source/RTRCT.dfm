inherited RptTRCT: TRptTRCT
  Left = 359
  Top = 153
  Width = 395
  Height = 284
  Caption = 'RptTRCT'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'IdEmpresa'
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
        Name = 'IdEmpresa'
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
        Caption = 'IdEstab'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'IdEstab'
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
        Caption = 'ExibeCCusto'
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
        Name = 'ExibeCCusto'
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
        Caption = 'IdResponsavel'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'IdResponsavel'
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
        Caption = 'TipoRescisao'
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
        Name = 'TipoRescisao'
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
        Caption = 'IdTipoFolha'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'IdTipoFolha'
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
        Caption = 'NomeTabela'
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
        Name = 'NomeTabela'
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
        Caption = 'TotaisTodasFolhas'
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
        Name = 'TotaisTodasFolhas'
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
    Report = rpTRCT
    ConnectionType = cntBDE
  end
  object rpTRCT: TppReport
    AutoStop = False
    DataPipeline = ppTRCT
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'TRCT'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5292
    PrinterSetup.mmMarginLeft = 5292
    PrinterSetup.mmMarginRight = 5292
    PrinterSetup.mmMarginTop = 5292
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
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
    Left = 199
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTRCT'
    object rpTRCTDtlBnd: TppDetailBand
      BeforeGenerate = rpTRCTDtlBndBeforeGenerate
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object rpTRCTDBTxt28: TppDBText
        UserName = 'rpTRCTDBTxt28'
        ReprintOnOverFlow = True
        DataField = 'DESCRICAO_01'
        DataPipeline = ppTRCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        WordWrap = True
        DataPipelineName = 'ppTRCT'
        mmHeight = 7408
        mmLeft = 8467
        mmTop = 794
        mmWidth = 39688
        BandType = 4
      end
      object rpTRCTDBTxt29: TppDBText
        UserName = 'rpTRCTDBTxt29'
        ReprintOnOverFlow = True
        DataField = 'DESCRICAO_02'
        DataPipeline = ppTRCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        WordWrap = True
        DataPipelineName = 'ppTRCT'
        mmHeight = 7408
        mmLeft = 69586
        mmTop = 794
        mmWidth = 39688
        BandType = 4
      end
      object rpTRCTDBTxt32: TppDBText
        UserName = 'rpTRCTDBTxt32'
        BlankWhenZero = True
        DataField = 'VALOR_03'
        DataPipeline = ppTRCT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTRCT'
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object rpTRCTDBTxt31: TppDBText
        UserName = 'rpTRCTDBTxt31'
        ReprintOnOverFlow = True
        BlankWhenZero = True
        DataField = 'DESCRICAO_03'
        DataPipeline = ppTRCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ReprintOnSubsequent = True
        WordWrap = True
        DataPipelineName = 'ppTRCT'
        mmHeight = 7408
        mmLeft = 130704
        mmTop = 794
        mmWidth = 39688
        BandType = 4
      end
      object rpTRCTDBTxt30: TppDBText
        UserName = 'rpTRCTDBTxt30'
        DataField = 'VALOR_02'
        DataPipeline = ppTRCT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        DataPipelineName = 'ppTRCT'
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object rpTRCTLine1: TppLine
        UserName = 'rpTRCTLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 48419
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object rpTRCTLine2: TppLine
        UserName = 'rpTRCTLine2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 109538
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object rpTRCTLine3: TppLine
        UserName = 'rpTRCTLine3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8467
        mmLeft = 130175
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object rpTRCTLine4: TppLine
        UserName = 'rpTRCTLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 170657
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VALOR_01'
        DataPipeline = ppTRCT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        DataPipelineName = 'ppTRCT'
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 69056
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line19'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 182563
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 190500
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line25'
        Position = lpRight
        Weight = 0.75
        mmHeight = 8731
        mmLeft = 2117
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        ShiftWithParent = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169863
        mmTop = 0
        mmWidth = 21167
        BandType = 8
      end
    end
    object rpTRCTSmryBnd: TppSummaryBand
      AfterPrint = rpTRCTSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 1323
      mmPrintPosition = 0
    end
    object rpTRCTGroup1: TppGroup
      BreakName = 'NUMPAGINA'
      DataPipeline = ppTRCT
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'rpTRCTGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTRCT'
      object rpTRCTGrpHdrBnd0: TppGroupHeaderBand
        BeforePrint = rpTRCTGrpHdrBnd0BeforePrint
        mmBottomOffset = 0
        mmHeight = 128588
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape5'
          mmHeight = 15081
          mmLeft = 137054
          mmTop = 21167
          mmWidth = 53181
          BandType = 3
          GroupNo = 0
        end
        object ppShape52: TppShape
          UserName = 'Shape2'
          mmHeight = 43921
          mmLeft = 7938
          mmTop = 79375
          mmWidth = 182563
          BandType = 3
          GroupNo = 0
        end
        object rpTRCTShape1: TppShape
          UserName = 'rpTRCTShape1'
          Brush.Color = 15329769
          mmHeight = 7144
          mmLeft = 8467
          mmTop = 0
          mmWidth = 181769
          BandType = 3
          GroupNo = 0
        end
        object rpTRCTLbl1: TppLabel
          UserName = 'rpTRCTLbl1'
          AutoSize = False
          Caption = 'TERMO DE RESCISÃO DO CONTRATO DE TRABALHO '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 9525
          mmTop = 1058
          mmWidth = 179388
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'rpTRCTShape14'
          Brush.Style = bsClear
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 43127
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object rpTRCTDBTxtCentroCusto: TppDBText
          UserName = 'rpTRCTDBTxtCentroCusto'
          DataField = 'C_CUSTO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3440
          mmLeft = 68792
          mmTop = 43127
          mmWidth = 97102
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'rpTRCTShape20'
          mmHeight = 7938
          mmLeft = 106098
          mmTop = 57679
          mmWidth = 84138
          BandType = 3
          GroupNo = 0
        end
        object ppShape11: TppShape
          UserName = 'rpTRCTShape8'
          mmHeight = 7673
          mmLeft = 75406
          mmTop = 28575
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppShape12: TppShape
          UserName = 'rpTRCTShape7'
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 28575
          mmWidth = 67469
          BandType = 3
          GroupNo = 0
        end
        object ppShape14: TppShape
          UserName = 'rpTRCTShape9'
          mmHeight = 7673
          mmLeft = 93927
          mmTop = 28575
          mmWidth = 43392
          BandType = 3
          GroupNo = 0
        end
        object ppShape15: TppShape
          UserName = 'rpTRCTShape5'
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 21167
          mmWidth = 129117
          BandType = 3
          GroupNo = 0
        end
        object ppShape16: TppShape
          UserName = 'rpTRCTShape4'
          mmHeight = 7673
          mmLeft = 48683
          mmTop = 13758
          mmWidth = 141552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'rpTRCTLbl3'
          AutoSize = False
          Caption = ' 02  Razão Social/Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 48683
          mmTop = 14023
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'rpTRCTLbl9'
          AutoSize = False
          Caption = ' 08  CNAE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 111390
          mmTop = 28840
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'rpTRCTLbl8'
          AutoSize = False
          Caption = ' 07  CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 93927
          mmTop = 28840
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'rpTRCTLbl5'
          AutoSize = False
          Caption = ' 04  Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 137054
          mmTop = 21431
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'rpTRCTLbl6'
          AutoSize = False
          Caption = ' 05  Município'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 28840
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'rpTRCTLbl7'
          AutoSize = False
          Caption = ' 06  UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 75406
          mmTop = 28840
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'rpTRCTDBTxt2'
          DataField = 'NOME_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 17198
          mmWidth = 119327
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'rpTRCTDBTxt3'
          DataField = 'ENDERECO_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 24606
          mmWidth = 126207
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'rpTRCTDBTxt7'
          DataField = 'CEP_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 94986
          mmTop = 32015
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'rpTRCTDBTxt4'
          DataField = 'BAIRRO_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 138113
          mmTop = 24606
          mmWidth = 42069
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'rpTRCTDBTxt5'
          DataField = 'CIDADE_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 32015
          mmWidth = 65352
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'rpTRCTDBTxt6'
          DataField = 'UF_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 76465
          mmTop = 32015
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'rpTRCTLbl25'
          AutoSize = False
          Caption = ' 26  Data de afastamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 147638
          mmTop = 98425
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'rpTRCTLbl12'
          AutoSize = False
          Caption = ' 11  Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 49213
          mmTop = 43392
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'rpTRCTLbl18'
          AutoSize = False
          Caption = ' 17  Carteira de trabalho (nº, série e UF)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 106098
          mmTop = 58208
          mmWidth = 50536
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'rpTRCTLbl11'
          AutoSize = False
          Caption = ' 10  PIS-PASEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 43392
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'rpTRCTLbl23'
          AutoSize = False
          Caption = ' 24  Data de admissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 61648
          mmTop = 98425
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'rpTRCTLbl29'
          AutoSize = False
          Caption = ' 30  Categoria do trabalhador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 147638
          mmTop = 106892
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'rpTRCTLbl24'
          AutoSize = False
          Caption = ' 25  Data do aviso prévio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 102923
          mmTop = 98425
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'rpTRCTLbl26'
          AutoSize = False
          Caption = ' 22  Causa do afastamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8202
          mmTop = 89429
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'rpTRCTLbl27'
          AutoSize = False
          Caption = ' 27  Cód. afastamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 7938
          mmTop = 106892
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'rpTRCTDBTxt10'
          DataField = 'NOME_EMPREGADO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 46567
          mmWidth = 119327
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'rpTRCTDBTxt21'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 62442
          mmTop = 101865
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'rpTRCTDBTxt23'
          DataField = 'DATADESLIGAMENTO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 149490
          mmTop = 101865
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object rpTRCTDBTxtCTPS: TppDBText
          UserName = 'rpTRCTDBTxtCTPS'
          DataField = 'CTPS_NUM'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 111125
          mmTop = 61383
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'rpTRCTDBTxt22'
          DataField = 'DATAAVISO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 104511
          mmTop = 101865
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'rpTRCTLbl4'
          AutoSize = False
          Caption = ' 03  Endereço (Logradouro, nº, andar, apartamento)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 21431
          mmWidth = 67733
          BandType = 3
          GroupNo = 0
        end
        object rpTRCTDBTxtPIS: TppDBText
          UserName = 'rpTRCTDBTxtPIS'
          DataField = 'PIS'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 46567
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'rpTRCTDBTxt16'
          DataField = 'CTPS_UF'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 61383
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'rpTRCTLbl28'
          AutoSize = False
          Caption = ' 28  Pensão alimentícia (%) TRTC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 61648
          mmTop = 106892
          mmWidth = 39688
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'rpTRCTDBTxt8'
          DataField = 'IDITEMCNAE'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 112713
          mmTop = 32015
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppShape21: TppShape
          UserName = 'rpTRCTShape3'
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 13758
          mmWidth = 40746
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'rpTRCTLbl2'
          AutoSize = False
          Caption = ' 01  CNPJ/CEI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 14023
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'rpTRCTDBTxt1'
          DataField = 'INSCRICAO_EMPRESA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 17198
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'rpTRCTLbl10'
          AutoSize = False
          Caption = ' 09  CNPJ/CEI Tomador/Obra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 137054
          mmTop = 28575
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'rpTRCTDBTxt9'
          DataField = 'INSCRICAO_TOMADOR'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 138113
          mmTop = 31750
          mmWidth = 42069
          BandType = 3
          GroupNo = 0
        end
        object ppShape23: TppShape
          UserName = 'rpTRCTShape15'
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 50536
          mmWidth = 118004
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'rpTRCTLbl13'
          AutoSize = False
          Caption = ' 12  Endereço (Logradouro, nº, andar, apartamento)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 50800
          mmWidth = 67733
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'rpTRCTDBTxt11'
          DataField = 'ENDERECO_EMPREGADO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 53975
          mmWidth = 115888
          BandType = 3
          GroupNo = 0
        end
        object ppShape24: TppShape
          UserName = 'rpTRCTShape18'
          mmHeight = 7673
          mmLeft = 75406
          mmTop = 57944
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppShape25: TppShape
          UserName = 'rpTRCTShape17'
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 57944
          mmWidth = 67469
          BandType = 3
          GroupNo = 0
        end
        object ppShape26: TppShape
          UserName = 'rpTRCTShape19'
          mmHeight = 7673
          mmLeft = 88900
          mmTop = 57944
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'rpTRCTLbl17'
          AutoSize = False
          Caption = ' 16  CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 58208
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'rpTRCTLbl15'
          AutoSize = False
          Caption = ' 14  Município'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 58208
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'rpTRCTLbl16'
          AutoSize = False
          Caption = ' 15  UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 75406
          mmTop = 58208
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'rpTRCTDBTxt15'
          DataField = 'CEP_EMPREGADO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 61383
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'rpTRCTDBTxt13'
          DataField = 'CIDADE_EMPREGADO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 61383
          mmWidth = 65352
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'rpTRCTDBTxt14'
          DataField = 'UF_EMPREGADO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 76465
          mmTop = 61383
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppShape27: TppShape
          UserName = 'rpTRCTShape23'
          mmHeight = 7673
          mmLeft = 85196
          mmTop = 65352
          mmWidth = 105040
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'rpTRCTLbl21'
          AutoSize = False
          Caption = ' 20  Nome da mãe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 85196
          mmTop = 65617
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'rpTRCTDBTxt19'
          DataField = 'NOME_MAE'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 86254
          mmTop = 68792
          mmWidth = 82815
          BandType = 3
          GroupNo = 0
        end
        object ppShape28: TppShape
          UserName = 'rpTRCTShape22'
          mmHeight = 7673
          mmLeft = 52123
          mmTop = 65352
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppShape29: TppShape
          UserName = 'rpTRCTShape21'
          mmHeight = 7673
          mmLeft = 8202
          mmTop = 65352
          mmWidth = 44186
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'rpTRCTLbl19'
          AutoSize = False
          Caption = ' 18  CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 65617
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'rpTRCTLbl20'
          AutoSize = False
          Caption = ' 19  Data de nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 52123
          mmTop = 65617
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object rpTRCTDBTxtCPF: TppDBText
          UserName = 'rpTRCTDBTxtCPF'
          DataField = 'CPF'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 68792
          mmWidth = 42069
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'rpTRCTDBTxt18'
          DataField = 'DATANASC'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 53181
          mmTop = 68792
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppShape30: TppShape
          UserName = 'rpTRCTShape16'
          mmHeight = 7673
          mmLeft = 125942
          mmTop = 50536
          mmWidth = 64294
          BandType = 3
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'rpTRCTLbl14'
          AutoSize = False
          Caption = ' 13  Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 125942
          mmTop = 50800
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'rpTRCTDBTxt12'
          DataField = 'BAIRRO_EMPREGADO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 127000
          mmTop = 53975
          mmWidth = 42069
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'rpTRCTDBTxt27'
          DataField = 'IDCATEMPRGRE'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 149225
          mmTop = 110331
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'rpTRCTDBTxt24'
          DataField = 'MOTIVOSAIDA'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 9790
          mmTop = 92869
          mmWidth = 62971
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'rpTRCTDBTxt25'
          DataField = 'MOTIVOFGTS'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 10319
          mmTop = 110331
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'rpTRCTDBTxt26'
          DataField = 'PENSAOALIM'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 69850
          mmTop = 110331
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label55'
          AutoSize = False
          Caption = 'DADOS DO CONTRATO'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 4191
          mmLeft = 8467
          mmTop = 74348
          mmWidth = 181769
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'Label2'
          Caption = ' 21  Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 7938
          mmTop = 79904
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'Label3'
          Caption = 'Contrato de Trabalho por prazo indeterminado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 9260
          mmTop = 83344
          mmWidth = 50006
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 17463
          mmLeft = 102923
          mmTop = 97631
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 86519
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLabel58: TppLabel
          UserName = 'Label58'
          Caption = ' 23  Remuneração Mês Anterior Afast.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 7938
          mmTop = 98425
          mmWidth = 44186
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 105040
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 17727
          mmLeft = 61648
          mmTop = 97631
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 114036
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'Line101'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 17727
          mmLeft = 147638
          mmTop = 97631
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          AutoSize = False
          Caption = ' 29 Pensão alimentícia (%) (Saque FGTS)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 7144
          mmLeft = 103452
          mmTop = 106892
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label61'
          AutoSize = False
          Caption = ' 31  Código Sindical'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 7938
          mmTop = 115888
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line3'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 73025
          mmTop = 115359
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppLabel63: TppLabel
          UserName = 'Label63'
          Caption = ' 32 CNPJ e Nome da Entidade Sindical Laboral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 73025
          mmTop = 115888
          mmWidth = 56356
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'IDENTIFICAÇÃO DO TRABALHADOR'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 4191
          mmLeft = 8467
          mmTop = 38100
          mmWidth = 181505
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label54'
          AutoSize = False
          Caption = 'IDENTIFICAÇÃO DO EMPREGADOR'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 4191
          mmLeft = 8467
          mmTop = 9260
          mmWidth = 181505
          BandType = 3
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'rpTRCTLbl30'
          AutoSize = False
          Caption = 'DISCRIMINAÇÃO DAS VERBAS RESCISÓRIAS'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 4233
          mmLeft = 8202
          mmTop = 124354
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'PERCENTUAL'
          DataPipeline = ppTRCT
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 2910
          mmLeft = 121973
          mmTop = 110331
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object lblSomaRub: TppLabel
          UserName = 'lblSomaRub'
          AutoSize = False
          Caption = '0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 10054
          mmTop = 101865
          mmWidth = 42333
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line12'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 136790
          mmTop = 28575
          mmWidth = 53446
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7144
          mmLeft = 110861
          mmTop = 28840
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 8202
          mmTop = 96309
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 48683
          mmTop = 43127
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'CODIGO_SINDICAL'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 10319
          mmTop = 119063
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'SINDICATO'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 2879
          mmLeft = 77523
          mmTop = 119063
          mmWidth = 13123
          BandType = 3
          GroupNo = 0
        end
      end
      object rpTRCTGrpFootBnd0: TppGroupFooterBand
        BeforePrint = rpTRCTGrpFootBnd0BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMPAGINA'
      DataPipeline = ppTRCT
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTRCT'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforeGenerate = ppGroupFooterBand1BeforeGenerate
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape9: TppShape
          UserName = 'Shape8'
          mmHeight = 6085
          mmLeft = 7938
          mmTop = 0
          mmWidth = 182827
          BandType = 5
          GroupNo = 1
        end
        object ppShape17: TppShape
          UserName = 'Shape17'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 5821
          mmLeft = 130175
          mmTop = 265
          mmWidth = 60590
          BandType = 5
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line4'
          Position = lpRight
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 161396
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
        object rpTRCTLbl36: TppLabel
          UserName = 'rpTRCTLbl36'
          AutoSize = False
          Caption = 'Total de Proventos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 2910
          mmLeft = 10054
          mmTop = 2117
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object rpTRCTLbl37: TppLabel
          UserName = 'rpTRCTLbl37'
          AutoSize = False
          Caption = 'Total de Descontos: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 2910
          mmLeft = 70644
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 1
        end
        object rpTRCTLbl38: TppLabel
          UserName = 'rpTRCTLbl38'
          AutoSize = False
          Caption = 'VALOR LÍQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 131234
          mmTop = 1323
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object rpTRCTLblTOT_LIQUIDO: TppLabel
          UserName = 'rpTRCTLblTOT_LIQUIDO'
          AutoSize = False
          Caption = 'rpTRCTLblTOT_LIQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3387
          mmLeft = 170127
          mmTop = 1323
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object ppShape13: TppShape
          UserName = 'Shape13'
          mmHeight = 6085
          mmLeft = 109538
          mmTop = 0
          mmWidth = 20902
          BandType = 5
          GroupNo = 1
        end
        object ppLine34: TppLine
          UserName = 'Line27'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 48419
          mmTop = 265
          mmWidth = 4498
          BandType = 5
          GroupNo = 1
        end
        object ppLine35: TppLine
          UserName = 'Line28'
          Position = lpRight
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 61648
          mmTop = 0
          mmWidth = 7673
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TIPORUBRICA'
      DataPipeline = ppTRCT
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTRCT'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforeGenerate = ppGroupHeaderBand2BeforeGenerate
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLabel31: TppLabel
          UserName = 'rpTRCTLbl31'
          AutoSize = False
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 8467
          mmTop = 6085
          mmWidth = 39688
          BandType = 3
          GroupNo = 2
        end
        object ppLabel32: TppLabel
          UserName = 'rpTRCTLbl32'
          AutoSize = False
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 69586
          mmTop = 6085
          mmWidth = 39688
          BandType = 3
          GroupNo = 2
        end
        object ppLabel33: TppLabel
          UserName = 'rpTRCTLbl35'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 171186
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
        object ppLabel34: TppLabel
          UserName = 'rpTRCTLbl34'
          AutoSize = False
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 130704
          mmTop = 6085
          mmWidth = 39688
          BandType = 3
          GroupNo = 2
        end
        object ppLabel35: TppLabel
          UserName = 'rpTRCTLbl33'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 110067
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
        object ppLabel47: TppLabel
          UserName = 'Label47'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 48948
          mmTop = 6085
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line14'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 109538
          mmTop = 5292
          mmWidth = 4233
          BandType = 3
          GroupNo = 2
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5292
          mmLeft = 48419
          mmTop = 5027
          mmWidth = 4233
          BandType = 3
          GroupNo = 2
        end
        object ppLine21: TppLine
          UserName = 'Line201'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 69056
          mmTop = 5292
          mmWidth = 4233
          BandType = 3
          GroupNo = 2
        end
        object ppLine22: TppLine
          UserName = 'Line22'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 130175
          mmTop = 5292
          mmWidth = 4233
          BandType = 3
          GroupNo = 2
        end
        object ppLine23: TppLine
          UserName = 'Line23'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 170657
          mmTop = 5292
          mmWidth = 4233
          BandType = 3
          GroupNo = 2
        end
        object lblTipoVerba: TppLabel
          UserName = 'lblTipoVerba'
          Caption = 'VERBAS RESCISÓRIAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 8467
          mmTop = 1323
          mmWidth = 34925
          BandType = 3
          GroupNo = 2
        end
        object ppLine15: TppLine
          UserName = 'Line7'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 7938
          mmTop = 5027
          mmWidth = 182827
          BandType = 3
          GroupNo = 2
        end
        object ppLine17: TppLine
          UserName = 'Line16'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 7938
          mmTop = 265
          mmWidth = 182827
          BandType = 3
          GroupNo = 2
        end
        object ppLine18: TppLine
          UserName = 'Line17'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 190500
          mmTop = 265
          mmWidth = 3969
          BandType = 3
          GroupNo = 2
        end
        object ppLine19: TppLine
          UserName = 'Line18'
          Position = lpRight
          Weight = 0.75
          mmHeight = 10319
          mmLeft = 1323
          mmTop = 265
          mmWidth = 6879
          BandType = 3
          GroupNo = 2
        end
        object ppLine26: TppLine
          UserName = 'Line24'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 8202
          mmTop = 8731
          mmWidth = 182298
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        BeforeGenerate = ppGroupFooterBand2BeforeGenerate
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 6615
          mmLeft = 130175
          mmTop = 0
          mmWidth = 60590
          BandType = 5
          GroupNo = 2
        end
        object ppLine16: TppLine
          UserName = 'Line15'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6879
          mmLeft = 161396
          mmTop = 0
          mmWidth = 9525
          BandType = 5
          GroupNo = 2
        end
        object lblValorBloco: TppLabel
          UserName = 'lblValorBloco'
          Caption = 'VALOR BRUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 131498
          mmTop = 1323
          mmWidth = 20373
          BandType = 5
          GroupNo = 2
        end
        object ppLine30: TppLine
          UserName = 'Line30'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6615
          mmLeft = 103717
          mmTop = 0
          mmWidth = 6085
          BandType = 5
          GroupNo = 2
        end
        object ppLine31: TppLine
          UserName = 'Line301'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6879
          mmLeft = 63236
          mmTop = 0
          mmWidth = 6085
          BandType = 5
          GroupNo = 2
        end
        object ppLine32: TppLine
          UserName = 'Line302'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6615
          mmLeft = 43921
          mmTop = 0
          mmWidth = 4763
          BandType = 5
          GroupNo = 2
        end
        object ppLine33: TppLine
          UserName = 'Line303'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6350
          mmLeft = 5292
          mmTop = 0
          mmWidth = 2910
          BandType = 5
          GroupNo = 2
        end
        object ppLine28: TppLine
          UserName = 'Line26'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6615
          mmLeft = 124090
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 2
        end
        object ppLine29: TppLine
          UserName = 'Line29'
          Position = lpRight
          Weight = 0.75
          mmHeight = 6615
          mmLeft = 184415
          mmTop = 0
          mmWidth = 6350
          BandType = 5
          GroupNo = 2
        end
        object rpTRCTLblTOT_DESC: TppLabel
          UserName = 'rpTRCTLblTOT_DESC'
          AutoSize = False
          Caption = 'rpTRCTLblTOT_DESC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 71702
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 2
        end
        object rpTRCTLblTOT_PROV: TppLabel
          UserName = 'rpTRCTLblTOT_PROV'
          AutoSize = False
          Caption = 'rpTRCTLblTOT_PROV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 11113
          mmTop = 1323
          mmWidth = 31221
          BandType = 5
          GroupNo = 2
        end
        object lblValorGrupo: TppLabel
          UserName = 'lblValorGrupo'
          Caption = 'lblValorGrupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3387
          mmLeft = 170392
          mmTop = 1323
          mmWidth = 19579
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppTRCT: TppBDEPipeline
    DataSource = dsTRCT
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'TRCT'
    Left = 195
    Top = 48
    object ppTRCTppField1: TppField
      FieldAlias = 'NOME_EMPRESA'
      FieldName = 'NOME_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField2: TppField
      FieldAlias = 'INSCRICAO_EMPRESA'
      FieldName = 'INSCRICAO_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField3: TppField
      FieldAlias = 'ENDERECO_EMPRESA'
      FieldName = 'ENDERECO_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField4: TppField
      FieldAlias = 'BAIRRO_EMPRESA'
      FieldName = 'BAIRRO_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField5: TppField
      FieldAlias = 'CIDADE_EMPRESA'
      FieldName = 'CIDADE_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField6: TppField
      FieldAlias = 'UF_EMPRESA'
      FieldName = 'UF_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField7: TppField
      FieldAlias = 'CEP_EMPRESA'
      FieldName = 'CEP_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField8: TppField
      FieldAlias = 'IDITEMCNAE'
      FieldName = 'IDITEMCNAE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField9: TppField
      FieldAlias = 'INSCRICAO_TOMADOR'
      FieldName = 'INSCRICAO_TOMADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField10: TppField
      FieldAlias = 'NOME_EMPREGADO'
      FieldName = 'NOME_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField11: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField12: TppField
      FieldAlias = 'PIS'
      FieldName = 'PIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField13: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField14: TppField
      FieldAlias = 'CTPS_NUM'
      FieldName = 'CTPS_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField15: TppField
      FieldAlias = 'CTPS_UF'
      FieldName = 'CTPS_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField16: TppField
      FieldAlias = 'ENDERECO_EMPREGADO'
      FieldName = 'ENDERECO_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField17: TppField
      FieldAlias = 'BAIRRO_EMPREGADO'
      FieldName = 'BAIRRO_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField18: TppField
      FieldAlias = 'CIDADE_EMPREGADO'
      FieldName = 'CIDADE_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField19: TppField
      FieldAlias = 'UF_EMPREGADO'
      FieldName = 'UF_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField20: TppField
      FieldAlias = 'CEP_EMPREGADO'
      FieldName = 'CEP_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField21: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField22: TppField
      FieldAlias = 'NOME_MAE'
      FieldName = 'NOME_MAE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField23: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField24: TppField
      FieldAlias = 'DATAAVISO'
      FieldName = 'DATAAVISO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField25: TppField
      FieldAlias = 'DATADESLIGAMENTO'
      FieldName = 'DATADESLIGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField26: TppField
      FieldAlias = 'MOTIVOSAIDA'
      FieldName = 'MOTIVOSAIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField27: TppField
      FieldAlias = 'MOTIVOFGTS'
      FieldName = 'MOTIVOFGTS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField28: TppField
      FieldAlias = 'PENSAOALIM'
      FieldName = 'PENSAOALIM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField29: TppField
      FieldAlias = 'IDCATEMPRGRE'
      FieldName = 'IDCATEMPRGRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField30: TppField
      FieldAlias = 'REM_FINS_RESCISORIOS'
      FieldName = 'REM_FINS_RESCISORIOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField31: TppField
      FieldAlias = 'DIVISAO'
      FieldName = 'DIVISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField32: TppField
      FieldAlias = 'CODRUBRICA'
      FieldName = 'CODRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField33: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField34: TppField
      FieldAlias = 'TIPORUBRICA'
      FieldName = 'TIPORUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField35: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField36: TppField
      FieldAlias = 'PROVENTOS'
      FieldName = 'PROVENTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField37: TppField
      FieldAlias = 'DESCONTOS'
      FieldName = 'DESCONTOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField38: TppField
      FieldAlias = 'HOMOLOGACAO'
      FieldName = 'HOMOLOGACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField39: TppField
      FieldAlias = 'RESPONSAVEL'
      FieldName = 'RESPONSAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField40: TppField
      FieldAlias = 'CODIGO_SINDICAL'
      FieldName = 'CODIGO_SINDICAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField41: TppField
      FieldAlias = 'SINDICATO'
      FieldName = 'SINDICATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField42: TppField
      FieldAlias = 'NUMPAGINA'
      FieldName = 'NUMPAGINA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField43: TppField
      FieldAlias = 'TOT_PROV'
      FieldName = 'TOT_PROV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField44: TppField
      FieldAlias = 'TOT_DESC'
      FieldName = 'TOT_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField45: TppField
      FieldAlias = 'TOT_LIQUIDO'
      FieldName = 'TOT_LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField46: TppField
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField47: TppField
      FieldAlias = 'FLGPENSAO'
      FieldName = 'FLGPENSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField48: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField49: TppField
      FieldAlias = 'SEQU'
      FieldName = 'SEQU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField50: TppField
      FieldAlias = 'NEXTSEQU'
      FieldName = 'NEXTSEQU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField51: TppField
      FieldAlias = 'DESCRICAO_01'
      FieldName = 'DESCRICAO_01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField52: TppField
      FieldAlias = 'DESCRICAO_02'
      FieldName = 'DESCRICAO_02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField53: TppField
      FieldAlias = 'DESCRICAO_03'
      FieldName = 'DESCRICAO_03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField54: TppField
      FieldAlias = 'VALOR_01'
      FieldName = 'VALOR_01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField55: TppField
      FieldAlias = 'VALOR_02'
      FieldName = 'VALOR_02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField56: TppField
      FieldAlias = 'VALOR_03'
      FieldName = 'VALOR_03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppTRCTppField57: TppField
      FieldAlias = 'SOMAGRUPO'
      FieldName = 'SOMAGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
  end
  object dsTRCT: TwwDataSource
    DataSet = CdsTRCT
    Left = 195
    Top = 96
  end
  object sqlTRCT: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  RPAD('#39'1'#39',60,'#39'1'#39') NOME_EMPRESA,'
      '  RPAD('#39'1'#39',18,'#39'1'#39') INSCRICAO_EMPRESA,'
      '  RPAD('#39'1'#39',93,'#39'1'#39') ENDERECO_EMPRESA,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') BAIRRO_EMPRESA,'
      '  RPAD('#39'1'#39',50,'#39'1'#39') CIDADE_EMPRESA,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') UF_EMPRESA,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') CEP_EMPRESA,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') IDITEMCNAE,'
      '  RPAD('#39'1'#39',17,'#39'1'#39') INSCRICAO_TOMADOR,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') NOME_EMPREGADO,'
      '  RPAD('#39'1'#39',30,'#39'1'#39') C_CUSTO,'
      '  RPAD('#39'1'#39',18,'#39'1'#39') PIS,'
      '  RPAD('#39'1'#39',18,'#39'1'#39') CPF,'
      '  RPAD('#39'1'#39',18,'#39'1'#39') CTPS_NUM,'
      '  RPAD('#39'1'#39',03,'#39'1'#39') CTPS_UF,'
      '  RPAD('#39'1'#39',93,'#39'1'#39') ENDERECO_EMPREGADO,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') BAIRRO_EMPREGADO,'
      '  RPAD('#39'1'#39',50,'#39'1'#39') CIDADE_EMPREGADO,'
      '  RPAD('#39'1'#39',02,'#39'1'#39') UF_EMPREGADO,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') CEP_EMPREGADO,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') DATANASC,'
      '  RPAD('#39'1'#39',50,'#39'1'#39') NOME_MAE,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') DATAADMISSAO,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') DATAAVISO,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') DATADESLIGAMENTO,'
      '  RPAD('#39'1'#39',50,'#39'1'#39') MOTIVOSAIDA,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') MOTIVOFGTS,'
      '  RPAD('#39'1'#39',40,'#39'1'#39') PENSAOALIM,'
      '  '#39'12'#39' IDCATEMPRGRE,'
      '  0 REM_FINS_RESCISORIOS,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') DIVISAO,'
      '  RPAD('#39'1'#39',15,'#39'1'#39') CODRUBRICA,'
      '  0 IDPROVENTO,'
      '  RPAD('#39'1'#39',130,'#39'1'#39') RUBRICA,'
      '  0 TIPORUBRICA,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') REFERENCIA,'
      '  0 PROVENTOS,'
      '  0 DESCONTOS,'
      '  RPAD('#39'1'#39',71,'#39'1'#39') HOMOLOGACAO,'
      '  RPAD('#39'1'#39',71,'#39'1'#39') RESPONSAVEL,'
      '  RPAD('#39'1'#39',93,'#39'1'#39') CODIGO_SINDICAL,'
      '  RPAD('#39'1'#39',93,'#39'1'#39') SINDICATO, '
      '  0 NUMPAGINA,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') TOT_PROV,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') TOT_DESC,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') TOT_LIQUIDO,'
      '  0 PERCENTUAL,'
      '  RPAD('#39'1'#39',3,'#39'1'#39') FLGPENSAO,'
      '  0 IDPESSOA,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') SEQU,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') NextSEQU'
      '--SOL219119 -INICIO'
      '  ,RPAD('#39'1'#39',145,'#39'1'#39') descricao_01,'
      '  RPAD('#39'1'#39',145,'#39'1'#39') descricao_02,'
      '  RPAD('#39'1'#39',145,'#39'1'#39') descricao_03,'
      '  0 valor_01,'
      '  0 valor_02,'
      '  0 valor_03,'
      '  0 somagrupo'
      '  --SOL219119 -FIM'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsTRCT
    Left = 187
    Top = 184
  end
  object CdsTRCT: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME_EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'INSCRICAO_EMPRESA'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'ENDERECO_EMPRESA'
        DataType = ftString
        Size = 93
      end
      item
        Name = 'BAIRRO_EMPRESA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE_EMPRESA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UF_EMPRESA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CEP_EMPRESA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IDITEMCNAE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'INSCRICAO_TOMADOR'
        DataType = ftString
        Size = 17
      end
      item
        Name = 'NOME_EMPREGADO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'C_CUSTO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PIS'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CTPS_NUM'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'CTPS_UF'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ENDERECO_EMPREGADO'
        DataType = ftString
        Size = 93
      end
      item
        Name = 'BAIRRO_EMPREGADO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE_EMPREGADO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UF_EMPREGADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP_EMPREGADO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATANASC'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NOME_MAE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DATAADMISSAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATAAVISO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DATADESLIGAMENTO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'MOTIVOSAIDA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MOTIVOFGTS'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PENSAOALIM'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'IDCATEMPRGRE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'REM_FINS_RESCISORIOS'
        DataType = ftFloat
      end
      item
        Name = 'DIVISAO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CODRUBRICA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'IDPROVENTO'
        DataType = ftInteger
      end
      item
        Name = 'RUBRICA'
        DataType = ftString
        Size = 130
      end
      item
        Name = 'TIPORUBRICA'
        DataType = ftFloat
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PROVENTOS'
        DataType = ftFloat
      end
      item
        Name = 'DESCONTOS'
        DataType = ftFloat
      end
      item
        Name = 'HOMOLOGACAO'
        DataType = ftString
        Size = 71
      end
      item
        Name = 'RESPONSAVEL'
        DataType = ftString
        Size = 71
      end
      item
        Name = 'CODIGO_SINDICAL'
        DataType = ftString
        Size = 93
      end
      item
        Name = 'SINDICATO'
        DataType = ftString
        Size = 93
      end
      item
        Name = 'NUMPAGINA'
        DataType = ftFloat
      end
      item
        Name = 'TOT_PROV'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TOT_DESC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TOT_LIQUIDO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PERCENTUAL'
        DataType = ftFloat
      end
      item
        Name = 'FLGPENSAO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'SEQU'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NEXTSEQU'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO_01'
        DataType = ftString
        Size = 145
      end
      item
        Name = 'DESCRICAO_02'
        DataType = ftString
        Size = 145
      end
      item
        Name = 'DESCRICAO_03'
        DataType = ftString
        Size = 145
      end
      item
        Name = 'VALOR_01'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_02'
        DataType = ftFloat
      end
      item
        Name = 'VALOR_03'
        DataType = ftFloat
      end
      item
        Name = 'SOMAGRUPO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'Index1'
        Fields = 'NOME_EMPREGADO'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = CdsTRCTAfterScroll
    Left = 187
    Top = 144
  end
  object qryRubAnt: TQuery
    DatabaseName = 'BaseDados'
    Left = 48
    Top = 96
  end
end
