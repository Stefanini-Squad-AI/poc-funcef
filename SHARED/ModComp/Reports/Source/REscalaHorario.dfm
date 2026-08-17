inherited RptEscalaHorario: TRptEscalaHorario
  Left = 245
  Top = 203
  Width = 283
  Height = 266
  Caption = 'RptEscalaHorario'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
        Caption = 'FlgDoisCargos'
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
        Name = 'FlgDoisCargos'
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
        Caption = 'ImprimeHorarios'
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
        Name = 'ImprimeHorarios'
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
      end
      item
        Caption = 'ListaIdCargo'
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
        Name = 'ListaIdCargo'
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
      end>
    Left = 136
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpEscalaHorario
  end
  object rpEscalaHorario: TppReport
    AutoStop = False
    DataPipeline = ppEscalaHorario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpEscalaHorarioBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 215
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEscalaHorario'
    object rpEscalaHorarioHdrBnd: TppHeaderBand
      AfterPrint = rpEscalaHorarioHdrBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 1058
      mmPrintPosition = 0
    end
    object rpEscalaHorarioDtlBnd: TppDetailBand
      BeforePrint = rpEscalaHorarioDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 249238
      mmPrintPosition = 0
      object rpEscalaHorarioShape1: TppShape
        UserName = 'rpEscalaHorarioShape1'
        Brush.Color = clSilver
        StretchWithParent = True
        mmHeight = 23548
        mmLeft = 529
        mmTop = 16404
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape4: TppShape
        UserName = 'rpEscalaHorarioShape4'
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 1588
        mmTop = 33602
        mmWidth = 194734
        BandType = 4
      end
      object rpEscalaHorarioShape3: TppShape
        UserName = 'rpEscalaHorarioShape3'
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 1588
        mmTop = 27252
        mmWidth = 194734
        BandType = 4
      end
      object rpEscalaHorarioShape2: TppShape
        UserName = 'rpEscalaHorarioShape2'
        Pen.Style = psClear
        mmHeight = 8731
        mmLeft = 1588
        mmTop = 17463
        mmWidth = 88371
        BandType = 4
      end
      object rpEscalaHorarioShape5: TppShape
        UserName = 'rpEscalaHorarioShape5'
        mmHeight = 166423
        mmLeft = 529
        mmTop = 39423
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape12: TppShape
        UserName = 'rpEscalaHorarioShape12'
        Brush.Style = bsClear
        mmHeight = 160867
        mmLeft = 166688
        mmTop = 44979
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA29_1: TppShape
        UserName = 'rpEscalaHorarioShapeDIA29_1'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 205582
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA31_1: TppShape
        UserName = 'rpEscalaHorarioShapeDIA31_1'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 216165
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA30_1: TppShape
        UserName = 'rpEscalaHorarioShapeDIA30_1'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 210873
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA31_4: TppShape
        UserName = 'rpEscalaHorarioShapeDIA31_4'
        mmHeight = 5556
        mmLeft = 103717
        mmTop = 216165
        mmWidth = 47625
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA30_4: TppShape
        UserName = 'rpEscalaHorarioShapeDIA30_4'
        mmHeight = 5556
        mmLeft = 103717
        mmTop = 210873
        mmWidth = 47625
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA29_4: TppShape
        UserName = 'Shape103'
        mmHeight = 5556
        mmLeft = 103717
        mmTop = 205582
        mmWidth = 47625
        BandType = 4
      end
      object rpEscalaHorarioShape7: TppShape
        UserName = 'rpEscalaHorarioShape7'
        Brush.Style = bsClear
        mmHeight = 166423
        mmLeft = 11113
        mmTop = 39423
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA29_2: TppShape
        UserName = 'rpEscalaHorarioShapeDIA29_2'
        mmHeight = 5556
        mmLeft = 11113
        mmTop = 205582
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShape27: TppShape
        UserName = 'rpEscalaHorarioShape27'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 194998
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape26: TppShape
        UserName = 'rpEscalaHorarioShape26'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 184415
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape25: TppShape
        UserName = 'rpEscalaHorarioShape25'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 173832
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape24: TppShape
        UserName = 'rpEscalaHorarioShape24'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 163248
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape23: TppShape
        UserName = 'rpEscalaHorarioShape23'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 152665
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape22: TppShape
        UserName = 'rpEscalaHorarioShape22'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 142082
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape21: TppShape
        UserName = 'rpEscalaHorarioShape21'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 131498
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape20: TppShape
        UserName = 'rpEscalaHorarioShape20'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 120915
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape19: TppShape
        UserName = 'rpEscalaHorarioShape19'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 110331
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape18: TppShape
        UserName = 'rpEscalaHorarioShape18'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 99748
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape16: TppShape
        UserName = 'rpEscalaHorarioShape16'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 89165
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape15: TppShape
        UserName = 'rpEscalaHorarioShape15'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 78581
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape14: TppShape
        UserName = 'rpEscalaHorarioShape14'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 67998
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape13: TppShape
        UserName = 'rpEscalaHorarioShape13'
        Brush.Style = bsClear
        mmHeight = 5556
        mmLeft = 529
        mmTop = 57415
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA31_3: TppShape
        UserName = 'rpEscalaHorarioShapeDIA31_3'
        mmHeight = 5556
        mmLeft = 73554
        mmTop = 216165
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA30_3: TppShape
        UserName = 'rpEscalaHorarioShapeDIA30_3'
        mmHeight = 5556
        mmLeft = 73554
        mmTop = 210873
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA29_3: TppShape
        UserName = 'Shape10'
        mmHeight = 5556
        mmLeft = 73554
        mmTop = 205582
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShape10: TppShape
        UserName = 'rpEscalaHorarioShape10'
        Brush.Style = bsClear
        mmHeight = 166423
        mmLeft = 103717
        mmTop = 39423
        mmWidth = 47625
        BandType = 4
      end
      object rpEscalaHorarioShape9: TppShape
        UserName = 'rpEscalaHorarioShape9'
        Brush.Style = bsClear
        mmHeight = 160867
        mmLeft = 73554
        mmTop = 44979
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA31_2: TppShape
        UserName = 'rpEscalaHorarioShapeDIA31_2'
        mmHeight = 5556
        mmLeft = 11113
        mmTop = 216165
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA30_2: TppShape
        UserName = 'rpEscalaHorarioShapeDIA30_2'
        mmHeight = 5556
        mmLeft = 11113
        mmTop = 210873
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShape11: TppShape
        UserName = 'rpEscalaHorarioShape11'
        mmHeight = 5821
        mmLeft = 151077
        mmTop = 39423
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioShape28: TppShape
        UserName = 'rpEscalaHorarioShape28'
        mmHeight = 19844
        mmLeft = 529
        mmTop = 227807
        mmWidth = 196586
        BandType = 4
      end
      object rpEscalaHorarioShape6: TppShape
        UserName = 'rpEscalaHorarioShape6'
        Brush.Style = bsClear
        mmHeight = 5821
        mmLeft = 529
        mmTop = 39423
        mmWidth = 25929
        BandType = 4
      end
      object rpEscalaHorarioLbl2: TppLabel
        UserName = 'rpEscalaHorarioLbl2'
        AutoSize = False
        Caption = '    REFERÊNCIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 17463
        mmWidth = 52388
        BandType = 4
      end
      object rpEscalaHorarioLbl3: TppLabel
        UserName = 'rpEscalaHorarioLbl3'
        AutoSize = False
        Caption = '          EMISSÃO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 22225
        mmWidth = 52388
        BandType = 4
      end
      object rpEscalaHorarioDBTxt1: TppDBText
        UserName = 'rpEscalaHorarioDBTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 19050
        mmWidth = 85725
        BandType = 4
      end
      object rpEscalaHorarioLblDia01: TppLabel
        UserName = 'rpEscalaHorarioLblDia01'
        AutoSize = False
        Caption = '01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 57944
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia02: TppLabel
        UserName = 'rpEscalaHorarioLblDia02'
        AutoSize = False
        Caption = '02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 63236
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia03: TppLabel
        UserName = 'rpEscalaHorarioLblDia03'
        AutoSize = False
        Caption = '03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 68527
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia04: TppLabel
        UserName = 'rpEscalaHorarioLblDia04'
        AutoSize = False
        Caption = '04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 73819
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia05: TppLabel
        UserName = 'rpEscalaHorarioLblDia05'
        AutoSize = False
        Caption = '05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 79111
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia06: TppLabel
        UserName = 'rpEscalaHorarioLblDia06'
        AutoSize = False
        Caption = '06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 84402
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia07: TppLabel
        UserName = 'rpEscalaHorarioLblDia07'
        AutoSize = False
        Caption = '07'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 89694
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia08: TppLabel
        UserName = 'rpEscalaHorarioLblDia08'
        AutoSize = False
        Caption = '08'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 94986
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia09: TppLabel
        UserName = 'rpEscalaHorarioLblDia09'
        AutoSize = False
        Caption = '09'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 100277
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia10: TppLabel
        UserName = 'rpEscalaHorarioLblDia10'
        AutoSize = False
        Caption = '10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 105569
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia11: TppLabel
        UserName = 'rpEscalaHorarioLblDia11'
        AutoSize = False
        Caption = '11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 110861
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia12: TppLabel
        UserName = 'rpEscalaHorarioLblDia12'
        AutoSize = False
        Caption = '12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 116152
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia13: TppLabel
        UserName = 'rpEscalaHorarioLblDia13'
        AutoSize = False
        Caption = '13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 121444
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia14: TppLabel
        UserName = 'rpEscalaHorarioLblDia14'
        AutoSize = False
        Caption = '14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 126736
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia15: TppLabel
        UserName = 'rpEscalaHorarioLblDia15'
        AutoSize = False
        Caption = '15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 132027
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia16: TppLabel
        UserName = 'rpEscalaHorarioLblDia16'
        AutoSize = False
        Caption = '16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 137319
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia17: TppLabel
        UserName = 'rpEscalaHorarioLblDia17'
        AutoSize = False
        Caption = '17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 142611
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia18: TppLabel
        UserName = 'rpEscalaHorarioLblDia18'
        AutoSize = False
        Caption = '18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 147902
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia19: TppLabel
        UserName = 'rpEscalaHorarioLblDia19'
        AutoSize = False
        Caption = '19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 153194
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia20: TppLabel
        UserName = 'rpEscalaHorarioLblDia20'
        AutoSize = False
        Caption = '20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 158486
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia21: TppLabel
        UserName = 'rpEscalaHorarioLblDia21'
        AutoSize = False
        Caption = '21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 163777
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia22: TppLabel
        UserName = 'rpEscalaHorarioLblDia22'
        AutoSize = False
        Caption = '22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 169069
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia23: TppLabel
        UserName = 'rpEscalaHorarioLblDia23'
        AutoSize = False
        Caption = '23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 174361
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia24: TppLabel
        UserName = 'rpEscalaHorarioLblDia24'
        AutoSize = False
        Caption = '24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 179652
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia25: TppLabel
        UserName = 'rpEscalaHorarioLblDia25'
        AutoSize = False
        Caption = '25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 184944
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia26: TppLabel
        UserName = 'rpEscalaHorarioLblDia26'
        AutoSize = False
        Caption = '26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 190236
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia27: TppLabel
        UserName = 'rpEscalaHorarioLblDia27'
        AutoSize = False
        Caption = '27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 195527
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia28: TppLabel
        UserName = 'rpEscalaHorarioLblDia28'
        AutoSize = False
        Caption = '28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 200819
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia29: TppLabel
        UserName = 'rpEscalaHorarioLblDia29'
        AutoSize = False
        Caption = '29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 206111
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia30: TppLabel
        UserName = 'rpEscalaHorarioLblDia30'
        AutoSize = False
        Caption = '30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 211403
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLblDia31: TppLabel
        UserName = 'rpEscalaHorarioLblDia31'
        AutoSize = False
        Caption = '31'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 1323
        mmTop = 216694
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLbl5: TppLabel
        UserName = 'rpEscalaHorarioLbl5'
        AutoSize = False
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 40217
        mmWidth = 9260
        BandType = 4
      end
      object rpEscalaHorarioLbl6: TppLabel
        UserName = 'rpEscalaHorarioLbl6'
        AutoSize = False
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 11906
        mmTop = 40217
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioShape8: TppShape
        UserName = 'rpEscalaHorarioShape8'
        mmHeight = 5821
        mmLeft = 73554
        mmTop = 39423
        mmWidth = 30427
        BandType = 4
      end
      object rpEscalaHorarioLbl8: TppLabel
        UserName = 'rpEscalaHorarioLbl8'
        AutoSize = False
        Caption = 'Intervalo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74348
        mmTop = 40217
        mmWidth = 28840
        BandType = 4
      end
      object rpEscalaHorarioLbl9: TppLabel
        UserName = 'rpEscalaHorarioLbl9'
        AutoSize = False
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74348
        mmTop = 46038
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioLbl10: TppLabel
        UserName = 'rpEscalaHorarioLbl10'
        AutoSize = False
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 46038
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioLbl11: TppLabel
        UserName = 'rpEscalaHorarioLbl11'
        AutoSize = False
        Caption = 'Folga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 104511
        mmTop = 40746
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioLbl13: TppLabel
        UserName = 'rpEscalaHorarioLbl13'
        AutoSize = False
        Caption = 'Anotações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 40217
        mmWidth = 28840
        BandType = 4
      end
      object rpEscalaHorarioLbl14: TppLabel
        UserName = 'rpEscalaHorarioLbl14'
        AutoSize = False
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 45773
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioLbl15: TppLabel
        UserName = 'rpEscalaHorarioLbl15'
        AutoSize = False
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 182563
        mmTop = 45773
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxt5: TppDBText
        UserName = 'rpEscalaHorarioDBTxt5'
        DataField = 'C_CUSTO'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 34660
        mmWidth = 86254
        BandType = 4
      end
      object rpEscalaHorarioDBTxt3: TppDBText
        UserName = 'rpEscalaHorarioDBTxt3'
        DataField = 'MATRICULA'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 28310
        mmWidth = 22754
        BandType = 4
      end
      object rpEscalaHorarioDBTxt4: TppDBText
        UserName = 'rpEscalaHorarioDBTxt4'
        DataField = 'EMPREGADO'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 28310
        mmWidth = 146844
        BandType = 4
      end
      object rpEscalaHorarioDBTxt6: TppDBText
        UserName = 'rpEscalaHorarioDBTxt6'
        DataField = 'CARGO'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 3175
        mmLeft = 92869
        mmTop = 34660
        mmWidth = 100806
        BandType = 4
      end
      object rpEscalaHorarioLbl7: TppLabel
        UserName = 'rpEscalaHorarioLbl7'
        AutoSize = False
        Caption = 'Folga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 26988
        mmTop = 40746
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioLbl12: TppLabel
        UserName = 'rpEscalaHorarioLbl12'
        AutoSize = False
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 40217
        mmWidth = 14288
        BandType = 4
      end
      object rpEscalaHorarioDBTxt2: TppDBText
        UserName = 'rpEscalaHorarioDBTxt2'
        DataField = 'REFERENCIA'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 17463
        mmWidth = 29633
        BandType = 4
      end
      object rpEscalaHorarioCalc1: TppCalc
        UserName = 'rpEscalaHorarioCalc1'
        CalcType = ctPrintDateTime
        CustomType = dtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 22225
        mmWidth = 22225
        BandType = 4
      end
      object rpEscalaHorarioLbl1: TppLabel
        UserName = 'rpEscalaHorarioLbl1'
        AutoSize = False
        Caption = 'Escala de Horários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 93398
        mmTop = 19844
        mmWidth = 46831
        BandType = 4
      end
      object rpEscalaHorarioDBTxt7: TppDBText
        UserName = 'rpEscalaHorarioDBTxt7'
        DataField = 'DIA01'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 57944
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt9: TppDBText
        UserName = 'rpEscalaHorarioDBTxt9'
        DataField = 'DIA02'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 63236
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt11: TppDBText
        UserName = 'rpEscalaHorarioDBTxt11'
        DataField = 'DIA03'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 68527
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt13: TppDBText
        UserName = 'rpEscalaHorarioDBTxt13'
        DataField = 'DIA04'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 73819
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt15: TppDBText
        UserName = 'rpEscalaHorarioDBTxt15'
        DataField = 'DIA05'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 79111
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt17: TppDBText
        UserName = 'rpEscalaHorarioDBTxt17'
        DataField = 'DIA06'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 84402
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt19: TppDBText
        UserName = 'rpEscalaHorarioDBTxt19'
        DataField = 'DIA07'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 89694
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt21: TppDBText
        UserName = 'rpEscalaHorarioDBTxt21'
        DataField = 'DIA08'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 94986
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt23: TppDBText
        UserName = 'rpEscalaHorarioDBTxt23'
        DataField = 'DIA09'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 100277
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt25: TppDBText
        UserName = 'rpEscalaHorarioDBTxt25'
        DataField = 'DIA10'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 105569
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt27: TppDBText
        UserName = 'rpEscalaHorarioDBTxt27'
        DataField = 'DIA11'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 110861
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt29: TppDBText
        UserName = 'rpEscalaHorarioDBTxt29'
        DataField = 'DIA12'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 116152
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt31: TppDBText
        UserName = 'rpEscalaHorarioDBTxt31'
        DataField = 'DIA13'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 121444
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt33: TppDBText
        UserName = 'rpEscalaHorarioDBTxt33'
        DataField = 'DIA14'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 126736
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt35: TppDBText
        UserName = 'rpEscalaHorarioDBTxt35'
        DataField = 'DIA15'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 132027
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt37: TppDBText
        UserName = 'rpEscalaHorarioDBTxt37'
        DataField = 'DIA16'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 137319
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt39: TppDBText
        UserName = 'rpEscalaHorarioDBTxt39'
        DataField = 'DIA17'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 142611
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt41: TppDBText
        UserName = 'rpEscalaHorarioDBTxt41'
        DataField = 'DIA18'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 147902
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt43: TppDBText
        UserName = 'rpEscalaHorarioDBTxt43'
        DataField = 'DIA19'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 153194
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt45: TppDBText
        UserName = 'rpEscalaHorarioDBTxt45'
        DataField = 'DIA20'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 158486
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt47: TppDBText
        UserName = 'rpEscalaHorarioDBTxt47'
        DataField = 'DIA21'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 163777
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt49: TppDBText
        UserName = 'rpEscalaHorarioDBTxt49'
        DataField = 'DIA22'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 169069
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt51: TppDBText
        UserName = 'rpEscalaHorarioDBTxt51'
        DataField = 'DIA23'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 174361
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt53: TppDBText
        UserName = 'rpEscalaHorarioDBTxt53'
        DataField = 'DIA24'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 179652
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt55: TppDBText
        UserName = 'rpEscalaHorarioDBTxt55'
        DataField = 'DIA25'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 184944
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt57: TppDBText
        UserName = 'rpEscalaHorarioDBTxt57'
        DataField = 'DIA26'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 190236
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt59: TppDBText
        UserName = 'rpEscalaHorarioDBTxt59'
        DataField = 'DIA27'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 195527
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt61: TppDBText
        UserName = 'rpEscalaHorarioDBTxt61'
        DataField = 'DIA28'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 200819
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtDia29a: TppDBText
        UserName = 'rpEscalaHorarioDBTxtDia29a'
        DataField = 'DIA29'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 206111
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtDia30a: TppDBText
        UserName = 'rpEscalaHorarioDBTxtDia30a'
        DataField = 'DIA30'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 211403
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtDia31a: TppDBText
        UserName = 'rpEscalaHorarioDBTxtDia31a'
        DataField = 'DIA31'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 26988
        mmTop = 216694
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt31: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt31'
        DataField = 'INICIOALMOCO_31'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 216694
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt30: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt30'
        DataField = 'INICIOALMOCO_30'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 211403
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt29: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt29'
        DataField = 'INICIOALMOCO_29'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 206111
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt28: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt28'
        DataField = 'INICIOALMOCO_28'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 200819
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt27: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt27'
        DataField = 'INICIOALMOCO_27'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 195527
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt26: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt26'
        DataField = 'INICIOALMOCO_26'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 190236
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt25: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt25'
        DataField = 'INICIOALMOCO_25'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 184944
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt24: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt24'
        DataField = 'INICIOALMOCO_24'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 179652
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt23: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt23'
        DataField = 'INICIOALMOCO_23'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 174361
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt22: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt22'
        DataField = 'INICIOALMOCO_22'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 169069
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt21: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt21'
        DataField = 'INICIOALMOCO_21'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 163777
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt20: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt20'
        DataField = 'INICIOALMOCO_20'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 158486
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt19: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt19'
        DataField = 'INICIOALMOCO_19'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 153194
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt18: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt18'
        DataField = 'INICIOALMOCO_18'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 147902
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt17: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt17'
        DataField = 'INICIOALMOCO_17'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 142611
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt16: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt16'
        DataField = 'INICIOALMOCO_16'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 137319
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt15: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt15'
        DataField = 'INICIOALMOCO_15'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 132027
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt14: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt14'
        DataField = 'INICIOALMOCO_14'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 126736
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt13: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt13'
        DataField = 'INICIOALMOCO_13'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 121444
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt12: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt12'
        DataField = 'INICIOALMOCO_12'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 116152
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt11: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt11'
        DataField = 'INICIOALMOCO_11'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 110861
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt10: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt10'
        DataField = 'INICIOALMOCO_10'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 105569
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt09: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt09'
        DataField = 'INICIOALMOCO_09'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 100277
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt08: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt08'
        DataField = 'INICIOALMOCO_08'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 94986
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt07: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt07'
        DataField = 'INICIOALMOCO_07'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 89694
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt06: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt06'
        DataField = 'INICIOALMOCO_06'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 84402
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt05: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt05'
        DataField = 'INICIOALMOCO_05'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 79111
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt04: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt04'
        DataField = 'INICIOALMOCO_04'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 73819
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt03: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt03'
        DataField = 'INICIOALMOCO_03'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 68527
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt02: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt02'
        DataField = 'INICIOALMOCO_02'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 63236
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtEnt01: TppDBText
        UserName = 'rpEscalaHorarioDBTxtEnt01'
        DataField = 'INICIOALMOCO_01'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 74348
        mmTop = 57944
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai01: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai01'
        DataField = 'FINALALMOCO_01'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 57944
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai02: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai02'
        DataField = 'FINALALMOCO_02'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 63236
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai03: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai03'
        DataField = 'FINALALMOCO_03'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 68527
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai04: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai04'
        DataField = 'FINALALMOCO_04'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 73819
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai05: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai05'
        DataField = 'FINALALMOCO_05'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 79111
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai06: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai06'
        DataField = 'FINALALMOCO_06'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 84402
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai07: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai07'
        DataField = 'FINALALMOCO_07'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 89694
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai08: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai08'
        DataField = 'FINALALMOCO_08'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 94986
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai09: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai09'
        DataField = 'FINALALMOCO_09'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 100277
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai10: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai10'
        DataField = 'FINALALMOCO_10'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 105569
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai11: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai11'
        DataField = 'FINALALMOCO_11'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 110861
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai12: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai12'
        DataField = 'FINALALMOCO_12'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 116152
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai13: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai13'
        DataField = 'FINALALMOCO_13'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 121444
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai14: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai14'
        DataField = 'FINALALMOCO_14'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 126736
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai16: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai16'
        DataField = 'FINALALMOCO_16'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 137319
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai17: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai17'
        DataField = 'FINALALMOCO_17'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 142611
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai18: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai18'
        DataField = 'FINALALMOCO_18'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 147902
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai19: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai19'
        DataField = 'FINALALMOCO_19'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 153194
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai20: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai20'
        DataField = 'FINALALMOCO_20'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 158486
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai21: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai21'
        DataField = 'FINALALMOCO_21'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 163777
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai22: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai22'
        DataField = 'FINALALMOCO_22'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 169069
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai23: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai23'
        DataField = 'FINALALMOCO_23'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 174361
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai24: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai24'
        DataField = 'FINALALMOCO_24'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 179652
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai25: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai25'
        DataField = 'FINALALMOCO_25'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 184944
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai26: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai26'
        DataField = 'FINALALMOCO_26'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 190236
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai27: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai27'
        DataField = 'FINALALMOCO_27'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 195527
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai28: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai28'
        DataField = 'FINALALMOCO_28'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 200819
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai29: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai29'
        DataField = 'FINALALMOCO_29'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 206111
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai30: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai30'
        DataField = 'FINALALMOCO_30'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 211403
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai31: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai31'
        DataField = 'FINALALMOCO_31'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 216694
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioDBTxtSai15: TppDBText
        UserName = 'rpEscalaHorarioDBTxtSai15'
        DataField = 'FINALALMOCO_15'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 89429
        mmTop = 132027
        mmWidth = 13758
        BandType = 4
      end
      object rpEscalaHorarioLbl4: TppLabel
        UserName = 'rpEscalaHorarioLbl4'
        AutoSize = False
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 28046
        mmWidth = 14552
        BandType = 4
      end
      object rpEscalaHorarioLine1: TppLine
        UserName = 'rpEscalaHorarioLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5556
        mmLeft = 166688
        mmTop = 39688
        mmWidth = 1058
        BandType = 4
      end
      object rpEscalaHorarioLine2: TppLine
        UserName = 'rpEscalaHorarioLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 114829
        mmTop = 237596
        mmWidth = 72761
        BandType = 4
      end
      object rpEscalaHorarioLbl17: TppLabel
        UserName = 'rpEscalaHorarioLbl17'
        AutoSize = False
        Caption = 'Assinatura do Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 114829
        mmTop = 241565
        mmWidth = 72761
        BandType = 4
      end
      object rpEscalaHorarioDBTxt8: TppDBText
        UserName = 'rpEscalaHorarioDBTxt8'
        DataField = 'DIA01'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 57944
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt10: TppDBText
        UserName = 'rpEscalaHorarioDBTxt10'
        DataField = 'DIA02'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 63236
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt12: TppDBText
        UserName = 'rpEscalaHorarioDBTxt12'
        DataField = 'DIA03'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 68527
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt14: TppDBText
        UserName = 'rpEscalaHorarioDBTxt14'
        DataField = 'DIA04'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 73819
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt16: TppDBText
        UserName = 'rpEscalaHorarioDBTxt16'
        DataField = 'DIA05'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 79111
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt18: TppDBText
        UserName = 'rpEscalaHorarioDBTxt18'
        DataField = 'DIA06'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 84402
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt20: TppDBText
        UserName = 'rpEscalaHorarioDBTxt20'
        DataField = 'DIA07'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 89694
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt22: TppDBText
        UserName = 'rpEscalaHorarioDBTxt22'
        DataField = 'DIA08'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 94986
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt24: TppDBText
        UserName = 'rpEscalaHorarioDBTxt24'
        DataField = 'DIA09'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 100277
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt26: TppDBText
        UserName = 'rpEscalaHorarioDBTxt26'
        DataField = 'DIA10'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 105569
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt28: TppDBText
        UserName = 'rpEscalaHorarioDBTxt28'
        DataField = 'DIA11'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 110861
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt30: TppDBText
        UserName = 'rpEscalaHorarioDBTxt30'
        DataField = 'DIA12'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 116152
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt32: TppDBText
        UserName = 'rpEscalaHorarioDBTxt32'
        DataField = 'DIA13'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 121444
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt34: TppDBText
        UserName = 'rpEscalaHorarioDBTxt34'
        DataField = 'DIA14'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 126736
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt36: TppDBText
        UserName = 'rpEscalaHorarioDBTxt36'
        DataField = 'DIA15'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 132027
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt38: TppDBText
        UserName = 'rpEscalaHorarioDBTxt38'
        DataField = 'DIA16'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 137319
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt40: TppDBText
        UserName = 'rpEscalaHorarioDBTxt40'
        DataField = 'DIA17'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 142611
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt42: TppDBText
        UserName = 'rpEscalaHorarioDBTxt42'
        DataField = 'DIA18'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 147902
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt44: TppDBText
        UserName = 'rpEscalaHorarioDBTxt44'
        DataField = 'DIA19'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 153194
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt46: TppDBText
        UserName = 'rpEscalaHorarioDBTxt46'
        DataField = 'DIA20'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 158486
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt48: TppDBText
        UserName = 'rpEscalaHorarioDBTxt48'
        DataField = 'DIA21'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 163777
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt50: TppDBText
        UserName = 'rpEscalaHorarioDBTxt50'
        DataField = 'DIA22'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 169069
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt52: TppDBText
        UserName = 'rpEscalaHorarioDBTxt52'
        DataField = 'DIA23'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 174361
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt54: TppDBText
        UserName = 'rpEscalaHorarioDBTxt54'
        DataField = 'DIA24'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 179652
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt56: TppDBText
        UserName = 'rpEscalaHorarioDBTxt56'
        DataField = 'DIA25'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 184944
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt58: TppDBText
        UserName = 'rpEscalaHorarioDBTxt58'
        DataField = 'DIA26'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 190236
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt60: TppDBText
        UserName = 'rpEscalaHorarioDBTxt60'
        DataField = 'DIA27'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 195527
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxt62: TppDBText
        UserName = 'rpEscalaHorarioDBTxt62'
        DataField = 'DIA28'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 200819
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtDia29b: TppDBText
        UserName = 'rpEscalaHorarioDBTxtDia29b'
        DataField = 'DIA29'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 206111
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtDia30b: TppDBText
        UserName = 'rpEscalaHorarioDBTxtDia30b'
        DataField = 'DIA30'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 211403
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioDBTxtDia31b: TppDBText
        UserName = 'rpEscalaHorarioDBTxtDia31b'
        DataField = 'DIA31'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 104511
        mmTop = 216694
        mmWidth = 46038
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA29_5: TppShape
        UserName = 'rpEscalaHorarioShapeDIA29_5'
        mmHeight = 5556
        mmLeft = 166688
        mmTop = 205582
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA30_5: TppShape
        UserName = 'rpEscalaHorarioShapeDIA30_5'
        mmHeight = 5556
        mmLeft = 166688
        mmTop = 210873
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioShapeDIA31_5: TppShape
        UserName = 'rpEscalaHorarioShapeDIA31_5'
        mmHeight = 5556
        mmLeft = 166688
        mmTop = 216165
        mmWidth = 15346
        BandType = 4
      end
      object rpEscalaHorarioLbl16: TppLabel
        UserName = 'rpEscalaHorarioLbl16'
        AutoSize = False
        Caption = 'Data  ___/___/____'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 8467
        mmTop = 236538
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ENTRADA_01'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 57944
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SAIDA_01'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 57944
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ENTRADA_02'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 63236
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'ENTRADA_03'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 68527
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'ENTRADA_04'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 73819
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ENTRADA_05'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 79111
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'ENTRADA_06'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 84402
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ENTRADA_07'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 89694
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'ENTRADA_08'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 94986
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ENTRADA_09'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 100277
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'ENTRADA_10'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 105569
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'ENTRADA_11'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 110861
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'ENTRADA_12'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 116152
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'ENTRADA_13'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 121444
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'ENTRADA_14'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 126736
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'ENTRADA_15'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 132027
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ENTRADA_16'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 137319
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'ENTRADA_17'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 142611
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'ENTRADA_18'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 147902
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'ENTRADA_19'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 153194
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'ENTRADA_20'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 158486
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'ENTRADA_21'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 163777
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'ENTRADA_22'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 169069
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'ENTRADA_23'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 174361
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'ENTRADA_24'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 179652
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'ENTRADA_25'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 184944
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'ENTRADA_26'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 190236
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'ENTRADA_27'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 195527
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'ENTRADA_28'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 200819
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'ENTRADA_29'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 206111
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'ENTRADA_30'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 211403
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'ENTRADA_31'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 11906
        mmTop = 216694
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'SAIDA_02'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 63236
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'SAIDA_03'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 68527
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'SAIDA_04'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 73819
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'SAIDA_05'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 79111
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'SAIDA_06'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 84402
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'SAIDA_07'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 89694
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'SAIDA_08'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 94986
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'SAIDA_09'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 100277
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'SAIDA_10'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 105569
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'SAIDA_11'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 110861
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'SAIDA_12'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 116152
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'SAIDA_13'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 121444
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        DataField = 'SAIDA_14'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 126736
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = 'SAIDA_15'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 132027
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'SAIDA_16'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 137319
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = 'SAIDA_17'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 142611
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'SAIDA_18'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 147902
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = 'SAIDA_19'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 153194
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'SAIDA_20'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 158486
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'SAIDA_21'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 163777
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        DataField = 'SAIDA_22'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 169069
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'SAIDA_23'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 174361
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        DataField = 'SAIDA_24'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 179652
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText401'
        DataField = 'SAIDA_25'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 184944
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        DataField = 'SAIDA_26'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 190236
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        DataField = 'SAIDA_27'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 195527
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        DataField = 'SAIDA_28'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 200819
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'SAIDA_29'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 206111
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'SAIDA_30'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 211403
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'SAIDA_31'
        DataPipeline = ppEscalaHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEscalaHorario'
        mmHeight = 4498
        mmLeft = 152136
        mmTop = 216694
        mmWidth = 13758
        BandType = 4
      end
    end
  end
  object ppEscalaHorario: TppDBPipeline
    DataSource = dsEscalaHorario
    CloseDataSource = True
    OpenDataSource = False
    AutoCreateFields = False
    SkipWhenNoRecords = False
    UserName = 'EscalaHorario'
    Left = 215
    Top = 48
    object ppEscalaHorarioppField1: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 70
      DisplayWidth = 70
      Position = 0
    end
    object ppEscalaHorarioppField2: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppEscalaHorarioppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppEscalaHorarioppField4: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppEscalaHorarioppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppEscalaHorarioppField6: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppEscalaHorarioppField7: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppEscalaHorarioppField8: TppField
      FieldAlias = 'CTPS'
      FieldName = 'CTPS'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppEscalaHorarioppField9: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 8
    end
    object ppEscalaHorarioppField10: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppEscalaHorarioppField11: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppEscalaHorarioppField12: TppField
      FieldAlias = 'NOMEHORARIO'
      FieldName = 'NOMEHORARIO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 11
    end
    object ppEscalaHorarioppField13: TppField
      FieldAlias = 'INICIOALMOCO_01'
      FieldName = 'INICIOALMOCO_01'
      FieldLength = 5
      DisplayWidth = 5
      Position = 12
    end
    object ppEscalaHorarioppField14: TppField
      FieldAlias = 'INICIOALMOCO_02'
      FieldName = 'INICIOALMOCO_02'
      FieldLength = 5
      DisplayWidth = 5
      Position = 13
    end
    object ppEscalaHorarioppField15: TppField
      FieldAlias = 'INICIOALMOCO_03'
      FieldName = 'INICIOALMOCO_03'
      FieldLength = 5
      DisplayWidth = 5
      Position = 14
    end
    object ppEscalaHorarioppField16: TppField
      FieldAlias = 'INICIOALMOCO_04'
      FieldName = 'INICIOALMOCO_04'
      FieldLength = 5
      DisplayWidth = 5
      Position = 15
    end
    object ppEscalaHorarioppField17: TppField
      FieldAlias = 'INICIOALMOCO_05'
      FieldName = 'INICIOALMOCO_05'
      FieldLength = 5
      DisplayWidth = 5
      Position = 16
    end
    object ppEscalaHorarioppField18: TppField
      FieldAlias = 'INICIOALMOCO_06'
      FieldName = 'INICIOALMOCO_06'
      FieldLength = 5
      DisplayWidth = 5
      Position = 17
    end
    object ppEscalaHorarioppField19: TppField
      FieldAlias = 'INICIOALMOCO_07'
      FieldName = 'INICIOALMOCO_07'
      FieldLength = 5
      DisplayWidth = 5
      Position = 18
    end
    object ppEscalaHorarioppField20: TppField
      FieldAlias = 'INICIOALMOCO_08'
      FieldName = 'INICIOALMOCO_08'
      FieldLength = 5
      DisplayWidth = 5
      Position = 19
    end
    object ppEscalaHorarioppField21: TppField
      FieldAlias = 'INICIOALMOCO_09'
      FieldName = 'INICIOALMOCO_09'
      FieldLength = 5
      DisplayWidth = 5
      Position = 20
    end
    object ppEscalaHorarioppField22: TppField
      FieldAlias = 'INICIOALMOCO_10'
      FieldName = 'INICIOALMOCO_10'
      FieldLength = 5
      DisplayWidth = 5
      Position = 21
    end
    object ppEscalaHorarioppField23: TppField
      FieldAlias = 'INICIOALMOCO_11'
      FieldName = 'INICIOALMOCO_11'
      FieldLength = 5
      DisplayWidth = 5
      Position = 22
    end
    object ppEscalaHorarioppField24: TppField
      FieldAlias = 'INICIOALMOCO_12'
      FieldName = 'INICIOALMOCO_12'
      FieldLength = 5
      DisplayWidth = 5
      Position = 23
    end
    object ppEscalaHorarioppField25: TppField
      FieldAlias = 'INICIOALMOCO_13'
      FieldName = 'INICIOALMOCO_13'
      FieldLength = 5
      DisplayWidth = 5
      Position = 24
    end
    object ppEscalaHorarioppField26: TppField
      FieldAlias = 'INICIOALMOCO_14'
      FieldName = 'INICIOALMOCO_14'
      FieldLength = 5
      DisplayWidth = 5
      Position = 25
    end
    object ppEscalaHorarioppField27: TppField
      FieldAlias = 'INICIOALMOCO_15'
      FieldName = 'INICIOALMOCO_15'
      FieldLength = 5
      DisplayWidth = 5
      Position = 26
    end
    object ppEscalaHorarioppField28: TppField
      FieldAlias = 'INICIOALMOCO_16'
      FieldName = 'INICIOALMOCO_16'
      FieldLength = 5
      DisplayWidth = 5
      Position = 27
    end
    object ppEscalaHorarioppField29: TppField
      FieldAlias = 'INICIOALMOCO_17'
      FieldName = 'INICIOALMOCO_17'
      FieldLength = 5
      DisplayWidth = 5
      Position = 28
    end
    object ppEscalaHorarioppField30: TppField
      FieldAlias = 'INICIOALMOCO_18'
      FieldName = 'INICIOALMOCO_18'
      FieldLength = 5
      DisplayWidth = 5
      Position = 29
    end
    object ppEscalaHorarioppField31: TppField
      FieldAlias = 'INICIOALMOCO_19'
      FieldName = 'INICIOALMOCO_19'
      FieldLength = 5
      DisplayWidth = 5
      Position = 30
    end
    object ppEscalaHorarioppField32: TppField
      FieldAlias = 'INICIOALMOCO_20'
      FieldName = 'INICIOALMOCO_20'
      FieldLength = 5
      DisplayWidth = 5
      Position = 31
    end
    object ppEscalaHorarioppField33: TppField
      FieldAlias = 'INICIOALMOCO_21'
      FieldName = 'INICIOALMOCO_21'
      FieldLength = 5
      DisplayWidth = 5
      Position = 32
    end
    object ppEscalaHorarioppField34: TppField
      FieldAlias = 'INICIOALMOCO_22'
      FieldName = 'INICIOALMOCO_22'
      FieldLength = 5
      DisplayWidth = 5
      Position = 33
    end
    object ppEscalaHorarioppField35: TppField
      FieldAlias = 'INICIOALMOCO_23'
      FieldName = 'INICIOALMOCO_23'
      FieldLength = 5
      DisplayWidth = 5
      Position = 34
    end
    object ppEscalaHorarioppField36: TppField
      FieldAlias = 'INICIOALMOCO_24'
      FieldName = 'INICIOALMOCO_24'
      FieldLength = 5
      DisplayWidth = 5
      Position = 35
    end
    object ppEscalaHorarioppField37: TppField
      FieldAlias = 'INICIOALMOCO_25'
      FieldName = 'INICIOALMOCO_25'
      FieldLength = 5
      DisplayWidth = 5
      Position = 36
    end
    object ppEscalaHorarioppField38: TppField
      FieldAlias = 'INICIOALMOCO_26'
      FieldName = 'INICIOALMOCO_26'
      FieldLength = 5
      DisplayWidth = 5
      Position = 37
    end
    object ppEscalaHorarioppField39: TppField
      FieldAlias = 'INICIOALMOCO_27'
      FieldName = 'INICIOALMOCO_27'
      FieldLength = 5
      DisplayWidth = 5
      Position = 38
    end
    object ppEscalaHorarioppField40: TppField
      FieldAlias = 'INICIOALMOCO_28'
      FieldName = 'INICIOALMOCO_28'
      FieldLength = 5
      DisplayWidth = 5
      Position = 39
    end
    object ppEscalaHorarioppField41: TppField
      FieldAlias = 'INICIOALMOCO_29'
      FieldName = 'INICIOALMOCO_29'
      FieldLength = 5
      DisplayWidth = 5
      Position = 40
    end
    object ppEscalaHorarioppField42: TppField
      FieldAlias = 'INICIOALMOCO_30'
      FieldName = 'INICIOALMOCO_30'
      FieldLength = 5
      DisplayWidth = 5
      Position = 41
    end
    object ppEscalaHorarioppField43: TppField
      FieldAlias = 'INICIOALMOCO_31'
      FieldName = 'INICIOALMOCO_31'
      FieldLength = 5
      DisplayWidth = 5
      Position = 42
    end
    object ppEscalaHorarioppField44: TppField
      FieldAlias = 'FINALALMOCO_01'
      FieldName = 'FINALALMOCO_01'
      FieldLength = 5
      DisplayWidth = 5
      Position = 43
    end
    object ppEscalaHorarioppField45: TppField
      FieldAlias = 'FINALALMOCO_02'
      FieldName = 'FINALALMOCO_02'
      FieldLength = 5
      DisplayWidth = 5
      Position = 44
    end
    object ppEscalaHorarioppField46: TppField
      FieldAlias = 'FINALALMOCO_03'
      FieldName = 'FINALALMOCO_03'
      FieldLength = 5
      DisplayWidth = 5
      Position = 45
    end
    object ppEscalaHorarioppField47: TppField
      FieldAlias = 'FINALALMOCO_04'
      FieldName = 'FINALALMOCO_04'
      FieldLength = 5
      DisplayWidth = 5
      Position = 46
    end
    object ppEscalaHorarioppField48: TppField
      FieldAlias = 'FINALALMOCO_05'
      FieldName = 'FINALALMOCO_05'
      FieldLength = 5
      DisplayWidth = 5
      Position = 47
    end
    object ppEscalaHorarioppField49: TppField
      FieldAlias = 'FINALALMOCO_06'
      FieldName = 'FINALALMOCO_06'
      FieldLength = 5
      DisplayWidth = 5
      Position = 48
    end
    object ppEscalaHorarioppField50: TppField
      FieldAlias = 'FINALALMOCO_07'
      FieldName = 'FINALALMOCO_07'
      FieldLength = 5
      DisplayWidth = 5
      Position = 49
    end
    object ppEscalaHorarioppField51: TppField
      FieldAlias = 'FINALALMOCO_08'
      FieldName = 'FINALALMOCO_08'
      FieldLength = 5
      DisplayWidth = 5
      Position = 50
    end
    object ppEscalaHorarioppField52: TppField
      FieldAlias = 'FINALALMOCO_09'
      FieldName = 'FINALALMOCO_09'
      FieldLength = 5
      DisplayWidth = 5
      Position = 51
    end
    object ppEscalaHorarioppField53: TppField
      FieldAlias = 'FINALALMOCO_10'
      FieldName = 'FINALALMOCO_10'
      FieldLength = 5
      DisplayWidth = 5
      Position = 52
    end
    object ppEscalaHorarioppField54: TppField
      FieldAlias = 'FINALALMOCO_11'
      FieldName = 'FINALALMOCO_11'
      FieldLength = 5
      DisplayWidth = 5
      Position = 53
    end
    object ppEscalaHorarioppField55: TppField
      FieldAlias = 'FINALALMOCO_12'
      FieldName = 'FINALALMOCO_12'
      FieldLength = 5
      DisplayWidth = 5
      Position = 54
    end
    object ppEscalaHorarioppField56: TppField
      FieldAlias = 'FINALALMOCO_13'
      FieldName = 'FINALALMOCO_13'
      FieldLength = 5
      DisplayWidth = 5
      Position = 55
    end
    object ppEscalaHorarioppField57: TppField
      FieldAlias = 'FINALALMOCO_14'
      FieldName = 'FINALALMOCO_14'
      FieldLength = 5
      DisplayWidth = 5
      Position = 56
    end
    object ppEscalaHorarioppField58: TppField
      FieldAlias = 'FINALALMOCO_15'
      FieldName = 'FINALALMOCO_15'
      FieldLength = 5
      DisplayWidth = 5
      Position = 57
    end
    object ppEscalaHorarioppField59: TppField
      FieldAlias = 'FINALALMOCO_16'
      FieldName = 'FINALALMOCO_16'
      FieldLength = 5
      DisplayWidth = 5
      Position = 58
    end
    object ppEscalaHorarioppField60: TppField
      FieldAlias = 'FINALALMOCO_17'
      FieldName = 'FINALALMOCO_17'
      FieldLength = 5
      DisplayWidth = 5
      Position = 59
    end
    object ppEscalaHorarioppField61: TppField
      FieldAlias = 'FINALALMOCO_18'
      FieldName = 'FINALALMOCO_18'
      FieldLength = 5
      DisplayWidth = 5
      Position = 60
    end
    object ppEscalaHorarioppField62: TppField
      FieldAlias = 'FINALALMOCO_19'
      FieldName = 'FINALALMOCO_19'
      FieldLength = 5
      DisplayWidth = 5
      Position = 61
    end
    object ppEscalaHorarioppField63: TppField
      FieldAlias = 'FINALALMOCO_20'
      FieldName = 'FINALALMOCO_20'
      FieldLength = 5
      DisplayWidth = 5
      Position = 62
    end
    object ppEscalaHorarioppField64: TppField
      FieldAlias = 'FINALALMOCO_21'
      FieldName = 'FINALALMOCO_21'
      FieldLength = 5
      DisplayWidth = 5
      Position = 63
    end
    object ppEscalaHorarioppField65: TppField
      FieldAlias = 'FINALALMOCO_22'
      FieldName = 'FINALALMOCO_22'
      FieldLength = 5
      DisplayWidth = 5
      Position = 64
    end
    object ppEscalaHorarioppField66: TppField
      FieldAlias = 'FINALALMOCO_23'
      FieldName = 'FINALALMOCO_23'
      FieldLength = 5
      DisplayWidth = 5
      Position = 65
    end
    object ppEscalaHorarioppField67: TppField
      FieldAlias = 'FINALALMOCO_24'
      FieldName = 'FINALALMOCO_24'
      FieldLength = 5
      DisplayWidth = 5
      Position = 66
    end
    object ppEscalaHorarioppField68: TppField
      FieldAlias = 'FINALALMOCO_25'
      FieldName = 'FINALALMOCO_25'
      FieldLength = 5
      DisplayWidth = 5
      Position = 67
    end
    object ppEscalaHorarioppField69: TppField
      FieldAlias = 'FINALALMOCO_26'
      FieldName = 'FINALALMOCO_26'
      FieldLength = 5
      DisplayWidth = 5
      Position = 68
    end
    object ppEscalaHorarioppField70: TppField
      FieldAlias = 'FINALALMOCO_27'
      FieldName = 'FINALALMOCO_27'
      FieldLength = 5
      DisplayWidth = 5
      Position = 69
    end
    object ppEscalaHorarioppField71: TppField
      FieldAlias = 'FINALALMOCO_28'
      FieldName = 'FINALALMOCO_28'
      FieldLength = 5
      DisplayWidth = 5
      Position = 70
    end
    object ppEscalaHorarioppField72: TppField
      FieldAlias = 'FINALALMOCO_29'
      FieldName = 'FINALALMOCO_29'
      FieldLength = 5
      DisplayWidth = 5
      Position = 71
    end
    object ppEscalaHorarioppField73: TppField
      FieldAlias = 'FINALALMOCO_30'
      FieldName = 'FINALALMOCO_30'
      FieldLength = 5
      DisplayWidth = 5
      Position = 72
    end
    object ppEscalaHorarioppField74: TppField
      FieldAlias = 'FINALALMOCO_31'
      FieldName = 'FINALALMOCO_31'
      FieldLength = 5
      DisplayWidth = 5
      Position = 73
    end
    object ppEscalaHorarioppField75: TppField
      FieldAlias = 'ENTRADA_01'
      FieldName = 'ENTRADA_01'
      FieldLength = 5
      DisplayWidth = 5
      Position = 74
    end
    object ppEscalaHorarioppField76: TppField
      FieldAlias = 'ENTRADA_02'
      FieldName = 'ENTRADA_02'
      FieldLength = 5
      DisplayWidth = 5
      Position = 75
    end
    object ppEscalaHorarioppField77: TppField
      FieldAlias = 'ENTRADA_03'
      FieldName = 'ENTRADA_03'
      FieldLength = 5
      DisplayWidth = 5
      Position = 76
    end
    object ppEscalaHorarioppField78: TppField
      FieldAlias = 'ENTRADA_04'
      FieldName = 'ENTRADA_04'
      FieldLength = 5
      DisplayWidth = 5
      Position = 77
    end
    object ppEscalaHorarioppField79: TppField
      FieldAlias = 'ENTRADA_05'
      FieldName = 'ENTRADA_05'
      FieldLength = 5
      DisplayWidth = 5
      Position = 78
    end
    object ppEscalaHorarioppField80: TppField
      FieldAlias = 'ENTRADA_06'
      FieldName = 'ENTRADA_06'
      FieldLength = 5
      DisplayWidth = 5
      Position = 79
    end
    object ppEscalaHorarioppField81: TppField
      FieldAlias = 'ENTRADA_07'
      FieldName = 'ENTRADA_07'
      FieldLength = 5
      DisplayWidth = 5
      Position = 80
    end
    object ppEscalaHorarioppField82: TppField
      FieldAlias = 'ENTRADA_08'
      FieldName = 'ENTRADA_08'
      FieldLength = 5
      DisplayWidth = 5
      Position = 81
    end
    object ppEscalaHorarioppField83: TppField
      FieldAlias = 'ENTRADA_09'
      FieldName = 'ENTRADA_09'
      FieldLength = 5
      DisplayWidth = 5
      Position = 82
    end
    object ppEscalaHorarioppField84: TppField
      FieldAlias = 'ENTRADA_10'
      FieldName = 'ENTRADA_10'
      FieldLength = 5
      DisplayWidth = 5
      Position = 83
    end
    object ppEscalaHorarioppField85: TppField
      FieldAlias = 'ENTRADA_11'
      FieldName = 'ENTRADA_11'
      FieldLength = 5
      DisplayWidth = 5
      Position = 84
    end
    object ppEscalaHorarioppField86: TppField
      FieldAlias = 'ENTRADA_12'
      FieldName = 'ENTRADA_12'
      FieldLength = 5
      DisplayWidth = 5
      Position = 85
    end
    object ppEscalaHorarioppField87: TppField
      FieldAlias = 'ENTRADA_13'
      FieldName = 'ENTRADA_13'
      FieldLength = 5
      DisplayWidth = 5
      Position = 86
    end
    object ppEscalaHorarioppField88: TppField
      FieldAlias = 'ENTRADA_14'
      FieldName = 'ENTRADA_14'
      FieldLength = 5
      DisplayWidth = 5
      Position = 87
    end
    object ppEscalaHorarioppField89: TppField
      FieldAlias = 'ENTRADA_15'
      FieldName = 'ENTRADA_15'
      FieldLength = 5
      DisplayWidth = 5
      Position = 88
    end
    object ppEscalaHorarioppField90: TppField
      FieldAlias = 'ENTRADA_16'
      FieldName = 'ENTRADA_16'
      FieldLength = 5
      DisplayWidth = 5
      Position = 89
    end
    object ppEscalaHorarioppField91: TppField
      FieldAlias = 'ENTRADA_17'
      FieldName = 'ENTRADA_17'
      FieldLength = 5
      DisplayWidth = 5
      Position = 90
    end
    object ppEscalaHorarioppField92: TppField
      FieldAlias = 'ENTRADA_18'
      FieldName = 'ENTRADA_18'
      FieldLength = 5
      DisplayWidth = 5
      Position = 91
    end
    object ppEscalaHorarioppField93: TppField
      FieldAlias = 'ENTRADA_19'
      FieldName = 'ENTRADA_19'
      FieldLength = 5
      DisplayWidth = 5
      Position = 92
    end
    object ppEscalaHorarioppField94: TppField
      FieldAlias = 'ENTRADA_20'
      FieldName = 'ENTRADA_20'
      FieldLength = 5
      DisplayWidth = 5
      Position = 93
    end
    object ppEscalaHorarioppField95: TppField
      FieldAlias = 'ENTRADA_21'
      FieldName = 'ENTRADA_21'
      FieldLength = 5
      DisplayWidth = 5
      Position = 94
    end
    object ppEscalaHorarioppField96: TppField
      FieldAlias = 'ENTRADA_22'
      FieldName = 'ENTRADA_22'
      FieldLength = 5
      DisplayWidth = 5
      Position = 95
    end
    object ppEscalaHorarioppField97: TppField
      FieldAlias = 'ENTRADA_23'
      FieldName = 'ENTRADA_23'
      FieldLength = 5
      DisplayWidth = 5
      Position = 96
    end
    object ppEscalaHorarioppField98: TppField
      FieldAlias = 'ENTRADA_24'
      FieldName = 'ENTRADA_24'
      FieldLength = 5
      DisplayWidth = 5
      Position = 97
    end
    object ppEscalaHorarioppField99: TppField
      FieldAlias = 'ENTRADA_25'
      FieldName = 'ENTRADA_25'
      FieldLength = 5
      DisplayWidth = 5
      Position = 98
    end
    object ppEscalaHorarioppField100: TppField
      FieldAlias = 'ENTRADA_26'
      FieldName = 'ENTRADA_26'
      FieldLength = 5
      DisplayWidth = 5
      Position = 99
    end
    object ppEscalaHorarioppField101: TppField
      FieldAlias = 'ENTRADA_27'
      FieldName = 'ENTRADA_27'
      FieldLength = 5
      DisplayWidth = 5
      Position = 100
    end
    object ppEscalaHorarioppField102: TppField
      FieldAlias = 'ENTRADA_28'
      FieldName = 'ENTRADA_28'
      FieldLength = 5
      DisplayWidth = 5
      Position = 101
    end
    object ppEscalaHorarioppField103: TppField
      FieldAlias = 'ENTRADA_29'
      FieldName = 'ENTRADA_29'
      FieldLength = 5
      DisplayWidth = 5
      Position = 102
    end
    object ppEscalaHorarioppField104: TppField
      FieldAlias = 'ENTRADA_30'
      FieldName = 'ENTRADA_30'
      FieldLength = 5
      DisplayWidth = 5
      Position = 103
    end
    object ppEscalaHorarioppField105: TppField
      FieldAlias = 'ENTRADA_31'
      FieldName = 'ENTRADA_31'
      FieldLength = 5
      DisplayWidth = 5
      Position = 104
    end
    object ppEscalaHorarioppField106: TppField
      FieldAlias = 'SAIDA_01'
      FieldName = 'SAIDA_01'
      FieldLength = 5
      DisplayWidth = 5
      Position = 105
    end
    object ppEscalaHorarioppField107: TppField
      FieldAlias = 'SAIDA_02'
      FieldName = 'SAIDA_02'
      FieldLength = 5
      DisplayWidth = 5
      Position = 106
    end
    object ppEscalaHorarioppField108: TppField
      FieldAlias = 'SAIDA_03'
      FieldName = 'SAIDA_03'
      FieldLength = 5
      DisplayWidth = 5
      Position = 107
    end
    object ppEscalaHorarioppField109: TppField
      FieldAlias = 'SAIDA_04'
      FieldName = 'SAIDA_04'
      FieldLength = 5
      DisplayWidth = 5
      Position = 108
    end
    object ppEscalaHorarioppField110: TppField
      FieldAlias = 'SAIDA_05'
      FieldName = 'SAIDA_05'
      FieldLength = 5
      DisplayWidth = 5
      Position = 109
    end
    object ppEscalaHorarioppField111: TppField
      FieldAlias = 'SAIDA_06'
      FieldName = 'SAIDA_06'
      FieldLength = 5
      DisplayWidth = 5
      Position = 110
    end
    object ppEscalaHorarioppField112: TppField
      FieldAlias = 'SAIDA_07'
      FieldName = 'SAIDA_07'
      FieldLength = 5
      DisplayWidth = 5
      Position = 111
    end
    object ppEscalaHorarioppField113: TppField
      FieldAlias = 'SAIDA_08'
      FieldName = 'SAIDA_08'
      FieldLength = 5
      DisplayWidth = 5
      Position = 112
    end
    object ppEscalaHorarioppField114: TppField
      FieldAlias = 'SAIDA_09'
      FieldName = 'SAIDA_09'
      FieldLength = 5
      DisplayWidth = 5
      Position = 113
    end
    object ppEscalaHorarioppField115: TppField
      FieldAlias = 'SAIDA_10'
      FieldName = 'SAIDA_10'
      FieldLength = 5
      DisplayWidth = 5
      Position = 114
    end
    object ppEscalaHorarioppField116: TppField
      FieldAlias = 'SAIDA_11'
      FieldName = 'SAIDA_11'
      FieldLength = 5
      DisplayWidth = 5
      Position = 115
    end
    object ppEscalaHorarioppField117: TppField
      FieldAlias = 'SAIDA_12'
      FieldName = 'SAIDA_12'
      FieldLength = 5
      DisplayWidth = 5
      Position = 116
    end
    object ppEscalaHorarioppField118: TppField
      FieldAlias = 'SAIDA_13'
      FieldName = 'SAIDA_13'
      FieldLength = 5
      DisplayWidth = 5
      Position = 117
    end
    object ppEscalaHorarioppField119: TppField
      FieldAlias = 'SAIDA_14'
      FieldName = 'SAIDA_14'
      FieldLength = 5
      DisplayWidth = 5
      Position = 118
    end
    object ppEscalaHorarioppField120: TppField
      FieldAlias = 'SAIDA_15'
      FieldName = 'SAIDA_15'
      FieldLength = 5
      DisplayWidth = 5
      Position = 119
    end
    object ppEscalaHorarioppField121: TppField
      FieldAlias = 'SAIDA_16'
      FieldName = 'SAIDA_16'
      FieldLength = 5
      DisplayWidth = 5
      Position = 120
    end
    object ppEscalaHorarioppField122: TppField
      FieldAlias = 'SAIDA_17'
      FieldName = 'SAIDA_17'
      FieldLength = 5
      DisplayWidth = 5
      Position = 121
    end
    object ppEscalaHorarioppField123: TppField
      FieldAlias = 'SAIDA_18'
      FieldName = 'SAIDA_18'
      FieldLength = 5
      DisplayWidth = 5
      Position = 122
    end
    object ppEscalaHorarioppField124: TppField
      FieldAlias = 'SAIDA_19'
      FieldName = 'SAIDA_19'
      FieldLength = 5
      DisplayWidth = 5
      Position = 123
    end
    object ppEscalaHorarioppField125: TppField
      FieldAlias = 'SAIDA_20'
      FieldName = 'SAIDA_20'
      FieldLength = 5
      DisplayWidth = 5
      Position = 124
    end
    object ppEscalaHorarioppField126: TppField
      FieldAlias = 'SAIDA_21'
      FieldName = 'SAIDA_21'
      FieldLength = 5
      DisplayWidth = 5
      Position = 125
    end
    object ppEscalaHorarioppField127: TppField
      FieldAlias = 'SAIDA_22'
      FieldName = 'SAIDA_22'
      FieldLength = 5
      DisplayWidth = 5
      Position = 126
    end
    object ppEscalaHorarioppField128: TppField
      FieldAlias = 'SAIDA_23'
      FieldName = 'SAIDA_23'
      FieldLength = 5
      DisplayWidth = 5
      Position = 127
    end
    object ppEscalaHorarioppField129: TppField
      FieldAlias = 'SAIDA_24'
      FieldName = 'SAIDA_24'
      FieldLength = 5
      DisplayWidth = 5
      Position = 128
    end
    object ppEscalaHorarioppField130: TppField
      FieldAlias = 'SAIDA_25'
      FieldName = 'SAIDA_25'
      FieldLength = 5
      DisplayWidth = 5
      Position = 129
    end
    object ppEscalaHorarioppField131: TppField
      FieldAlias = 'SAIDA_26'
      FieldName = 'SAIDA_26'
      FieldLength = 5
      DisplayWidth = 5
      Position = 130
    end
    object ppEscalaHorarioppField132: TppField
      FieldAlias = 'SAIDA_27'
      FieldName = 'SAIDA_27'
      FieldLength = 5
      DisplayWidth = 5
      Position = 131
    end
    object ppEscalaHorarioppField133: TppField
      FieldAlias = 'SAIDA_28'
      FieldName = 'SAIDA_28'
      FieldLength = 5
      DisplayWidth = 5
      Position = 132
    end
    object ppEscalaHorarioppField134: TppField
      FieldAlias = 'SAIDA_29'
      FieldName = 'SAIDA_29'
      FieldLength = 5
      DisplayWidth = 5
      Position = 133
    end
    object ppEscalaHorarioppField135: TppField
      FieldAlias = 'SAIDA_30'
      FieldName = 'SAIDA_30'
      FieldLength = 5
      DisplayWidth = 5
      Position = 134
    end
    object ppEscalaHorarioppField136: TppField
      FieldAlias = 'SAIDA_31'
      FieldName = 'SAIDA_31'
      FieldLength = 5
      DisplayWidth = 5
      Position = 135
    end
    object ppEscalaHorarioppField137: TppField
      FieldAlias = 'DIA01'
      FieldName = 'DIA01'
      FieldLength = 10
      DisplayWidth = 10
      Position = 136
    end
    object ppEscalaHorarioppField138: TppField
      FieldAlias = 'DIA02'
      FieldName = 'DIA02'
      FieldLength = 10
      DisplayWidth = 10
      Position = 137
    end
    object ppEscalaHorarioppField139: TppField
      FieldAlias = 'DIA03'
      FieldName = 'DIA03'
      FieldLength = 10
      DisplayWidth = 10
      Position = 138
    end
    object ppEscalaHorarioppField140: TppField
      FieldAlias = 'DIA04'
      FieldName = 'DIA04'
      FieldLength = 10
      DisplayWidth = 10
      Position = 139
    end
    object ppEscalaHorarioppField141: TppField
      FieldAlias = 'DIA05'
      FieldName = 'DIA05'
      FieldLength = 10
      DisplayWidth = 10
      Position = 140
    end
    object ppEscalaHorarioppField142: TppField
      FieldAlias = 'DIA06'
      FieldName = 'DIA06'
      FieldLength = 10
      DisplayWidth = 10
      Position = 141
    end
    object ppEscalaHorarioppField143: TppField
      FieldAlias = 'DIA07'
      FieldName = 'DIA07'
      FieldLength = 10
      DisplayWidth = 10
      Position = 142
    end
    object ppEscalaHorarioppField144: TppField
      FieldAlias = 'DIA08'
      FieldName = 'DIA08'
      FieldLength = 10
      DisplayWidth = 10
      Position = 143
    end
    object ppEscalaHorarioppField145: TppField
      FieldAlias = 'DIA09'
      FieldName = 'DIA09'
      FieldLength = 10
      DisplayWidth = 10
      Position = 144
    end
    object ppEscalaHorarioppField146: TppField
      FieldAlias = 'DIA10'
      FieldName = 'DIA10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 145
    end
    object ppEscalaHorarioppField147: TppField
      FieldAlias = 'DIA11'
      FieldName = 'DIA11'
      FieldLength = 10
      DisplayWidth = 10
      Position = 146
    end
    object ppEscalaHorarioppField148: TppField
      FieldAlias = 'DIA12'
      FieldName = 'DIA12'
      FieldLength = 10
      DisplayWidth = 10
      Position = 147
    end
    object ppEscalaHorarioppField149: TppField
      FieldAlias = 'DIA13'
      FieldName = 'DIA13'
      FieldLength = 10
      DisplayWidth = 10
      Position = 148
    end
    object ppEscalaHorarioppField150: TppField
      FieldAlias = 'DIA14'
      FieldName = 'DIA14'
      FieldLength = 10
      DisplayWidth = 10
      Position = 149
    end
    object ppEscalaHorarioppField151: TppField
      FieldAlias = 'DIA15'
      FieldName = 'DIA15'
      FieldLength = 10
      DisplayWidth = 10
      Position = 150
    end
    object ppEscalaHorarioppField152: TppField
      FieldAlias = 'DIA16'
      FieldName = 'DIA16'
      FieldLength = 10
      DisplayWidth = 10
      Position = 151
    end
    object ppEscalaHorarioppField153: TppField
      FieldAlias = 'DIA17'
      FieldName = 'DIA17'
      FieldLength = 10
      DisplayWidth = 10
      Position = 152
    end
    object ppEscalaHorarioppField154: TppField
      FieldAlias = 'DIA18'
      FieldName = 'DIA18'
      FieldLength = 10
      DisplayWidth = 10
      Position = 153
    end
    object ppEscalaHorarioppField155: TppField
      FieldAlias = 'DIA19'
      FieldName = 'DIA19'
      FieldLength = 10
      DisplayWidth = 10
      Position = 154
    end
    object ppEscalaHorarioppField156: TppField
      FieldAlias = 'DIA20'
      FieldName = 'DIA20'
      FieldLength = 10
      DisplayWidth = 10
      Position = 155
    end
    object ppEscalaHorarioppField157: TppField
      FieldAlias = 'DIA21'
      FieldName = 'DIA21'
      FieldLength = 10
      DisplayWidth = 10
      Position = 156
    end
    object ppEscalaHorarioppField158: TppField
      FieldAlias = 'DIA22'
      FieldName = 'DIA22'
      FieldLength = 10
      DisplayWidth = 10
      Position = 157
    end
    object ppEscalaHorarioppField159: TppField
      FieldAlias = 'DIA23'
      FieldName = 'DIA23'
      FieldLength = 10
      DisplayWidth = 10
      Position = 158
    end
    object ppEscalaHorarioppField160: TppField
      FieldAlias = 'DIA24'
      FieldName = 'DIA24'
      FieldLength = 10
      DisplayWidth = 10
      Position = 159
    end
    object ppEscalaHorarioppField161: TppField
      FieldAlias = 'DIA25'
      FieldName = 'DIA25'
      FieldLength = 10
      DisplayWidth = 10
      Position = 160
    end
    object ppEscalaHorarioppField162: TppField
      FieldAlias = 'DIA26'
      FieldName = 'DIA26'
      FieldLength = 10
      DisplayWidth = 10
      Position = 161
    end
    object ppEscalaHorarioppField163: TppField
      FieldAlias = 'DIA27'
      FieldName = 'DIA27'
      FieldLength = 10
      DisplayWidth = 10
      Position = 162
    end
    object ppEscalaHorarioppField164: TppField
      FieldAlias = 'DIA28'
      FieldName = 'DIA28'
      FieldLength = 10
      DisplayWidth = 10
      Position = 163
    end
    object ppEscalaHorarioppField165: TppField
      FieldAlias = 'DIA29'
      FieldName = 'DIA29'
      FieldLength = 10
      DisplayWidth = 10
      Position = 164
    end
    object ppEscalaHorarioppField166: TppField
      FieldAlias = 'DIA30'
      FieldName = 'DIA30'
      FieldLength = 10
      DisplayWidth = 10
      Position = 165
    end
    object ppEscalaHorarioppField167: TppField
      FieldAlias = 'DIA31'
      FieldName = 'DIA31'
      FieldLength = 10
      DisplayWidth = 10
      Position = 166
    end
  end
  object dsEscalaHorario: TwwDataSource
    DataSet = CdsEscalaHorario
    Left = 215
    Top = 96
  end
  object sqlEscalaHorario: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS ESTAB,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS CNPJ,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS ENDERECO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS UF,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS REFERENCIA,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS CTPS,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS CARGO,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS C_CUSTO,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DATAADMISSAO,'
      '  LPAD('#39'1'#39',70,'#39'1'#39') AS NOMEHORARIO,'
      ''
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_01, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_02,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_03, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_04,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_05, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_06,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_07, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_08,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_09, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_10,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_11, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_12,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_13, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_14,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_15, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_16,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_17, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_18,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_19, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_20,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_21, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_22,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_23, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_24,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_25, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_26,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_27, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_28,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_29, LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOA' +
        'LMOCO_30,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS INICIOALMOCO_31,'
      ''
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_01, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_02,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_03, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_04,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_05, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_06,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_07, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_08,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_09, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_10,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_11, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_12,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_13, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_14,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_15, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_16,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_17, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_18,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_19, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_20,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_21, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_22,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_23, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_24,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_25, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_26,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_27, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_28,'
      
        '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_29, LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALM' +
        'OCO_30,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS FINALALMOCO_31,'
      ''
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_01, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_02,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_03, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_04,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_05, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_06,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_07, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_08,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_09, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_10,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_11, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_12,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_13, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_14,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_15, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_16,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_17, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_18,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_19, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_20,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_21, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_22,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_23, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_24,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_25, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_26,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_27, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_28,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_29, LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_30,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS ENTRADA_31,'
      ''
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_01, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_02,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_03, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_04,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_05, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_06,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_07, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_08,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_09, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_10,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_11, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_12,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_13, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_14,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_15, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_16,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_17, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_18,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_19, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_20,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_21, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_22,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_23, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_24,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_25, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_26,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_27, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_28,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_29, LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_30,'
      '  LPAD('#39'1'#39',5,'#39'1'#39') AS SAIDA_31,'
      ''
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA01, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA02,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA03, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA04,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA05, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA06,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA07, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA08,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA09, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA10,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA11, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA12,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA13, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA14,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA15, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA16,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA17, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA18,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA19, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA20,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA21, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA22,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA23, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA24,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA25, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA26,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA27, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA28,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA29, LPAD('#39'1'#39',10,'#39'1'#39') AS DIA30,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS DIA31'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsEscalaHorario
    Left = 215
    Top = 190
  end
  object CdsEscalaHorario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsEscalaHorarioAfterScroll
    Left = 215
    Top = 144
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 64
  end
  object CdsFerias: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 112
  end
  object CdsDiasExtras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 136
  end
  object CdsFeriado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 64
  end
  object CdsHorarioVariavel: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDLAYOUT'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COLCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGO'
        DataType = ftFloat
      end
      item
        Name = 'COLCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODFAVORECIDO'
        DataType = ftFloat
      end
      item
        Name = 'FLGMATRICULA'
        DataType = ftFloat
      end
      item
        Name = 'COLCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'TAMCODIGODEP'
        DataType = ftFloat
      end
      item
        Name = 'FLGPOSSUIDEP'
        DataType = ftFloat
      end
      item
        Name = 'ULTIMPORT'
        DataType = ftString
        Size = 7
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftString
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Data2'
        ParamType = ptUnknown
      end>
    StoreDefs = True
    Left = 113
    Top = 185
  end
  object CdsTurno: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 169
  end
  object CdsTurnoDiario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 155
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 156
    Top = 80
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPRESA,'
      '  LPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS CODCENTROCUSTO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS NOMECENTROCUSTO,'
      '  '#39'1234567890'#39' AS DATA_REF_INI,'
      '  '#39'1234567890'#39' AS DATA_REF_FIN,'
      
        '  0 AS OCORRIDA_01, '#39'1200000012'#39' AS PERIODO_01, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_01, '#39'123'#39' AS NOME_MES_01,'
      
        '  0 AS OCORRIDA_02, '#39'1200000012'#39' AS PERIODO_02, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_02, '#39'123'#39' AS NOME_MES_02,'
      
        '  0 AS OCORRIDA_03, '#39'1200000012'#39' AS PERIODO_03, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_03, '#39'123'#39' AS NOME_MES_03,'
      
        '  0 AS OCORRIDA_04, '#39'1200000012'#39' AS PERIODO_04, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_04, '#39'123'#39' AS NOME_MES_04,'
      
        '  0 AS OCORRIDA_05, '#39'1200000012'#39' AS PERIODO_05, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_05, '#39'123'#39' AS NOME_MES_05,'
      
        '  0 AS OCORRIDA_06, '#39'1200000012'#39' AS PERIODO_06, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_06, '#39'123'#39' AS NOME_MES_06,'
      
        '  0 AS OCORRIDA_07, '#39'1200000012'#39' AS PERIODO_07, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_07, '#39'123'#39' AS NOME_MES_07,'
      
        '  0 AS OCORRIDA_08, '#39'1200000012'#39' AS PERIODO_08, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_08, '#39'123'#39' AS NOME_MES_08,'
      
        '  0 AS OCORRIDA_09, '#39'1200000012'#39' AS PERIODO_09, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_09, '#39'123'#39' AS NOME_MES_09,'
      
        '  0 AS OCORRIDA_10, '#39'1200000012'#39' AS PERIODO_10, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_10, '#39'123'#39' AS NOME_MES_10,'
      
        '  0 AS OCORRIDA_11, '#39'1200000012'#39' AS PERIODO_11, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_11, '#39'123'#39' AS NOME_MES_11,'
      
        '  0 AS OCORRIDA_12, '#39'1200000012'#39' AS PERIODO_12, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_12, '#39'123'#39' AS NOME_MES_12,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsAux
    Left = 156
    Top = 126
  end
end
