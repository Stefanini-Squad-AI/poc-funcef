inherited RptDocAbertos: TRptDocAbertos
  Left = 389
  Top = 201
  Width = 266
  Height = 258
  Caption = 'RptDocAbertos'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Pagamentos em Aberto'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = ' Data Programada Inicial '
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
        Caption = ' Data Programada Final'
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
        Caption = 'Contas/Caixas x Forma de Pag'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '35'
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
        Caption = 'Tipo de Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '35'
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
        Caption = 'Cliente / Fornecedor'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 240
    FormWidth = 530
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptDocAbertos
    LabelEmpresa = ppLabel87
    LabelSistema = ppLabel100
  end
  object DsDocAbertos: TwwDataSource
    DataSet = CdsDocAbertos
    Left = 137
    Top = 73
  end
  object PpDocAbertos: TppBDEPipeline
    DataSource = DsDocAbertos
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'PpDocAbertos'
    Left = 177
    Top = 76
    object PpDocAbertosppField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField2: TppField
      FieldAlias = 'DOC'
      FieldName = 'DOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField3: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField4: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField5: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField6: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField7: TppField
      FieldAlias = 'VALOROUTRA'
      FieldName = 'VALOROUTRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField8: TppField
      FieldAlias = 'DESCFORMARECPAG'
      FieldName = 'DESCFORMARECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDocAbertosppField9: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object RptDocAbertos: TppReport
    AutoStop = False
    DataPipeline = PpDocAbertos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 225
    Top = 85
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDocAbertos'
    object ppHeaderBand23: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLine44: TppLine
        UserName = 'ppLine44'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 185000
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 77523
        mmTop = 529
        mmWidth = 29633
        BandType = 0
      end
      object LblDocAberto: TppLabel
        UserName = 'LblDocAberto'
        Caption = 'Documentos Em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 68263
        mmTop = 6615
        mmWidth = 48154
        BandType = 0
      end
      object ppLabelCliFor: TppLabel
        UserName = 'LabelCliFor'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 17463
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 38894
        mmTop = 17463
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 17463
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel99: TppLabel
        UserName = 'ppLabel99'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 67733
        mmTop = 17463
        mmWidth = 12965
        BandType = 0
      end
      object RptDocAbertosLabel2: TppLabel
        UserName = 'RptDocAbertosLabel2'
        AutoSize = False
        Caption = 'Saldo Outra Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 17463
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'ppLabel94'
        Caption = 'Lancto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 55827
        mmTop = 17463
        mmWidth = 9790
        BandType = 0
      end
      object LblTipoCobranca: TppLabel
        UserName = 'LblTipoCobranca'
        Caption = 'Tipo de Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 17463
        mmWidth = 25400
        BandType = 0
      end
      object RptDocAbertosRegion1: TppRegion
        UserName = 'RptDocAbertosRegion1'
        Caption = 'RptDocAbertosRegion1'
        Pen.Color = clWhite
        Stretch = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 11642
        mmWidth = 185473
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object RptDocAbertosMemo1: TppMemo
          UserName = 'RptDocAbertosMemo1'
          Caption = 'RptDocAbertosMemo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Stretch = True
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 12435
          mmWidth = 183092
          BandType = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppDetailBand24: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 38629
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'DOC'
        DataPipeline = PpDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 38894
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
        DataField = 'DATALANCTO'
        DataPipeline = PpDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 265
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'ppDBText29'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 67733
        mmTop = 265
        mmWidth = 34660
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'ppDBText30'
        DataField = 'VALOROUTRA'
        DataPipeline = PpDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 134938
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText31'
        DataField = 'VALOR'
        DataPipeline = PpDocAbertos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 265
        mmWidth = 26988
        BandType = 4
      end
      object RptDocAbertosDBText2: TppDBText
        UserName = 'RptDocAbertosDBText2'
        DataField = 'DESCFORMARECPAG'
        DataPipeline = PpDocAbertos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 102923
        mmTop = 265
        mmWidth = 27781
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLabel100: TppLabel
        UserName = 'ppLabel100'
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
        mmTop = 529
        mmWidth = 39423
        BandType = 8
      end
      object ppLine46: TppLine
        UserName = 'ppLine46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 185000
        BandType = 8
      end
      object ppCalc41: TppSystemVariable
        UserName = 'Calc41'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 529
        mmWidth = 75142
        BandType = 8
      end
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel101: TppLabel
        UserName = 'ppLabel101'
        Caption = 'Total Em Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 113506
        mmTop = 265
        mmWidth = 23283
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'ppDBCalc2'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpDocAbertos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocAbertos'
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 265
        mmWidth = 20108
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'DATAPROGRAMADA'
      DataPipeline = PpDocAbertos
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDocAbertos'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptDocAbertosDBText1: TppDBText
          UserName = 'RptDocAbertosDBText1'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = PpDocAbertos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpDocAbertos'
          mmHeight = 3704
          mmLeft = 26194
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object RptDocAbertosLabel1: TppLabel
          UserName = 'RptDocAbertosLabel1'
          Caption = 'Data Programada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 265
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object RptDocAbertosLabel3: TppLabel
          UserName = 'RptDocAbertosLabel3'
          Caption = 'Subtotal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 124884
          mmTop = 0
          mmWidth = 11113
          BandType = 5
          GroupNo = 0
        end
        object RptDocAbertosDBCalc1: TppDBCalc
          UserName = 'RptDocAbertosDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpDocAbertos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpDocAbertos'
          mmHeight = 3175
          mmLeft = 164571
          mmTop = 0
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object RptDocAbertosLine1: TppLine
          UserName = 'RptDocAbertosLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4233
          mmWidth = 185000
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          OnPrint = ppLabel1Print
          UserName = 'Label1'
          Caption = 'Não há lançamentos em aberto para o período indicado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 265
          mmWidth = 72761
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object CdsDocAbertos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 128
  end
  object SqlDocAbertos: TCMSqlParams
    SQL.Strings = (
      'SELECT  P.RAZAOSOCIAL,'
      '       (D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUMENTO) AS DOC,'
      '        D.DATAPROGRAMADA,'
      '        L.DATALANCTO,'
      '        L.HISTORICOCOMPL,'
      
        '        DECODE(D.RECPAG,'#39'P'#39',saldo.svalor,(SALDO.SVALOR*-1)) AS V' +
        'ALOR,'
      
        '        DECODE(D.RECPAG,'#39'P'#39',saldo.svaloroutramoeda,(saldo.svalor' +
        'outramoeda*-1)) AS VALOROUTRA,'
      '        F.DESCRICAO AS DESCFORMARECPAG,'
      '        P.NOME'
      'FROM    DOCUMENTO D,'
      '        LANCTODOCUM L,'
      '        PESSOA P,'
      '        FORMARECPAG F,'
      '        (SELECT  D.CODDOCUMENTO,'
      
        '                 SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1) )' +
        ' AS SVALOR,'
      
        '                 SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VAL' +
        'OROUTRAMOEDA * -1)) AS SVALOROUTRAMOEDA'
      '         FROM DOCUMENTO D,LANCTODOCUM L'
      '         WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '         GROUP BY D.CODDOCUMENTO'
      '         HAVING'
      
        '-- by Carlos - 01/03/2001 - inicio - desconsidera documentos com' +
        ' saldo inferior a 1 centavo'
      
        '           (ABS(SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1))) ' +
        '>= 0.01) OR'
      
        '           (ABS(SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALO' +
        'ROUTRAMOEDA * -1))) >= 0.01)) SALDO'
      
        '-- by Carlos - 01/03/2001 - final - documentos com saldo inferio' +
        'r a 1 centavo'
      '-- anterior - inicio - desconsidera documentos com saldo zerado'
      
        '--           (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1)) <> ' +
        '0) OR'
      
        '--           (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALORO' +
        'UTRAMOEDA * -1)) <> 0)) SALDO'
      '-- anterior - final - desconsidera documentos com saldo zerado'
      
        'WHERE   ((LTRIM(RTRIM(D.STATUS)) <> '#39'2'#39') OR (D.STATUS IS NULL)) ' +
        'AND'
      '        (D.RECPAG = :PRECPAG) AND'
      '        (D.IDPESSOA = :PIDPESSOA) AND'
      '        (D.DATAPROGRAMADA <= :PDATA) AND'
      '        (D.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39')) AND'
      '        (D.CODFORMA = F.CODFORMA(+)) AND'
      '        (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '        (D.OPERACAO = L.OPERACAO) AND'
      '        (L.ESTORNO IS NULL) AND'
      '        (D.IDFORCLI = P.IDPESSOA) AND'
      '        (D.CODDOCUMENTO = SALDO.CODDOCUMENTO(+))'
      'ORDER BY'
      '      D.DATAPROGRAMADA, P.RAZAOSOCIAL'
      ''
      ''
      ' ')
    ClientDataSet = CdsDocAbertos
    Left = 48
    Top = 64
  end
end
