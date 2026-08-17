inherited RptTRCT_Homologacao: TRptTRCT_Homologacao
  Left = 307
  Top = 139
  Width = 395
  Height = 284
  Caption = 'RptTRCT_Homologacao'
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
    PrinterSetup.PaperSize = 0
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
    Left = 195
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTRCT'
    object rpTRCTDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
        mmHeight = 253471
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'rpTRCTShape14'
          Brush.Style = bsClear
          mmHeight = 19844
          mmLeft = 8202
          mmTop = 28840
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
          mmTop = 29369
          mmWidth = 97102
          BandType = 3
          GroupNo = 0
        end
        object ppShape16: TppShape
          UserName = 'rpTRCTShape4'
          mmHeight = 8731
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
          mmLeft = 49213
          mmTop = 14288
          mmWidth = 32279
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
          mmLeft = 51065
          mmTop = 17727
          mmWidth = 119327
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
          mmTop = 29369
          mmWidth = 15875
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
          mmLeft = 8731
          mmTop = 29633
          mmWidth = 20373
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
          mmLeft = 51329
          mmTop = 33073
          mmWidth = 119327
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
          mmLeft = 10848
          mmTop = 33073
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppShape21: TppShape
          UserName = 'rpTRCTShape3'
          mmHeight = 8731
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
          mmLeft = 8731
          mmTop = 14288
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
          mmLeft = 10319
          mmTop = 17992
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 8996
          mmTop = 142346
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 9260
          mmLeft = 8202
          mmTop = 54504
          mmWidth = 182034
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
          mmLeft = 8731
          mmTop = 55033
          mmWidth = 34925
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
          mmLeft = 10848
          mmTop = 58208
          mmWidth = 62971
          BandType = 3
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 8467
          mmLeft = 8202
          mmTop = 63500
          mmWidth = 182034
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
          mmLeft = 8996
          mmTop = 64294
          mmWidth = 28310
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
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 11377
          mmTop = 67733
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape5'
          mmHeight = 8467
          mmLeft = 8202
          mmTop = 71702
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 48683
          mmTop = 63765
          mmWidth = 1058
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
          mmLeft = 49477
          mmTop = 64294
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
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 51594
          mmTop = 67733
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 83344
          mmTop = 63765
          mmWidth = 1058
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
          mmLeft = 84138
          mmTop = 64029
          mmWidth = 31750
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
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 85990
          mmTop = 67469
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'Line18'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 121444
          mmTop = 63765
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'rpTRCTLbl27'
          AutoSize = False
          Caption = ' 27  Cód. afast.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 122238
          mmTop = 64294
          mmWidth = 26723
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
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 124619
          mmTop = 67733
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line24'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 150284
          mmTop = 63765
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          AutoSize = False
          Caption = ' 29 Pensão alimentícia (%) FGTS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3175
          mmLeft = 151342
          mmTop = 64294
          mmWidth = 38365
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
          mmLeft = 154252
          mmTop = 67733
          mmWidth = 17992
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
          mmLeft = 8996
          mmTop = 72496
          mmWidth = 36513
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
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 11113
          mmTop = 75936
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppMemo1: TppMemo
          UserName = 'Memo1'
          Caption = 
            'Foi realizada a rescisão do contrato de trabalho do trabalhador ' +
            'acima qualificado, nos termos do artigo n.º 477 da Consolidação ' +
            'das Leis do'#13#10'Trabalho (CLT). A assistência à rescisão prevista n' +
            'o [] 1º do art. da CLT não é devida, tendo em vista a duração do' +
            ' contrato de'#13#10'trabalho não ser superior a um ano de serviço e nã' +
            'o existir previsão de assistência à rescisão contratual em Acord' +
            'o ou Convenção Coletiva'#13#10'de Trabalho da categoria a qual pertenc' +
            'e o trabalhador.'#13#10#13#10'No dia       /      /          foi realizado' +
            ', nos termos do art. 23 da Instrução Normativa/SRT n.º 15/2010, ' +
            'o efetivo pagamento das verbas'#13#10'rescisórias especificadas no cor' +
            'po do TRCT, no valor líquido de R$                   , o qual, d' +
            'evidamente rubricado pelas partes, é parte'#13#10'integrante do presen' +
            'te Termo de Quitação.'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            ' ')
          Transparent = True
          mmHeight = 24606
          mmLeft = 8202
          mmTop = 94986
          mmWidth = 182298
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = '150 Assinatura do Empregador ou Proposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8996
          mmTop = 144198
          mmWidth = 53711
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = '151 Assinatura do Trabalhador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8996
          mmTop = 167217
          mmWidth = 53711
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 8996
          mmTop = 165365
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = '152 Assinatura do Responsável Legal do Trabalhador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 111125
          mmTop = 167217
          mmWidth = 73025
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 111125
          mmTop = 165365
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label2'
          Caption = 
            '                                             /                  ' +
            '               ,                                 de             ' +
            '                                                 de             ' +
            '                             .'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 8467
          mmTop = 123031
          mmWidth = 153332
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'rpTRCTLbl18'
          AutoSize = False
          Caption = ' 17  CTPS (nº, série e UF)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 39952
          mmWidth = 37571
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
          mmLeft = 8731
          mmTop = 43392
          mmWidth = 20373
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
          mmLeft = 29369
          mmTop = 43392
          mmWidth = 13758
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
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3704
          mmLeft = 49742
          mmTop = 43127
          mmWidth = 26458
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
          mmLeft = 49213
          mmTop = 39688
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 76465
          mmTop = 38629
          mmWidth = 1058
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
          mmLeft = 76994
          mmTop = 39688
          mmWidth = 28840
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
          mmLeft = 78846
          mmTop = 43127
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 106098
          mmTop = 38629
          mmWidth = 1058
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
          mmLeft = 106627
          mmTop = 39688
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
          mmLeft = 107156
          mmTop = 43127
          mmWidth = 82550
          BandType = 3
          GroupNo = 0
        end
        object ppShape9: TppShape
          UserName = 'Shape9'
          mmHeight = 8467
          mmLeft = 8202
          mmTop = 79904
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 48683
          mmTop = 80169
          mmWidth = 1058
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
          mmLeft = 8996
          mmTop = 80698
          mmWidth = 36513
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
          mmLeft = 49213
          mmTop = 80698
          mmWidth = 56356
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = '153 Carimbo e Assinatura do Assistente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 9260
          mmTop = 189971
          mmWidth = 53711
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 9260
          mmTop = 188119
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = '154 Nome do Órgão Homologador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 111390
          mmTop = 189971
          mmWidth = 73025
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 111390
          mmTop = 188119
          mmWidth = 71967
          BandType = 3
          GroupNo = 0
        end
        object ppShape11: TppShape
          UserName = 'Shape11'
          mmHeight = 55563
          mmLeft = 7144
          mmTop = 197909
          mmWidth = 182298
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = '155 Ressalvas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8996
          mmTop = 198967
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppShape12: TppShape
          UserName = 'Shape12'
          mmHeight = 6085
          mmLeft = 8202
          mmTop = 1852
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'TERMO DE HOMOLOGAÇÃO DE RESCISÃO DO CONTRATO DE TRABALHO'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 4498
          mmLeft = 9260
          mmTop = 2646
          mmWidth = 180182
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label54'
          AutoSize = False
          Caption = 'EMPREGADOR'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 4191
          mmLeft = 8202
          mmTop = 8996
          mmWidth = 181769
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'TRABALHADOR'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 23548
          mmWidth = 181769
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label55'
          AutoSize = False
          Caption = 'CONTRATO'
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 50006
          mmWidth = 181769
          BandType = 3
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 19844
          mmLeft = 48683
          mmTop = 28840
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 8467
          mmTop = 38365
          mmWidth = 181769
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'CODIGO_SINDICAL'
          DataPipeline = ppTRCT
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTRCT'
          mmHeight = 3175
          mmLeft = 10583
          mmTop = 84402
          mmWidth = 36513
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
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
          mmHeight = 3175
          mmLeft = 52123
          mmTop = 84138
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
      end
      object rpTRCTGrpFootBnd0: TppGroupFooterBand
        BeforePrint = rpTRCTGrpFootBnd0BeforePrint
        mmBottomOffset = 0
        mmHeight = 18785
        mmPrintPosition = 0
        object ppMemo2: TppMemo
          UserName = 'Memo2'
          Caption = 
            'A ASSISTÊNCIA NO ATO DE RESCISÃO CONTRATUAL É GRATUITA.'#13#10'Pode o ' +
            'trabalhador iniciar ação judicial aos créditos resultantes das r' +
            'elações de trabalho até o limite de dois anos'#13#10'após a extinção d' +
            'o contrato de trabalho (Inc. XXIX, Art. 7º da Constituição Feder' +
            'al/1988).'#13#10
          CharWrap = False
          Color = 13816530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Lines.Strings = (
            'A ASSISTÊNCIA NO ATO DE RESCISÃO CONTRATUAL É GRATUITA.'
            
              'Pode o trabalhador iniciar ação judicial aos créditos resultante' +
              's das relações de trabalho até o limite de dois anos'
            
              'após a extinção do contrato de trabalho (Inc. XXIX, Art. 7º da C' +
              'onstituição Federal/1988).')
          TextAlignment = taCentered
          mmHeight = 13494
          mmLeft = 7144
          mmTop = 5292
          mmWidth = 182298
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 5556
          mmLeft = 7144
          mmTop = 0
          mmWidth = 182298
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label6'
          Caption = '156 Informações à CAIXA:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 8202
          mmTop = 1058
          mmWidth = 30395
          BandType = 5
          GroupNo = 0
        end
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
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
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
      '  RPAD('#39'1'#39',130,'#39'1'#39') RUBRICA,'
      '  0 TIPORUBRICA,'
      '  RPAD('#39'1'#39',10,'#39'1'#39') REFERENCIA,'
      '  0 PROVENTOS,'
      '  0 DESCONTOS,'
      '  RPAD('#39'1'#39',71,'#39'1'#39') HOMOLOGACAO,'
      '  RPAD('#39'1'#39',71,'#39'1'#39') RESPONSAVEL,'
      '  RPAD('#39'1'#39',93,'#39'1'#39') CODIGO_SINDICAL,'
      '  RPAD('#39'1'#39',93,'#39'1'#39') SINDICATO,'
      '  0 NUMPAGINA,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') TOT_PROV,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') TOT_DESC,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') TOT_LIQUIDO,'
      '  0 PERCENTUAL,'
      '  RPAD('#39'1'#39',3,'#39'1'#39') FLGPENSAO,'
      '  0 IDPESSOA,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') SEQU,'
      '  RPAD('#39'1'#39',20,'#39'1'#39') NextSEQU'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsTRCT
    Left = 187
    Top = 182
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
