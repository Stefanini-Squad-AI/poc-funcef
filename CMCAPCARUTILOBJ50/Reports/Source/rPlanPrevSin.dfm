inherited RptPlanPrevSin: TRptPlanPrevSin
  Left = 446
  Top = 219
  Height = 210
  Caption = 'RptPlanPrevSin'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Plano Previdenciario Sintético'
    Params = <
      item
        Caption = 'Favorecido'
        Controle = tcProcuraFC
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
      end
      item
        Caption = 'Lançamento Inicial'
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
        Caption = 'Lançamento Final'
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
        Caption = 'Programada Inicial'
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
        Caption = 'Programada Final'
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
        Caption = 'Centro de Respon.'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODCENTRORESPON'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro Respomsabilidade'
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
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Plano Previdencia'
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
        Caption = 'Valor'
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
        Caption = 'Ap/Gr'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 325
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpPrevSint
    LabelEmpresa = ppLabel4
    LabelSistema = ppLabel5
  end
  object ppPrevsint: TppBDEPipeline
    DataSource = dsprevsint
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Prevsint'
    Left = 163
    Top = 72
    object ppPrevsintppField1: TppField
      FieldAlias = 'NOMEPP'
      FieldName = 'NOMEPP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppPrevsintppField2: TppField
      FieldAlias = 'VALORBRUTO'
      FieldName = 'VALORBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppPrevsintppField3: TppField
      FieldAlias = 'VALORLIQUIDO'
      FieldName = 'VALORLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object rpPrevSint: TppReport
    AutoStop = False
    DataPipeline = ppPrevsint
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
    Left = 216
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPrevsint'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Plano Previdênciário Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 69850
        mmTop = 8467
        mmWidth = 60590
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpPrevSintRegion1: TppRegion
        UserName = 'rpPrevSintRegion1'
        Caption = 'rpPrevSintRegion1'
        Pen.Color = clWhite
        Stretch = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 14023
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPrevSintMemo1: TppMemo
          UserName = 'rpPrevSintMemo1'
          Caption = 'rpPrevSintMemo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Stretch = True
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 15346
          mmWidth = 194734
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
      object rpPrevSintRegion2: TppRegion
        UserName = 'rpPrevSintRegion2'
        Caption = 'rpPrevSintRegion2'
        Pen.Color = clWhite
        ShiftRelativeTo = rpPrevSintRegion1
        Stretch = True
        mmHeight = 6085
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197909
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpPrevSintLabel6: TppLabel
          UserName = 'rpPrevSintLabel6'
          Caption = 'Previdêcia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 20902
          mmWidth = 15081
          BandType = 0
        end
        object rpPrevSintLabel1: TppLabel
          UserName = 'rpPrevSintLabel1'
          Caption = 'Vl. Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 20902
          mmWidth = 12435
          BandType = 0
        end
        object rpPrevSintLabel2: TppLabel
          UserName = 'rpPrevSintLabel2'
          Caption = 'Vl. Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 173038
          mmTop = 20902
          mmWidth = 15346
          BandType = 0
        end
        object rpPrevSintLine1: TppLine
          UserName = 'rpPrevSintLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 24870
          mmWidth = 197909
          BandType = 0
        end
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpPrevSintDBText1: TppDBText
        UserName = 'rpPrevSintDBText1'
        DataField = 'VALORBRUTO'
        DataPipeline = ppPrevsint
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPrevsint'
        mmHeight = 3704
        mmLeft = 82286
        mmTop = 0
        mmWidth = 58738
        BandType = 4
      end
      object rpPrevSintDBText2: TppDBText
        UserName = 'rpPrevSintDBText2'
        DataField = 'VALORLIQUIDO'
        DataPipeline = ppPrevsint
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPrevsint'
        mmHeight = 3704
        mmLeft = 142611
        mmTop = 0
        mmWidth = 45773
        BandType = 4
      end
      object rpPrevSintDBText3: TppDBText
        UserName = 'rpPrevSintDBText3'
        DataField = 'NOMEPP'
        DataPipeline = ppPrevsint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPrevsint'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 78317
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpPrevSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object rpPrevSintLabel3: TppLabel
        UserName = 'rpPrevSintLabel3'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 529
        mmWidth = 7938
        BandType = 7
      end
      object rpPrevSintDBCalc1: TppDBCalc
        UserName = 'rpPrevSintDBCalc1'
        DataField = 'VALORBRUTO'
        DataPipeline = ppPrevsint
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPrevsint'
        mmHeight = 3704
        mmLeft = 70908
        mmTop = 265
        mmWidth = 70115
        BandType = 7
      end
      object rpPrevSintDBCalc2: TppDBCalc
        UserName = 'rpPrevSintDBCalc2'
        DataField = 'VALORLIQUIDO'
        DataPipeline = ppPrevsint
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPrevsint'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 265
        mmWidth = 46302
        BandType = 7
      end
    end
  end
  object dsprevsint: TwwDataSource
    DataSet = CdsPrevSint
    Left = 109
    Top = 72
  end
  object SqlPrevSint: TCMSqlParams
    SQL.Strings = (
      'select '
      ' sum(valorbruto) as valorbruto,'
      ' sum(valorliquido) as valorliquido,'
      '   nomepp '
      'from'
      '(select'
      '          sum(r.valor) as valorbruto,'
      '          sum(r.valor*saldo.valor/l.valor) as valorliquido,'
      '         pp.nome as nomepp '
      'from documento d,  '
      '        lanctodocum l ,'
      '        rateiodocum r,'
      '        centrespon cr,'
      '        PLANPREVCONTABIL pp,'
      '        pessoa p ,'
      ''
      
        '(select d.coddocumento, sum(decode(d.recpag,'#39'P'#39', (decode(l.debcr' +
        'e,'#39'D'#39',l.valor*-1,l.valor)) , (decode(l.debcre,'#39'C'#39',l.valor*-1,l.v' +
        'alor))  ) )  as valor '
      
        ' from documento d,lanctodocum l where d.recpag='#39'L'#39' and d.idpesso' +
        'a=1 and d.coddocumento=l.coddocumento and d.numfatura is null gr' +
        'oup by d.coddocumento) saldo'
      ''
      'where'
      'd.coddocumento=l.coddocumento and'
      'd.coddocumento=r.coddocumento and'
      'r.codcentrorespon=cr.codcentrorespon and'
      'r.idplanoprev =pp.idplanoprev and'
      'd.idforcli=p.idpessoa and'
      'd.operacao=l.operacao and'
      'd.numfatura is null and'
      'd.recpag='#39'P'#39' and d.idpessoa=1 and'
      'l.estorno is null and'
      'd.coddocumento=saldo.coddocumento and'
      'l.datalancto >= '#39'31/10/2002'#39' and'
      'l.datalancto <= '#39'01/11/2000'#39' '
      'group by'
      '         pp.nome'
      ''
      'union all'
      'select'
      '          sum(r.valor*parcela.valor/l.valor) as valorbruto,'
      
        '          sum((r.valor*parcela.valor/l.valor)*saldo.valor/parcel' +
        'a.valor) as valorliquido,'
      ''
      '         pp.nome as nomepp '
      ''
      'from documento d,  '
      '        lanctodocum l ,'
      '        rateiodocum r,'
      '        centrespon cr,'
      '        PLANPREVCONTABIL pp,'
      '        pessoa p ,'
      ''
      
        '(select d.coddocumento,d.numfatura,sum(decode(d.recpag,'#39'P'#39', (dec' +
        'ode(l.debcre,'#39'D'#39',l.valor*-1,l.valor)) , (decode(l.debcre,'#39'C'#39',l.v' +
        'alor*-1,l.valor))  ) )  as valor '
      
        ' from documento d,lanctodocum l where d.recpag='#39'L'#39' and d.idpesso' +
        'a=1 and d.coddocumento=l.coddocumento and rtrim(d.operacao)='#39'3'#39' ' +
        'group by d.coddocumento,d.numfatura) saldo'
      ','
      
        '(select l.valor,d.numfatura, d.numapgr ,d.coddocumento,l.datalan' +
        'cto ,d.dataprogramada from documento d, lanctodocum l where d.co' +
        'ddocumento=l.coddocumento  and '
      '  d.recpag='#39'P'#39' and d.idpessoa=1 and rtrim(l.operacao)='#39'3'#39' and'
      'l.datalancto >= '#39'31/10/2002'#39' and'
      'l.datalancto <= '#39'31/12/2001'#39' and l.estorno is null'
      ') parcela'
      ''
      'where'
      'd.coddocumento=l.coddocumento and'
      ''
      'd.coddocumento=r.coddocumento and'
      ''
      'r.codcentrorespon=cr.codcentrorespon and'
      ''
      'r.idplanoprev =pp.idplanoprev and'
      ''
      'd.idforcli=p.idpessoa and'
      'd.operacao=l.operacao and'
      'rtrim(d.operacao)='#39'1'#39' and d.numfatura is not null and'
      'd.recpag='#39'P'#39' and d.idpessoa=1 and'
      'd.numfatura=saldo.numfatura and'
      'd.numfatura=parcela.numfatura and'
      'saldo.coddocumento=parcela.coddocumento'
      ''
      ''
      'group by'
      '         pp.nome'
      '        )'
      'group by'
      '   nomepp '
      ''
      ''
      ''
      ' '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ''
      'select '
      ''
      'numapgr , '
      '   nomerespon , '
      '  nome , '
      ' sum(valorbruto) as valorbruto,'
      ' sum(valorliquido)as valorliquido,'
      '        datalancto,'
      '        dataprogramada ,'
      '   nomepp '
      ''
      'from'
      ''
      '(select d.numapgr , '
      '          cr.nome as nomerespon , '
      '          p.nome , '
      '          sum(r.valor) as valorbruto,'
      '          sum(r.valor*saldo.valor/l.valor) as valorliquido,'
      '          l.datalancto,'
      '         d.dataprogramada ,'
      '         pp.nome as nomepp '
      ''
      'from documento d,  '
      '        lanctodocum l ,'
      '        rateiodocum r,'
      '        centrespon cr,'
      '        PLANPREVCONTABIL pp,'
      '        pessoa p ,'
      ''
      
        '(select d.coddocumento, sum(decode(d.recpag,'#39'P'#39', (decode(l.debcr' +
        'e,'#39'D'#39',l.valor*-1,l.valor)) , (decode(l.debcre,'#39'C'#39',l.valor*-1,l.v' +
        'alor))  ) )  as valor '
      
        ' from documento d,lanctodocum l where d.recpag='#39'r'#39' and d.idpesso' +
        'a=1 and d.coddocumento=l.coddocumento and d.numfatura is null gr' +
        'oup by d.coddocumento) saldo'
      ''
      'where'
      'd.coddocumento=l.coddocumento and'
      'd.coddocumento=r.coddocumento and'
      'r.codcentrorespon=cr.codcentrorespon and'
      'r.idplanoprev =pp.idplanoprev and'
      'd.idforcli=p.idpessoa and'
      'd.operacao=l.operacao and'
      'd.numfatura is null and'
      'd.recpag='#39'P'#39' and d.idpessoa=1 and'
      'l.estorno is null and'
      'd.coddocumento=saldo.coddocumento and'
      'l.datalancto >= '#39'31/10/2002'#39' and'
      'l.datalancto <= '#39'01/11/2000'#39' '
      'group by'
      '         pp.nome,'
      '         cr.nome , '
      '          p.nome ,'
      '          l.datalancto,'
      '         d.dataprogramada ,'
      '         d.numapgr '
      ''
      'union all'
      ''
      'select parcela.numapgr , '
      '          cr.nome as nomerespon , '
      '          p.nome , '
      '          sum(r.valor*parcela.valor/l.valor) as valorbruto,'
      
        '          sum((r.valor*parcela.valor/l.valor)*saldo.valor/parcel' +
        'a.valor) as valorliquido,'
      '          parcela.datalancto,'
      '         parcela.dataprogramada ,'
      '         pp.nome as nomepp '
      ''
      'from documento d,  '
      '        lanctodocum l ,'
      '        rateiodocum r,'
      '        centrespon cr,'
      '        PLANPREVCONTABIL pp,'
      '        pessoa p ,'
      ''
      
        '(select d.coddocumento,d.numfatura,sum(decode(d.recpag,'#39'P'#39', (dec' +
        'ode(l.debcre,'#39'D'#39',l.valor*-1,l.valor)) , (decode(l.debcre,'#39'C'#39',l.v' +
        'alor*-1,l.valor))  ) )  as valor '
      
        ' from documento d,lanctodocum l where d.recpag='#39'o'#39' and d.idpesso' +
        'a=1 and d.coddocumento=l.coddocumento and rtrim(d.operacao)='#39'3'#39' ' +
        'group by d.coddocumento,d.numfatura) saldo'
      ','
      
        '(select l.valor,d.numfatura, d.numapgr ,d.coddocumento,l.datalan' +
        'cto ,d.dataprogramada from documento d, lanctodocum l where d.co' +
        'ddocumento=l.coddocumento  and '
      '  d.recpag='#39'P'#39' and d.idpessoa=1 and rtrim(l.operacao)='#39'3'#39' and'
      'l.datalancto >= '#39'31/10/2002'#39' and'
      'l.datalancto <= '#39'31/12/2001'#39' and l.estorno is null'
      ') parcela'
      ''
      'where'
      'd.coddocumento=l.coddocumento and'
      ''
      'd.coddocumento=r.coddocumento and'
      ''
      'r.codcentrorespon=cr.codcentrorespon and'
      ''
      'r.idplanoprev =pp.idplanoprev and'
      ''
      'd.idforcli=p.idpessoa and'
      'd.operacao=l.operacao and'
      'rtrim(d.operacao)='#39'1'#39' and d.numfatura is not null and'
      'd.recpag='#39'P'#39' and d.idpessoa=1 and'
      'd.numfatura=saldo.numfatura and'
      'd.numfatura=parcela.numfatura and'
      'saldo.coddocumento=parcela.coddocumento'
      ''
      ''
      'group by'
      '         pp.nome,'
      '         cr.nome , '
      '          p.nome ,'
      '         parcela.datalancto,'
      '        parcela.dataprogramada ,'
      
        '         parcela.numapgr ,parcela.coddocumento,saldo.coddocument' +
        'o)'
      'group by numapgr , '
      '   nomerespon , '
      '  nome , '
      ''
      '        datalancto,'
      '        dataprogramada ,'
      '   nomepp '
      ''
      ''
      ''
      ' '
      ''
      ''
      ''
      ''
      '')
    ClientDataSet = CdsPrevSint
    Left = 72
    Top = 72
  end
  object CdsPrevSint: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 72
  end
end
