inherited RptDemSintGest: TRptDemSintGest
  Left = 637
  Top = 26
  Width = 375
  Height = 303
  Caption = 'RptDemSintGest'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Centro de Responsabilidade'
        Controle = tcListBox
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
        ListBoxSettings.MultiSelect = True
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 150
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
        Caption = 'Listar Documento Referentes A Lançamentos de CPMF'
        Controle = tcCheckBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        Caption = ' Data para Seleção '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Inclusão'
          'Emissão'
          'Programada')
        RadioGroupSettings.Values.Strings = ()
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
        Caption = ' Situação '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Em Aberto'
          'Baixados'
          'Todos')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 2
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
        Caption = ' Status do Documento '
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Com A.P.'
          'Sem A.P.'
          'Todos')
        RadioGroupSettings.Values.Strings = ()
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
        Caption = 'Preiodo Inicial'
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
        Caption = 'Periodo Final'
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
      end>
    FormWidth = 590
    Left = 164
  end
  inherited DevRptCM: TExtraOptions
    Left = 48
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = Rptdemsintgest
    Left = 107
  end
  object Dsdemsintgest: TwwDataSource
    DataSet = CdsAuxDemSintGest
    Left = 132
    Top = 103
  end
  object PpDemsintgest: TppBDEPipeline
    DataSource = Dsdemsintgest
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'PpDemsintgest'
    Left = 220
    Top = 159
    object PpDemsintgestppField1: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDemsintgestppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDemsintgestppField3: TppField
      FieldAlias = 'VALORATU'
      FieldName = 'VALORATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDemsintgestppField4: TppField
      FieldAlias = 'VALORANT'
      FieldName = 'VALORANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDemsintgestppField5: TppField
      FieldAlias = 'ANASINT'
      FieldName = 'ANASINT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDemsintgestppField6: TppField
      FieldAlias = 'QUEBRA'
      FieldName = 'QUEBRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDemsintgestppField7: TppField
      FieldAlias = 'DESCR'
      FieldName = 'DESCR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object Rptdemsintgest: TppReport
    AutoStop = False
    DataPipeline = PpDemsintgest
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 16500
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 16500
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 246
    Top = 103
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDemsintgest'
    object ppHeaderBand10: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLabel47: TppLabel
        UserName = 'ppLabel47'
        Caption = 'cabeçalho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 88106
        mmTop = 6350
        mmWidth = 20902
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'ppLine24'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 265
        mmWidth = 29633
        BandType = 0
      end
      object rptdemsintgestRegion1: TppRegion
        UserName = 'rptdemsintgestRegion1'
        Caption = 'rptdemsintgestRegion1'
        Pen.Color = clWhite
        Stretch = True
        mmHeight = 7673
        mmLeft = 0
        mmTop = 11906
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rptdemsintgestMemo1: TppMemo
          UserName = 'rptdemsintgestMemo1'
          Caption = 'rptdemsintgestMemo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Stretch = True
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 1587
          mmTop = 13493
          mmWidth = 194734
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppDetailBand13: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'CODTIPRECDES'
        DataPipeline = PpDemsintgest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDemsintgest'
        mmHeight = 3704
        mmLeft = 795
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'DESCRICAO'
        DataPipeline = PpDemsintgest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'PpDemsintgest'
        mmHeight = 3704
        mmLeft = 28840
        mmTop = 0
        mmWidth = 98161
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        AutoSize = True
        DataField = 'VALORANT'
        DataPipeline = PpDemsintgest
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDemsintgest'
        mmHeight = 3175
        mmLeft = 149490
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        AutoSize = True
        DataField = 'VALORATU'
        DataPipeline = PpDemsintgest
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDemsintgest'
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object rptdemsintgestLine2: TppLine
        UserName = 'rptdemsintgestLine2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object rptdemsintgestLine1: TppLine
        UserName = 'rptdemsintgestLine1'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 197115
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 795
        mmTop = 3440
        mmWidth = 27252
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 3440
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
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
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object rptdemsintgestShape3: TppShape
        UserName = 'rptdemsintgestShape3'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 265
        mmWidth = 197381
        BandType = 7
      end
      object ppLabel79: TppLabel
        UserName = 'ppLabel79'
        Caption = 'Total '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 795
        mmTop = 794
        mmWidth = 9525
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'ppDBCalc3'
        DataField = 'VALORATU'
        DataPipeline = PpDemsintgest
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDemsintgest'
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 1058
        mmWidth = 28310
        BandType = 7
      end
      object rptdemsintgestDBCalc3: TppDBCalc
        UserName = 'rptdemsintgestDBCalc3'
        DataField = 'VALORANT'
        DataPipeline = PpDemsintgest
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDemsintgest'
        mmHeight = 4233
        mmLeft = 136525
        mmTop = 1058
        mmWidth = 28310
        BandType = 7
      end
    end
    object rptdemsintgestGroup1: TppGroup
      BreakName = 'QUEBRA'
      DataPipeline = PpDemsintgest
      OutlineSettings.CreateNode = True
      UserName = 'rptdemsintgestGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDemsintgest'
      object rptdemsintgestGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rptdemsintgestShape1: TppShape
          UserName = 'rptdemsintgestShape1'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rptdemsintgestDBText1: TppDBText
          UserName = 'rptdemsintgestDBText1'
          AutoSize = True
          DataField = 'DESCR'
          DataPipeline = PpDemsintgest
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpDemsintgest'
          mmHeight = 4233
          mmLeft = 794
          mmTop = 529
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object rptdemsintgestLabel2: TppLabel
          UserName = 'rptdemsintgestLabel2'
          Caption = 'Mês Ant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 150548
          mmTop = 529
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object rptdemsintgestLabel3: TppLabel
          UserName = 'rptdemsintgestLabel3'
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 189971
          mmTop = 529
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
      end
      object rptdemsintgestGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rptdemsintgestShape2: TppShape
          UserName = 'rptdemsintgestShape2'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197381
          BandType = 5
          GroupNo = 0
        end
        object rptdemsintgestDBCalc1: TppDBCalc
          UserName = 'rptdemsintgestDBCalc1'
          AutoSize = True
          DataField = 'VALORATU'
          DataPipeline = PpDemsintgest
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptdemsintgestGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpDemsintgest'
          mmHeight = 3440
          mmLeft = 191030
          mmTop = 529
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object rptdemsintgestDBCalc2: TppDBCalc
          UserName = 'rptdemsintgestDBCalc2'
          AutoSize = True
          DataField = 'VALORANT'
          DataPipeline = PpDemsintgest
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptdemsintgestGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpDemsintgest'
          mmHeight = 3440
          mmLeft = 159279
          mmTop = 529
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
        end
        object rptdemsintgestLabel4: TppLabel
          UserName = 'rptdemsintgestLabel4'
          Caption = 'Sub Total '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 795
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlDemSintGest: TCMSqlParams
    SQL.Strings = (
      
        '-- VERIFICAR Qrydemsintgest NO DTMCAPCAR POIS ESTA É A QRY OFICI' +
        'AL'
      'SELECT'
      
        '   CODTIPRECDES, DESCRICAO, SUM(VALORATU) AS VALORATU, SUM(VALOR' +
        'ANT) AS VALORANT,'
      '   ANASINT'
      'FROM'
      '  (SELECT'
      
        '      T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU, (0) AS VALOR' +
        'ANT, T.ANASINT'
      '   FROM'
      '      TIPORECEBDESEMB T'
      '   WHERE'
      
        '      T.ANASINT = '#39'S'#39' AND  T.RECPAG=:PRECPAG AND T.IDPESSOA=:PID' +
        'PESSOA'
      '   UNION'
      '   SELECT'
      '      T.CODTIPRECDES, T.DESCRICAO,'
      
        '      SUM(DECODE(T.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',R.VALOR,R.VALO' +
        'R * -1),'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',R.VALOR,R.VALOR * -1))) AS VALORATU ,(' +
        '0) AS VALORANT,'
      '      T.ANASINT'
      '   FROM'
      
        '      TIPORECEBDESEMB T, RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO' +
        ' D'
      '   WHERE'
      '-- TO_CHAR(D.DATAVENCTO,'#39'MMYYYY'#39')= PANOMESATU AND'
      '-- #ADF1'
      '      T.RECPAG = :PRECPAG AND'
      
        '      T.IDPESSOA = :PIDPESSOA AND T.ANASINT = '#39'A'#39' AND T.CODTIPRE' +
        'CDES  = R.CODTIPRECDES AND'
      
        '      T.IDPESSOA = R.IDPESSOA AND T.RECPAG = R.RECPAG AND D.CODD' +
        'OCUMENTO = R.CODDOCUMENTO AND'
      
        '      D.CODDOCUMENTO = L.CODDOCUMENTO AND D.OPERACAO = L.OPERACA' +
        'O AND L.ESTORNO IS NULL'
      '   GROUP BY'
      '      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG'
      '   UNION'
      '   SELECT'
      '      T.CODTIPRECDES, T.DESCRICAO, (0) AS VALORATU,'
      
        '      DECODE(T.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',SUM(R.VALOR),SUM(R' +
        '.VALOR) * -1),'
      
        '      DECODE(L.DEBCRE,'#39'D'#39',SUM(R.VALOR),SUM(R.VALOR) * -1)) AS VA' +
        'LORANT ,'
      '      T.ANASINT'
      '   FROM'
      
        '      TIPORECEBDESEMB T, RATEIODOCUM R, LANCTODOCUM L, DOCUMENTO' +
        ' D,'
      '      CENTRESPON CR'
      '   WHERE'
      '-- TO_CHAR(D.DATAVENCTO,'#39'MMYYYY'#39')= PANOMESANT AND'
      '-- #ADF2'
      '      T.RECPAG = :PRECPAG AND'
      
        '      T.IDPESSOA = :PIDPESSOA AND T.ANASINT = '#39'A'#39' AND T.CODTIPRE' +
        'CDES = R.CODTIPRECDES AND'
      
        '      T.IDPESSOA = R.IDPESSOA AND T.RECPAG = R.RECPAG AND D.CODD' +
        'OCUMENTO = R.CODDOCUMENTO AND'
      
        '      D.CODDOCUMENTO = L.CODDOCUMENTO AND D.OPERACAO = L.OPERACA' +
        'O AND CR.IDPESSOA = R.IDPESSOA(+) AND'
      
        '      CR.CODCENTRORESPON = R.CODCENTRORESPON(+) AND L.ESTORNO IS' +
        ' NULL '
      '   GROUP BY'
      
        '      T.CODTIPRECDES, T.DESCRICAO, T.ANASINT, L.DEBCRE, T.RECPAG' +
        #39')'
      'GROUP BY'
      '   CODTIPRECDES, DESCRICAO, ANASINT'
      'ORDER BY'
      '   CODTIPRECDES'
      ''
      ''
      '')
    ClientDataSet = CdsDemSintGest
    Left = 88
    Top = 56
  end
  object CdsDemSintGest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 56
  end
  object CdsAuxDemSintGest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 104
  end
  object SqlAuxDemSintGest: TCMSqlParams
    SQL.Strings = (
      
        'select t.codtiprecdes , t.descricao , 0 as valoratu ,0 as valora' +
        'nt ,'
      't.anasint,t.codtiprecdes as quebra, t.descricao as descr'
      'from tiporecebdesemb t '
      'where 1=2'
      ''
      '')
    ClientDataSet = CdsAuxDemSintGest
    Left = 96
    Top = 104
  end
  object CdsAutPagDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 160
  end
  object SqlAutPagDoc: TCMSqlParams
    SQL.Strings = (
      
        '-- VERIFICAR QryModeloAutPag NO DTMCAPCAR POIS ESTA É A QRY OFIC' +
        'IAL'
      'SELECT'
      '  NUMFATURA,'
      '  CODDOCUMENTO,'
      '  NUMAPGR,'
      '  REFERENCIA,'
      '  NODOCUMENTO,'
      '  COMPLDOCUMENTO,'
      '  DATAVENCTO,'
      '  DATAEMISSAO,'
      '  DATAPROGRAMADA,'
      '  NUMDOCUMENTO,'
      '  VALOR,'
      '  VALOROUTRAMOEDA,'
      '  RAZAOSOCIAL,'
      '  DESCRICAO,'
      '  VALORRATEIO,'
      '  DESCTDR,'
      '  NOMEAP,'
      '  NOMECR,'
      '  NOMECC,'
      '  OBS,'
      '  FLGDOCBANCARIO,'
      '  VLACRE,'
      '  VLDEC,'
      '  VLIMP,'
      '  VLLIQ,'
      '  TRGUSERINCLUSAO,'
      
        '  TO_DATE(TO_CHAR(TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39') AS' +
        ' TRGDTINCLUSAO,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  NUMIMOVEL,'
      '  NOMEPATRO,'
      '  DESCPLANO,'
      '  DESCPROGRAMA,'
      '  IDFORCLI,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ'
      'FROM'
      '  ('
      '    SELECT'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      L.VALOR,'
      '      L.VALOROUTRAMOEDA,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      RD.VALOR AS VALORRATEIO,'
      '      TDR.DESCRICAO AS DESCTDR,'
      '      AP.NOME AS NOMEAP,'
      '      CR.NOME AS NOMECR,'
      '      CC.NOME AS NOMECC,'
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '      (0) AS VLACRE,'
      '      (0) AS VLDEC,'
      '      (0) AS VLIMP,'
      '      (0) AS VLLIQ,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      RD.NUMIMOVEL,'
      '      PATRO.NOME AS NOMEPATRO,'
      '      PLANO.NOME AS DESCPLANO,'
      '      PROGRAMA.DESCPROGRAMA,'
      '      D.IDFORCLI'
      '    FROM'
      '      PESSOA P,'
      '      PESSOA PATRO,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      FORMARECPAG F,'
      '      CENTCUST CC,'
      '      RATEIODOCUM RD,'
      '      UNIDNEGOCIO AP,'
      '      CENTRESPON CR,'
      '      TIPORECEBDESEMB TDR,'
      '      PLANPREVCONTABIL PLANO,'
      '      PROGRAMA'
      '    WHERE'
      '-- #ADF1'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '      D.CODTIPDOC IN'
      '      ('
      '        SELECT'
      '          CODTIPDOC'
      '        FROM'
      '          TIPODOCRECPAG A'
      '        WHERE'
      '          A.RECPAG = :RECPAG AND'
      '          NOT EXISTS'
      '          ('
      '            SELECT'
      '              *'
      '            FROM'
      '              USUARIOXTPDOCTO B'
      '            WHERE'
      '              RECPAG = :RECPAG AND'
      '              B.IDUSUARIO = :IDUSUARIO'
      '          )'
      '        UNION'
      '          SELECT'
      '            CODTIPDOC'
      '          FROM'
      '            TIPODOCRECPAG A'
      '          WHERE'
      '            A.RECPAG = :RECPAG AND'
      '            EXISTS'
      '            ('
      '              SELECT'
      '                *'
      '              FROM'
      '                USUARIOXTPDOCTO B'
      '              WHERE'
      '                RECPAG = :RECPAG AND'
      '                A.CODTIPDOC = B.CODTIPDOC AND'
      '                B.IDUSUARIO = :IDUSUARIO'
      '            )'
      '      ) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.RECPAG = :RECPAG) AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (D.CODFORMA = F.CODFORMA(+)) AND'
      '      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '      (TDR.RECPAG(+) = RD.RECPAG) AND'
      '      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '      (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '      (CR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '      (PATRO.IDPESSOA(+) = RD.IDPATRO)'
      '    UNION'
      '      SELECT'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO ,'
      '        (0) AS VLACRE,'
      '        (0) AS VLDEC,'
      '        (0) AS VLIMP,'
      '        (0) AS VLLIQ,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '      FROM'
      '        ('
      '          SELECT'
      '            DOC.NUMFATURA,'
      '            DOC.CODDOCUMENTO,'
      '            DOC.NUMAPGR,'
      '            DOC.REFERENCIA,'
      '            DOC.NODOCUMENTO,'
      '            DOC.COMPLDOCUMENTO,'
      '            DOC.DATAVENCTO,'
      '            DOC.DATAEMISSAO,'
      '            DOC.DATAPROGRAMADA,'
      '            P.NUMDOCUMENTO,'
      '            LAN.VALOR,'
      '            LAN.VALOROUTRAMOEDA,'
      '            P.RAZAOSOCIAL,'
      '            F.DESCRICAO,'
      '            DOC.OBS,'
      '            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '            (0) AS VLACRE,'
      '            (0) AS VLDEC,'
      '            (0) AS VLIMP,'
      '            (0) AS VLLIQ,'
      '            DOC.TRGUSERINCLUSAO,'
      '            DOC.TRGDTINCLUSAO,'
      '            DOC.IDFORCLI'
      '          FROM'
      '            PESSOA P,'
      '            DOCUMENTO DOC,'
      '            LANCTODOCUM LAN,'
      '            FORMARECPAG F'
      '          WHERE'
      '-- #ADF2'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            DOC.CODTIPDOC IN'
      '            ('
      '              SELECT'
      '                CODTIPDOC'
      '              FROM'
      '                TIPODOCRECPAG A'
      '              WHERE'
      '                A.RECPAG = :RECPAG AND'
      '                NOT EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '              UNION'
      '                SELECT'
      '                  CODTIPDOC'
      '                FROM'
      '                  TIPODOCRECPAG A'
      '                WHERE'
      '                  A.RECPAG = :RECPAG AND'
      '                EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    A.CODTIPDOC = B.CODTIPDOC AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '            ) AND'
      '            (LAN.ESTORNO IS NULL) AND'
      '            (DOC.RECPAG = :RECPAG) AND'
      '            (DOC.IDPESSOA = :IDPESSOA) AND'
      '            (P.IDPESSOA = DOC.IDFORCLI) AND'
      '            (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '            (RTRIM(LAN.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)'
      '        ) Q1,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            RD.VALOR,'
      '            TDR.DESCRICAO AS DESCTDR,'
      '            AP.NOME AS NOMEAP,'
      '            CR.NOME AS NOMECR,'
      '            CC.NOME AS NOMECC,'
      '            RD.NUMIMOVEL,'
      '            PATRO.NOME AS NOMEPATRO,'
      '            PLANO.NOME AS DESCPLANO,'
      '            PROGRAMA.DESCPROGRAMA'
      '          FROM'
      '            PESSOA PATRO,'
      '            DOCUMENTO D,'
      '            RATEIODOCUM RD,'
      '            CENTCUST CC,'
      '            UNIDNEGOCIO AP,'
      '            CENTRESPON CR,'
      '            TIPORECEBDESEMB TDR,'
      '            PLANPREVCONTABIL PLANO,'
      '            PROGRAMA'
      '          WHERE'
      '-- #ADF3'
      
        '-- STRING PARA ADICIONAR FILTRO DAS TELAS DE PARÂMETRO NA CONSUL' +
        'TA'
      '            (D.RECPAG = :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (D.NUMFATURA IS NOT NULL) AND'
      '            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '            (TDR.RECPAG(+) = RD.RECPAG) AND'
      '            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '            (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND'
      '            (CR.IDPESSOA(+) = RD.IDPESSOA)'
      '        ) Q2,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            SUM(L.VALOR) AS VALOR'
      '          FROM'
      '            LANCTODOCUM L,'
      '            DOCUMENTO D'
      '          WHERE'
      '            (L.ESTORNO IS NULL) AND'
      '            (D.RECPAG= :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'11'#39')) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL)'
      '          GROUP BY'
      '            D.NUMFATURA'
      '        ) Q3'
      '      WHERE'
      '        (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '        (Q3.NUMFATURA = Q2.NUMFATURA)'
      '      GROUP BY'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '  )')
    ClientDataSet = CdsAutPagDoc
    Left = 88
    Top = 160
  end
  object CdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 208
  end
  object SqlCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODCENTRORESPON,'
      '  NOME,'
      '  ANALITICOSINTET,'
      '  CODCENTROCUSTO'
      'FROM'
      '  CENTRESPON'
      'WHERE'
      '  IDPESSOA = :IDPESSOA AND'
      '  RTRIM(CODCENTRORESPON) <> '#39'9999999999'#39
      'ORDER BY'
      '  CODCENTRORESPON, ANALITICOSINTET DESC')
    ClientDataSet = CdsCentroRespon
    Left = 88
    Top = 208
  end
end
