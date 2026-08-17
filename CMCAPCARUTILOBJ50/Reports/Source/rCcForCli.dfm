inherited RptCcForCli: TRptCcForCli
  Left = 580
  Top = 218
  Width = 344
  Height = 201
  Caption = 'Parâmentros do Relatório de Conta Corrente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conta Corrente'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Período do Extrato Inicial'
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
        Name = 'Período do Extrato Inicial'
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
        Caption = 'Período do Extrato Final'
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
        Name = 'Período do Extrato Final'
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
        ProcuraFCSettings.ForCli = fcCliente
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'Não Incluir Adiantamentos no Relatório'
        Controle = tcCheckBox
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Não Incluir Adiantamentos no Relatório'
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
        Caption = 'Tipo Cliente'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  IDTIPOCLIENTE,'
          '  DESCRICAO'
          'FROM'
          '  TIPOCLIENTE'
          'ORDER BY'
          '  DESCRICAO')
        LookupSettings.Chave = 'IDTIPOCLIENTE'
        LookupSettings.Display = 'Descricao'
        LookupSettings.Descricao = 'Descricao'
        LookupSettings.Tamanho = '40'
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
        Name = 'Tipo de Documento'
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
    Formheight = 325
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptContaFornCli
    LabelEmpresa = ppReport1Label1
    LabelSistema = ppReportSistema
  end
  object PpContaFornCli: TppBDEPipeline
    DataSource = DsContaFornCli
    UserName = 'PpContaFornCli'
    Left = 179
    Top = 70
    object PpContaFornClippField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField2: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField3: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField4: TppField
      FieldAlias = 'NODOCUMENTODEF'
      FieldName = 'NODOCUMENTODEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField5: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField6: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField7: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField8: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField9: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField10: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField11: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField12: TppField
      FieldAlias = 'SALDOANT'
      FieldName = 'SALDOANT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField13: TppField
      FieldAlias = 'MOVDEB'
      FieldName = 'MOVDEB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField14: TppField
      FieldAlias = 'MOVCRE'
      FieldName = 'MOVCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField15: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField16: TppField
      FieldAlias = 'NUMSLIP'
      FieldName = 'NUMSLIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField17: TppField
      FieldAlias = 'NUMOP'
      FieldName = 'NUMOP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpContaFornClippField18: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object DsContaFornCli: TwwDataSource
    DataSet = CdsContaFornCli
    Left = 110
    Top = 62
  end
  object RptContaFornCli: TppReport
    AutoStop = False
    DataPipeline = PpContaFornCli
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
    Left = 243
    Top = 62
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpContaFornCli'
    object ppHeaderBand12: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppReport1Label1: TppLabel
        UserName = 'ppReport1Label1'
        Caption = 'CM Soluções Informática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 62971
        mmTop = 2117
        mmWidth = 59002
        BandType = 0
      end
      object LblCc: TppLabel
        UserName = 'LblCc'
        Caption = 'Conta Corrente de Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 56886
        mmTop = 8731
        mmWidth = 70908
        BandType = 0
      end
      object LblPeridoCc: TppLabel
        UserName = 'LblPeridoCc'
        Caption = 'Período Do Extrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 73025
        mmTop = 14552
        mmWidth = 38629
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 25400
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Op.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 38629
        mmTop = 25400
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel144: TppLabel
        UserName = 'Label144'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 45773
        mmTop = 25400
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel145: TppLabel
        UserName = 'Label145'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 25400
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel146: TppLabel
        UserName = 'Label146'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 144727
        mmTop = 25400
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel147: TppLabel
        UserName = 'Label147'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 25400
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'Label148'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17463
        mmTop = 25400
        mmWidth = 19579
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NUMOP'
        DataPipeline = PpContaFornCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 4233
        mmLeft = 141023
        mmTop = 8202
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppReport1DBText1: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'HISTORICO'
        DataPipeline = PpContaFornCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 45773
        mmTop = 265
        mmWidth = 57944
        BandType = 4
      end
      object ppReport1DBText2: TppDBText
        UserName = 'ppReport1DBText2'
        DataField = 'DATALANCTO'
        DataPipeline = PpContaFornCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppReport1DBText3: TppDBText
        UserName = 'ppReport1DBText3'
        BlankWhenZero = True
        DataField = 'MOVCRE'
        DataPipeline = PpContaFornCli
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object RptContaFornCliDBText2: TppDBText
        UserName = 'RptContaFornCliDBText2'
        DataField = 'OPERACAO'
        DataPipeline = PpContaFornCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 37042
        mmTop = 265
        mmWidth = 7673
        BandType = 4
      end
      object RptContaFornCliDBText4: TppDBText
        UserName = 'RptContaFornCliDBText4'
        BlankWhenZero = True
        DataField = 'MOVDEB'
        DataPipeline = PpContaFornCli
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'DBCalc15'
        DataField = 'SALDO'
        DataPipeline = PpContaFornCli
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ResetGroup = ppGroup15
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 265
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'NODOCUMENTODEF'
        DataPipeline = PpContaFornCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 17463
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppReportSistema: TppLabel
        UserName = 'ReportSistema'
        AutoSize = False
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 5292
        mmWidth = 183886
        BandType = 8
      end
      object ppReport1Line1: TppLine
        UserName = 'ppReport1Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 185000
        BandType = 8
      end
      object ppReport1Calc1: TppSystemVariable
        UserName = 'Report1Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 5292
        mmWidth = 18785
        BandType = 8
      end
      object ppReport1Calc2: TppSystemVariable
        UserName = 'Report1Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 5292
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptContaFornCliSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object RptContaFornCliLabel1: TppLabel
        UserName = 'RptContaFornCliLabel1'
        Caption = 'Totais:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 89694
        mmTop = 1852
        mmWidth = 9260
        BandType = 7
      end
      object LblTotDeb: TppDBCalc
        UserName = 'LblTotDeb'
        DataField = 'MOVDEB'
        DataPipeline = PpContaFornCli
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 1323
        mmWidth = 25400
        BandType = 7
      end
      object LblTotCred: TppDBCalc
        UserName = 'LblTotCred'
        DataField = 'MOVCRE'
        DataPipeline = PpContaFornCli
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 1323
        mmWidth = 25400
        BandType = 7
      end
      object RptContaFornCliLine1: TppLine
        UserName = 'RptContaFornCliLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 185000
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'SALDO'
        DataPipeline = PpContaFornCli
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpContaFornCli'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 1323
        mmWidth = 25400
        BandType = 7
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'IDFORCLI'
      DataPipeline = PpContaFornCli
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpContaFornCli'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppDBText78: TppDBText
          UserName = 'DBText78'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpContaFornCli
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpContaFornCli'
          mmHeight = 4233
          mmLeft = 25135
          mmTop = 1323
          mmWidth = 52388
          BandType = 3
          GroupNo = 0
        end
        object ppLine63: TppLine
          UserName = 'Line63'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 6085
          mmWidth = 185000
          BandType = 3
          GroupNo = 0
        end
        object ppLine64: TppLine
          UserName = 'Line64'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2646
          mmLeft = 0
          mmTop = 0
          mmWidth = 185000
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBCalc16: TppDBCalc
          UserName = 'LblTotDeb1'
          DataField = 'MOVDEB'
          DataPipeline = PpContaFornCli
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpContaFornCli'
          mmHeight = 3704
          mmLeft = 105304
          mmTop = 1588
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'LblTotCred1'
          DataField = 'MOVCRE'
          DataPipeline = PpContaFornCli
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup15
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpContaFornCli'
          mmHeight = 3704
          mmLeft = 131763
          mmTop = 1588
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label42'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 90752
          mmTop = 2117
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlContaFornCli: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   U.RAZAOSOCIAL,'
      '   U.NODOCUMENTO,'
      '   U.COMPLDOCUMENTO,'
      '   U.NODOCUMENTODEF,'
      '   U.CODDOCUMENTO,'
      '   U.OPERACAO,'
      '   U.HISTORICO,'
      '   U.DATALANCTO,'
      '   U.RECPAG,'
      '   U.DATAPROGRAMADA,'
      '   U.IDFORCLI,'
      '   U.SALDOANT,'
      '   U.MOVDEB,'
      '   U.MOVCRE,'
      
        '   DECODE(U.RECPAG,'#39'R'#39', (U.SALDOANT + U.MOVDEB - U.MOVCRE), (U.S' +
        'ALDOANT + U.MOVCRE - U.MOVDEB)) AS SALDO,'
      
        '   U.NUMSLIP, '#39'           '#39' NUMOP, '#39'               '#39' NUMCHQBORDE' +
        'RO'
      'FROM'
      '((SELECT'
      '   P.RAZAOSOCIAL,'
      '   D.NODOCUMENTO,'
      '   DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),'
      
        '   (TO_CHAR(D.NODOCUMENTO)||'#39'/'#39'||D.COMPLDOCUMENTO)) AS NODOCUMEN' +
        'TODEF,'
      '   D.COMPLDOCUMENTO,'
      '   D.CODDOCUMENTO,'
      '   L.OPERACAO,'
      '   D.RECPAG,'
      '   L.HISTORICOCOMPL AS HISTORICO,'
      '   L.DATALANCTO,'
      '   D.DATAPROGRAMADA,'
      '   D.IDFORCLI,'
      '   0 AS SALDOANT,'
      '   DECODE(L.DEBCRE,'#39'D'#39',L.VALOR, 0) AS MOVDEB,'
      '   DECODE(L.DEBCRE,'#39'C'#39',L.VALOR, 0) AS MOVCRE,'
      '   D.NUMSLIP'
      'FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO IN ('#39'1 '#39','#39'2 '#39','#39'4 '#39','#39'5 '#39','#39'17'#39'))'
      '  AND (L.DATALANCTO >= TO_DATE('#39'01/03/2001'#39','#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCTO <= TO_DATE('#39'31/05/2001'#39','#39'DD/MM/YYYY'#39'))'
      '  AND (P.IDPESSOA = D.IDFORCLI)'
      '  AND (D.RECPAG = '#39'R'#39')'
      '  AND (D.IDPESSOA = 1))'
      'UNION ALL'
      '(SELECT'
      '   P.RAZAOSOCIAL,'
      '   0  AS NODOCUMENTO,'
      '   '#39#39' AS NODOCUMENTODEF,'
      '   '#39#39' AS COMPLDOCUMENTO,'
      '   0 AS CODDOCUMENTO,'
      '   '#39'  '#39' AS OPERACAO,'
      '   D.RECPAG,'
      '   '#39'SALDO ANTERIOR'#39' AS HISTORICO,'
      '   (TO_DATE('#39'01/03/2001'#39','#39'DD/MM/YYYY'#39')-1)  AS DATALANCTO,'
      '   (TO_DATE('#39'01/03/2001'#39','#39'DD/MM/YYYY'#39')-1)  AS DATAPROGRAMADA,'
      '   D.IDFORCLI,'
      
        '   SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR, L.VALOR*' +
        '-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR, L.VALOR*-1))) AS SALDOANT,'
      '   0 AS MOVDEB,'
      '   0 AS MOVCRE,'
      '   '#39'          '#39' NUMSLIP'
      'FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO IN ('#39'1 '#39','#39'2 '#39','#39'4 '#39','#39'5 '#39','#39'17'#39'))'
      '  AND (L.DATALANCTO < TO_DATE('#39'01/03/2001'#39','#39'DD/MM/YYYY'#39'))'
      '  AND (P.IDPESSOA = D.IDFORCLI)'
      '  AND (D.RECPAG = '#39'R'#39')'
      '  AND (D.IDPESSOA = 1)'
      'GROUP BY    P.RAZAOSOCIAL,'
      '   D.RECPAG,'
      '   D.IDFORCLI'
      
        'HAVING SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR, L.VA' +
        'LOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR, L.VALOR*-1))) <> 0'
      ') ) U'
      'ORDER BY U.RAZAOSOCIAL, U.IDFORCLI, U.DATALANCTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = CdsContaFornCli
    Left = 64
    Top = 62
  end
  object CdsContaFornCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 62
  end
end
