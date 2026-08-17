inherited RptDeclDependente: TRptDeclDependente
  Left = 237
  Top = 209
  Width = 301
  Height = 257
  Caption = 'RptDeclDependente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
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
        Caption = 'CodFuncSel'
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
        Name = 'CodFuncSel'
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
        Caption = 'CodTipoDependSel'
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
        Name = 'CodTipoDependSel'
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
        Caption = 'SexoTitular'
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
        Name = 'SexoTitular'
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
        Caption = 'FaixaEtariaIni'
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
        Name = 'FaixaEtariaIni'
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
        Caption = 'FaixaEtariaFin'
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
        Name = 'FaixaEtariaFin'
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
        Caption = 'SexoDependente'
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
        Name = 'SexoDependente'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpDeclDependente
    ConnectionType = cntBDE
  end
  object rpDeclDependente: TppReport
    AutoStop = False
    DataPipeline = ppDeclDependente
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
    DeviceType = 'Screen'
    Left = 222
    Version = '5.5'
    mmColumnWidth = 197300
    object rpDeclDependenteHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41804
      mmPrintPosition = 0
      object rpDeclDependenteShape1: TppShape
        UserName = 'rpDeclDependenteShape1'
        mmHeight = 14552
        mmLeft = 2381
        mmTop = 5027
        mmWidth = 192882
        BandType = 0
      end
      object rpDeclDependenteMemo1: TppMemo
        UserName = 'rpDeclDependenteMemo1'
        Caption = 'Declaração de Dependentes para'#13#10'Fins de Imposto de Renda'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Lines.Strings = (
          'Declaração de Dependentes para'
          'Fins de Imposto de Renda')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 10319
        mmLeft = 4498
        mmTop = 7144
        mmWidth = 188648
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpDeclDependenteDBTxt1: TppDBText
        UserName = 'rpCadDependenteDBTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppDeclDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 24342
        mmWidth = 102923
        BandType = 0
      end
      object rpDeclDependenteMemo2: TppMemo
        UserName = 'rpDeclDependenteMemo2'
        Caption = 
          'Em obediência a legislação do Imposto de Renda, venho pela prese' +
          'nte informar-lhe que tenho, como encargo(s) de família, a(s) pes' +
          'soa(s) abaixo relacionada(s):'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Lines.Strings = (
          
            'Em obediência a legislação do Imposto de Renda, venho pela prese' +
            'nte informar-lhe que tenho, como encargo(s) de família, a(s) pes' +
            'soa(s) abaixo relacionada(s):')
        Transparent = True
        mmHeight = 8996
        mmLeft = 4498
        mmTop = 30692
        mmWidth = 188648
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object rpDeclDependenteDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpDeclDependenteShape3: TppShape
        UserName = 'rpDeclDependenteShape3'
        mmHeight = 6350
        mmLeft = 2910
        mmTop = 0
        mmWidth = 192882
        BandType = 4
      end
      object rpDeclDependenteDBTxt2: TppDBText
        UserName = 'rpCadDependenteDBTxt10'
        DataField = 'DEPENDENTE'
        DataPipeline = ppDeclDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 4498
        mmTop = 1323
        mmWidth = 94986
        BandType = 4
      end
      object rpDeclDependenteDBTxt3: TppDBText
        UserName = 'rpCadDependenteDBTxt11'
        DataField = 'DATANASC'
        DataPipeline = ppDeclDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 105569
        mmTop = 1323
        mmWidth = 32015
        BandType = 4
      end
      object rpDeclDependenteDBTxt4: TppDBText
        UserName = 'rpCadDependenteDBTxt12'
        DataField = 'DEPENDENCIA'
        DataPipeline = ppDeclDependente
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 143669
        mmTop = 1323
        mmWidth = 50536
        BandType = 4
      end
      object rpDeclDependenteLine3: TppLine
        UserName = 'rpDeclDependenteLine3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 102394
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object rpDeclDependenteLine4: TppLine
        UserName = 'rpDeclDependenteLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 140494
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
    end
    object rpDeclDependenteFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
    end
    object rpDeclDependenteSmryBnd: TppSummaryBand
      AfterPrint = rpDeclDependenteSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
    object rpDeclDependenteGroupEMPREGADO: TppGroup
      BreakName = 'EMPREGADO'
      DataPipeline = ppDeclDependente
      NewPage = True
      UserName = 'rpCadDependenteGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpDeclDependenteGrpHdrBnd0: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpDeclDependenteShape2: TppShape
          UserName = 'Shape1'
          mmHeight = 7144
          mmLeft = 2910
          mmTop = 529
          mmWidth = 192882
          BandType = 3
          GroupNo = 0
        end
        object rpDeclDependenteLbl1: TppLabel
          UserName = 'rpDeclDependenteLbl1'
          AutoSize = False
          Caption = 'Nome Completo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4498
          mmTop = 2646
          mmWidth = 94986
          BandType = 3
          GroupNo = 1
        end
        object rpDeclDependenteLbl3: TppLabel
          UserName = 'rpDeclDependenteLbl3'
          AutoSize = False
          Caption = 'Dependência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 143669
          mmTop = 2646
          mmWidth = 50536
          BandType = 3
          GroupNo = 1
        end
        object rpDeclDependenteLbl2: TppLabel
          UserName = 'rpDeclDependenteLbl2'
          AutoSize = False
          Caption = 'Data de Nascimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 105569
          mmTop = 2646
          mmWidth = 32015
          BandType = 3
          GroupNo = 1
        end
        object rpDeclDependenteLine1: TppLine
          UserName = 'rpDeclDependenteLine1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6879
          mmLeft = 102394
          mmTop = 529
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object rpDeclDependenteLine2: TppLine
          UserName = 'rpDeclDependenteLine2'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 6879
          mmLeft = 140494
          mmTop = 529
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
      end
      object rpDeclDependenteGrpFootBnd0: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 82021
        mmPrintPosition = 0
        object rpDeclDependenteShape5: TppShape
          UserName = 'rpDeclDependenteShape5'
          mmHeight = 32808
          mmLeft = 4498
          mmTop = 46038
          mmWidth = 188648
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl4: TppLabel
          UserName = 'rpDeclDependenteLbl4'
          AutoSize = False
          Caption = 'Nome do Declarante:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 47625
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt15: TppDBText
          UserName = 'rpCadDependenteDBTxt5'
          DataField = 'CTPS_UF'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 69321
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteSysVar1: TppSystemVariable
          UserName = 'rpDeclDependenteSysVar1'
          AutoSize = False
          VarType = vtDateTime
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 168540
          mmTop = 69321
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt8: TppDBText
          UserName = 'rpCadDependenteDBTxt2'
          DataField = 'BAIRRO'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 60325
          mmWidth = 51594
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt9: TppDBText
          UserName = 'rpCadDependenteDBTxt3'
          DataField = 'ESTCIVIL'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 64823
          mmWidth = 51594
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt6: TppDBText
          UserName = 'rpCadDependenteDBTxt4'
          DataField = 'LOGRADOURO'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 51329
          mmWidth = 131763
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt5: TppDBText
          UserName = 'rpCadDependenteDBTxt7'
          DataField = 'EMPREGADO'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 46831
          mmWidth = 131763
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt7: TppDBText
          UserName = 'DBText2'
          DataField = 'CIDADE'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 55827
          mmWidth = 51594
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt14: TppDBText
          UserName = 'DBText5'
          DataField = 'TELEFONE'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 64823
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteMemo3: TppMemo
          UserName = 'rpDeclDependenteMemo3'
          Caption = 
            'Declaro, sob as penas da lei, que as informações aqui prestadas ' +
            'são verdadeiras e de minha inteira responsabilidade, não cabendo' +
            ' a V. Sa.(s) (fonte pagadora) qualquer responsabilidade perante ' +
            'a fiscalização.'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Lines.Strings = (
            
              'Declaro, sob as penas da lei, que as informações aqui prestadas ' +
              'são verdadeiras e de minha inteira responsabilidade, não cabendo' +
              ' a V. Sa.(s) (fonte pagadora) qualquer responsabilidade perante ' +
              'a fiscalização.')
          Transparent = True
          mmHeight = 8996
          mmLeft = 4498
          mmTop = 5556
          mmWidth = 188648
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpDeclDependenteShape4: TppShape
          UserName = 'rpDeclDependenteShape4'
          mmHeight = 21431
          mmLeft = 98954
          mmTop = 19050
          mmWidth = 93927
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteMemo4: TppMemo
          UserName = 'rpDeclDependenteMemo4'
          Caption = 
            #13#10'________________, ____ de ___________ de ________'#13#10#13#10#13#10'Ass. __' +
            '__________________________________________'#13#10
          CharWrap = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            ''
            '________________, ____ de ___________ de ________'
            ''
            ''
            'Ass. ____________________________________________')
          Transparent = True
          mmHeight = 19315
          mmLeft = 100277
          mmTop = 20108
          mmWidth = 91281
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpDeclDependenteLbl5: TppLabel
          UserName = 'rpDeclDependenteLbl5'
          AutoSize = False
          Caption = 'Endereço          :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 52123
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl6: TppLabel
          UserName = 'rpDeclDependenteLbl6'
          AutoSize = False
          Caption = 'Cidade            :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 56621
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl7: TppLabel
          UserName = 'rpDeclDependenteLbl7'
          AutoSize = False
          Caption = 'Bairro            :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 61119
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl8: TppLabel
          UserName = 'rpDeclDependenteLbl8'
          AutoSize = False
          Caption = 'Estado Civil      :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 65617
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl9: TppLabel
          UserName = 'rpDeclDependenteLbl9'
          AutoSize = False
          Caption = 'Carteira Prof.    :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 70115
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl10: TppLabel
          UserName = 'rpDeclDependenteLbl10'
          AutoSize = False
          Caption = 'CPF               :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5821
          mmTop = 74613
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt10: TppDBText
          UserName = 'rpDeclDependenteDBTxt10'
          DataField = 'CTPS'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 69321
          mmWidth = 51594
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt11: TppDBText
          UserName = 'rpDeclDependenteDBTxt11'
          DataField = 'CPF'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 47096
          mmTop = 73819
          mmWidth = 51594
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl11: TppLabel
          UserName = 'rpDeclDependenteLbl11'
          AutoSize = False
          Caption = 'Estado   :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 101336
          mmTop = 56621
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl12: TppLabel
          UserName = 'rpDeclDependenteLbl12'
          AutoSize = False
          Caption = 'CEP      :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 101600
          mmTop = 61119
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl13: TppLabel
          UserName = 'rpDeclDependenteLbl13'
          AutoSize = False
          Caption = 'Telefone :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 101336
          mmTop = 65617
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl14: TppLabel
          UserName = 'rpDeclDependenteLbl14'
          AutoSize = False
          Caption = 'Estado   :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 101336
          mmTop = 70115
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteLbl15: TppLabel
          UserName = 'rpDeclDependenteLbl15'
          AutoSize = False
          Caption = 'Exp.:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Lucida Console'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 2910
          mmLeft = 156634
          mmTop = 70115
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt12: TppDBText
          UserName = 'rpDeclDependenteDBTxt12'
          DataField = 'UF'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 55827
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object rpDeclDependenteDBTxt13: TppDBText
          UserName = 'rpDeclDependenteDBTxt13'
          DataField = 'CEP'
          DataPipeline = ppDeclDependente
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 60325
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDeclDependente: TppBDEPipeline
    DataSource = dsDeclDependente
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppDeclDependente'
    Left = 222
    Top = 45
    object ppDeclDependenteppField1: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField4: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField5: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField6: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField7: TppField
      FieldAlias = 'ESTCIVIL'
      FieldName = 'ESTCIVIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField8: TppField
      FieldAlias = 'CTPS'
      FieldName = 'CTPS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField9: TppField
      FieldAlias = 'CTPS_UF'
      FieldName = 'CTPS_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField10: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField11: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField12: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField13: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField14: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField15: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDeclDependenteppField16: TppField
      FieldAlias = 'DEPENDENCIA'
      FieldName = 'DEPENDENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object dsDeclDependente: TwwDataSource
    AutoEdit = False
    DataSet = CdsDeclDependente
    Left = 222
    Top = 90
  end
  object CdsDeclDependente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsDeclDependenteAfterScroll
    Left = 222
    Top = 135
  end
  object sqlDeclDependente: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS ESTAB,'
      '  '#39'2'#39' AS MATRICULA,'
      '  '#39'3'#39' AS LOGRADOURO,'
      '  '#39'4'#39' AS CIDADE,'
      '  '#39'5'#39' AS BAIRRO,'
      '  '#39'6'#39' AS CEP,'
      '  '#39'7'#39' AS ESTCIVIL,'
      '  '#39'8'#39' AS CTPS,'
      '  '#39'9'#39' AS CTPS_UF,'
      '  '#39'0'#39' AS CPF,'
      '  '#39'1'#39' AS TELEFONE,'
      '  '#39'2'#39' AS UF,'
      '  '#39'3'#39' AS EMPREGADO,'
      '  '#39'4'#39' AS DEPENDENTE,'
      '  '#39'5'#39' AS DATANASC,'
      '  '#39'6'#39' AS DEPENDENCIA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsDeclDependente
    Left = 222
    Top = 181
  end
end
