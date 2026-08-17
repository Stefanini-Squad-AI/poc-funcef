inherited RptRellccontab: TRptRellccontab
  Left = 564
  Top = 217
  Height = 236
  Caption = 'RptRellccontab'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Lançamentos Contábeis'
    Params = <
      item
        Caption = 'Data Lançamento Inicial'
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
        Caption = 'Data Lançamento Final'
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
        Caption = 'Conta Contábil'
        Controle = tcProcuraCC
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
        LookupSettings.Chave = 'codcentrocusto'
        LookupSettings.Display = 'nome'
        LookupSettings.Descricao = 'Nome'
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
        Caption = 'Atividade / Projeto'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'unidnegoc'
        LookupSettings.Display = 'nome'
        LookupSettings.Descricao = 'Nome'
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
        Caption = 'Sub Conta'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'codsubconta'
        LookupSettings.Display = 'nomesubconta'
        LookupSettings.Descricao = 'Nome'
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
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 270
    Left = 148
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppContab
    LabelEmpresa = lbempresa
    LabelSistema = ppLabel29
  end
  object bdeContab: TppBDEPipeline
    DataSource = dscontab
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'bdeContab'
    Left = 132
    Top = 58
    object bdeContabppField1: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object bdeContabppField2: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object bdeContabppField3: TppField
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object bdeContabppField4: TppField
      FieldAlias = 'HISTLANCAMENTOCONTABIL'
      FieldName = 'HISTLANCAMENTOCONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object bdeContabppField5: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object bdeContabppField6: TppField
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object bdeContabppField7: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object bdeContabppField8: TppField
      FieldAlias = 'PLAREDUZ'
      FieldName = 'PLAREDUZ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object bdeContabppField9: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object bdeContabppField10: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object bdeContabppField11: TppField
      FieldAlias = 'LACNUMLAN'
      FieldName = 'LACNUMLAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object bdeContabppField12: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object bdeContabppField13: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object bdeContabppField14: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object bdeContabppField15: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object bdeContabppField16: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object bdeContabppField17: TppField
      FieldAlias = 'NOMESUBCONTA'
      FieldName = 'NOMESUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object ppContab: TppReport
    AutoStop = False
    DataPipeline = bdeContab
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 174
    Top = 58
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeContab'
    object ppHeaderBand9: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object TituloContab: TppLabel
        UserName = 'TituloContab'
        Caption = 'Listagem dos Lançamentos Contábeis (Contas a Receber)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 83609
        mmTop = 7408
        mmWidth = 117211
        BandType = 0
      end
      object lbempresa: TppLabel
        UserName = 'lbempresa'
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
      object ppContabMemo1: TppMemo
        UserName = 'ppContabMemo1'
        Caption = 'ppContabMemo1'
        CharWrap = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 8
        Font.Style = [fsBold]
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 265
        mmTop = 13229
        mmWidth = 283369
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
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
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel29: TppLabel
        UserName = 'ppLabel29'
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
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc16: TppSystemVariable
        UserName = 'Calc16'
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
        mmWidth = 112977
        BandType = 8
      end
    end
    object ppContabSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppContab1: TppSubReport
        UserName = 'ppContab1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'bdeContab'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppContabChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = bdeContab
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
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'bdeContab'
          object ppContabChildReport1HeaderBand1: TppHeaderBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object ppContabChildReport1Label1: TppLabel
              UserName = 'ppContabChildReport1Label1'
              Caption = 'Lançamentos Efetivos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 123825
              mmTop = 529
              mmWidth = 36513
              BandType = 0
            end
            object ppContabChildReport1Label2: TppLabel
              UserName = 'ppContabChildReport1Label2'
              Caption = 'Dt. Lanc.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 0
              mmTop = 6085
              mmWidth = 12171
              BandType = 0
            end
            object ppContabChildReport1Label3: TppLabel
              UserName = 'ppContabChildReport1Label3'
              Caption = 'Planilha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 13494
              mmTop = 6085
              mmWidth = 11113
              BandType = 0
            end
            object ppContabChildReport1Label4: TppLabel
              UserName = 'ppContabChildReport1Label4'
              AutoSize = False
              Caption = 'C. Reduz'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 25400
              mmTop = 6085
              mmWidth = 12171
              BandType = 0
            end
            object ppContabChildReport1Label5: TppLabel
              UserName = 'ppContabChildReport1Label5'
              Caption = 'C. Contábil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 38629
              mmTop = 6085
              mmWidth = 15346
              BandType = 0
            end
            object ppContabChildReport1Label6: TppLabel
              UserName = 'ppContabChildReport1Label6'
              Caption = 'Descr. C. Contábil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 60854
              mmTop = 6085
              mmWidth = 24871
              BandType = 0
            end
            object ppContabChildReport1Label7: TppLabel
              UserName = 'ppContabChildReport1Label7'
              Caption = 'Valor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 107421
              mmTop = 6085
              mmWidth = 7408
              BandType = 0
            end
            object ppContabChildReport1Label8: TppLabel
              UserName = 'ppContabChildReport1Label8'
              Caption = 'Histórico'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 120650
              mmTop = 6085
              mmWidth = 12965
              BandType = 0
            end
            object ppContabChildReport1Label9: TppLabel
              UserName = 'ppContabChildReport1Label9'
              Caption = 'Centro de Custo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 177800
              mmTop = 6085
              mmWidth = 22490
              BandType = 0
            end
            object ppContabChildReport1Label10: TppLabel
              UserName = 'ppContabChildReport1Label10'
              Caption = 'Unidade de Negócio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 214048
              mmTop = 6085
              mmWidth = 26988
              BandType = 0
            end
            object ppContabChildReport1Label11: TppLabel
              UserName = 'ppContabChildReport1Label11'
              Caption = 'Sub Conta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 244475
              mmTop = 6085
              mmWidth = 14288
              BandType = 0
            end
          end
          object ppContabChildReport1DetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppContabChildReport1DBText1: TppDBText
              UserName = 'ppContabChildReport1DBText1'
              AutoSize = True
              DataField = 'DATA'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 0
              mmTop = 265
              mmWidth = 6615
              BandType = 4
            end
            object ppContabChildReport1DBText2: TppDBText
              UserName = 'ppContabChildReport1DBText2'
              DataField = 'PLNPLANIL'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 13494
              mmTop = 265
              mmWidth = 11113
              BandType = 4
            end
            object ppContabChildReport1DBText3: TppDBText
              UserName = 'ppContabChildReport1DBText3'
              DataField = 'PLAREDUZ'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 25400
              mmTop = 265
              mmWidth = 12172
              BandType = 4
            end
            object ppContabChildReport1DBText4: TppDBText
              UserName = 'ppContabChildReport1DBText4'
              DataField = 'PLACONTA'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 38629
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object ppContabChildReport1DBText5: TppDBText
              UserName = 'ppContabChildReport1DBText5'
              DataField = 'PLANOME'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 60854
              mmTop = 265
              mmWidth = 37835
              BandType = 4
            end
            object ppContabChildReport1DBText6: TppDBText
              UserName = 'ppContabChildReport1DBText6'
              AutoSize = True
              DataField = 'LACVALOR'
              DataPipeline = bdeContab
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 102394
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ppContabChildReport1DBText7: TppDBText
              UserName = 'ppContabChildReport1DBText7'
              DataField = 'LACDEBCRE'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 115888
              mmTop = 265
              mmWidth = 3704
              BandType = 4
            end
            object ppContabChildReport1DBText9: TppDBText
              UserName = 'ppContabChildReport1DBText9'
              DataField = 'NOMECC'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 177800
              mmTop = 265
              mmWidth = 35190
              BandType = 4
            end
            object ppContabChildReport1DBText10: TppDBText
              UserName = 'ppContabChildReport1DBText10'
              DataField = 'NOME'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 214048
              mmTop = 265
              mmWidth = 27781
              BandType = 4
            end
            object ppContabChildReport1DBText11: TppDBText
              UserName = 'ppContabChildReport1DBText11'
              DataField = 'NOMESUBCONTA'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 243153
              mmTop = 265
              mmWidth = 40746
              BandType = 4
            end
            object ppContabChildReport1DBMemo1: TppDBMemo
              UserName = 'ppContabChildReport1DBMemo1'
              CharWrap = False
              DataField = 'HISTLANCAMENTOCONTABIL'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              Stretch = True
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 120650
              mmTop = 265
              mmWidth = 56092
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
      object ppContab2: TppSubReport
        UserName = 'ppContab2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppContab1
        TraverseAllData = False
        DataPipelineName = 'BDECONTABPARC'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5821
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppContabChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = BDECONTABPARC
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
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDECONTABPARC'
          object ppContabChildReport2HeaderBand1: TppHeaderBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 10319
            mmPrintPosition = 0
            object ppContabChildReport2Label1: TppLabel
              UserName = 'ppContabChildReport2Label1'
              Caption = 'Dt. Lanc.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 0
              mmTop = 6350
              mmWidth = 12171
              BandType = 0
            end
            object ppContabChildReport2Label2: TppLabel
              UserName = 'ppContabChildReport2Label2'
              AutoSize = False
              Caption = 'Planilha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2911
              mmLeft = 13494
              mmTop = 6350
              mmWidth = 11113
              BandType = 0
            end
            object ppContabChildReport2Label3: TppLabel
              UserName = 'ppContabChildReport2Label3'
              AutoSize = False
              Caption = 'C. Reduz'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 25665
              mmTop = 6350
              mmWidth = 12171
              BandType = 0
            end
            object ppContabChildReport2Label4: TppLabel
              UserName = 'ppContabChildReport2Label4'
              Caption = 'C. Contábil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 38629
              mmTop = 6350
              mmWidth = 15346
              BandType = 0
            end
            object ppContabChildReport2Label5: TppLabel
              UserName = 'ppContabChildReport2Label5'
              Caption = 'Descr. C. Contábil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 60854
              mmTop = 6350
              mmWidth = 24871
              BandType = 0
            end
            object ppContabChildReport2Label6: TppLabel
              UserName = 'ppContabChildReport2Label6'
              Caption = 'Valor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 107421
              mmTop = 6350
              mmWidth = 7408
              BandType = 0
            end
            object ppContabChildReport2Label7: TppLabel
              UserName = 'ppContabChildReport2Label7'
              Caption = 'Lançamentos (Parcelados/Agrupados)'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 110331
              mmTop = 794
              mmWidth = 63500
              BandType = 0
            end
            object ppContabChildReport2Label8: TppLabel
              UserName = 'ppContabChildReport2Label8'
              Caption = 'Histórico'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 120650
              mmTop = 6350
              mmWidth = 12965
              BandType = 0
            end
            object ppContabChildReport2Label9: TppLabel
              UserName = 'ppContabChildReport2Label9'
              Caption = 'Centro de Custo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 177800
              mmTop = 6350
              mmWidth = 22490
              BandType = 0
            end
            object ppContabChildReport2Label10: TppLabel
              UserName = 'ppContabChildReport2Label10'
              Caption = 'Unidade de Negócio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 214048
              mmTop = 6350
              mmWidth = 26988
              BandType = 0
            end
            object ppContabChildReport2Label11: TppLabel
              UserName = 'ppContabChildReport2Label11'
              Caption = 'Sub Conta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2911
              mmLeft = 244475
              mmTop = 6350
              mmWidth = 14288
              BandType = 0
            end
          end
          object ppContabChildReport2DetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppContabChildReport2DBText1: TppDBText
              UserName = 'ppContabChildReport2DBText1'
              AutoSize = True
              DataField = 'DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 0
              mmTop = 265
              mmWidth = 6615
              BandType = 4
            end
            object ppContabChildReport2DBText2: TppDBText
              UserName = 'ppContabChildReport2DBText2'
              DataField = 'PLNPLANIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 13494
              mmTop = 265
              mmWidth = 11113
              BandType = 4
            end
            object ppContabChildReport2DBText3: TppDBText
              UserName = 'ppContabChildReport2DBText3'
              DataField = 'PLAREDUZ'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 25665
              mmTop = 265
              mmWidth = 12171
              BandType = 4
            end
            object ppContabChildReport2DBText4: TppDBText
              UserName = 'ppContabChildReport2DBText4'
              DataField = 'PLACONTA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 38629
              mmTop = 265
              mmWidth = 20638
              BandType = 4
            end
            object ppContabChildReport2DBText5: TppDBText
              UserName = 'ppContabChildReport2DBText5'
              DataField = 'PLANOME'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 60854
              mmTop = 265
              mmWidth = 37835
              BandType = 4
            end
            object ppContabChildReport2DBText6: TppDBText
              UserName = 'ppContabChildReport2DBText6'
              AutoSize = True
              DataField = 'VALOR'
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 107156
              mmTop = 265
              mmWidth = 8202
              BandType = 4
            end
            object ppContabChildReport2DBText7: TppDBText
              UserName = 'ppContabChildReport2DBText7'
              DataField = 'LACDEBCRE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 115888
              mmTop = 265
              mmWidth = 3704
              BandType = 4
            end
            object ppContabChildReport2DBText9: TppDBText
              UserName = 'ppContabChildReport2DBText9'
              DataField = 'NOMECC'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 177800
              mmTop = 265
              mmWidth = 35190
              BandType = 4
            end
            object ppContabChildReport2DBText10: TppDBText
              UserName = 'ppContabChildReport2DBText10'
              DataField = 'NOME'
              DataPipeline = bdeContab
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'bdeContab'
              mmHeight = 2910
              mmLeft = 214048
              mmTop = 265
              mmWidth = 27781
              BandType = 4
            end
            object ppContabChildReport2DBText11: TppDBText
              UserName = 'ppContabChildReport2DBText11'
              DataField = 'NOMESUBCONTA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 244475
              mmTop = 265
              mmWidth = 39688
              BandType = 4
            end
            object ppContabChildReport2DBMemo1: TppDBMemo
              UserName = 'ppContabChildReport2DBMemo1'
              CharWrap = False
              DataField = 'HISTLANCAMENTOCONTABIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 2910
              mmLeft = 120915
              mmTop = 265
              mmWidth = 56092
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
      object ppContabBAIXA3: TppSubReport
        UserName = 'ppContabBAIXA3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppContab2
        TraverseAllData = False
        DataPipelineName = 'BDECONTABPARC'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 11113
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppContabChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = BDECONTABPARC
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
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'BDECONTABPARC'
          object ppContabChildReport3HeaderBand1: TppHeaderBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 10054
            mmPrintPosition = 0
            object ppContabChildReport3Label1: TppLabel
              UserName = 'ppContabChildReport3Label1'
              Caption = 'Dt. Lanc.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 0
              mmTop = 6350
              mmWidth = 12171
              BandType = 0
            end
            object ppContabChildReport3Label2: TppLabel
              UserName = 'ppContabChildReport3Label2'
              AutoSize = False
              Caption = 'Planilha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 13494
              mmTop = 6350
              mmWidth = 11113
              BandType = 0
            end
            object ppContabChildReport3Label3: TppLabel
              UserName = 'ppContabChildReport3Label3'
              AutoSize = False
              Caption = 'C. Reduz'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 25400
              mmTop = 6350
              mmWidth = 12171
              BandType = 0
            end
            object ppContabChildReport3Label4: TppLabel
              UserName = 'ppContabChildReport3Label4'
              Caption = 'C. Contábil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 38629
              mmTop = 6350
              mmWidth = 15346
              BandType = 0
            end
            object ppContabChildReport3Label5: TppLabel
              UserName = 'ppContabChildReport3Label5'
              Caption = 'Descr. C. Contábil'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 60854
              mmTop = 6350
              mmWidth = 24871
              BandType = 0
            end
            object ppContabChildReport3Label7: TppLabel
              UserName = 'ppContabChildReport3Label7'
              Caption = 'Lançamentos Baixados'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 125148
              mmTop = 794
              mmWidth = 35454
              BandType = 0
            end
            object ppContabChildReport3Label6: TppLabel
              UserName = 'ppContabChildReport3Label6'
              Caption = 'Valor'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 107421
              mmTop = 6350
              mmWidth = 7408
              BandType = 0
            end
            object ppContabChildReport3Label8: TppLabel
              UserName = 'ppContabChildReport3Label8'
              Caption = 'Histórico'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 120650
              mmTop = 6350
              mmWidth = 12965
              BandType = 0
            end
            object ppContabChildReport3Label9: TppLabel
              UserName = 'ppContabChildReport3Label9'
              Caption = 'Centro de Custo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 177800
              mmTop = 6615
              mmWidth = 22490
              BandType = 0
            end
            object ppContabChildReport3Label10: TppLabel
              UserName = 'ppContabChildReport3Label10'
              Caption = 'Unidade de Negócio'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 214049
              mmTop = 6615
              mmWidth = 26988
              BandType = 0
            end
            object ppContabChildReport3Label11: TppLabel
              UserName = 'ppContabChildReport3Label11'
              Caption = 'Sub Conta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 243682
              mmTop = 6615
              mmWidth = 14288
              BandType = 0
            end
          end
          object ppContabChildReport3DetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3175
            mmPrintPosition = 0
            object ppContabChildReport3DBText1: TppDBText
              UserName = 'ppContabChildReport3DBText1'
              AutoSize = True
              DataField = 'DATA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 0
              mmTop = 0
              mmWidth = 6615
              BandType = 4
            end
            object ppContabChildReport3DBText2: TppDBText
              UserName = 'ppContabChildReport3DBText2'
              DataField = 'PLNPLANIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 13494
              mmTop = 0
              mmWidth = 11113
              BandType = 4
            end
            object ppContabChildReport3DBText3: TppDBText
              UserName = 'ppContabChildReport3DBText3'
              DataField = 'PLAREDUZ'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 25400
              mmTop = 0
              mmWidth = 12172
              BandType = 4
            end
            object ppContabChildReport3DBText4: TppDBText
              UserName = 'ppContabChildReport3DBText4'
              DataField = 'CONTACONTABIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 38629
              mmTop = 0
              mmWidth = 20638
              BandType = 4
            end
            object ppContabChildReport3DBText5: TppDBText
              UserName = 'ppContabChildReport3DBText5'
              DataField = 'PLANOME'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 60854
              mmTop = 0
              mmWidth = 37835
              BandType = 4
            end
            object ppContabChildReport3DBText6: TppDBText
              UserName = 'ppContabChildReport3DBText6'
              AutoSize = True
              DataField = 'VALOR'
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 107156
              mmTop = 265
              mmWidth = 8202
              BandType = 4
            end
            object ppContabChildReport3DBText7: TppDBText
              UserName = 'ppContabChildReport3DBText7'
              DataField = 'DEBCRE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 115888
              mmTop = 265
              mmWidth = 3704
              BandType = 4
            end
            object ppContabChildReport3DBText9: TppDBText
              UserName = 'ppContabChildReport3DBText9'
              DataField = 'NOMECC'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 177800
              mmTop = 265
              mmWidth = 35190
              BandType = 4
            end
            object ppContabChildReport3DBText10: TppDBText
              UserName = 'ppContabChildReport3DBText10'
              DataField = 'NOMEAP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 214048
              mmTop = 265
              mmWidth = 27781
              BandType = 4
            end
            object ppContabChildReport3DBText11: TppDBText
              UserName = 'ppContabChildReport3DBText11'
              DataField = 'NOMESUBCONTA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 2910
              mmLeft = 243682
              mmTop = 265
              mmWidth = 40746
              BandType = 4
            end
            object ppContabChildReport3DBMemo1: TppDBMemo
              UserName = 'ppContabChildReport3DBMemo1'
              CharWrap = False
              DataField = 'HISTORICO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Small Fonts'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Stretch = True
              Transparent = True
              mmHeight = 2910
              mmLeft = 120650
              mmTop = 265
              mmWidth = 56092
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
        end
      end
    end
  end
  object dscontab: TwwDataSource
    DataSet = CdsContab
    Left = 100
    Top = 58
  end
  object SqlContab: TCMSqlParams
    ClientDataSet = CdsContab
    Left = 64
    Top = 56
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 56
  end
  object CdsContabBaixado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 120
  end
  object SqlContabBaixado: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    CONTACONTABIL,'
      '    NOMECC,'
      '    NOMESUBCONTA,'
      '    NOMEAP,'
      '    CODCENTROCUSTO,  CODSUBCONTA, UNIDNEGOC,'
      '    HISTORICO,'
      '    DEBCRE,'
      '    VALOR,'
      '    PLNPLANIL,'
      '    PLANOME,'
      '    PLAREDUZ  , PLNCODIGO , data'
      'FROM'
      '   (SELECT'
      '       PC.PLACONTA AS CONTACONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       '#39#39' AS NOMESUBCONTA,'
      
        '       ('#39'                         '#39') AS NOMEAP,  cc.CODCENTROCUS' +
        'TO,  0 as CODSUBCONTA, 0 as UNIDNEGOC,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNPLANIL,'
      
        '       PCONTA.PLANOME, PCONTA.PLAREDUZ   ,pl.PLNCODIGO , pl.plnd' +
        'atdia as data'
      '    FROM'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       PESSOA PB,'
      '       TIPODOCRECPAG TD,'
      '       PESSOA PD,'
      '       CENTCUST CC,'
      '       PLANOCONTA  PCONTA,'
      '      (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '       FROM'
      '           LANCTODOCUM'
      '       WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.OPERACAO = '#39'15'#39') OR (D.STATUS = '#39'2'#39') OR ((D.STATUS = ' +
        '0) AND (L.ESTORNO > 0))) AND'
      '       (PCONTA.PLANO(+) = PC.PLANO)               AND'
      '       (PCONTA.PLACONTA(+) = PC.PLACONTA)         AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO)       AND'
      '       (D.IDFORCLI = PD.IDPESSOA)                 AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)                AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)          AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'          AND'
      '       (B.IDPESSOA = PB.IDPESSOA)                 AND'
      '       (D.IDFORCLI = E.IDFORCLI)                  AND'
      '       (D.IDPESSOA = E.IDPESSOA)                  AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)           AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)               AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)               AND'
      '       (CC.CODCENTROCUSTO(+) = PC.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = PC.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      ''
      'UNION'
      '    SELECT'
      
        '       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTAC' +
        'ONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       SC.NOMESUBCONTA,'
      
        '       ('#39'                         '#39') AS NOMEAP,  cc.CODCENTROCUS' +
        'TO,  sc.CODSUBCONTA, 0 as UNIDNEGOC,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       L.DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNPLANIL,'
      
        '       PCONTA.PLANOME, PCONTA.PLAREDUZ   ,pl.PLNCODIGO   , pl.pl' +
        'ndatdia as data'
      '    FROM'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       PESSOA PB,'
      '       TIPODOCRECPAG TD,'
      '       PESSOA PD,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       PLANOCONTA  PCONTA,'
      '       (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '        FROM'
      '           LANCTODOCUM'
      '        WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.OPERACAO = '#39'15'#39') OR (D.STATUS = '#39'2'#39') OR ((D.STATUS = ' +
        '0) AND (L.ESTORNO > 0))) AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '       (D.IDFORCLI = PD.IDPESSOA)           AND'
      '       (PCONTA.PLANO(+) = D.PLANO)          AND'
      '       (PCONTA.PLACONTA(+) = D.PLACONTA)    AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)          AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'    AND'
      '       (B.IDPESSOA = PB.IDPESSOA)           AND'
      '       (D.IDFORCLI = E.IDFORCLI)            AND'
      '       (D.IDPESSOA = E.IDPESSOA)            AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)         AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '       (SC.CODSUBCONTA(+) = D.CODSUBCONTA)       AND'
      '       (SC.IDPESSOA(+) = D.IDPESSOA)             AND'
      '       (CC.CODCENTROCUSTO(+) = D.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = D.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      '     )'
      'ORDER BY'
      '  data,PLNCODIGO , DEBCRE DESC'
      '')
    ClientDataSet = CdsContabBaixado
    Left = 64
    Top = 120
  end
  object CdsContaParc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 88
  end
  object SqlContaParc: TCMSqlParams
    SQL.Strings = (
      'SELECT  DISTINCT'
      
        '       Q2.LACDEBCRE, Q2.PLACONTA,  decode(Q3.VALOR,0,0, ((Q1.VAL' +
        'OR * Q2.LACVALOR)/ Q3.VALOR)) AS VALOR,'
      
        '       Q2.NOMECC, Q2.NOMEAP, Q2.NOMESUBCONTA,  Q2.CODCENTROCUSTO' +
        ',  Q2.CODSUBCONTA, Q2.UNIDNEGOC,'
      '       Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL,'
      
        '       Q2.PLNPLANIL, Q2.PLANOME, Q2.PLAREDUZ ,Q2.PLNCODIGO ,Q2.l' +
        'acnumlan,data'
      'FROM'
      '   (SELECT'
      
        '       LAN.VALOR, DOC.NUMFATURA, '#39'LANÇAMENTO DO DOCUMENTO '#39' || D' +
        'OC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL AS ' +
        'HISTORICOCOMPL'
      '    FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LAN,'
      '       PESSOA P'
      '    WHERE'
      '      ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '      (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '      (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '   (SELECT'
      
        '       DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, L' +
        'AN.VALOR,'
      
        '       CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA, cc' +
        '.CODCENTROCUSTO, sc.CODSUBCONTA, ap.UNIDNEGOC,'
      
        '       LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 ' +
        '|| LC.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      
        '       P.PLNPLANIL, PC.PLANOME, PC.PLAREDUZ  , p.plndatdia as da' +
        'ta,LC.PLNCODIGO ,LC.lacnumlan'
      '    FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LAN,'
      '       LANCAMENTO LC,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       UNIDNEGOCIO AP,'
      '       PLANILHA P,'
      '       PLANOCONTA PC'
      '    WHERE'
      '       ((LAN.OPERACAO = '#39'1'#39') OR (LAN.OPERACAO = '#39'11'#39')) AND'
      '       (DOC.NUMFATURA IS NOT NULL)                AND'
      '       (PC.PLANO = LC.PLANO)                      AND'
      '       (PC.PLACONTA = LC.PLACONTA)                AND'
      '       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)      AND'
      '       (AP.UNIDNEGOC(+) = LC.UNIDNEGOC)           AND'
      '       (AP.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '       (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND'
      '       (SC.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '       (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND'
      '       (LC.PLNCODIGO = P.PLNCODIGO)               AND'
      '       (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2,'
      
        '      (SELECT D.NUMFATURA, SUM(L.VALOR) AS VALOR FROM LANCTODOCU' +
        'M L, DOCUMENTO D'
      '       WHERE ((L.OPERACAO = '#39'1'#39') OR (L.OPERACAO = '#39'11'#39')) AND'
      '             (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '             (D.OPERACAO = L.OPERACAO) AND'
      '             (D.NUMFATURA IS NOT NULL)'
      '             GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'ORDER BY'
      'data,Q2.PLNCODIGO ,Q2.lacnumlan,Q2.LACDEBCRE DESC')
    ClientDataSet = CdsContaParc
    Left = 64
    Top = 88
  end
  object BDECONTABBAIXA: TppBDEPipeline
    DataSource = dsContabBaixado
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDECONTABBAIXA'
    Left = 132
    Top = 135
  end
  object BDECONTABPARC: TppBDEPipeline
    DataSource = dsContaParc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDECONTABPARC'
    Left = 132
    Top = 90
  end
  object dsContaParc: TwwDataSource
    DataSet = CdsContaParc
    Left = 100
    Top = 90
  end
  object dsContabBaixado: TwwDataSource
    DataSet = CdsContabBaixado
    Left = 100
    Top = 135
  end
end
