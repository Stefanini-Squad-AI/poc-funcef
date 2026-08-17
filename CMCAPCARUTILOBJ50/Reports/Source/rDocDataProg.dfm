inherited RptDocDataProg: TRptDocDataProg
  Left = 301
  Top = 191
  Width = 322
  Height = 233
  Caption = 'RptDocDataProg'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Documentos por Data Programada'
    Params = <
      item
        Caption = 'Data Programa dos Documentos Inicial'
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
        Caption = 'Data Programa dos Documentos Final'
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
        Caption = 'Tipo do Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'Descricao'
        LookupSettings.Descricao = 'DESCRIÇÃO'
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
        Caption = 'Tipo de Recebimento/Desembolso'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPRECDES'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'DESCRIÇÃO'
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
        Caption = 'Documentos'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Efetivos'
          'Previstos'
          'Ambos')
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
        Caption = 'Cliente / Fronecedor'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 275
    FormWidth = 650
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptDocDataProg
    LabelEmpresa = ppLabel8
    LabelSistema = ppLabel9
  end
  object DsDocDataProg: TwwDataSource
    DataSet = CdsDocDataProg
    Left = 137
    Top = 51
  end
  object PpDocDataProg: TppBDEPipeline
    DataSource = DsDocDataProg
    CloseDataSource = True
    UserName = 'PpDocDataProg'
    Left = 157
    Top = 99
    object PpDocDataProgppField1: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField2: TppField
      FieldAlias = 'FLGESTORNO'
      FieldName = 'FLGESTORNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField3: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField4: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField5: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField6: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField7: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField8: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField9: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField10: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField11: TppField
      FieldAlias = 'CGCCPF'
      FieldName = 'CGCCPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField12: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField13: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField14: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField15: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField16: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField17: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField18: TppField
      FieldAlias = 'CODTIPDOC'
      FieldName = 'CODTIPDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField19: TppField
      FieldAlias = 'DESCTIPODOC'
      FieldName = 'DESCTIPODOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField20: TppField
      FieldAlias = 'MENSAGEM'
      FieldName = 'MENSAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpDocDataProgppField21: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
  end
  object RptDocDataProg: TppReport
    AutoStop = False
    DataPipeline = PpDocDataProg
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
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
    Left = 241
    Top = 43
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDocDataProg'
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121973
        mmTop = 529
        mmWidth = 28046
        BandType = 0
      end
      object RptDocDataProgLine2: TppLine
        UserName = 'RptDocDataProgLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 272000
        BandType = 0
      end
      object ppLine66: TppLine
        UserName = 'Line66'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 272000
        BandType = 0
      end
      object pplTitRelatDataProg: TppLabel
        UserName = 'lTitRelatDataProg'
        Caption = 'Documentos em Aberto por Data Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5292
        mmLeft = 89959
        mmTop = 8731
        mmWidth = 92075
        BandType = 0
      end
      object ppLabel159: TppLabel
        UserName = 'Label159'
        AutoSize = False
        Caption = 'Tipo de Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 178330
        mmTop = 22225
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel157: TppLabel
        UserName = 'Label157'
        AutoSize = False
        Caption = 'Valor a Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 133615
        mmTop = 22225
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel156: TppLabel
        UserName = 'Label156'
        AutoSize = False
        Caption = 'Vencimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114036
        mmTop = 22225
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel155: TppLabel
        UserName = 'Label155'
        AutoSize = False
        Caption = 'Lançamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 81756
        mmTop = 22225
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel154: TppLabel
        UserName = 'Label154'
        AutoSize = False
        Caption = 'Documento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 57944
        mmTop = 22225
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'Label153'
        AutoSize = False
        Caption = 'Fornecedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12965
        mmTop = 22225
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel158: TppLabel
        UserName = 'Label158'
        AutoSize = False
        Caption = 'Tipo Lançto.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 158750
        mmTop = 22225
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel160: TppLabel
        UserName = 'Label160'
        AutoSize = False
        Caption = 'Histórico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 213519
        mmTop = 22225
        mmWidth = 32808
        BandType = 0
      end
      object ppLabel152: TppLabel
        UserName = 'Label152'
        Caption = 'Label152'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 16404
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Nº Lote: '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 100542
        mmTop = 22225
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 22225
        mmWidth = 11113
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object RptDocDataProgDBText7: TppDBText
        UserName = 'RptDocDataProgDBText7'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 11906
        mmTop = 0
        mmWidth = 45508
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'DBText81'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 57944
        mmTop = 0
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'DBText82'
        DataField = 'DATALANCTO'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 81756
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        DataField = 'DATAVENCTO'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 114036
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        DataField = 'TIPO'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 158750
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText86: TppDBText
        UserName = 'DBText86'
        DataField = 'DESCTIPODOC'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 178330
        mmTop = 0
        mmWidth = 34660
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'DBText87'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 213519
        mmTop = 0
        mmWidth = 58473
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'SALDO'
        DataPipeline = PpDocDataProg
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 133615
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMLOTE'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 100542
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object Contador: TppDBCalc
        UserName = 'Contador'
        DataField = 'CODDOCUMENTO'
        DataPipeline = PpDocDataProg
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ResetGroup = RptDocDataProgGroup1
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Nome do Sistema'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 3175
        mmTop = 2381
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 2381
        mmWidth = 17463
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 244740
        mmTop = 3440
        mmWidth = 25400
        BandType = 8
      end
    end
    object RptDocDataProgSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel151: TppLabel
        UserName = 'Label1501'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 1323
        mmWidth = 26194
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc25'
        DataField = 'SALDO'
        DataPipeline = PpDocDataProg
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpDocDataProg'
        mmHeight = 3440
        mmLeft = 130440
        mmTop = 1058
        mmWidth = 26988
        BandType = 7
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 5292
        mmWidth = 272000
        BandType = 7
      end
    end
    object RptDocDataProgGroup1: TppGroup
      BreakName = 'DATAPROGRAMADA'
      DataPipeline = PpDocDataProg
      OutlineSettings.CreateNode = True
      UserName = 'RptDocDataProgGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDocDataProg'
      object RptDocDataProgGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object RptDocDataProgDBText8: TppDBText
          UserName = 'RptDocDataProgDBText8'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = PpDocDataProg
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpDocDataProg'
          mmHeight = 3969
          mmLeft = 39158
          mmTop = 1323
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object RptDocDataProgLabel10: TppLabel
          UserName = 'RptDocDataProgLabel10'
          AutoSize = False
          Caption = 'Data Programada:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 10583
          mmTop = 1323
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'DBText80'
          DataField = 'MENSAGEM'
          DataPipeline = PpDocDataProg
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpDocDataProg'
          mmHeight = 3969
          mmLeft = 85196
          mmTop = 1323
          mmWidth = 97102
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6086
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
      end
      object RptDocDataProgGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object RptDocDataProgLine1: TppLine
          UserName = 'RptDocDataProgLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 3969
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
        object ppLabel150: TppLabel
          UserName = 'Label150'
          AutoSize = False
          Caption = 'Total desta Data:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 99219
          mmTop = 265
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          DataField = 'SALDO'
          DataPipeline = PpDocDataProg
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptDocDataProgGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpDocDataProg'
          mmHeight = 3440
          mmLeft = 128852
          mmTop = 265
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = PpDocDataProg
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDocDataProg'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NUMLOTE'
      DataPipeline = PpDocDataProg
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpDocDataProg'
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
  end
  object SqlDocDataProg: TCMSqlParams
    SQL.Strings = (
      
        'SELECT                                                          ' +
        '                                   '
      
        'DECODE(LD.FLGESTORNO, '#39'S'#39', '#39#39', LD.NUMLOTE ) AS NUMLOTE,    LD.FL' +
        'GESTORNO      , '
      
        '   U.DATAPROGRAMADA,                                            ' +
        '                                   '
      
        '   U.IDFORCLI,                                                  ' +
        '                                   '
      
        '   U.CODDOCUMENTO,                                              ' +
        '                                   '
      
        '   U.DATAVENCTO,                                                ' +
        '                                   '
      
        '   U.TIPO,                                                      ' +
        '                                   '
      
        '   U.NODOCUMENTO,                                               ' +
        '                                   '
      
        '   P.RAZAOSOCIAL,                                               ' +
        '                                   '
      
        '   P.NOME,                                                      ' +
        '                                   '
      
        '   P.NUMDOCUMENTO AS CGCCPF,                                    ' +
        '                                   '
      
        '   U.HISTORICOCOMPL,                                            ' +
        '                                   '
      
        '   U.DATALANCTO,                                                ' +
        '                                   '
      
        '   U.CODTIPRECDES,                                              ' +
        '                                   '
      
        '   U.RECPAG,                                                    ' +
        '                                   '
      
        '   T.DESCRICAO,                                                 ' +
        '                                   '
      
        '   U.IDPESSOA,                                                  ' +
        '                                   '
      
        '   U.CODTIPDOC,                                                 ' +
        '                                   '
      
        '   TD.DESCRICAO AS DESCTIPODOC,                                 ' +
        '                                   '
      
        '   DECODE(SIGN(TO_DATE(TO_CHAR(SYSDATE,'#39'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY' +
        #39')-U.DATAPROGRAMADA),1,        '
      
        '          '#39'Vencido a '#39'||to_char(abs((TO_DATE(TO_CHAR(SYSDATE,'#39'DD' +
        '/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')-U.DATAPROGRAMADA))), '
      
        '          '#39'A Vencer em '#39'||to_char(abs((TO_DATE(TO_CHAR(SYSDATE,'#39 +
        'DD/MM/YYYY'#39'),'#39'DD/MM/YYYY'#39')-U.DATAPROGRAMADA))))||'#39' Dias'#39' AS MENS' +
        'AGEM, '
      
        '   U.SALDO                                                      ' +
        '                                   '
      
        'FROM                                                            ' +
        '                                   '
      
        '   LOTEXDOCUM LD,                                               ' +
        '                                        '
      
        '   PESSOA P,                                                    ' +
        '                                   '
      
        '   TIPORECEBDESEMB T,                                           ' +
        '                                   '
      
        '   TIPODOCRECPAG TD,                                            ' +
        '                                   '
      
        '   (                                                            ' +
        '                                   '
      
        '   (SELECT                                                      ' +
        '                                   '
      
        '       D.DATAPROGRAMADA,                                        ' +
        '                                   '
      
        '       D.IDFORCLI,                                              ' +
        '                                   '
      
        '       D.CODDOCUMENTO,                                          ' +
        '                                   '
      
        '       D.DATAVENCTO,                                            ' +
        '                                   '
      
        '       DECODE(D.OPERACAO,'#39'2 '#39','#39'Efetivo'#39', DECODE(D.OPERACAO,'#39'1 '#39',' +
        #39'Efetivo'#39','#39'Previsto'#39')) AS TIPO, '
      
        '       DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),     ' +
        '                                   '
      
        '       (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOC' +
        'UMENTO,                          '
      
        '       L.HISTORICOCOMPL,                                        ' +
        '                                   '
      
        '       L.DATALANCTO,                                            ' +
        '                                   '
      
        '       R.CODTIPRECDES,                                          ' +
        '                                   '
      
        '       R.RECPAG,                                                ' +
        '                                   '
      
        '       D.IDPESSOA,                                              ' +
        '                                   '
      
        '       D.CODTIPDOC,                                             ' +
        '                                   '
      
        '       SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO                ' +
        '                                   '
      
        '    FROM                                                        ' +
        '                                   '
      
        '       DOCUMENTO D,                                             ' +
        '                                   '
      
        '       LANCTODOCUM L,                                           ' +
        '                                   '
      
        '       RATEIODOCUM R,                                           ' +
        '                                   '
      
        '       (SELECT                                                  ' +
        '                                   '
      
        '           D.CODDOCUMENTO,                                      ' +
        '                                   '
      
        '           SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L' +
        '.VALOR*-1),                    '
      
        '           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDO   ' +
        '                                 '
      
        '        FROM                                                    ' +
        '                                   '
      
        '           DOCUMENTO D,                                         ' +
        '                                   '
      
        '           LANCTODOCUM L                                        ' +
        '                                   '
      
        '        WHERE                                                   ' +
        '                                   '
      
        '                (D.CODDOCUMENTO = L.CODDOCUMENTO)               ' +
        '                                   '
      
        '            AND (D.OPERACAO IN ('#39'2 '#39','#39'12'#39','#39'1 '#39','#39'11'#39','#39'14'#39'))      ' +
        '                                '
      
        '            AND (D.DATAPROGRAMADA >=TO_Date('#39'01/02/2007'#39','#39'dd/mm/' +
        'yyyy'#39'))  '
      
        '            AND (D.DATAPROGRAMADA <=TO_Date('#39'11/04/2007'#39','#39'dd/mm/' +
        'yyyy'#39'))  '
      
        '            AND (D.RECPAG = '#39'P'#39')                                ' +
        '        '
      
        '            AND (D.IDPESSOA = 1)                                ' +
        '  '
      
        '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))       ' +
        '                                 '
      
        '        GROUP BY D.CODDOCUMENTO) S                              ' +
        '                                   '
      
        '    WHERE                                                       ' +
        '                                   '
      
        '       (D.CODDOCUMENTO = L.CODDOCUMENTO)                        ' +
        '                                   '
      
        '        AND (D.OPERACAO = L.OPERACAO)                           ' +
        '                                   '
      
        '        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)                   ' +
        '                                   '
      
        '        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                   ' +
        '                                   '
      
        '        AND (D.RECPAG = '#39'P'#39')                                    ' +
        '        '
      
        '        AND (D.IDPESSOA = 1)                                    ' +
        '  '
      
        '        AND (D.DATAPROGRAMADA >=TO_Date('#39'01/02/2007'#39','#39'dd/mm/yyyy' +
        #39'))  '
      
        '        AND (D.DATAPROGRAMADA <=TO_Date('#39'11/04/2007'#39','#39'dd/mm/yyyy' +
        #39'))  '
      
        '        AND (NVL(L.VALOR,0) <> 0)                               ' +
        '                                   '
      
        '        AND (D.OPERACAO IN ('#39'2 '#39','#39'12'#39','#39'1 '#39','#39'11'#39','#39'14'#39'))          ' +
        '                                '
      
        '        AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))           ' +
        '                                 '
      
        '    GROUP BY                                                    ' +
        '                                   '
      
        '        D.IDFORCLI,                                             ' +
        '                                   '
      
        '        D.DATAVENCTO,                                           ' +
        '                                   '
      
        '        D.COMPLDOCUMENTO,                                       ' +
        '                                   '
      
        '        D.NODOCUMENTO,                                          ' +
        '                                   '
      
        '        D.DATAPROGRAMADA,                                       ' +
        '                                   '
      
        '        L.HISTORICOCOMPL,                                       ' +
        '                                   '
      
        '        L.DATALANCTO,                                           ' +
        '                                   '
      
        '        R.CODTIPRECDES,                                         ' +
        '                                   '
      
        '        R.RECPAG,                                               ' +
        '                                   '
      
        '        D.IDPESSOA,                                             ' +
        '                                   '
      
        '        D.OPERACAO,                                             ' +
        '                                   '
      
        '        D.CODTIPDOC,                                            ' +
        '                                   '
      
        '        D.CODDOCUMENTO)                                         ' +
        '                                   '
      
        'UNION ALL                                                       ' +
        '                                   '
      
        '   (                                                            ' +
        '                                   '
      
        '   SELECT                                                       ' +
        '                                   '
      
        '      D.DATAPROGRAMADA,                                         ' +
        '                                   '
      
        '      D.IDFORCLI,                                               ' +
        '                                   '
      
        '      D.CODDOCUMENTO,                                           ' +
        '                                   '
      
        '      D.DATAVENCTO,                                             ' +
        '                                   '
      
        '      DECODE(D.OPERACAO,'#39'3 '#39','#39'Efetivo'#39', '#39'Previsto'#39') AS TIPO,    ' +
        '                             '
      
        '      DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),      ' +
        '                                   '
      
        '      (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCU' +
        'MENTO,                           '
      
        '      L.HISTORICOCOMPL,                                         ' +
        '                                   '
      
        '      L.DATALANCTO,                                             ' +
        '                                   '
      
        '      R.CODTIPRECDES,                                           ' +
        '                                   '
      
        '      R.RECPAG,                                                 ' +
        '                                   '
      
        '      D.IDPESSOA,                                               ' +
        '                                   '
      
        '      D.CODTIPDOC,                                              ' +
        '                                   '
      
        '      SUM(((R.VALORRAT*S.SALDODOC)/SS.SALDOTOT)) AS SALDO       ' +
        '                                   '
      
        '   FROM                                                         ' +
        '                                   '
      
        '      DOCUMENTO D,                                              ' +
        '                                   '
      
        '      LANCTODOCUM L,                                            ' +
        '                                   '
      
        '      (SELECT                                                   ' +
        '                                   '
      
        '          D.NUMFATURA,                                          ' +
        '                                   '
      
        '          SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.' +
        'VALOR*-1),                     '
      
        '          DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDOTOT ' +
        '                                 '
      
        '       FROM                                                     ' +
        '                                   '
      
        '          DOCUMENTO D,                                          ' +
        '                                   '
      
        '          LANCTODOCUM L                                         ' +
        '                                   '
      
        '       WHERE                                                    ' +
        '                                   '
      
        '          (D.CODDOCUMENTO = L.CODDOCUMENTO)                     ' +
        '                                   '
      
        '           AND (D.OPERACAO = L.OPERACAO)                        ' +
        '                                   '
      
        '           AND (D.OPERACAO IN ('#39'1 '#39','#39'11'#39'))                      ' +
        '                               '
      
        '           AND (D.RECPAG = '#39'P'#39')                                 ' +
        '        '
      
        '           AND (D.IDPESSOA = 1)                                 ' +
        '  '
      
        '           AND (D.NUMFATURA IS NOT NULL)                        ' +
        '                                   '
      
        '       GROUP BY D.NUMFATURA) SS,                                ' +
        '                                   '
      
        '       (SELECT                                                  ' +
        '                                   '
      
        '           D.CODDOCUMENTO,                                      ' +
        '                                   '
      
        '           SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L' +
        '.VALOR*-1),                    '
      
        '           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDODOC' +
        '                                 '
      
        '        FROM                                                    ' +
        '                                   '
      
        '           DOCUMENTO D,                                         ' +
        '                                   '
      
        '           LANCTODOCUM L                                        ' +
        '                                   '
      
        '        WHERE                                                   ' +
        '                                   '
      
        '           (D.CODDOCUMENTO = L.CODDOCUMENTO)                    ' +
        '                                   '
      
        '            AND (D.OPERACAO IN ('#39'3 '#39','#39'13'#39'))                     ' +
        '                               '
      
        '            AND (D.RECPAG = '#39'P'#39')                                ' +
        '        '
      
        '            AND (D.IDPESSOA = 1)                                ' +
        '  '
      
        '            AND (D.DATAPROGRAMADA >=TO_Date('#39'01/02/2007'#39','#39'dd/mm/' +
        'yyyy'#39'))  '
      
        '            AND (D.DATAPROGRAMADA <=TO_Date('#39'11/04/2007'#39','#39'dd/mm/' +
        'yyyy'#39'))  '
      
        '            AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))       ' +
        '                                 '
      
        '        GROUP BY D.CODDOCUMENTO) S,                             ' +
        '                                   '
      
        '       (SELECT                                                  ' +
        '                                   '
      
        '           D.NUMFATURA,                                         ' +
        '                                   '
      
        '           R.CODTIPRECDES,                                      ' +
        '                                   '
      
        '           R.IDPESSOA,                                          ' +
        '                                   '
      
        '           R.RECPAG,                                            ' +
        '                                   '
      
        '           SUM(R.VALOR) AS VALORRAT                             ' +
        '                                   '
      
        '        FROM                                                    ' +
        '                                   '
      
        '           DOCUMENTO D,                                         ' +
        '                                   '
      
        '           RATEIODOCUM R                                        ' +
        '                                   '
      
        '        WHERE                                                   ' +
        '                                   '
      
        '           (D.CODDOCUMENTO = R.CODDOCUMENTO)                    ' +
        '                                   '
      
        '            AND (D.OPERACAO IN ('#39'1 '#39','#39'11'#39'))                     ' +
        '                               '
      
        '            AND (D.RECPAG = '#39'P'#39')                                ' +
        '        '
      
        '            AND (D.IDPESSOA = 1)                                ' +
        '  '
      
        '            AND (D.NUMFATURA IS NOT NULL)                       ' +
        '                                   '
      
        '        GROUP BY                                                ' +
        '                                   '
      
        '            R.CODTIPRECDES,                                     ' +
        '                                   '
      
        '            R.IDPESSOA,                                         ' +
        '                                   '
      
        '            R.RECPAG,                                           ' +
        '                                   '
      
        '            D.NUMFATURA) R                                      ' +
        '                                   '
      
        'WHERE                                                           ' +
        '                                   '
      
        '   (D.CODDOCUMENTO = L.CODDOCUMENTO)                            ' +
        '                                   '
      
        '    AND (D.OPERACAO = L.OPERACAO)                               ' +
        '                                   '
      
        '    AND (D.NUMFATURA = R.NUMFATURA)                             ' +
        '                                   '
      
        '    AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                       ' +
        '                                   '
      
        '    AND (D.NUMFATURA = SS.NUMFATURA)                            ' +
        '                                   '
      
        '    AND (D.RECPAG = '#39'P'#39')                                        ' +
        '        '
      
        '    AND (D.IDPESSOA = 1)                                        ' +
        '  '
      
        '    AND (D.DATAPROGRAMADA >=TO_Date('#39'01/02/2007'#39','#39'dd/mm/yyyy'#39')) ' +
        ' '
      
        '    AND (D.DATAPROGRAMADA <=TO_Date('#39'11/04/2007'#39','#39'dd/mm/yyyy'#39')) ' +
        ' '
      
        '    AND (NVL(SS.SALDOTOT,0) <> 0 )                              ' +
        '                                   '
      
        '    AND (D.OPERACAO IN ('#39'3 '#39','#39'13'#39'))                             ' +
        '                               '
      
        '    AND ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))               ' +
        '                                 '
      
        'GROUP BY                                                        ' +
        '                                   '
      
        '       D.IDFORCLI,                                              ' +
        '                                   '
      
        '       D.DATAVENCTO,                                            ' +
        '                                   '
      
        '       D.COMPLDOCUMENTO,                                        ' +
        '                                   '
      
        '       D.NODOCUMENTO,                                           ' +
        '                                   '
      
        '       D.DATAPROGRAMADA,                                        ' +
        '                                   '
      
        '       L.HISTORICOCOMPL,                                        ' +
        '                                   '
      
        '       L.DATALANCTO,                                            ' +
        '                                   '
      
        '       R.CODTIPRECDES,                                          ' +
        '                                   '
      
        '       R.RECPAG,                                                ' +
        '                                   '
      
        '       D.IDPESSOA,                                              ' +
        '                                   '
      
        '       D.OPERACAO,                                              ' +
        '                                   '
      
        '       D.CODTIPDOC,                                             ' +
        '                                   '
      
        '       D.CODDOCUMENTO )                                         ' +
        '                                   '
      
        ') U                                                             ' +
        '                                   '
      
        'WHERE (U.IDFORCLI = P.IDPESSOA)                                 ' +
        '                                   '
      
        '  AND (U.CODTIPRECDES = T.CODTIPRECDES)                         ' +
        '                                   '
      
        '  AND (U.RECPAG = T.RECPAG)                                     ' +
        '                                   '
      
        '  AND (U.IDPESSOA = T.IDPESSOA)                                 ' +
        '                                   '
      
        '  AND (U.CODTIPDOC = TD.CODTIPDOC)                              ' +
        '                                   '
      
        '  AND (LD.CODDOCUMENTO(+) = U.CODDOCUMENTO)                     ' +
        '                                   '
      
        'ORDER BY U.IDPESSOA, U.DATAPROGRAMADA, P.RAZAOSOCIAL, U.NODOCUME' +
        'NTO, U.CODDOCUMENTO               ')
    ClientDataSet = CdsDocDataProg
    Left = 56
    Top = 112
  end
  object CdsDocDataProg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 56
  end
end
