inherited RptSalarioEduc: TRptSalarioEduc
  Left = 241
  Top = 194
  Width = 281
  Height = 267
  Caption = 'RptSalarioEduc'
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
        Caption = 'ListaTipoFolha'
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
        Name = 'ListaTipoFolha'
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
        Caption = 'NumConvRec'
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
        Name = 'NumConvRec'
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
        Caption = 'DataVencimento'
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
        Name = 'DataVencimento'
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
        Caption = 'AgenciaCentralizadora'
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
        Name = 'AgenciaCentralizadora'
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
        Caption = 'NumeroConta'
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
        Name = 'NumeroConta'
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
        Caption = 'Competencia13'
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
        Name = 'Competencia13'
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
        Caption = 'PercentualContribFPAS'
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
        Name = 'PercentualContribFPAS'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpSalarioEduc
    ConnectionType = cntBDE
  end
  object rpSalarioEduc: TppReport
    AutoStop = False
    DataPipeline = ppSalarioEduc
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
    Left = 211
    Version = '5.5'
    mmColumnWidth = 197300
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpSalarioEducSmryBnd: TppSummaryBand
      AfterPrint = rpSalarioEducSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
    end
    object ppGroup8: TppGroup
      BreakName = 'ESTAB'
      DataPipeline = ppSalarioEduc
      NewPage = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpSalarioEducGroupFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 191559
        mmPrintPosition = 0
        object rpSalarioEducShape37: TppShape
          UserName = 'Shape30'
          mmHeight = 7673
          mmLeft = 150284
          mmTop = 110861
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape18: TppShape
          UserName = 'Shape21'
          mmHeight = 8467
          mmLeft = 150019
          mmTop = 73819
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape6: TppShape
          UserName = 'Shape32'
          mmHeight = 7673
          mmLeft = 4233
          mmTop = 29633
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape9: TppShape
          UserName = 'Shape2'
          mmHeight = 8202
          mmLeft = 150019
          mmTop = 4763
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape10: TppShape
          UserName = 'Shape3'
          mmHeight = 7673
          mmLeft = 150019
          mmTop = 12700
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape3: TppShape
          UserName = 'Shape14'
          mmHeight = 13758
          mmLeft = 102129
          mmTop = 4763
          mmWidth = 41804
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl4: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'PAGÁVEL SOMENTE NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 102659
          mmTop = 7938
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape2: TppShape
          UserName = 'Shape15'
          mmHeight = 13758
          mmLeft = 30427
          mmTop = 4763
          mmWidth = 70379
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape4: TppShape
          UserName = 'Shape16'
          mmHeight = 8996
          mmLeft = 30427
          mmTop = 19579
          mmWidth = 113506
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'FUNDO NACIONAL DA DESENVOLVIMENTO DE EDUCAÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 31485
          mmTop = 23548
          mmWidth = 111390
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl6: TppLabel
          UserName = 'Label10'
          Caption = '1. Cedente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 31485
          mmTop = 20108
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape1: TppShape
          UserName = 'Shape17'
          mmHeight = 23548
          mmLeft = 4233
          mmTop = 5027
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducImage1: TppImage
          UserName = 'Image1'
          MaintainAspectRatio = False
          Picture.Data = {
            07544269746D617032590000424D325900000000000036000000280000005900
            0000550000000100180000000000FC580000C30E0000C30E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6CCCCCCCDCDCDCACACAF9F9F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4C4C4C4C7C7C7D2D2D2F6F6F6FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DE
            DEDEC6C6C6C3C3C3CBCBCBEEEEEED4D4D4FBFBFBE6E6E6D5D5D5FEFEFEFFFFFF
            FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFF9F9F9FEFEFEFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E13131319
            1919171717111111636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F1212
            121A1A1A1A1A1A6A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFCBCBCB2B2B2B1E1E1E1C1C1C1E1E1E2B2B2B3232322A2A2A373737
            2424242121213030304A4A4A6565659E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD3D3D3D3232323636362C2C2C4F
            4F4F4F4F4F3C3C3C4F4F4F4747474141414545454949494040403C3C3C393939
            3A3A3A3E3E3E999999FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF878787000000000000000000000000424242FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF404040000000000000000000585858FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B1000000000000000000000000
            0000000000000000000000000000000000000000000000000000000B0B0B6C6C
            6CC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E019
            19190000000000000202020505050000000B0B0B090909010101000000000000
            080808000000000000070707000000000000717171FFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2000000000000000000000000
            3C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51515100000000000000000053
            5353FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E
            0000000000000101010000000000000000000101010505050101010B0B0B0505
            05000000000000000000000000393939FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC6C6C61010101010101D1D1D0C0C0C0B0B0B0606060A0A0A
            0101010000000101010000000101010707070202020101010000000000007979
            79FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A
            0000000000000000000000003C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3C
            3C3C000000000000000000545454FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF7878780000000000000202020000000000000000000000
            000303030202020000000000000000000000000404040D0D0D0000007E7E7EFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF141414050505080808
            0000000101010A0A0A0F0F0F0707070000000000000101010000000202020202
            02000000000000000000595959FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF9C9C9C000000000000000000000000303030FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF4242420000000000000000004B4B4BFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D5D5D0000000000000000
            000000000000000000000000000404040303030707070C0C0C01010100000002
            0202010101000000181818B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFE2424240000000000000101010303030000000202020404041212120202
            02000000000000020202020202010101000000000000555555FFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B10101010000000000
            00000000323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4E000000000000
            000000404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF33333300000000000000000001010100000000000000000000000000000004
            0404060606010101020202000000010101000000000000282828FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2525250000000000000101010202020000
            000000000707070D0D0D02020202020200000003030302020203030300000000
            00005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC0C0C0060606000000000000000000282828FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF4C4C4C0000000000000000004A4A4AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFC4C4C40B0B0B00000000000000000000000000000000
            0000000000000000000000010101010101000000010101010101000000000000
            0000000000007A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D3D0000
            0000000000000009090903030301010102020200000000000004040400000000
            0000000000000000000000000000585858FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6101010000000000000000000202020FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D000000000000000000343434FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F00000000000000
            0000000000000000000000000000000000000000010101020202000000000000
            000000000000000000000000000000000000232323FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF42424200000000000000000006060602020201010101010100
            00000000000000000000000606060101010000000000000000004E4E4EFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C20C0C0C00
            0000000000000000202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F0000
            00000000000000373737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF848484000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000202
            02AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF46464600000000000000000000
            0000060606020202020202040404060606030303010101050505010101020202
            0202020000003D3D3DFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFBBBBBB0707070000000000000101011E1E1EFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF5E5E5E0000000000000000003B3B3BFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666000000000000000000000000000000
            0000000000000000000000000000000000000000000404040404040000000000
            00000000000000000000000000717171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF45
            45450000000000000000000202020C0C0C0505050202020606060E0E0E0B0B0B
            0202020505050505050101010000000000002B2B2BFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA101010000000000000040404
            191919FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5353530000000000000000002B
            2B2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4E000000
            0000000000000101010000000101010000000000000000000000000000000000
            000303030202020B0B0B0707070000000000000000000000002E2E2EE6E6E6FF
            FFFFFFFFFFFFFFFFFFFFFF505050000000010101050505050505070707070707
            0909090909090202020303030202021414140909090000000000000000002626
            26FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB
            191919000000000000000000222222FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57
            57570000000000000000001B1B1BFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF2F2F2F0000000000000000000101010000000000000000000000
            0000000000000000000000000000000000000002020202020200000000000000
            00000000000F0F0F999999FFFFFFFFFFFFFFFFFFFFFFFF5B5B5B000000020202
            0A0A0A0303030202020202020202020101010000000000000101010000000000
            00000000000000000000282828FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE8E8E8141414000000000000000000141414DDDDDDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF747474000000000000000000222222F8F8F8FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E81313130000000000000000000404
            040303032323231B1B1B13131304040401010102020204040400000000000000
            00000000000101010101010000000000000000005E5E5EFFFFFFFFFFFFFFFFFF
            FFFFFF8181810000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000C0C0CFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A2A2A0000000000
            000000000F0F0FF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888000000000000
            000000232323EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B00303
            030000000000000000000000001B1B1BCDCDCDFFFFFFE0E0E0B9B9B9B4B4B4B4
            B4B4B1B1B17676761D1D1D000000000000000000000000000000000000000000
            121212C2C2C2FFFFFFFFFFFFFFFFFF7F7F7F0000000000000000000000000E0E
            0E6262626262625353535252526262626666665555555555555353535B5B5B53
            5353545454FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF242424000000000000000000080808CACACAFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF747474000000000000000000232323CBCBCBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF6D6D6D0000000000000000000000000000004C4C4CFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDE545454000000000000
            000000000000000000000000000000A4A4A4FFFFFFF6F6F6FFFFFF7A7A7A0000
            000000000000000000002B2B2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F000000000000000000060606C0
            C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8585850000000000000000001F1F1FF6F6
            F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54545400000000000000000000
            00000000007C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF4B4B4B000000000000000000000000000000000000696969FFFF
            FFFFFFFFFFFFFF898989000000000000000000000000343434DEDEDEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404000
            0000000000000000040404BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484840000
            00000000000000232323FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF33
            3333000000000000000000000000000000939393FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C62222220000000000000000
            00000000000000353535F6F6F6FFFFFFFFFFFF72727200000000000001010100
            00002D2D2DEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF494949000000000000000000000000B4B4B4FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF939393000000000000000000151515D6D6D6FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF1C1C1C000000000000000000000000020202B3B3B3
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF878787000000010101010101000000000000090909BABABAFFFFFFFFFFFF62
            62620000000404040E0E0E000000252525DEDEDEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555555000000000000000000
            010101B9B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94949400000000000000000013
            1313F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50C0C0C000000000000
            000000000000181818DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFBABABA12121200000001010101010100000003
            0303ACACACFFFFFFFFFFFF8080800000000000000101010000001B1B1BCBCBCB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            575757000000060606000000000000A7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D
            8D8D0000000000000000000D0D0DC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9191910000000000000000000000000000003D3D3DFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A00
            0000010101050505020202010101838383FFFFFFFFFFFF838383000000000000
            000000000000232323CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF7E7E7E282828353535000000000000959595FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9F9F9F000000000000000000030303B9B9B9FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF6565650000000000000000000000000000007070
            70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9C9C9C000000000000000000000000000000565656FFFFFF
            FFFFFF7D7D7D000000000000000000000000141414CACACAFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767670A0A0A0505
            05000000000000858585FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7000000000000
            0000000A0A0ACDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3434340000000000
            00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00A0A0A000000000000
            0000000000004E4E4EFFFFFFFFFFFF8787870000000000000000000000000C0C
            0CBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF5454540000000000000000000000007C7C7CFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFA7A7A7000000000000000000070707BCBCBCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF1D1D1D0000000000000000000000000000009F9F9FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3E3E3E000000000000000000000000292929E0E0E0FFFFFF8787870000
            000000000000000202021A1A1ACACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C00000001010100000000000081
            8181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7020202000000000000000000AEAE
            AEFFFFFFFFFFFFFFFFFFFFFFFFC6C6C612121200000001010102020200000002
            0202B1B1B1FFFFFFFFFFFFFFFFFFC1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D6D0000000000000000000000000303
            03B2B2B2FFFFFF8F8F8F000000000000000000010101171717CACACAFFFFFFFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63636300
            0000000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B60303
            03000000010101040404BABABAFFFFFFFFFFFFFFFFFFFFFFFFA1A1A100000000
            0000010101010101000000191919ECECECFFFFFFFFFFFFC7C7C7797979FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A00404
            04000000000000000000010101A7A7A7FFFFFF8C8C8C00000000000000000000
            00002E2E2EE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF5F5F5F000000000000000000000000888888FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFAAAAAA010101000000000000040404A2A2A2FFFFFFFFFFFFFF
            FFFFFFFFFF686868000000000000000000000000000000323232FFFFFFFFFFFF
            FFFFFF8585855C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB4B4B4030303000000000000000000000000A7A7A7FFFFFF9E
            9E9E000000000000000000000000161616CACACAFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A000000000000000000
            0000008F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD01010100000000000000
            00008D8D8DFFFFFFFFFFFFFFFFFFFFFFFF353535000000000000000000000000
            000000555555FFFFFFFFFFFFFFFFFF4C4C4C606060FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC07070700000000000000
            0000000000969696FFFFFF8F8F8F000000000000000000000000101010D8D8D8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            6969690000000000000000000000007C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
            C0C00606060000000000000000008F8F8FFFFFFFFFFFFFFFFFFFFFFFFF292929
            0000000000000000000000000000006F6F6FFFFFFFFFFFFFFFFFFF2929296262
            62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
            FCFC3838380000000000000000000000007F7F7FFFFFFF959595000000000000
            000000000000151515CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF757575000000000000000000000000727272FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFC9C9C9080808000000000000000000878787FFFFFF
            FFFFFFFFFFFFCFCFCF0E0E0E000000020202171717040404000000A0A0A0FFFF
            FFFFFFFFD2D2D21010105D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F000000000000000000000000656565
            FFFFFFA3A3A30000000000000000000000000F0F0FC3C3C3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181810000000000
            000000000000006B6B6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D50C0C0C000000
            000000000000838383FFFFFFFFFFFFFFFFFFA3A3A30000000000000101011D1D
            1D080808090909B7B7B7FFFFFFFFFFFF8383830000005D5D5DFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696969000000
            000000000000000000595959FFFFFFAAAAAA0101010000000000000000001010
            10CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF8585850000000000000000000000006D6D6DFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC8C8C8090909000000000000000000818181FFFFFFFFFFFFFFFFFF7777
            77000000000000000000000000000000282828FFFFFFFFFFFFFFFFFF63636300
            00005A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF767676000000000000000000000000545454FFFFFFA5A5A50101
            010000000000000000000B0B0BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000000000000000000063
            6363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D20E0E0E0000000000000000007373
            73FFFFFFFFFFFFFFFFFF6A6A6A0000000000000000000000000000004E4E4EFF
            FFFFFFFFFFFFFFFF535353000000616161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8585850000000000000000000000
            00474747FFFFFFA7A7A7020202000000000000000000050505B5B5B5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A00
            0000000000000000000000414141FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D61313
            13000000000000000000636363FFFFFFFFFFFFFFFFFF4C4C4C00000000000000
            0000000000000000656565FFFFFFFFFFFFFFFFFF252525000000585858FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2
            A2000000000000000000000000323232FFFFFFAAAAAA02020200000000000000
            00000C0C0CC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9393930000000000000000000000000202025757576E6E6E
            5E5E5E4B4B4B5C5C5C5C5C5C6E6E6E6767675F5F5FB8B8B8FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFE8E8E8131313000000000000000000646464FFFFFFFFFFFFFF
            FFFF2424240000000000000000000000000000007A7A7AFFFFFFFFFFFFB9B9B9
            0B0B0B0000005B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFADADAD0303030000000000000000002C2C2CFFFFFFAE
            AEAE0404040000000000000000000606067E7E7EB9B9B9B7B7B7AFAFAFAAAAAA
            B3B3B3B1B1B1B8B8B8BABABAEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            008B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE16161600000000000000
            00005B5B5BFFFFFFFFFFFFFBFBFB151515000000000000000000000000020202
            B5B5B5FFFFFFFFFFFF7D7D7D0000000000005A5A5AFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B303030300000000
            0000000000232323F6F6F6C6C6C60A0A0A000000020202040404000000030303
            1414142828280B0B0B0202020505051A1A1A2323231111117F7F7FFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9090900000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF232323000000000000000000545454FFFFFFFFFFFFB6B6B6070707000000
            000000000000000000151515DDDDDDFFFFFFFFFFFF5959590000000000005A5A
            5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFB6B6B6030303000000010101000000272727FFFFFFC5C5C50B0B0B000000
            0303030303030000000000000000000101010000000000000101010101010000
            00000000555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF9696960000000000000000000505050707070000
            00030303010101000000000000000000000000000000000000858585FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFE2121210000000000000000005A5A5AFFFFFF
            FFFFFFA5A5A5000000000000000000000000000000353535FFFFFFFFFFFFFFFF
            FF363636000000000000464646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD070707000000010101000000242424
            F9F9F9C8C8C81717170000000000000000000000000303030000000000000303
            030606060101010101010000000000004D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A70101010000
            0000000001010102020200000001010100000000000000000000000000000000
            00000000007C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF272727000000
            000000000000525252FFFFFFFFFFFF8B8B8B0000000101010303030000000000
            004E4E4EFFFFFFFFFFFFCECECE131313000000000000404040FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF060606
            000000000000000000181818F9F9F9D9D9D90B0B0B0000000000000000000000
            00010101000000000000040404090909000000000000000000000000575757FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA9A9A901010100000000000000000000000000000000000003030301
            0101000000000000000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF2C2C2C000000000000000000494949FFFFFFFFFFFF6868680000
            00050505070707000000000000666666FFFFFFFFFFFF93939300000000000000
            0000454545FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCDCDCD080808000000000000000000111111CDCDCDFFFFFF2828
            2800000000000001010100000000000001010101010103030300000000000000
            00000000000000004E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A300000000000000000000000000
            0000000000000000010101000000000000000000000000000000000000616161
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626260000000000000000003737
            37FFFFFFFEFEFE2B2B2B0000000000000000000000000000008A8A8AFFFFFFFF
            FFFF6D6D6D000000000000000000343434FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF0808080101010101010000
            000B0B0BC0C0C0FFFFFF3131310000000101010505050202020E0E0E04040400
            0000000000000000000000000000000000000000424242FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE06
            0606000000000000000000000000000000000000000000000000000000000000
            0000000000000000004D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D
            2D000000000000000000353535FFFFFFD6D6D610101000000000000000000000
            0000040404ADADADFFFFFFFFFFFF4545450000000000000000002C2C2CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEC
            EC1616160000000000000000000E0E0ED8D8D8FEFEFE15151500000004040402
            0202010101030303000000000000000000010101010101000000000000000000
            383838FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFBABABA050505000000000000000000010101010101000000
            0000000000000000000000000000000000000000003E3E3EFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF2A2A2A000000000000000000333333FFFFFFBABABA04
            0404000000000000000000000000242424FCFCFCFFFFFFEAEAEA1E1E1E000000
            0000000000002C2C2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE6E6E61010100000000000000000000F0F0FC5C5C5FB
            FBFB1A1A1A000000030303010101000000000000000000000000020202040404
            000000000000000000000000383838FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3020202000000040404
            0000000000000000000000000000000000000000000000000000000000000000
            003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF32323200000000000000
            0000333333FFFFFF9696960000000000000000000000000000003A3A3AFFFFFF
            FFFFFFB3B3B30606060000000000000000002F2F2FFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F714141400000000
            0000000000151515C7C7C7FFFFFF272727000000000000000000000000000000
            0000000000000000000000000101010303030000000000003A3A3AFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            B6B6B60404040000000101010000000000000000000000000000000101010101
            010000000000000000000000001B1B1BE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF4A4A4A0000000000000000003C3C3CFFFFFF717171000000000000000000
            000000000000565656FFFFFFFFFFFFB7B7B70505050000000000000000002828
            28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE2E2E2111111000000000000000000131313C4C4C4FFFFFF2A2A2A000000
            0000000000000101010101010404040000000000000000000000000101010000
            000000002A2A2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFBDBDBD0707070000000000000202020000000000
            000000000000000000000000000000000000000000000000000C0C0CF2F2F2FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF4444440000000000000000002A2A2AFFFFFF
            4A4A4A000000000000000000000000000000797979FFFFFFFFFFFFBFBFBF0909
            09000000000000000000292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50909090000000000000000000F0F0F
            C6C6C6FFFFFF3636360000000000000000000000000000000000000000000000
            00000000000000000000000000000000202020FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C30D0D0D0000
            000000000101010000003838387474746666666F6F6F7474747878787272726D
            6D6D606060838383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B000000
            0000000000000C0C0C7676761818180000000000000000000000000000009292
            92FFFFFFFFFFFFC2C2C20A0A0A000000000000000000212121FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF060606
            000000000000000000121212CDCDCDFFFFFF3333330000000000000000000000
            002727275757574141413232323F3F3F4343434444443E3E3E333333484848FE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFBDBDBD060606000000000000000000000000A0A0A0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF5C5C5C0000000000000000000000000000000000000101010101
            01000000000000020202AEAEAEFFFFFFFFFFFFC6C6C60F0F0F00000000000000
            0000171717DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBEBEBE050505000000000000000000141414CFCFCFFFFFFF4646
            460000000000000202020000006A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C30A0A0A00000000000000000000
            00009C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5454540000000000000000000000
            000000000000000000000000000000000000000F0F0FC6C6C6FFFFFFFFFFFFBF
            BFBF0A0A0A000000000000000000121212D2D2D2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC0000000000000000000000
            00242424FCFCFCFFFFFF5A5A5A0000000000000101010000006D6D6DFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C70C
            0C0C0000000000000000000000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5151
            5100000000000000000000000003030302020200000000000000000000000026
            2626F8F8F8FFFFFFFFFFFFC5C5C50D0D0D0000000000000000000D0D0DD0D0D0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAB
            AB0000000000000000000000001B1B1BD8D8D8FFFFFF56565600000000000000
            0000000000686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFEEEEEE1616160000000000000000000000008C8C8CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF5F5F5F00000000000000000000000000000000000000
            0000000000000000000000525252FFFFFFFFFFFFFFFFFFD6D6D6151515000000
            020202000000131313CACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF9B9B9B000000000000000000000000181818DCDCDCFF
            FFFF5555550000000000000000000000005F5F5FFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2191919000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64646402020203030300
            0000000000000000000000000000000000000000000000818181FFFFFFFFFFFF
            FFFFFFE8E8E81A1A1A0000000101010000000F0F0FC1C1C1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87878700000000000000
            00000000002D2D2DFFFFFFFFFFFF5B5B5B000000000000000000000000535353
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF4A4A4A000000000000000000000000797979FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF6A6A6A010101010101000000000000000000000000000000000000000000
            000000A7A7A7FFFFFFFFFFFFFFFFFFDFDFDF1B1B1B0000000000000000000E0E
            0EBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF6666660000000000000000000000002F2F2FFFFFFFFFFFFF5A5A5A000000
            0000000000000000004C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4E0000000000000000000000006D6D
            6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666000000000000010101020202000000
            000000000000000000000000070707B1B1B1FFFFFFFFFFFFFFFFFFF6F6F62323
            23000000000000000000040404B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F0000000000000202020000002D2D2D
            FEFEFEFFFFFF6C6C6C000000000000000000000000424242FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656560000
            00000000000000000000505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767000000
            0000000000000000000000000000000000000000000000000E0E0ECFCFCFFFFF
            FFFFFFFFFFFFFFFEFEFE262626000000000000000000010101B1B1B1FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0121212000000
            0000000101010000003F3F3FFFFFFFFFFFFF7979790000000000000000000000
            003D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF4B4B4B000000000000000000000000434343FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF6666660000000000000000000000000000000000000000000000
            000000003D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE2A2A2A00000000000000
            0000070707B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABABA060606000000000000000000000000565656FFFFFFFFFFFF8A8A
            8A0000000000000000000000003D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B00000000000000000000
            0000292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7373730000000000000000000000
            000000000000000101010000000000005E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFE2929290000000000000000000101019C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494940000000000000000000000000000
            00676767FFFFFFFFFFFF7A7A7A0000000000000000000000002E2E2EFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76
            7676000000000000000000000000111111F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A
            7A000000010101000000000000000000000000000000000000000000939393FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF2C2C2C0000000000000000000000007F7F7F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B0000
            000000000000000000000000007F7F7FFFFFFFFFFFFF7A7A7A00000004040405
            05050000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF7878780000000000000000000000000C0C0CD9D9D9
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF91919100000000000000000000000000000000000000
            0000000000010101BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF282828000000
            0000000000000000006C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFBFBFB121212000000000000000000000000000000888888FFFFFFFF
            FFFF8B8B8B000000010101010101000000272727FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D6D000000000000
            000000000000070707C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99999900000000000000
            0000000000000000000000000000000000070707BDBDBDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3232320000000000000000000000005F5F5FFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A501010100000000000000000000
            0000000000A0A0A0FFFFFFFFFFFF9191910000000000000000000000000E0E0E
            DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF7D7D7D000000000000000000000000060606BFBFBFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFA5A5A5060606000000000000000000000000010101010101000000262626
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4141410000000000000000000000
            005C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D00
            0000000000000000000000000000060606BFBFBFFFFFFFFFFFFFA7A7A7010101
            0000000000000000000B0B0BD1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383830000000000000000000000000303
            03B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0090909000000000000000000000000
            010101010101000000484848FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
            4D000000000000000000000000646464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF9F9F9F000000000000000000000000000000000000121212CDCDCD
            FFFFFFFFFFFFAFAFAF000000000000000000000000121212DEDEDEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A70000
            00000000000000000000000000A6A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C70B0B0B
            000000000000000000000000000000000000000000616161FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF5454540000000000000000000000004F4F4FFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5232323000000000000000000000000
            000000000000212121FEFEFEFFFFFFFFFFFFADADAD0101010000000000000000
            000F0F0FE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA6A6A6000000000000000000000000000000ABABABFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCFCFCF1616160000000000000000000000000000000000000000
            00909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52525200000000000000
            00000000004E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD1C1C1C000000
            0000000000000000000000000000000000005D5D5DFFFFFFFFFFFFFFFFFFBABA
            BA030303000000000000000000020202A5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A801010100000000000000
            0000000000999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00A0A0A0000000000000101
            01000000000000000000000000ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF5E5E5E0000000000000000000000001515157676766D6D6D656565505050
            4545450909090000000000000000000000000000000000000000000000008B8B
            8BFFFFFFFFFFFFFFFFFFBBBBBB0303030000000000000000000000002121213E
            3E3E2424242727272D2D2D3131312B2B2B2E2E2E4242423A3A3A3A3A3A383838
            ACACACFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5
            A5A50101010000000000000000000000004C4C4CBCBCBCBABABAAFAFAFB2B2B2
            ABABABB3B3B3B5B5B5B0B0B0AEAEAEB8B8B8A2A2A2B7B7B7FFFFFFFFFFFFD8D8
            D8171717000000000000000000000000000000000000050505BEBEBEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565000000000000000000000000000000
            0303030000000000000000000000000000000202020000000000000000000000
            000000000000000B0B0BC1C1C1FFFFFFFFFFFFFFFFFFBEBEBE04040400000001
            01010000000000000000000101010C0C0C000000000000000000000000000000
            0000000000000000000000007D7D7DFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFAFAFAF020202000000000000000000000000000000
            1010101717170000000101010000000303030303030202020101010404040000
            001F1F1FF6F6F6FFFFFFDFDFDF19191900000000000000000000000000000000
            0000212121EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF858585000000
            0000000000000000000101010000000000000000000000000000000000000101
            010000000000000000000000000000000000002E2E2EFFFFFFFFFFFFFFFFFFFF
            FFFFC9C9C9090909000000010101000000000000010101020202050505010101
            010101000000000000000000010101050505000000000000838383FFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD060606000000
            0000000000000000000000000000000707070000000000000000000000000000
            00000000000000000000000000171717FBFBFBFFFFFFDDDDDD15151500000001
            0101010101000000000000000000565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA0A0A00000000000000000000000000000000000000000000000
            0000000000000000000000000000000001010102020201010100000000000075
            7575FFFFFFFFFFFFFFFFFFFFFFFFD2D2D20B0B0B000000000000000000000000
            0000000000000000000404040000000000000000000000000000000000000000
            00000000767676FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBCBCBC0505050000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000F0F0FC6C6C6FF
            FFFFF2F2F2171717000000000000000000000000000000000000777777FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000001
            01010000000000000000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8111111
            0000000303030101010000000101010000000000000303030101010D0D0D0303
            03000000000000000000000000000000646464FFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50808080000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000171717F6F6F6FFFFFFFFFFFF242424000000000000000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E
            8E00000000000000000000000000000000000001010100000000000000000000
            00000000000000000000000000000000000000001A1A1AEEEEEEFFFFFFFFFFFF
            FFFFFFFFFFFFFBFBFB2929290000000E0E0E0606060000000303030000000000
            000101010101011A1A1A0606060202020000000303030101010000004D4D4DFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F01A1A
            1A00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000080808BFBFBFFFFFFFFFFFFF303030
            000000000000000000000000000000040404B4B4B4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFA5A5A501010100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            6E6E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2222220000000101010101
            0100000000000000000000000000000000000001010100000001010100000006
            0606030303000000545454FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFE8E8E80F0F0F00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000070707
            BCBCBCFFFFFFFFFFFF3434340000000000000000000000000000000E0E0EE4E4
            E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000C0C0CBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF38383800000000000000000000000000000000000000000000000000000000
            0000000000000000020202000000010101000000414141FFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D809090900000000000000
            0000000000000000000000000000000000000000000000010101010101000000
            0000000000000000000F0F0FD9D9D9FFFFFFFFFFFF3535350000000000000000
            000000000000001B1B1BF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFAFAFAF030303000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000005B5B5BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF48484800000000000001010101010101010100
            0000000000000000000000000000000000010101020202000000010101000000
            3C3C3CFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
            F6F6101010000000010101010101010101000000000000000000000000000000
            000000000000010101010101000000000000000000111111DEDEDEFFFFFFFFFF
            FF4646460000000000000000000000000000002A2A2AFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4080808000000000000000000010101
            0000000000000000000000000000000000000000000000000000000000000606
            06BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF46464600000000
            00000000000303030505050101010000000101010101010000000707070C0C0C
            0303030000000101010000003D3D3DFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF303030000000000000010101020202000000
            0000000000000000000000000101010101010000000000000000000000000000
            00101010D8D8D8FFFFFFFFFFFF4C4C4C0000000000000000000000000000004B
            4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2060606
            0000000000000101010404040000000000000101010000000000000000000101
            01000000000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF4A4A4A000000000000000000010101030303020202000000010101
            0303030000000303030B0B0B0303030505050404040000002B2B2BFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF373737000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000070707C6C6C6FFFFFFFFFFFF5B5B5B00000000
            0000000000000000000000656565FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBEBEBE0A0A0A0000000000000000000000000000000000000000
            00000000000000000000000000000000020202737373FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A000000000000000000000000
            0000000101010202020101010303030000000101010808080606060707070202
            02000000242424FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3131310000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000A7A7A7FF
            FFFFFFFFFF515151000000000000000000000000000000707070FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D10404040000000000000000
            000000000000000000000000000000000000000000000202022B2B2B989898FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000B0B0BFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF8484849B9B9B8D8D8D8888
            888989898F8F8F8E8E8E8F8F8F9393937272728080808E8E8E7171717F7F7F7B
            7B7B696969828282F6F6F6FFFFFFFFFFFFA7A7A76767678686868282827F7F7F
            848484CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF7575756464646F6F6F6B6B6B6B6B6B7676767B7B7B78787868686864646488
            8888B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB6B6B65E5E5E6565656565656464646868686262625C5C
            5C5C5C5C6262626666666868686363636C6C6C6262626161615E5E5E6A6A6AFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          mmHeight = 22225
          mmLeft = 5027
          mmTop = 5821
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine33: TppLine
          UserName = 'Line5'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2381
          mmTop = 94456
          mmWidth = 264055
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl5: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'BANCO DO BRASIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 102659
          mmTop = 11642
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape17: TppShape
          UserName = 'Shape22'
          mmHeight = 8202
          mmLeft = 150019
          mmTop = 65881
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape16: TppShape
          UserName = 'Shape23'
          mmHeight = 7673
          mmLeft = 150019
          mmTop = 58473
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape15: TppShape
          UserName = 'Shape24'
          mmHeight = 8202
          mmLeft = 150019
          mmTop = 50536
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape14: TppShape
          UserName = 'Shape25'
          mmHeight = 7938
          mmLeft = 150019
          mmTop = 42863
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape13: TppShape
          UserName = 'Shape26'
          mmHeight = 8202
          mmLeft = 150019
          mmTop = 34925
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape12: TppShape
          UserName = 'Shape27'
          mmHeight = 7673
          mmLeft = 150019
          mmTop = 27517
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBCalc1: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'BASE_CONTRIB'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 30692
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt13: TppDBText
          UserName = 'DBText11'
          DataField = 'DEDUCAO_SME'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 46302
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl23: TppLabel
          UserName = 'Label21'
          Caption = '12. Base de Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 28046
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl24: TppLabel
          UserName = 'Label22'
          Caption = '13. (=) Valor do Salário-Educação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 35454
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl25: TppLabel
          UserName = 'Label23'
          Caption = '14. (-) Deduções para o SME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 43392
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl26: TppLabel
          UserName = 'Label24'
          Caption = '15. (-) Compensação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 51065
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl27: TppLabel
          UserName = 'Label25'
          Caption = '16. (=) Valor Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 59002
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl28: TppLabel
          UserName = 'Label26'
          Caption = '17. (+) Multa + Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 66411
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl29: TppLabel
          UserName = 'Label27'
          Caption = '18. (=) Valor Cobrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 74348
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt14: TppDBText
          UserName = 'DBText12'
          DataField = 'COMPENSACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 54240
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt15: TppDBText
          UserName = 'DBText13'
          DataField = 'VALOR_ATUALIZADO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 61648
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt16: TppDBText
          UserName = 'DBText14'
          DataField = 'MULTA_JUROS'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 69586
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducMemo1: TppMemo
          UserName = 'Memo3'
          Caption = '  R  E  C  I  B  O    C  O  N  T  R  I  B  U  I  N  T  E'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Lines.Strings = (
            '  R'
            '  E'
            '  C'
            '  I'
            '  B'
            '  O'
            '  '
            '  C'
            '  O'
            '  N'
            '  T'
            '  R'
            '  I'
            '  B'
            '  U'
            '  I'
            '  N'
            '  T'
            '  E')
          Transparent = True
          mmHeight = 53975
          mmLeft = 144992
          mmTop = 18521
          mmWidth = 3969
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpSalarioEducLbl17: TppLabel
          UserName = 'Label32'
          Caption = '9. Tipo Identific.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 12965
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt10: TppDBText
          UserName = 'DBText16'
          DataField = 'TIPO_INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 15081
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl30: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = '19. Autenticação Mecânica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 84667
          mmWidth = 50271
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl21: TppLabel
          UserName = 'Label35'
          Caption = '10. Identificação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 169334
          mmTop = 12965
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxtINSCRICAO1: TppDBText
          UserName = 'DBText17'
          DataField = 'INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 169334
          mmTop = 15875
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl9: TppLabel
          UserName = 'Label36'
          Caption = '4. Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 81227
          mmTop = 30427
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt3: TppDBText
          UserName = 'DBText18'
          DataField = 'VENCIMENTO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 82286
          mmTop = 32544
          mmWidth = 59796
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl16: TppLabel
          UserName = 'Label37'
          Caption = '8. Competência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 180182
          mmTop = 5292
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt9: TppDBText
          UserName = 'DBText19'
          DataField = 'REFERENCIA'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 181240
          mmTop = 7938
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine6: TppLine
          UserName = 'Line12'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 151342
          mmTop = 18785
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine5: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 156369
          mmTop = 15081
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine4: TppLine
          UserName = 'Line14'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 150284
          mmTop = 15081
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl14: TppLabel
          UserName = 'Label42'
          Caption = 'SENHOR(A) CAIXA - UTILIZE FE 294'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 155575
          mmTop = 794
          mmWidth = 48218
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl18: TppLabel
          UserName = 'Label43'
          Caption = '0. CEI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 159015
          mmTop = 15081
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl19: TppLabel
          UserName = 'Label44'
          Caption = '1. CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 159015
          mmTop = 17463
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine7: TppLine
          UserName = 'Line15'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 168275
          mmTop = 12700
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl2: TppLabel
          UserName = 'Label50'
          AutoSize = False
          Caption = 'COMPROVANTE DE ARRECADAÇÃO DIRETA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 30956
          mmTop = 10583
          mmWidth = 69321
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl3: TppLabel
          UserName = 'Label51'
          AutoSize = False
          Caption = 'SALÁRIO-EDUCAÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 30956
          mmTop = 14288
          mmWidth = 69321
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt12: TppDBText
          UserName = 'DBText29'
          DataField = 'SAL_EDUCACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 38629
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt17: TppDBText
          UserName = 'DBText30'
          DataField = 'VALOR_TOTAL'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 77788
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl1: TppLabel
          UserName = 'Label501'
          AutoSize = False
          Caption = 'CAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 20
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 8467
          mmLeft = 30956
          mmTop = 3969
          mmWidth = 69321
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape7: TppShape
          UserName = 'Shape33'
          mmHeight = 19844
          mmLeft = 4233
          mmTop = 37042
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape8: TppShape
          UserName = 'Shape201'
          mmHeight = 23813
          mmLeft = 4233
          mmTop = 56621
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl10: TppLabel
          UserName = 'Label54'
          AutoSize = False
          Caption = '5. Sacado / Endereço de Correspondência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 1852
          mmLeft = 5292
          mmTop = 37835
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine1: TppLine
          UserName = 'Line101'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 46567
          mmTop = 29633
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine2: TppLine
          UserName = 'Line102'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 80169
          mmTop = 29633
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl11: TppLabel
          UserName = 'Label57'
          Caption = '6. Instruções'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 5027
          mmTop = 57150
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt4: TppDBText
          UserName = 'DBText201'
          DataField = 'ESTAB'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 39952
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt5: TppDBText
          UserName = 'DBText32'
          DataField = 'ENDERECO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 43656
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt6: TppDBText
          UserName = 'DBText33'
          DataField = 'CIDADE'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 47361
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt7: TppDBText
          UserName = 'DBText34'
          DataField = 'CEP'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 51065
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl7: TppLabel
          UserName = 'Label58'
          Caption = '2. Agência Centralizadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 5292
          mmTop = 30427
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt1: TppDBText
          UserName = 'DBText601'
          DataField = 'AG_CENTRALIZ'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 6350
          mmTop = 32808
          mmWidth = 38365
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl8: TppLabel
          UserName = 'Label59'
          Caption = '3. Número da Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 47890
          mmTop = 30427
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt2: TppDBText
          UserName = 'DBText35'
          DataField = 'NUM_CONTA'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 48683
          mmTop = 32808
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl12: TppLabel
          UserName = 'Label61'
          AutoSize = False
          Caption = 
            'Instruções BB: Arrecadação: LIC 3-19-10 / Recebimento em cheque:' +
            ' LIC 3-19-10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 7938
          mmTop = 59267
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl15: TppLabel
          UserName = 'Label1'
          Caption = '7. Número do Convênio/Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 5027
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt8: TppDBText
          UserName = 'DBText1'
          DataField = 'NUMCONVREC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 152929
          mmTop = 8467
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine3: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 179123
          mmTop = 5027
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape11: TppShape
          UserName = 'Shape4'
          mmHeight = 7673
          mmLeft = 150019
          mmTop = 20108
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl22: TppLabel
          UserName = 'Label2'
          Caption = '11. Número do Processo no FNDE ou da Execução Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 150813
          mmTop = 20373
          mmWidth = 46038
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt11: TppDBText
          UserName = 'DBText2'
          DataField = 'NUMPROC_EXECFISC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 155311
          mmTop = 23283
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine9: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 150019
          mmTop = 84138
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine8: TppLine
          UserName = 'Line3'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 150019
          mmTop = 84402
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape19: TppShape
          UserName = 'Shape6'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 4763
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape20: TppShape
          UserName = 'Shape7'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 12700
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape28: TppShape
          UserName = 'Shape101'
          mmHeight = 8467
          mmLeft = 212990
          mmTop = 73554
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape27: TppShape
          UserName = 'Shape8'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 65881
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape26: TppShape
          UserName = 'Shape9'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 58473
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape25: TppShape
          UserName = 'Shape10'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 50536
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape24: TppShape
          UserName = 'Shape11'
          mmHeight = 7938
          mmLeft = 212990
          mmTop = 42863
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape23: TppShape
          UserName = 'Shape12'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 34925
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape22: TppShape
          UserName = 'Shape13'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 27517
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBCalc2: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'BASE_CONTRIB'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 30692
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt24: TppDBText
          UserName = 'DBText3'
          DataField = 'DEDUCAO_SME'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 46302
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl40: TppLabel
          UserName = 'Label701'
          Caption = '12. Base de Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 28046
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl41: TppLabel
          UserName = 'Label3'
          Caption = '13. (=) Valor do Salário-Educação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 35454
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl42: TppLabel
          UserName = 'Label4'
          Caption = '14. (-) Deduções para o SME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 43392
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl43: TppLabel
          UserName = 'Label5'
          Caption = '15. (-) Compensação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 51065
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl44: TppLabel
          UserName = 'Label6'
          Caption = '16. (=) Valor Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 59002
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl45: TppLabel
          UserName = 'Label7'
          Caption = '17. (+) Multa + Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 66411
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl46: TppLabel
          UserName = 'Label11'
          Caption = '18. (=) Valor Cobrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 74348
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt25: TppDBText
          UserName = 'DBText4'
          DataField = 'COMPENSACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 54240
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt26: TppDBText
          UserName = 'DBText5'
          DataField = 'VALOR_ATUALIZADO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 216959
          mmTop = 61648
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt27: TppDBText
          UserName = 'DBText6'
          DataField = 'MULTA_JUROS'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 69586
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object ppMemo1: TppMemo
          UserName = 'Memo1'
          Caption = '  F'#13#10'  I'#13#10'  C'#13#10'  H'#13#10'  A'#13#10#13#10'  O'#13#10'  N'#13#10'  -'#13#10'  L'#13#10'  I'#13#10'  N'#13#10'  E'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Lines.Strings = (
            '  F'
            '  I'
            '  C'
            '  H'
            '  A'
            ''
            '  O'
            '  N'
            '  -'
            '  L'
            '  I'
            '  N'
            '  E')
          Transparent = True
          mmHeight = 36777
          mmLeft = 207698
          mmTop = 24342
          mmWidth = 3969
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpSalarioEducLbl34: TppLabel
          UserName = 'Label12'
          Caption = '9. Tipo Identific.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 12965
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt20: TppDBText
          UserName = 'DBText7'
          DataField = 'TIPO_INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 214313
          mmTop = 15081
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl47: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = '19. Autenticação Mecânica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 84931
          mmWidth = 50271
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl38: TppLabel
          UserName = 'Label14'
          Caption = '10. Identificação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 232305
          mmTop = 12965
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxtINSCRICAO2: TppDBText
          UserName = 'DBText701'
          DataField = 'INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 232305
          mmTop = 15875
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl33: TppLabel
          UserName = 'Label801'
          Caption = '8. Competência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 243153
          mmTop = 5292
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt19: TppDBText
          UserName = 'DBText8'
          DataField = 'REFERENCIA'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 244211
          mmTop = 8467
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine13: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 214313
          mmTop = 18785
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine12: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 219340
          mmTop = 15081
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine11: TppLine
          UserName = 'Line7'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 213255
          mmTop = 15081
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl31: TppLabel
          UserName = 'Label15'
          Caption = 'SENHOR(A) CAIXA - UTILIZE FE 294'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 218546
          mmTop = 794
          mmWidth = 48218
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl35: TppLabel
          UserName = 'Label16'
          Caption = '0. CEI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 221986
          mmTop = 15081
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl36: TppLabel
          UserName = 'Label18'
          Caption = '1. CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 221986
          mmTop = 17463
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine14: TppLine
          UserName = 'Line8'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 231246
          mmTop = 12700
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt23: TppDBText
          UserName = 'DBText10'
          DataField = 'SAL_EDUCACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 38629
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt28: TppDBText
          UserName = 'DBText301'
          DataField = 'VALOR_TOTAL'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 217223
          mmTop = 77788
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl32: TppLabel
          UserName = 'Label63'
          Caption = '7. Número do Convênio/Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 5292
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt18: TppDBText
          UserName = 'DBText27'
          DataField = 'NUMCONVREC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 215900
          mmTop = 8467
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine10: TppLine
          UserName = 'Line17'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 242094
          mmTop = 5027
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape21: TppShape
          UserName = 'Shape34'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 20108
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl39: TppLabel
          UserName = 'Label64'
          Caption = '11. Número do Processo no FNDE ou da Execução Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 20638
          mmWidth = 46038
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt22: TppDBText
          UserName = 'DBText28'
          DataField = 'NUMPROC_EXECFISC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 23283
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine16: TppLine
          UserName = 'rpSalarioEducLine16'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 212990
          mmTop = 84402
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine15: TppLine
          UserName = 'Line201'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 212990
          mmTop = 84667
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl13: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'ATENÇÃO! PAGÁVEL SOMENTE NO BANCO DO BRASIL S/A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 5556
          mmTop = 73554
          mmWidth = 137319
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape33: TppShape
          UserName = 'Shape1'
          mmHeight = 7673
          mmLeft = 4498
          mmTop = 127000
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape31: TppShape
          UserName = 'Shape5'
          mmHeight = 13758
          mmLeft = 102394
          mmTop = 101865
          mmWidth = 41804
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl51: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'PAGÁVEL SOMENTE NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 102923
          mmTop = 104775
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape30: TppShape
          UserName = 'Shape202'
          mmHeight = 13758
          mmLeft = 30956
          mmTop = 101865
          mmWidth = 70379
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape32: TppShape
          UserName = 'Shape18'
          mmHeight = 8996
          mmLeft = 30956
          mmTop = 116681
          mmWidth = 113506
          BandType = 5
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'FUNDO NACIONAL DA DESENVOLVIMENTO DE EDUCAÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 32015
          mmTop = 120650
          mmWidth = 111390
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl53: TppLabel
          UserName = 'Label1010'
          Caption = '1. Cedente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 32015
          mmTop = 117211
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape29: TppShape
          UserName = 'Shape19'
          mmHeight = 23813
          mmLeft = 4498
          mmTop = 102129
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducImage2: TppImage
          UserName = 'Image2'
          MaintainAspectRatio = False
          Picture.Data = {
            07544269746D617032590000424D325900000000000036000000280000005900
            0000550000000100180000000000FC580000C30E0000C30E0000000000000000
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6CCCCCCCDCDCDCACACAF9F9F9FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4C4C4C4C7C7C7D2D2D2F6F6F6FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DE
            DEDEC6C6C6C3C3C3CBCBCBEEEEEED4D4D4FBFBFBE6E6E6D5D5D5FEFEFEFFFFFF
            FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFF9F9F9FEFEFEFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E13131319
            1919171717111111636363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F1212
            121A1A1A1A1A1A6A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFCBCBCB2B2B2B1E1E1E1C1C1C1E1E1E2B2B2B3232322A2A2A373737
            2424242121213030304A4A4A6565659E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD3D3D3D3232323636362C2C2C4F
            4F4F4F4F4F3C3C3C4F4F4F4747474141414545454949494040403C3C3C393939
            3A3A3A3E3E3E999999FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF878787000000000000000000000000424242FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF404040000000000000000000585858FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B1000000000000000000000000
            0000000000000000000000000000000000000000000000000000000B0B0B6C6C
            6CC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E0E019
            19190000000000000202020505050000000B0B0B090909010101000000000000
            080808000000000000070707000000000000717171FFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2A2000000000000000000000000
            3C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51515100000000000000000053
            5353FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E
            0000000000000101010000000000000000000101010505050101010B0B0B0505
            05000000000000000000000000393939FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC6C6C61010101010101D1D1D0C0C0C0B0B0B0606060A0A0A
            0101010000000101010000000101010707070202020101010000000000007979
            79FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9A
            0000000000000000000000003C3C3CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3C
            3C3C000000000000000000545454FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF7878780000000000000202020000000000000000000000
            000303030202020000000000000000000000000404040D0D0D0000007E7E7EFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF141414050505080808
            0000000101010A0A0A0F0F0F0707070000000000000101010000000202020202
            02000000000000000000595959FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF9C9C9C000000000000000000000000303030FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF4242420000000000000000004B4B4BFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5D5D5D0000000000000000
            000000000000000000000000000404040303030707070C0C0C01010100000002
            0202010101000000181818B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFE2424240000000000000101010303030000000202020404041212120202
            02000000000000020202020202010101000000000000555555FFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB1B1B10101010000000000
            00000000323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4E000000000000
            000000404040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF33333300000000000000000001010100000000000000000000000000000004
            0404060606010101020202000000010101000000000000282828FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2525250000000000000101010202020000
            000000000707070D0D0D02020202020200000003030302020203030300000000
            00005D5D5DFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFC0C0C0060606000000000000000000282828FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF4C4C4C0000000000000000004A4A4AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFC4C4C40B0B0B00000000000000000000000000000000
            0000000000000000000000010101010101000000010101010101000000000000
            0000000000007A7A7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D3D3D0000
            0000000000000009090903030301010102020200000000000004040400000000
            0000000000000000000000000000585858FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6101010000000000000000000202020FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4D000000000000000000343434FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F00000000000000
            0000000000000000000000000000000000000000010101020202000000000000
            000000000000000000000000000000000000232323FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF42424200000000000000000006060602020201010101010100
            00000000000000000000000606060101010000000000000000004E4E4EFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C20C0C0C00
            0000000000000000202020FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F5F0000
            00000000000000373737FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF848484000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000202
            02AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF46464600000000000000000000
            0000060606020202020202040404060606030303010101050505010101020202
            0202020000003D3D3DFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFBBBBBB0707070000000000000101011E1E1EFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF5E5E5E0000000000000000003B3B3BFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666000000000000000000000000000000
            0000000000000000000000000000000000000000000404040404040000000000
            00000000000000000000000000717171FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF45
            45450000000000000000000202020C0C0C0505050202020606060E0E0E0B0B0B
            0202020505050505050101010000000000002B2B2BFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA101010000000000000040404
            191919FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5353530000000000000000002B
            2B2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4E000000
            0000000000000101010000000101010000000000000000000000000000000000
            000303030202020B0B0B0707070000000000000000000000002E2E2EE6E6E6FF
            FFFFFFFFFFFFFFFFFFFFFF505050000000010101050505050505070707070707
            0909090909090202020303030202021414140909090000000000000000002626
            26FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFB
            191919000000000000000000222222FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57
            57570000000000000000001B1B1BFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF2F2F2F0000000000000000000101010000000000000000000000
            0000000000000000000000000000000000000002020202020200000000000000
            00000000000F0F0F999999FFFFFFFFFFFFFFFFFFFFFFFF5B5B5B000000020202
            0A0A0A0303030202020202020202020101010000000000000101010000000000
            00000000000000000000282828FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFE8E8E8141414000000000000000000141414DDDDDDFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF747474000000000000000000222222F8F8F8FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E8E81313130000000000000000000404
            040303032323231B1B1B13131304040401010102020204040400000000000000
            00000000000101010101010000000000000000005E5E5EFFFFFFFFFFFFFFFFFF
            FFFFFF8181810000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000C0C0CFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A2A2A0000000000
            000000000F0F0FF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF888888000000000000
            000000232323EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B00303
            030000000000000000000000001B1B1BCDCDCDFFFFFFE0E0E0B9B9B9B4B4B4B4
            B4B4B1B1B17676761D1D1D000000000000000000000000000000000000000000
            121212C2C2C2FFFFFFFFFFFFFFFFFF7F7F7F0000000000000000000000000E0E
            0E6262626262625353535252526262626666665555555555555353535B5B5B53
            5353545454FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF242424000000000000000000080808CACACAFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF747474000000000000000000232323CBCBCBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF6D6D6D0000000000000000000000000000004C4C4CFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDEDE545454000000000000
            000000000000000000000000000000A4A4A4FFFFFFF6F6F6FFFFFF7A7A7A0000
            000000000000000000002B2B2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F000000000000000000060606C0
            C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8585850000000000000000001F1F1FF6F6
            F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54545400000000000000000000
            00000000007C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF4B4B4B000000000000000000000000000000000000696969FFFF
            FFFFFFFFFFFFFF898989000000000000000000000000343434DEDEDEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40404000
            0000000000000000040404BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484840000
            00000000000000232323FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF33
            3333000000000000000000000000000000939393FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C62222220000000000000000
            00000000000000353535F6F6F6FFFFFFFFFFFF72727200000000000001010100
            00002D2D2DEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF494949000000000000000000000000B4B4B4FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF939393000000000000000000151515D6D6D6FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF1C1C1C000000000000000000000000020202B3B3B3
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF878787000000010101010101000000000000090909BABABAFFFFFFFFFFFF62
            62620000000404040E0E0E000000252525DEDEDEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF555555000000000000000000
            010101B9B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF94949400000000000000000013
            1313F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50C0C0C000000000000
            000000000000181818DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFBABABA12121200000001010101010100000003
            0303ACACACFFFFFFFFFFFF8080800000000000000101010000001B1B1BCBCBCB
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            575757000000060606000000000000A7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D
            8D8D0000000000000000000D0D0DC8C8C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9191910000000000000000000000000000003D3D3DFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A00
            0000010101050505020202010101838383FFFFFFFFFFFF838383000000000000
            000000000000232323CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF7E7E7E282828353535000000000000959595FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF9F9F9F000000000000000000030303B9B9B9FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF6565650000000000000000000000000000007070
            70FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9C9C9C000000000000000000000000000000565656FFFFFF
            FFFFFF7D7D7D000000000000000000000000141414CACACAFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6767670A0A0A0505
            05000000000000858585FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A7000000000000
            0000000A0A0ACDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3434340000000000
            00000000000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00A0A0A000000000000
            0000000000004E4E4EFFFFFFFFFFFF8787870000000000000000000000000C0C
            0CBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF5454540000000000000000000000007C7C7CFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFA7A7A7000000000000000000070707BCBCBCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF1D1D1D0000000000000000000000000000009F9F9FFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF3E3E3E000000000000000000000000292929E0E0E0FFFFFF8787870000
            000000000000000202021A1A1ACACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C00000001010100000000000081
            8181FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7B7B7020202000000000000000000AEAE
            AEFFFFFFFFFFFFFFFFFFFFFFFFC6C6C612121200000001010102020200000002
            0202B1B1B1FFFFFFFFFFFFFFFFFFC1C1C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D6D0000000000000000000000000303
            03B2B2B2FFFFFF8F8F8F000000000000000000010101171717CACACAFFFFFFFE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63636300
            0000000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B60303
            03000000010101040404BABABAFFFFFFFFFFFFFFFFFFFFFFFFA1A1A100000000
            0000010101010101000000191919ECECECFFFFFFFFFFFFC7C7C7797979FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A00404
            04000000000000000000010101A7A7A7FFFFFF8C8C8C00000000000000000000
            00002E2E2EE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF5F5F5F000000000000000000000000888888FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFAAAAAA010101000000000000040404A2A2A2FFFFFFFFFFFFFF
            FFFFFFFFFF686868000000000000000000000000000000323232FFFFFFFFFFFF
            FFFFFF8585855C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFB4B4B4030303000000000000000000000000A7A7A7FFFFFF9E
            9E9E000000000000000000000000161616CACACAFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A000000000000000000
            0000008F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD01010100000000000000
            00008D8D8DFFFFFFFFFFFFFFFFFFFFFFFF353535000000000000000000000000
            000000555555FFFFFFFFFFFFFFFFFF4C4C4C606060FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBC07070700000000000000
            0000000000969696FFFFFF8F8F8F000000000000000000000000101010D8D8D8
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            6969690000000000000000000000007C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0
            C0C00606060000000000000000008F8F8FFFFFFFFFFFFFFFFFFFFFFFFF292929
            0000000000000000000000000000006F6F6FFFFFFFFFFFFFFFFFFF2929296262
            62FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC
            FCFC3838380000000000000000000000007F7F7FFFFFFF959595000000000000
            000000000000151515CCCCCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF757575000000000000000000000000727272FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFC9C9C9080808000000000000000000878787FFFFFF
            FFFFFFFFFFFFCFCFCF0E0E0E000000020202171717040404000000A0A0A0FFFF
            FFFFFFFFD2D2D21010105D5D5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F000000000000000000000000656565
            FFFFFFA3A3A30000000000000000000000000F0F0FC3C3C3FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8181810000000000
            000000000000006B6B6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D50C0C0C000000
            000000000000838383FFFFFFFFFFFFFFFFFFA3A3A30000000000000101011D1D
            1D080808090909B7B7B7FFFFFFFFFFFF8383830000005D5D5DFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF696969000000
            000000000000000000595959FFFFFFAAAAAA0101010000000000000000001010
            10CDCDCDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF8585850000000000000000000000006D6D6DFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFC8C8C8090909000000000000000000818181FFFFFFFFFFFFFFFFFF7777
            77000000000000000000000000000000282828FFFFFFFFFFFFFFFFFF63636300
            00005A5A5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF767676000000000000000000000000545454FFFFFFA5A5A50101
            010000000000000000000B0B0BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F00000000000000000000000063
            6363FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D2D20E0E0E0000000000000000007373
            73FFFFFFFFFFFFFFFFFF6A6A6A0000000000000000000000000000004E4E4EFF
            FFFFFFFFFFFFFFFF535353000000616161FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8585850000000000000000000000
            00474747FFFFFFA7A7A7020202000000000000000000050505B5B5B5FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A00
            0000000000000000000000414141FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D6D61313
            13000000000000000000636363FFFFFFFFFFFFFFFFFF4C4C4C00000000000000
            0000000000000000656565FFFFFFFFFFFFFFFFFF252525000000585858FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2
            A2000000000000000000000000323232FFFFFFAAAAAA02020200000000000000
            00000C0C0CC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF9393930000000000000000000000000202025757576E6E6E
            5E5E5E4B4B4B5C5C5C5C5C5C6E6E6E6767675F5F5FB8B8B8FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFE8E8E8131313000000000000000000646464FFFFFFFFFFFFFF
            FFFF2424240000000000000000000000000000007A7A7AFFFFFFFFFFFFB9B9B9
            0B0B0B0000005B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFADADAD0303030000000000000000002C2C2CFFFFFFAE
            AEAE0404040000000000000000000606067E7E7EB9B9B9B7B7B7AFAFAFAAAAAA
            B3B3B3B1B1B1B8B8B8BABABAEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            008B8B8BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE16161600000000000000
            00005B5B5BFFFFFFFFFFFFFBFBFB151515000000000000000000000000020202
            B5B5B5FFFFFFFFFFFF7D7D7D0000000000005A5A5AFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B303030300000000
            0000000000232323F6F6F6C6C6C60A0A0A000000020202040404000000030303
            1414142828280B0B0B0202020505051A1A1A2323231111117F7F7FFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            9090900000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF232323000000000000000000545454FFFFFFFFFFFFB6B6B6070707000000
            000000000000000000151515DDDDDDFFFFFFFFFFFF5959590000000000005A5A
            5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFB6B6B6030303000000010101000000272727FFFFFFC5C5C50B0B0B000000
            0303030303030000000000000000000101010000000000000101010101010000
            00000000555555FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFF9696960000000000000000000505050707070000
            00030303010101000000000000000000000000000000000000858585FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFEFEFE2121210000000000000000005A5A5AFFFFFF
            FFFFFFA5A5A5000000000000000000000000000000353535FFFFFFFFFFFFFFFF
            FF363636000000000000464646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD070707000000010101000000242424
            F9F9F9C8C8C81717170000000000000000000000000303030000000000000303
            030606060101010101010000000000004D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A70101010000
            0000000001010102020200000001010100000000000000000000000000000000
            00000000007C7C7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF272727000000
            000000000000525252FFFFFFFFFFFF8B8B8B0000000101010303030000000000
            004E4E4EFFFFFFFFFFFFCECECE131313000000000000404040FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF060606
            000000000000000000181818F9F9F9D9D9D90B0B0B0000000000000000000000
            00010101000000000000040404090909000000000000000000000000575757FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFA9A9A901010100000000000000000000000000000000000003030301
            0101000000000000000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF2C2C2C000000000000000000494949FFFFFFFFFFFF6868680000
            00050505070707000000000000666666FFFFFFFFFFFF93939300000000000000
            0000454545FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCDCDCD080808000000000000000000111111CDCDCDFFFFFF2828
            2800000000000001010100000000000001010101010103030300000000000000
            00000000000000004E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A300000000000000000000000000
            0000000000000000010101000000000000000000000000000000000000616161
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2626260000000000000000003737
            37FFFFFFFEFEFE2B2B2B0000000000000000000000000000008A8A8AFFFFFFFF
            FFFF6D6D6D000000000000000000343434FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF0808080101010101010000
            000B0B0BC0C0C0FFFFFF3131310000000101010505050202020E0E0E04040400
            0000000000000000000000000000000000000000424242FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE06
            0606000000000000000000000000000000000000000000000000000000000000
            0000000000000000004D4D4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D2D
            2D000000000000000000353535FFFFFFD6D6D610101000000000000000000000
            0000040404ADADADFFFFFFFFFFFF4545450000000000000000002C2C2CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEC
            EC1616160000000000000000000E0E0ED8D8D8FEFEFE15151500000004040402
            0202010101030303000000000000000000010101010101000000000000000000
            383838FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFBABABA050505000000000000000000010101010101000000
            0000000000000000000000000000000000000000003E3E3EFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF2A2A2A000000000000000000333333FFFFFFBABABA04
            0404000000000000000000000000242424FCFCFCFFFFFFEAEAEA1E1E1E000000
            0000000000002C2C2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFE6E6E61010100000000000000000000F0F0FC5C5C5FB
            FBFB1A1A1A000000030303010101000000000000000000000000020202040404
            000000000000000000000000383838FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3020202000000040404
            0000000000000000000000000000000000000000000000000000000000000000
            003E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF32323200000000000000
            0000333333FFFFFF9696960000000000000000000000000000003A3A3AFFFFFF
            FFFFFFB3B3B30606060000000000000000002F2F2FFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F714141400000000
            0000000000151515C7C7C7FFFFFF272727000000000000000000000000000000
            0000000000000000000000000101010303030000000000003A3A3AFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            B6B6B60404040000000101010000000000000000000000000000000101010101
            010000000000000000000000001B1B1BE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF4A4A4A0000000000000000003C3C3CFFFFFF717171000000000000000000
            000000000000565656FFFFFFFFFFFFB7B7B70505050000000000000000002828
            28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFE2E2E2111111000000000000000000131313C4C4C4FFFFFF2A2A2A000000
            0000000000000101010101010404040000000000000000000000000101010000
            000000002A2A2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFBDBDBD0707070000000000000202020000000000
            000000000000000000000000000000000000000000000000000C0C0CF2F2F2FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF4444440000000000000000002A2A2AFFFFFF
            4A4A4A000000000000000000000000000000797979FFFFFFFFFFFFBFBFBF0909
            09000000000000000000292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50909090000000000000000000F0F0F
            C6C6C6FFFFFF3636360000000000000000000000000000000000000000000000
            00000000000000000000000000000000202020FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C30D0D0D0000
            000000000101010000003838387474746666666F6F6F7474747878787272726D
            6D6D606060838383FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B000000
            0000000000000C0C0C7676761818180000000000000000000000000000009292
            92FFFFFFFFFFFFC2C2C20A0A0A000000000000000000212121FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBF060606
            000000000000000000121212CDCDCDFFFFFF3333330000000000000000000000
            002727275757574141413232323F3F3F4343434444443E3E3E333333484848FE
            FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFBDBDBD060606000000000000000000000000A0A0A0FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF5C5C5C0000000000000000000000000000000000000101010101
            01000000000000020202AEAEAEFFFFFFFFFFFFC6C6C60F0F0F00000000000000
            0000171717DBDBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBEBEBE050505000000000000000000141414CFCFCFFFFFFF4646
            460000000000000202020000006A6A6AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3C3C30A0A0A00000000000000000000
            00009C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5454540000000000000000000000
            000000000000000000000000000000000000000F0F0FC6C6C6FFFFFFFFFFFFBF
            BFBF0A0A0A000000000000000000121212D2D2D2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACACAC0000000000000000000000
            00242424FCFCFCFFFFFF5A5A5A0000000000000101010000006D6D6DFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C70C
            0C0C0000000000000000000000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5151
            5100000000000000000000000003030302020200000000000000000000000026
            2626F8F8F8FFFFFFFFFFFFC5C5C50D0D0D0000000000000000000D0D0DD0D0D0
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABAB
            AB0000000000000000000000001B1B1BD8D8D8FFFFFF56565600000000000000
            0000000000686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFEEEEEE1616160000000000000000000000008C8C8CFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF5F5F5F00000000000000000000000000000000000000
            0000000000000000000000525252FFFFFFFFFFFFFFFFFFD6D6D6151515000000
            020202000000131313CACACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF9B9B9B000000000000000000000000181818DCDCDCFF
            FFFF5555550000000000000000000000005F5F5FFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2191919000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64646402020203030300
            0000000000000000000000000000000000000000000000818181FFFFFFFFFFFF
            FFFFFFE8E8E81A1A1A0000000101010000000F0F0FC1C1C1FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87878700000000000000
            00000000002D2D2DFFFFFFFFFFFF5B5B5B000000000000000000000000535353
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF4A4A4A000000000000000000000000797979FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF6A6A6A010101010101000000000000000000000000000000000000000000
            000000A7A7A7FFFFFFFFFFFFFFFFFFDFDFDF1B1B1B0000000000000000000E0E
            0EBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF6666660000000000000000000000002F2F2FFFFFFFFFFFFF5A5A5A000000
            0000000000000000004C4C4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4E0000000000000000000000006D6D
            6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF666666000000000000010101020202000000
            000000000000000000000000070707B1B1B1FFFFFFFFFFFFFFFFFFF6F6F62323
            23000000000000000000040404B1B1B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F0000000000000202020000002D2D2D
            FEFEFEFFFFFF6C6C6C000000000000000000000000424242FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5656560000
            00000000000000000000505050FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF676767000000
            0000000000000000000000000000000000000000000000000E0E0ECFCFCFFFFF
            FFFFFFFFFFFFFFFEFEFE262626000000000000000000010101B1B1B1FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0121212000000
            0000000101010000003F3F3FFFFFFFFFFFFF7979790000000000000000000000
            003D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF4B4B4B000000000000000000000000434343FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF6666660000000000000000000000000000000000000000000000
            000000003D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE2A2A2A00000000000000
            0000070707B5B5B5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBABABA060606000000000000000000000000565656FFFFFFFFFFFF8A8A
            8A0000000000000000000000003D3D3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B00000000000000000000
            0000292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7373730000000000000000000000
            000000000000000101010000000000005E5E5EFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFE2929290000000000000000000101019C9C9CFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494940000000000000000000000000000
            00676767FFFFFFFFFFFF7A7A7A0000000000000000000000002E2E2EFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF76
            7676000000000000000000000000111111F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7A
            7A000000010101000000000000000000000000000000000000000000939393FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF2C2C2C0000000000000000000000007F7F7F
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4B4B4B0000
            000000000000000000000000007F7F7FFFFFFFFFFFFF7A7A7A00000004040405
            05050000002D2D2DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFF7878780000000000000000000000000C0C0CD9D9D9
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF91919100000000000000000000000000000000000000
            0000000000010101BDBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF282828000000
            0000000000000000006C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFBFBFB121212000000000000000000000000000000888888FFFFFFFF
            FFFF8B8B8B000000010101010101000000272727FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D6D000000000000
            000000000000070707C3C3C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99999900000000000000
            0000000000000000000000000000000000070707BDBDBDFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3232320000000000000000000000005F5F5FFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5A5A501010100000000000000000000
            0000000000A0A0A0FFFFFFFFFFFF9191910000000000000000000000000E0E0E
            DCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFF7D7D7D000000000000000000000000060606BFBFBFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFA5A5A5060606000000000000000000000000010101010101000000262626
            FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4141410000000000000000000000
            005C5C5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D00
            0000000000000000000000000000060606BFBFBFFFFFFFFFFFFFA7A7A7010101
            0000000000000000000B0B0BD1D1D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8383830000000000000000000000000303
            03B7B7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0090909000000000000000000000000
            010101010101000000484848FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
            4D000000000000000000000000646464FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF9F9F9F000000000000000000000000000000000000121212CDCDCD
            FFFFFFFFFFFFAFAFAF000000000000000000000000121212DEDEDEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A70000
            00000000000000000000000000A6A6A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C70B0B0B
            000000000000000000000000000000000000000000616161FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFF5454540000000000000000000000004F4F4FFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5232323000000000000000000000000
            000000000000212121FEFEFEFFFFFFFFFFFFADADAD0101010000000000000000
            000F0F0FE4E4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFA6A6A6000000000000000000000000000000ABABABFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFCFCFCF1616160000000000000000000000000000000000000000
            00909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52525200000000000000
            00000000004E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADADAD1C1C1C000000
            0000000000000000000000000000000000005D5D5DFFFFFFFFFFFFFFFFFFBABA
            BA030303000000000000000000020202A5A5A5FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A801010100000000000000
            0000000000999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C00A0A0A0000000000000101
            01000000000000000000000000ACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFF5E5E5E0000000000000000000000001515157676766D6D6D656565505050
            4545450909090000000000000000000000000000000000000000000000008B8B
            8BFFFFFFFFFFFFFFFFFFBBBBBB0303030000000000000000000000002121213E
            3E3E2424242727272D2D2D3131312B2B2B2E2E2E4242423A3A3A3A3A3A383838
            ACACACFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA5
            A5A50101010000000000000000000000004C4C4CBCBCBCBABABAAFAFAFB2B2B2
            ABABABB3B3B3B5B5B5B0B0B0AEAEAEB8B8B8A2A2A2B7B7B7FFFFFFFFFFFFD8D8
            D8171717000000000000000000000000000000000000050505BEBEBEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565000000000000000000000000000000
            0303030000000000000000000000000000000202020000000000000000000000
            000000000000000B0B0BC1C1C1FFFFFFFFFFFFFFFFFFBEBEBE04040400000001
            01010000000000000000000101010C0C0C000000000000000000000000000000
            0000000000000000000000007D7D7DFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFAFAFAF020202000000000000000000000000000000
            1010101717170000000101010000000303030303030202020101010404040000
            001F1F1FF6F6F6FFFFFFDFDFDF19191900000000000000000000000000000000
            0000212121EEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF858585000000
            0000000000000000000101010000000000000000000000000000000000000101
            010000000000000000000000000000000000002E2E2EFFFFFFFFFFFFFFFFFFFF
            FFFFC9C9C9090909000000010101000000000000010101020202050505010101
            010101000000000000000000010101050505000000000000838383FFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBDBD060606000000
            0000000000000000000000000000000707070000000000000000000000000000
            00000000000000000000000000171717FBFBFBFFFFFFDDDDDD15151500000001
            0101010101000000000000000000565656FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFA0A0A00000000000000000000000000000000000000000000000
            0000000000000000000000000000000001010102020201010100000000000075
            7575FFFFFFFFFFFFFFFFFFFFFFFFD2D2D20B0B0B000000000000000000000000
            0000000000000000000404040000000000000000000000000000000000000000
            00000000767676FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFBCBCBC0505050000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000F0F0FC6C6C6FF
            FFFFF2F2F2171717000000000000000000000000000000000000777777FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E8E0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000001
            01010000000000000000009A9A9AFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8111111
            0000000303030101010000000101010000000000000303030101010D0D0D0303
            03000000000000000000000000000000646464FFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50808080000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000171717F6F6F6FFFFFFFFFFFF242424000000000000000000000000
            000000000000848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E8E
            8E00000000000000000000000000000000000001010100000000000000000000
            00000000000000000000000000000000000000001A1A1AEEEEEEFFFFFFFFFFFF
            FFFFFFFFFFFFFBFBFB2929290000000E0E0E0606060000000303030000000000
            000101010101011A1A1A0606060202020000000303030101010000004D4D4DFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F01A1A
            1A00000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000080808BFBFBFFFFFFFFFFFFF303030
            000000000000000000000000000000040404B4B4B4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFA5A5A501010100000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            6E6E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2222220000000101010101
            0100000000000000000000000000000000000001010100000001010100000006
            0606030303000000545454FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFE8E8E80F0F0F00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000070707
            BCBCBCFFFFFFFFFFFF3434340000000000000000000000000000000E0E0EE4E4
            E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A300000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000C0C0CBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF38383800000000000000000000000000000000000000000000000000000000
            0000000000000000020202000000010101000000414141FFFFFFFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D8D809090900000000000000
            0000000000000000000000000000000000000000000000010101010101000000
            0000000000000000000F0F0FD9D9D9FFFFFFFFFFFF3535350000000000000000
            000000000000001B1B1BF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFAFAFAF030303000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000005B5B5BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF48484800000000000001010101010101010100
            0000000000000000000000000000000000010101020202000000010101000000
            3C3C3CFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
            F6F6101010000000010101010101010101000000000000000000000000000000
            000000000000010101010101000000000000000000111111DEDEDEFFFFFFFFFF
            FF4646460000000000000000000000000000002A2A2AFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFB4B4B4080808000000000000000000010101
            0000000000000000000000000000000000000000000000000000000000000606
            06BCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF46464600000000
            00000000000303030505050101010000000101010101010000000707070C0C0C
            0303030000000101010000003D3D3DFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF303030000000000000010101020202000000
            0000000000000000000000000101010101010000000000000000000000000000
            00101010D8D8D8FFFFFFFFFFFF4C4C4C0000000000000000000000000000004B
            4B4BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2B2060606
            0000000000000101010404040000000000000101010000000000000000000101
            01000000000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFF4A4A4A000000000000000000010101030303020202000000010101
            0303030000000303030B0B0B0303030505050404040000002B2B2BFFFFFFFFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF373737000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000070707C6C6C6FFFFFFFFFFFF5B5B5B00000000
            0000000000000000000000656565FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFBEBEBE0A0A0A0000000000000000000000000000000000000000
            00000000000000000000000000000000020202737373FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A000000000000000000000000
            0000000101010202020101010303030000000101010808080606060707070202
            02000000242424FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF3131310000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000000000000000A7A7A7FF
            FFFFFFFFFF515151000000000000000000000000000000707070FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D10404040000000000000000
            000000000000000000000000000000000000000000000202022B2B2B989898FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000B0B0BFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF8484849B9B9B8D8D8D8888
            888989898F8F8F8E8E8E8F8F8F9393937272728080808E8E8E7171717F7F7F7B
            7B7B696969828282F6F6F6FFFFFFFFFFFFA7A7A76767678686868282827F7F7F
            848484CFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF7575756464646F6F6F6B6B6B6B6B6B7676767B7B7B78787868686864646488
            8888B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFB6B6B65E5E5E6565656565656464646868686262625C5C
            5C5C5C5C6262626666666868686363636C6C6C6262626161615E5E5E6A6A6AFF
            FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          mmHeight = 22490
          mmLeft = 5292
          mmTop = 102923
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl52: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'BANCO DO BRASIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 102923
          mmTop = 108744
          mmWidth = 40746
          BandType = 5
          GroupNo = 0
        end
        object ppMemo3: TppMemo
          UserName = 'Memo2'
          Caption = '  R  E  C  I  B  O    C  O  N  T  R  I  B  U  I  N  T  E'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Lines.Strings = (
            '  R'
            '  E'
            '  C'
            '  I'
            '  B'
            '  O'
            '  '
            '  C'
            '  O'
            '  N'
            '  T'
            '  R'
            '  I'
            '  B'
            '  U'
            '  I'
            '  N'
            '  T'
            '  E')
          Transparent = True
          mmHeight = 53975
          mmLeft = 145257
          mmTop = 115623
          mmWidth = 3969
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpSalarioEducLbl56: TppLabel
          UserName = 'Label901'
          Caption = '4. Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 81492
          mmTop = 127794
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt31: TppDBText
          UserName = 'DBText9'
          DataField = 'VENCIMENTO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 82550
          mmTop = 129911
          mmWidth = 59796
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl49: TppLabel
          UserName = 'Label502'
          AutoSize = False
          Caption = 'COMPROVANTE DE ARRECADAÇÃO DIRETA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 31485
          mmTop = 107686
          mmWidth = 69321
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl50: TppLabel
          UserName = 'Label29'
          AutoSize = False
          Caption = 'SALÁRIO-EDUCAÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 31485
          mmTop = 111390
          mmWidth = 69321
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl48: TppLabel
          UserName = 'Label30'
          AutoSize = False
          Caption = 'CAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 20
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 8467
          mmLeft = 31485
          mmTop = 101336
          mmWidth = 69321
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt36: TppShape
          UserName = 'Shape20'
          mmHeight = 19844
          mmLeft = 4498
          mmTop = 134409
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape35: TppShape
          UserName = 'Shape28'
          mmHeight = 23813
          mmLeft = 4498
          mmTop = 153988
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl57: TppLabel
          UserName = 'Label31'
          AutoSize = False
          Caption = '5. Sacado / Endereço de Correspondência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 1852
          mmLeft = 5556
          mmTop = 135202
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine17: TppLine
          UserName = 'Line9'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 46831
          mmTop = 127000
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine18: TppLine
          UserName = 'Line10'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 80433
          mmTop = 127000
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl58: TppLabel
          UserName = 'Label34'
          Caption = '6. Instruções'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 5292
          mmTop = 154517
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt32: TppDBText
          UserName = 'DBText15'
          DataField = 'ESTAB'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 137319
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt33: TppDBText
          UserName = 'DBText702'
          DataField = 'ENDERECO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 141023
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt34: TppDBText
          UserName = 'DBText20'
          DataField = 'CIDADE'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 144727
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt35: TppDBText
          UserName = 'DBText21'
          DataField = 'CEP'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 148432
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl54: TppLabel
          UserName = 'Label38'
          Caption = '2. Agência Centralizadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 5556
          mmTop = 127794
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt29: TppDBText
          UserName = 'DBText22'
          DataField = 'AG_CENTRALIZ'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 130175
          mmWidth = 38365
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl55: TppLabel
          UserName = 'Label39'
          Caption = '3. Número da Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 48154
          mmTop = 127794
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt30: TppDBText
          UserName = 'DBText23'
          DataField = 'NUM_CONTA'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 48948
          mmTop = 130175
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl59: TppLabel
          UserName = 'Label40'
          AutoSize = False
          Caption = 
            'Instruções BB: Arrecadação: LIC 3-19-10 / Recebimento em cheque:' +
            ' LIC 3-19-10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8202
          mmTop = 156634
          mmWidth = 132557
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl60: TppLabel
          UserName = 'Label41'
          AutoSize = False
          Caption = 'ATENÇÃO! PAGÁVEL SOMENTE NO BANCO DO BRASIL S/A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 171186
          mmWidth = 137319
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape36: TppShape
          UserName = 'Shape29'
          mmHeight = 8202
          mmLeft = 150284
          mmTop = 102923
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape45: TppShape
          UserName = 'Shape401'
          mmHeight = 8467
          mmLeft = 150284
          mmTop = 171980
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape44: TppShape
          UserName = 'Shape31'
          mmHeight = 8202
          mmLeft = 150284
          mmTop = 164042
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape43: TppShape
          UserName = 'Shape35'
          mmHeight = 7673
          mmLeft = 150284
          mmTop = 156634
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape42: TppShape
          UserName = 'Shape36'
          mmHeight = 8202
          mmLeft = 150284
          mmTop = 148696
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape41: TppShape
          UserName = 'Shape37'
          mmHeight = 7938
          mmLeft = 150284
          mmTop = 141023
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape40: TppShape
          UserName = 'Shape38'
          mmHeight = 8202
          mmLeft = 150284
          mmTop = 133086
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape39: TppShape
          UserName = 'Shape39'
          mmHeight = 7673
          mmLeft = 150284
          mmTop = 125677
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBCalc3: TppDBCalc
          UserName = 'rpSalarioEducDBCalc3'
          DataField = 'BASE_CONTRIB'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 128852
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt42: TppDBText
          UserName = 'DBText801'
          DataField = 'DEDUCAO_SME'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 144463
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl70: TppLabel
          UserName = 'Label1001'
          Caption = '12. Base de Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 125942
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl71: TppLabel
          UserName = 'Label46'
          Caption = '13. (=) Valor do Salário-Educação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 133615
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl72: TppLabel
          UserName = 'Label47'
          Caption = '14. (-) Deduções para o SME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 141552
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl73: TppLabel
          UserName = 'Label48'
          Caption = '15. (-) Compensação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 149225
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl74: TppLabel
          UserName = 'Label49'
          Caption = '16. (=) Valor Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 157163
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl75: TppLabel
          UserName = 'Label52'
          Caption = '17. (+) Multa + Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 164571
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl76: TppLabel
          UserName = 'Label53'
          Caption = '18. (=) Valor Cobrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 172509
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt43: TppDBText
          UserName = 'DBText24'
          DataField = 'COMPENSACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 151871
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt44: TppDBText
          UserName = 'DBText25'
          DataField = 'VALOR_ATUALIZADO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154252
          mmTop = 159809
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt45: TppDBText
          UserName = 'DBText26'
          DataField = 'MULTA_JUROS'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 167746
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl64: TppLabel
          UserName = 'Label55'
          Caption = '9. Tipo Identific.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151342
          mmTop = 111125
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt39: TppDBText
          UserName = 'DBText31'
          DataField = 'TIPO_INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 151607
          mmTop = 113242
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl77: TppLabel
          UserName = 'Label56'
          AutoSize = False
          Caption = '19. Autenticação Mecânica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151342
          mmTop = 182827
          mmWidth = 50271
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl68: TppLabel
          UserName = 'Label60'
          Caption = '10. Identificação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 169598
          mmTop = 111125
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxtINSCRICAO3: TppDBText
          UserName = 'DBText36'
          DataField = 'INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 169334
          mmTop = 114036
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl63: TppLabel
          UserName = 'Label1101'
          Caption = '8. Competência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 180446
          mmTop = 103717
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt38: TppDBText
          UserName = 'DBText37'
          DataField = 'REFERENCIA'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 181505
          mmTop = 106627
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine22: TppLine
          UserName = 'Line11'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 151342
          mmTop = 116946
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine21: TppLine
          UserName = 'Line16'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 156634
          mmTop = 113242
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine20: TppLine
          UserName = 'Line18'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 150548
          mmTop = 113242
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl61: TppLabel
          UserName = 'Label65'
          Caption = 'SENHOR(A) CAIXA - UTILIZE FE 294'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 155840
          mmTop = 98954
          mmWidth = 47361
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl65: TppLabel
          UserName = 'Label66'
          Caption = '0. CEI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 159279
          mmTop = 113242
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl66: TppLabel
          UserName = 'Label67'
          Caption = '1. CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 159279
          mmTop = 115623
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine23: TppLine
          UserName = 'Line20'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 168275
          mmTop = 110861
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt41: TppDBText
          UserName = 'DBText38'
          DataField = 'SAL_EDUCACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 136790
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt46: TppDBText
          UserName = 'DBText302'
          DataField = 'VALOR_TOTAL'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 175948
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl62: TppLabel
          UserName = 'Label69'
          Caption = '7. Número do Convênio/Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151342
          mmTop = 103717
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt37: TppDBText
          UserName = 'DBText39'
          DataField = 'NUMCONVREC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 153194
          mmTop = 106892
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine19: TppLine
          UserName = 'Line21'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 179388
          mmTop = 103452
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape38: TppShape
          UserName = 'Shape40'
          mmHeight = 7673
          mmLeft = 150284
          mmTop = 118269
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl69: TppLabel
          UserName = 'Label70'
          Caption = '11. Número do Processo no FNDE ou da Execução Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 151077
          mmTop = 118534
          mmWidth = 46038
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt40: TppDBText
          UserName = 'DBText901'
          DataField = 'NUMPROC_EXECFISC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 121444
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine25: TppLine
          UserName = 'Line22'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 150284
          mmTop = 182298
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine24: TppLine
          UserName = 'Line23'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 150284
          mmTop = 182563
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape46: TppShape
          UserName = 'Shape41'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 101865
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape47: TppShape
          UserName = 'Shape42'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 109802
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape55: TppShape
          UserName = 'Shape501'
          mmHeight = 8467
          mmLeft = 212990
          mmTop = 170921
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape54: TppShape
          UserName = 'Shape43'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 162984
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape53: TppShape
          UserName = 'Shape44'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 155575
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape52: TppShape
          UserName = 'Shape102'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 147638
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape51: TppShape
          UserName = 'Shape45'
          mmHeight = 7938
          mmLeft = 212990
          mmTop = 139965
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape50: TppShape
          UserName = 'Shape46'
          mmHeight = 8202
          mmLeft = 212990
          mmTop = 132027
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape49: TppShape
          UserName = 'Shape47'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 124619
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBCalc4: TppDBCalc
          UserName = 'rpSalarioEducDBCalc4'
          DataField = 'BASE_CONTRIB'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 127794
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt52: TppDBText
          UserName = 'DBText40'
          DataField = 'DEDUCAO_SME'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 143404
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl87: TppLabel
          UserName = 'Label71'
          Caption = '12. Base de Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 125148
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl88: TppLabel
          UserName = 'Label72'
          Caption = '13. (=) Valor do Salário-Educação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 132557
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl89: TppLabel
          UserName = 'Label73'
          Caption = '14. (-) Deduções para o SME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 140494
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl90: TppLabel
          UserName = 'Label1201'
          Caption = '15. (-) Compensação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 148167
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl91: TppLabel
          UserName = 'Label74'
          Caption = '16. (=) Valor Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 156104
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl92: TppLabel
          UserName = 'Label75'
          Caption = '17. (+) Multa + Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 163513
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl93: TppLabel
          UserName = 'Label76'
          Caption = '18. (=) Valor Cobrado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 171450
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt53: TppDBText
          UserName = 'DBText41'
          DataField = 'COMPENSACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 151342
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt54: TppDBText
          UserName = 'DBText42'
          DataField = 'VALOR_ATUALIZADO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218017
          mmTop = 158750
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt55: TppDBText
          UserName = 'DBText43'
          DataField = 'MULTA_JUROS'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 166688
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object ppMemo4: TppMemo
          UserName = 'Memo4'
          Caption = '  F'#13#10'  I'#13#10'  C'#13#10'  H'#13#10'  A'#13#10#13#10'  O'#13#10'  N'#13#10'  -'#13#10'  L'#13#10'  I'#13#10'  N'#13#10'  E'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Lines.Strings = (
            '  F'
            '  I'
            '  C'
            '  H'
            '  A'
            ''
            '  O'
            '  N'
            '  -'
            '  L'
            '  I'
            '  N'
            '  E')
          Transparent = True
          mmHeight = 36777
          mmLeft = 207698
          mmTop = 121709
          mmWidth = 3969
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpSalarioEducLbl81: TppLabel
          UserName = 'Label77'
          Caption = '9. Tipo Identific.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 110067
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt49: TppDBText
          UserName = 'DBText44'
          DataField = 'TIPO_INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 214313
          mmTop = 112184
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object ppLabel125: TppLabel
          UserName = 'Label78'
          AutoSize = False
          Caption = '19. Autenticação Mecânica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 182034
          mmWidth = 50271
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl85: TppLabel
          UserName = 'Label79'
          Caption = '10. Identificação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 232305
          mmTop = 110067
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxtINSCRICAO4: TppDBText
          UserName = 'DBText45'
          DataField = 'INSCRICAO'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3440
          mmLeft = 232305
          mmTop = 112977
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl80: TppLabel
          UserName = 'Label80'
          Caption = '8. Competência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 243153
          mmTop = 102394
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt48: TppDBText
          UserName = 'DBText46'
          DataField = 'REFERENCIA'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 244211
          mmTop = 105569
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine29: TppLine
          UserName = 'Line24'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 214313
          mmTop = 115888
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine28: TppLine
          UserName = 'Line301'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 219340
          mmTop = 112184
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine27: TppLine
          UserName = 'Line25'
          Position = lpRight
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 213255
          mmTop = 112184
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl78: TppLabel
          UserName = 'Label81'
          Caption = 'SENHOR(A) CAIXA - UTILIZE FE 294'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 218546
          mmTop = 97896
          mmWidth = 47361
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl82: TppLabel
          UserName = 'Label82'
          Caption = '0. CEI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 221986
          mmTop = 112184
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl83: TppLabel
          UserName = 'Label1301'
          Caption = '1. CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 221986
          mmTop = 114565
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine30: TppLine
          UserName = 'Line26'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 231246
          mmTop = 109802
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt51: TppDBText
          UserName = 'DBText1010'
          DataField = 'SAL_EDUCACAO'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 135732
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt56: TppDBText
          UserName = 'DBText47'
          DataField = 'VALOR_TOTAL'
          DataPipeline = ppSalarioEduc
          DisplayFormat = '#,0.00;#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 174890
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl79: TppLabel
          UserName = 'Label84'
          Caption = '7. Número do Convênio/Receita'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 102394
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt47: TppDBText
          UserName = 'DBText1001'
          DataField = 'NUMCONVREC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 3704
          mmLeft = 215900
          mmTop = 105569
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine26: TppLine
          UserName = 'Line27'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 7938
          mmLeft = 242094
          mmTop = 101865
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducShape48: TppShape
          UserName = 'Shape48'
          mmHeight = 7673
          mmLeft = 212990
          mmTop = 117211
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLbl86: TppLabel
          UserName = 'Label85'
          Caption = '11. Número do Processo no FNDE ou da Execução Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 5
          Font.Style = []
          Transparent = True
          mmHeight = 2117
          mmLeft = 214048
          mmTop = 117740
          mmWidth = 46038
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducDBTxt50: TppDBText
          UserName = 'DBText48'
          DataField = 'NUMPROC_EXECFISC'
          DataPipeline = ppSalarioEduc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 218282
          mmTop = 120386
          mmWidth = 31750
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine32: TppLine
          UserName = 'Line28'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 212990
          mmTop = 181505
          mmWidth = 52917
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine31: TppLine
          UserName = 'Line29'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 212990
          mmTop = 181769
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLine34: TppLine
          UserName = 'Line30'
          Pen.Style = psDot
          Position = lpLeft
          Weight = 0.75
          mmHeight = 183621
          mmLeft = 205052
          mmTop = 1323
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducBarCode1: TppBarCode
          UserName = 'rpSalarioEducBarCode1'
          BarCodeType = bcInt2of5
          BarColor = clWindowText
          CalcCheckDigit = False
          Data = '10'
          PrintHumanReadable = False
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          mmHeight = 9260
          mmLeft = 4233
          mmTop = 84138
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
          mmBarWidth = 381
          mmWideBarRatio = 35000
        end
        object rpSalarioEducLblCodBarras1: TppLabel
          UserName = 'rpSalarioEducLblCodBarras'
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 4233
          mmTop = 80433
          mmWidth = 105569
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducLblCodBarras2: TppLabel
          UserName = 'rpSalarioEducLblCodBarras1'
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 4498
          mmTop = 177800
          mmWidth = 105569
          BandType = 5
          GroupNo = 0
        end
        object rpSalarioEducBarCode2: TppBarCode
          UserName = 'rpSalarioEducBarCode2'
          BarCodeType = bcInt2of5
          BarColor = clWindowText
          CalcCheckDigit = False
          Data = '10'
          PrintHumanReadable = False
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          mmHeight = 9260
          mmLeft = 4498
          mmTop = 181505
          mmWidth = 139965
          BandType = 5
          GroupNo = 0
          mmBarWidth = 381
          mmWideBarRatio = 35000
        end
      end
    end
  end
  object ppSalarioEduc: TppBDEPipeline
    DataSource = dsSalarioEduc
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'SalarioEduc'
    Left = 211
    Top = 48
  end
  object dsSalarioEduc: TwwDataSource
    DataSet = CdsSalarioEduc
    Left = 211
    Top = 96
  end
  object sqlSalarioEduc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS ESTAB,'
      '  1 AS TIPO_INSCRICAO,'
      '  '#39'1'#39' AS INSCRICAO,'
      '  '#39'1'#39' AS NUMCONVREC,'
      '  '#39'1'#39' AS VENCIMENTO,'
      '  '#39'1'#39' AS AG_CENTRALIZ,'
      '  '#39'1'#39' AS NUM_CONTA,'
      '  '#39'1'#39' AS NUMPROC_EXECFISC,'
      '  0 AS VALOR_ATUALIZADO,'
      '  0 AS COMPENSACAO,'
      '  0 AS ATUALIZ_MONET,'
      '  0 AS MULTA_JUROS,'
      '  '#39'1'#39' AS ENDERECO,'
      '  '#39'1'#39' AS CIDADE,'
      '  '#39'1'#39' AS CEP,'
      '  '#39'1'#39' AS REFERENCIA,'
      '  0 AS DEDUCAO_SME,'
      '  0 AS BASE_CONTRIB,'
      '  0 AS SAL_EDUCACAO,'
      '  0 AS VALOR_TOTAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsSalarioEduc
    Left = 211
    Top = 190
  end
  object CdsSalarioEduc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsSalarioEducAfterScroll
    Left = 211
    Top = 144
  end
end
