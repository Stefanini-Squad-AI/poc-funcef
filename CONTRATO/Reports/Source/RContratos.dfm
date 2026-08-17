inherited RptContratos: TRptContratos
  Left = 332
  Top = 237
  Width = 484
  Height = 239
  Caption = 'RptContratos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Contratos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Tipo de Contrato'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Em Cadastramento'
          'Vigentes'
          'Encerrados')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
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
        Caption = 'Contratos com Datas de Encerramento'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todas'
          'Determinadas'
          'Indeterminadas')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 70
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
        Caption = 'Data de'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Assinatura'
          'Vencimento')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
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
        Caption = 'Data Inicial'
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
        Caption = 'Data Final'
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
      end>
    Formheight = 330
    FormWidth = 350
    Left = 328
  end
  inherited DevRptCM: TExtraOptions
    Left = 120
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpContratos
    Left = 224
  end
  object dsContratos: TwwDataSource
    DataSet = cdsContratos
    Left = 224
    Top = 64
  end
  object pplContratos: TppBDEPipeline
    DataSource = dsContratos
    UserName = 'lContratos'
    Left = 328
    Top = 64
    object pplContratosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATO'
      FieldName = 'IDCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplContratosppField2: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplContratosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplContratosppField4: TppField
      FieldAlias = 'NOMEFORCLI'
      FieldName = 'NOMEFORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplContratosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplContratosppField6: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplContratosppField7: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplContratosppField8: TppField
      FieldAlias = 'DATAASSINATURA'
      FieldName = 'DATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplContratosppField9: TppField
      FieldAlias = 'DATABASECONTRATO'
      FieldName = 'DATABASECONTRATO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplContratosppField10: TppField
      FieldAlias = 'DATAPREVENCERRA'
      FieldName = 'DATAPREVENCERRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplContratosppField11: TppField
      FieldAlias = 'DATAEFETENCERRA'
      FieldName = 'DATAEFETENCERRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object pplContratosppField12: TppField
      FieldAlias = 'OBS_CONTRATO'
      FieldName = 'OBS_CONTRATO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplContratosppField13: TppField
      FieldAlias = 'RENOVACAO'
      FieldName = 'RENOVACAO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplContratosppField14: TppField
      FieldAlias = 'DESC_TIPODESEMB'
      FieldName = 'DESC_TIPODESEMB'
      FieldLength = 35
      DisplayWidth = 35
      Position = 13
    end
    object pplContratosppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEM'
      FieldName = 'IDITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplContratosppField16: TppField
      FieldAlias = 'NOME_ITEM'
      FieldName = 'NOME_ITEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 15
    end
    object pplContratosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOBJETO'
      FieldName = 'IDOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplContratosppField18: TppField
      FieldAlias = 'NOMEOBJETO'
      FieldName = 'NOMEOBJETO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 17
    end
    object pplContratosppField19: TppField
      FieldAlias = 'DATABASEITEM'
      FieldName = 'DATABASEITEM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object pplContratosppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplContratosppField21: TppField
      FieldAlias = 'MOEDESC'
      FieldName = 'MOEDESC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 20
    end
    object pplContratosppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEITEM'
      FieldName = 'QTDEITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplContratosppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORUNITARIOOBJETO'
      FieldName = 'VALORUNITARIOOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplContratosppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTALOBJETO'
      FieldName = 'VALORTOTALOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplContratosppField25: TppField
      FieldAlias = 'DATAINICIOCOBR'
      FieldName = 'DATAINICIOCOBR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 24
    end
    object pplContratosppField26: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 250
      DisplayWidth = 250
      Position = 25
    end
    object pplContratosppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORBASECONTRATO'
      FieldName = 'VALORBASECONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplContratosppField28: TppField
      FieldAlias = 'TIPOC'
      FieldName = 'TIPOC'
      FieldLength = 9
      DisplayWidth = 9
      Position = 27
    end
    object pplContratosppField29: TppField
      FieldAlias = 'FREQ'
      FieldName = 'FREQ'
      FieldLength = 6
      DisplayWidth = 6
      Position = 28
    end
    object pplContratosppField30: TppField
      FieldAlias = 'TPCOB'
      FieldName = 'TPCOB'
      FieldLength = 3
      DisplayWidth = 3
      Position = 29
    end
    object pplContratosppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCRATEIOCONTR'
      FieldName = 'PERCRATEIOCONTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplContratosppField32: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 31
    end
    object pplContratosppField33: TppField
      FieldAlias = 'DATAADITAMENTO'
      FieldName = 'DATAADITAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 32
    end
  end
  object rpContratos: TppReport
    AutoStop = False
    DataPipeline = pplContratos
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
    Left = 424
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContratos'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Relatório de Controle de Contratos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 70115
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object pplblNomeEmpresa: TppLabel
        UserName = 'lblNomeEmpresa'
        Caption = 'Nome Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 124354
        mmTop = 1852
        mmWidth = 35719
        BandType = 0
      end
      object rpContratosLine1: TppLine
        UserName = 'rpContratosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object rpContratosLine4: TppLine
        UserName = 'rpContratosLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17198
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpContratosDBText17: TppDBText
        UserName = 'rpContratosDBText17'
        DataField = 'NOMECC'
        DataPipeline = pplContratos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratos'
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 794
        mmWidth = 106627
        BandType = 4
      end
      object rpContratosDBText18: TppDBText
        UserName = 'rpContratosDBText18'
        DataField = 'PERCRATEIOCONTR'
        DataPipeline = pplContratos
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratos'
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object pplblNomeSistema: TppLabel
        UserName = 'lblNomeSistema'
        AutoSize = False
        Caption = 'Contratos e Projetos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 794
        mmWidth = 249238
        BandType = 8
      end
      object rpContratosLine3: TppLine
        UserName = 'rpContratosLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 282046
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248180
        mmTop = 794
        mmWidth = 33867
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object pplblTotalContratos: TppLabel
        UserName = 'Label1'
        Caption = 'Total de Contratos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 264
        mmWidth = 32808
        BandType = 7
      end
      object lblCont: TppVariable
        UserName = 'lblCont'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 91546
        mmTop = 794
        mmWidth = 12435
        BandType = 7
      end
      object lblCont2: TppLabel
        UserName = 'lblCont2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34130
        mmTop = 264
        mmWidth = 32808
        BandType = 7
      end
    end
    object rpContratosGroup1: TppGroup
      BreakName = 'NOMECONTRATO'
      DataPipeline = pplContratos
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'rpContratosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratos'
      object rpContratosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 15875
        mmPrintPosition = 0
        object rpContratosShape1: TppShape
          UserName = 'rpContratosShape1'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText1: TppDBText
          UserName = 'rpContratosDBText1'
          DataField = 'NOMECONTRATO'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1058
          mmWidth = 279401
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel1: TppLabel
          UserName = 'rpContratosLabel1'
          Caption = 'Datas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 7144
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel2: TppLabel
          UserName = 'rpContratosLabel2'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 11377
          mmTop = 7144
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText2: TppDBText
          UserName = 'rpContratosDBText2'
          DataField = 'DATAASSINATURA'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 10319
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel3: TppLabel
          UserName = 'rpContratosLabel3'
          Caption = 'Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 7144
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText3: TppDBText
          UserName = 'rpContratosDBText3'
          DataField = 'DATABASECONTRATO'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel4: TppLabel
          UserName = 'rpContratosLabel4'
          Caption = 'Prev.Encerram.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 47625
          mmTop = 7144
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText4: TppDBText
          UserName = 'rpContratosDBText4'
          DataField = 'DATAPREVENCERRA'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 47625
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel5: TppLabel
          UserName = 'rpContratosLabel5'
          Caption = 'Encerramento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 70115
          mmTop = 7144
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText5: TppDBText
          UserName = 'rpContratosDBText5'
          DataField = 'DATAEFETENCERRA'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 70379
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel6: TppLabel
          UserName = 'rpContratosLabel6'
          Caption = 'Gestor Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 92075
          mmTop = 7144
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText6: TppDBText
          UserName = 'rpContratosDBText6'
          DataField = 'NOMERESP'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 92075
          mmTop = 12171
          mmWidth = 76994
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel7: TppLabel
          UserName = 'rpContratosLabel7'
          Caption = 'Contraparte (Fornecedor/Cliente)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 7144
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText7: TppDBText
          UserName = 'rpContratosDBText7'
          DataField = 'NOMEFORCLI'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 12171
          mmWidth = 66675
          BandType = 3
          GroupNo = 0
        end
        object rpContratosLabel8: TppLabel
          UserName = 'rpContratosLabel8'
          Caption = 'Valor Base Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 237861
          mmTop = 7144
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText8: TppDBText
          UserName = 'rpContratosDBText8'
          DataField = 'VALORBASECONTRATO'
          DataPipeline = pplContratos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 237861
          mmTop = 12171
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object rpContratosDBText9: TppDBText
          UserName = 'rpContratosDBText9'
          DataField = 'TIPOC'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 264848
          mmTop = 12171
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object rpContratosGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object rpContratosLine2: TppLine
          UserName = 'rpContratosLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5556
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'ppLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11906
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpContratosGroup2: TppGroup
      BreakName = 'NOMEOBJETO'
      DataPipeline = pplContratos
      OutlineSettings.CreateNode = True
      UserName = 'rpContratosGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratos'
      object rpContratosGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object rpContratosLabel9: TppLabel
          UserName = 'rpContratosLabel9'
          Caption = 'Serviços/Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 529
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object rpContratosDBText10: TppDBText
          UserName = 'rpContratosDBText10'
          DataField = 'NOMEOBJETO'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 5027
          mmWidth = 186267
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel10: TppLabel
          UserName = 'rpContratosLabel10'
          Caption = ' Itens Contratuais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 7144
          mmTop = 9790
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel11: TppLabel
          UserName = 'rpContratosLabel11'
          Caption = ' Início Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 134938
          mmTop = 9790
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel12: TppLabel
          UserName = 'rpContratosLabel12'
          Caption = 'Valor Item/Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 159279
          mmTop = 9790
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel13: TppLabel
          UserName = 'rpContratosLabel13'
          Caption = 'Medição ?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 187590
          mmTop = 9790
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
        object rpContratosLabel14: TppLabel
          UserName = 'rpContratosLabel14'
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 9790
          mmWidth = 16404
          BandType = 3
          GroupNo = 1
        end
      end
      object rpContratosGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpContratosGroup3: TppGroup
      BreakName = 'NOME_ITEM'
      DataPipeline = pplContratos
      OutlineSettings.CreateNode = True
      UserName = 'rpContratosGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratos'
      object rpContratosGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object rpContratosDBText11: TppDBText
          UserName = 'rpContratosDBText11'
          DataField = 'NOME_ITEM'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 1058
          mmWidth = 125942
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText12: TppDBText
          UserName = 'rpContratosDBText12'
          DataField = 'DATAINICIOCOBR'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 137054
          mmTop = 1058
          mmWidth = 20902
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText13: TppDBText
          UserName = 'rpContratosDBText13'
          DataField = 'VALORUNITARIOOBJETO'
          DataPipeline = pplContratos
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 162984
          mmTop = 1058
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText14: TppDBText
          UserName = 'rpContratosDBText14'
          DataField = 'TIPOC'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 187855
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText15: TppDBText
          UserName = 'rpContratosDBText15'
          DataField = 'QTDEITEM'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 204259
          mmTop = 1058
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object rpContratosLabel15: TppLabel
          UserName = 'rpContratosLabel15'
          Caption = 'parcela(s) a ser(em) paga(s) de forma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 214048
          mmTop = 1058
          mmWidth = 50536
          BandType = 3
          GroupNo = 2
        end
        object rpContratosDBText16: TppDBText
          UserName = 'rpContratosDBText16'
          DataField = 'TPCOB'
          DataPipeline = pplContratos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplContratos'
          mmHeight = 3704
          mmLeft = 264848
          mmTop = 1058
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object rpContratosLabel16: TppLabel
          UserName = 'rpContratosLabel16'
          Caption = 'Rateio por Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 16669
          mmTop = 5292
          mmWidth = 39688
          BandType = 3
          GroupNo = 2
        end
        object rpContratosLabel17: TppLabel
          UserName = 'rpContratosLabel17'
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 128323
          mmTop = 5556
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
      end
      object rpContratosGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppsrReajuste: TppSubReport
          OnPrint = ppsrReajustePrint
          UserName = 'srReajuste'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplReajuste'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplReajuste
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
            Left = 240
            Top = 112
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplReajuste'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 13229
              mmPrintPosition = 0
              object ppLabel2: TppLabel
                UserName = 'Label2'
                Caption = 'Reajustes Contratuais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3387
                mmLeft = 1852
                mmTop = 4498
                mmWidth = 29803
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label1'
                Caption = 'Descrição Aditamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 5027
                mmTop = 8996
                mmWidth = 33073
                BandType = 1
              end
              object ppLabel3: TppLabel
                UserName = 'Label3'
                Caption = 'Tipo de Correção'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 152929
                mmTop = 8996
                mmWidth = 25400
                BandType = 1
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                Caption = 'Frequência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 201348
                mmTop = 8996
                mmWidth = 16933
                BandType = 1
              end
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Intervalo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 225690
                mmTop = 8996
                mmWidth = 13494
                BandType = 1
              end
              object ppLabel6: TppLabel
                UserName = 'Label6'
                Caption = 'Data Base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 242094
                mmTop = 8996
                mmWidth = 15081
                BandType = 1
              end
            end
            object ppDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object ppDBtextDescricaoAditamento: TppDBText
                UserName = 'DBtextDescricaoAditamento'
                DataField = 'DESCRICAO'
                DataPipeline = pplReajuste
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplReajuste'
                mmHeight = 3175
                mmLeft = 5027
                mmTop = 1058
                mmWidth = 134409
                BandType = 4
              end
              object ppDBText1: TppDBText
                UserName = 'DBtextDescricaoAditamento1'
                DataField = 'DESCTIPOCORR'
                DataPipeline = pplReajuste
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplReajuste'
                mmHeight = 3175
                mmLeft = 152929
                mmTop = 1058
                mmWidth = 44715
                BandType = 4
              end
              object ppDBText2: TppDBText
                UserName = 'DBtextDescricaoAditamento2'
                DataField = 'FREQUENCIA'
                DataPipeline = pplReajuste
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplReajuste'
                mmHeight = 3175
                mmLeft = 201348
                mmTop = 1058
                mmWidth = 20902
                BandType = 4
              end
              object ppDBText3: TppDBText
                UserName = 'DBText3'
                DataField = 'INTERVALO'
                DataPipeline = pplReajuste
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplReajuste'
                mmHeight = 3175
                mmLeft = 225690
                mmTop = 1058
                mmWidth = 13494
                BandType = 4
              end
              object ppDBText4: TppDBText
                UserName = 'DBText4'
                DataField = 'DATABASE'
                DataPipeline = pplReajuste
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplReajuste'
                mmHeight = 3175
                mmLeft = 242094
                mmTop = 1058
                mmWidth = 20902
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object raCodeModule2: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        5265706F72744265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365064670726F63656475726520526570
        6F72744265666F72655072696E743B0D0A626567696E0D0A20206C626C436F6E
        742E4173496E7465676572203A3D20303B0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506065265706F7274094576656E744E616D65060B4265666F72
        655072696E74074576656E74494402010001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D6506257270436F6E747261746F7347726F75
        7048656164657242616E643141667465725072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F75726365066E70726F6365647572
        65207270436F6E747261746F7347726F757048656164657242616E6431416674
        65725072696E743B0D0A626567696E0D0A20206C626C436F6E742E4173496E74
        65676572203A3D206C626C436F6E742E4173496E7465676572202B20313B0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65061B7270436F6E747261746F
        7347726F757048656164657242616E6431094576656E744E616D65060A416674
        65725072696E74074576656E74494402170000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object spContratos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO,'
      '   C.NOMECONTRATO, '
      '   C.IDFORCLI, '
      '   P.NOME NOMEFORCLI, '
      '   C.IDRESPONSAVEL, '
      '   RS.NOME NOMERESP, '
      '   C.DATAINICIO, '
      '   C.DATAASSINATURA, '
      '   C.DATABASECONTRATO, '
      '   C.DATAPREVENCERRA, '
      '   C.DATAEFETENCERRA, '
      ''
      '   C.OBSERVACAO AS OBS_CONTRATO,'
      '   C.RENOVACAO,'
      '   T.DESCRICAO AS DESC_TIPODESEMB,'
      ''
      '   OI.IDITEM,'
      '   I.NOME_ITEM, '
      '   OI.IDOBJETO, '
      '   O.NOMEOBJETO, '
      '   OI.DATABASEITEM, '
      '   OI.MOECODIGO, '
      '   M.MOEDESC, '
      '   OI.QTDEITEM, '
      '   OI.VALORUNITARIOOBJETO, '
      '   OI.VALORTOTALOBJETO, '
      '   OI.DATAINICIOCOBR, '
      '   OI.OBSERVACAO, '
      '   C.VALORBASECONTRATO, '
      '   DECODE (C.TIPOCONTRATO,'#39'P'#39','#39'A Pagar'#39','#39'R'#39','#39'A Receber'#39') TIPOC, '
      
        '   DECODE (OI.FREQUENCIA,'#39'M'#39','#39'mensal'#39','#39'U'#39','#39'unica'#39','#39'D'#39','#39'diaria'#39','#39 +
        'A'#39','#39'anual'#39') FREQ, '
      
        '   DECODE (i.tipocobranca, '#39'PQ'#39','#39'Sim'#39','#39'PV'#39','#39'Sim'#39','#39'EQ'#39','#39'Sim'#39','#39'EV'#39 +
        ','#39'Sim'#39','#39'AQ'#39','#39'Sim'#39','#39'AV'#39','#39'Sim'#39','#39'Nao'#39') TPCOB, '
      '   R.PERCRATEIOCONTR, '
      '   CC.NOME AS NOMECC,'
      '   ADT.DATAASSADITAMENTO AS DATAADITAMENTO'
      'FROM '
      '   CONTRATOCONTR C, '
      '   OBJETOSXITEMCONTR OI,'
      ''
      '   OBJETOXITEM OXI,'
      '   TIPORECEBDESEMB T,'
      ''
      '   OBJETOCONTRATUAL O,'
      '   ITEMCONTRATUAL I, '
      '   RATEIOCENTROCUSTO R, '
      '   CENTCUST CC, '
      '   PESSOA P, '
      '   PESSOA RS, '
      '   MOEDA M, '
      '   CONTRATOUSUARIO CXU, '
      '   (SELECT AD1.DATAASSADITAMENTO, '
      '           AD1.IDCONTRATO '
      '    FROM ADITAMENTO AD1 '
      '    WHERE (AD1.IDADITAMENTO=(SELECT MAX(AD2.IDADITAMENTO) '
      '                             FROM ADITAMENTO AD2'
      
        '                             WHERE (AD2.IDCONTRATO= AD1.IDCONTRA' +
        'TO)))) ADT '
      'WHERE '
      '    (C.IDFORCLI=P.IDPESSOA(+)) AND '
      '    (C.IDRESPONSAVEL=RS.IDPESSOA(+)) AND '
      '    (C.IDCONTRATO=OI.IDCONTRATO(+)) AND '
      '    (C.IDCONTRATO = ADT.IDCONTRATO(+)) AND '
      '    (C.IDPESSOA = 1) AND'
      '    (OI.IDITEM=I.IDITEM) AND '
      '    (OI.IDOBJETO=O.IDOBJETO) AND '
      '    (OI.MOECODIGO=M.MOECODIGO(+)) AND '
      '    (OI.IDCONTRATO=R.IDCONTRATO(+)) AND '
      '    (OI.IDOBJETO=R.IDOBJETO(+)) AND '
      '    (OI.IDITEM=R.IDITEM(+)) AND '
      '    (R.IDEMPRESA=CC.IDEMPRESA) AND '
      '    (R.CODCENTROCUSTO=CC.CODCENTROCUSTO) AND '
      '    (CXU.IDCONTRATO = C.IDCONTRATO) AND '
      '    (CXU.IDUSUARIO = 3)  AND'
      ''
      '    (OXI.IDPESSOA     = T.IDPESSOA )    AND'
      '    (OXI.RECPAG       = T.RECPAG)       AND'
      '    (OXI.CODTIPRECDES = T.CODTIPRECDES) AND'
      '    (OI.IDITEM        = OXI.IDITEM)     AND'
      '    (OI.IDOBJETO      = OXI.IDOBJETO)'
      ''
      ''
      'ORDER BY C.NOMECONTRATO, O.NOMEOBJETO, I.NOME_ITEM, NOMECC'
      ' ')
    ClientDataSet = cdsContratos
    Left = 32
    Top = 64
  end
  object cdsContratos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 64
    Data = {
      A50300009619E0BD010000001800000021000000000003000000A5030A494443
      4F4E545241544F08000400000000000C4E4F4D45434F4E545241544F01004900
      00000100055749445448020002003C00084944464F52434C4908000400000000
      000A4E4F4D45464F52434C490100490000000100055749445448020002003C00
      0D4944524553504F4E534156454C0800040000000000084E4F4D455245535001
      00490000000100055749445448020002003C000A44415441494E4943494F0800
      0800000000000E44415441415353494E41545552410800080000000000104441
      544142415345434F4E545241544F08000800000000000F444154415052455645
      4E434552524108000800000000000F4441544145464554454E43455252410800
      0800000000000C4F42535F434F4E545241544F04004B00000002000753554254
      595045020049000500546578740005574944544802000200F4010952454E4F56
      4143414F04004B00000002000753554254595045020049000500546578740005
      574944544802000200F4010F444553435F5449504F444553454D420100490000
      0001000557494454480200020023000649444954454D0800040000000000094E
      4F4D455F4954454D010049000000010005574944544802000200C8000849444F
      424A45544F08000400000000000A4E4F4D454F424A45544F0100490000000100
      05574944544802000200C8000C44415441424153454954454D08000800000000
      00094D4F45434F4449474F0800040000000000074D4F45444553430100490000
      00010005574944544802000200140008515444454954454D0800040000000000
      1356414C4F52554E49544152494F4F424A45544F08000400000000001056414C
      4F52544F54414C4F424A45544F08000400000000000E44415441494E4943494F
      434F425208000800000000000A4F42534552564143414F010049000000010005
      574944544802000200FA001156414C4F5242415345434F4E545241544F080004
      0000000000055449504F43010049000000010005574944544802000200090004
      465245510100490000000100055749445448020002000600055450434F420100
      4900000001000557494454480200020003000F5045524352415445494F434F4E
      54520800040000000000064E4F4D454343010049000000010005574944544802
      0002001E000E4441544141444954414D454E544F080008000000000002000D44
      454641554C545F4F5244455202008200040000000200120010002000044C4349
      440400010009080000}
  end
  object dsReajuste: TwwDataSource
    DataSet = cdsReajuste
    Left = 224
    Top = 120
  end
  object pplReajuste: TppBDEPipeline
    DataSource = dsReajuste
    UserName = 'lReajuste'
    Left = 328
    Top = 120
    object pplReajusteppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCORRECAO'
      FieldName = 'IDCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplReajusteppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDREFCONTR'
      FieldName = 'IDREFCONTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplReajusteppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplReajusteppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATO'
      FieldName = 'IDCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplReajusteppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOBJETO'
      FieldName = 'IDOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplReajusteppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEM'
      FieldName = 'IDITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplReajusteppField7: TppField
      FieldAlias = 'TIPOCORRECAO'
      FieldName = 'TIPOCORRECAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 6
    end
    object pplReajusteppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FAIXAINICIAL'
      FieldName = 'FAIXAINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplReajusteppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'FAIXAFINAL'
      FieldName = 'FAIXAFINAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplReajusteppField10: TppField
      FieldAlias = 'FLGFAIXARATACU'
      FieldName = 'FLGFAIXARATACU'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object pplReajusteppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplReajusteppField12: TppField
      FieldAlias = 'FLGAFETACORR'
      FieldName = 'FLGAFETACORR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object pplReajusteppField13: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object pplReajusteppField14: TppField
      FieldAlias = 'CODADITAMENTO'
      FieldName = 'CODADITAMENTO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object pplReajusteppField15: TppField
      FieldAlias = 'DATABASE'
      FieldName = 'DATABASE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object pplReajusteppField16: TppField
      FieldAlias = 'OBSADITAMENTO'
      FieldName = 'OBSADITAMENTO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplReajusteppField17: TppField
      FieldAlias = 'DATAULTIMACORR'
      FieldName = 'DATAULTIMACORR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object pplReajusteppField18: TppField
      FieldAlias = 'FREQUENCIA'
      FieldName = 'FREQUENCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 17
    end
    object pplReajusteppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'INTERVALO'
      FieldName = 'INTERVALO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplReajusteppField20: TppField
      FieldAlias = 'FLGATIVO'
      FieldName = 'FLGATIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 19
    end
    object pplReajusteppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplReajusteppField22: TppField
      FieldAlias = 'ABRANGENCIA'
      FieldName = 'ABRANGENCIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object pplReajusteppField23: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 22
    end
    object pplReajusteppField24: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 23
    end
    object pplReajusteppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGOPROJ'
      FieldName = 'MOECODIGOPROJ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplReajusteppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATO_1'
      FieldName = 'IDCONTRATO_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplReajusteppField27: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 26
    end
    object pplReajusteppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplReajusteppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDCOBRANCA'
      FieldName = 'IDENDCOBRANCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplReajusteppField30: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object pplReajusteppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplReajusteppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDCORRESPON'
      FieldName = 'IDENDCORRESPON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplReajusteppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDENTREGA'
      FieldName = 'IDENDENTREGA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplReajusteppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplReajusteppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTATO'
      FieldName = 'IDCONTATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplReajusteppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object pplReajusteppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO_1'
      FieldName = 'MOECODIGO_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 36
    end
    object pplReajusteppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object pplReajusteppField39: TppField
      FieldAlias = 'TIPOCONTRATO'
      FieldName = 'TIPOCONTRATO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 38
    end
    object pplReajusteppField40: TppField
      FieldAlias = 'DESCRICAOCONTRATO'
      FieldName = 'DESCRICAOCONTRATO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 39
      Searchable = False
      Sortable = False
    end
    object pplReajusteppField41: TppField
      FieldAlias = 'DATAASSINATURA'
      FieldName = 'DATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 40
    end
    object pplReajusteppField42: TppField
      FieldAlias = 'CODAUXCONTRATO'
      FieldName = 'CODAUXCONTRATO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 41
    end
    object pplReajusteppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORBASECONTRATO'
      FieldName = 'VALORBASECONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object pplReajusteppField44: TppField
      FieldAlias = 'DATABASECONTRATO'
      FieldName = 'DATABASECONTRATO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 43
    end
    object pplReajusteppField45: TppField
      FieldAlias = 'DATAPREVENCERRA'
      FieldName = 'DATAPREVENCERRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 44
    end
    object pplReajusteppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRAZODENUNCIA'
      FieldName = 'PRAZODENUNCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplReajusteppField47: TppField
      FieldAlias = 'CODCONTRATOEMPR'
      FieldName = 'CODCONTRATOEMPR'
      FieldLength = 20
      DisplayWidth = 20
      Position = 46
    end
    object pplReajusteppField48: TppField
      FieldAlias = 'FLGEMPENHO'
      FieldName = 'FLGEMPENHO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 47
    end
    object pplReajusteppField49: TppField
      FieldAlias = 'DATAEFETENCERRA'
      FieldName = 'DATAEFETENCERRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 48
    end
    object pplReajusteppField50: TppField
      FieldAlias = 'MOTIVOENCERRA'
      FieldName = 'MOTIVOENCERRA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 49
    end
    object pplReajusteppField51: TppField
      FieldAlias = 'FLGFIMCONTRATO'
      FieldName = 'FLGFIMCONTRATO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 50
    end
    object pplReajusteppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODTIPDOC'
      FieldName = 'CODTIPDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 51
    end
    object pplReajusteppField53: TppField
      FieldAlias = 'TRGDTINCLUSAO_1'
      FieldName = 'TRGDTINCLUSAO_1'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 52
    end
    object pplReajusteppField54: TppField
      FieldAlias = 'TRGUSERINCLUSAO_1'
      FieldName = 'TRGUSERINCLUSAO_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 53
    end
    object pplReajusteppField55: TppField
      FieldAlias = 'RENOVACAO'
      FieldName = 'RENOVACAO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 54
      Searchable = False
      Sortable = False
    end
    object pplReajusteppField56: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 55
      Searchable = False
      Sortable = False
    end
    object pplReajusteppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADITAMENTO'
      FieldName = 'IDADITAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 56
    end
    object pplReajusteppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTELEFONE'
      FieldName = 'IDTELEFONE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object pplReajusteppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESERVAORCAMEN'
      FieldName = 'IDRESERVAORCAMEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object pplReajusteppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVISO'
      FieldName = 'AVISO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 59
    end
    object pplReajusteppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOPROCESSORAD'
      FieldName = 'IDTIPOPROCESSORAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 60
    end
    object pplReajusteppField62: TppField
      FieldAlias = 'FLGGERANOTADEB'
      FieldName = 'FLGGERANOTADEB'
      FieldLength = 1
      DisplayWidth = 1
      Position = 61
    end
    object pplReajusteppField63: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 62
    end
    object pplReajusteppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROCESSORAD'
      FieldName = 'IDPROCESSORAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 63
    end
    object pplReajusteppField65: TppField
      FieldAlias = 'MOEDESC'
      FieldName = 'MOEDESC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 64
    end
    object pplReajusteppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOBJTODOCONTR'
      FieldName = 'IDOBJTODOCONTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object pplReajusteppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEMTODOCONTR'
      FieldName = 'IDITEMTODOCONTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object pplReajusteppField68: TppField
      FieldAlias = 'DSC_ATIVO'
      FieldName = 'DSC_ATIVO'
      FieldLength = 7
      DisplayWidth = 7
      Position = 67
    end
    object pplReajusteppField69: TppField
      FieldAlias = 'DATAEFETIVA'
      FieldName = 'DATAEFETIVA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 68
    end
    object pplReajusteppField70: TppField
      FieldAlias = 'DESCTIPOCORR'
      FieldName = 'DESCTIPOCORR'
      FieldLength = 18
      DisplayWidth = 18
      Position = 69
    end
  end
  object spReajuste: TCMSqlParams
    SQL.Strings = (
      
        'SELECT COR.IDCONTRATO, COR.IDOBJETO,  COR.IDITEM,    COR.FAIXAIN' +
        'ICIAL, COR.FAIXAFINAL,'
      
        '       COR.VALOR,      COR.DESCRICAO, COR.INTERVALO, COR.DATABAS' +
        'E,'
      '       DECODE(COR.FREQUENCIA,'#39'D'#39','#39'Diária'#39','
      '                             '#39'M'#39','#39'Mensal'#39','
      '                             '#39'A'#39','#39'Anual'#39') AS FREQUENCIA,'
      '       DECODE(COR.TIPOCORRECAO,'#39'PC'#39','#39'Percentual'#39','
      '                               '#39'VA'#39','#39'Valor Absoluto'#39','
      '                               '#39'FP'#39','#39'Faixa Percentual'#39','
      '                               '#39'FV'#39','#39'Faixa Vlr Absoluto'#39','
      
        '                               '#39'MD'#39','#39'Moeda'#39','#39'Tipo Desconhecido'#39')' +
        ' AS DESCTIPOCORR'
      'FROM CORRECAOCONTR COR, MOEDA M, CONTRATOCONTR C'
      'WHERE (COR.IDCONTRATO = C.IDCONTRATO)'
      '  AND (COR.MOECODIGO  = M.MOECODIGO(+))'
      'ORDER BY COR.IDCONTRATO, COR.ORDEM'
      ' ')
    ClientDataSet = cdsReajuste
    Left = 32
    Top = 120
  end
  object cdsReajuste: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 120
    Data = {
      8C0800009619E0BD0100000018000000460000000000030000008C080A494443
      4F52524543414F08000400000000000A4944524546434F4E5452080004000000
      0000094D4F45434F4449474F08000400000000000A4944434F4E545241544F08
      000400000000000849444F424A45544F08000400000000000649444954454D08
      000400000000000C5449504F434F52524543414F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000200
      0C4641495841494E494349414C08000400000000000A464149584146494E414C
      08000400000000000E464C474641495841524154414355010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0001000556414C4F5208000400000000000C464C474146455441434F52520100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000944455343524943414F010049000000010005574944
      5448020002003C000D434F4441444954414D454E544F01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      0F0008444154414241534508000800000000000D4F425341444954414D454E54
      4F04004B00000002000753554254595045020049000500546578740005574944
      544802000200F4010E44415441554C54494D41434F525208000800000000000A
      4652455155454E43494101004900000002000753554254595045020049000A00
      4669786564436861720005574944544802000200010009494E54455256414C4F
      080004000000000008464C47415449564F010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000100054F52
      44454D08000400000000000B414252414E47454E434941010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0001000D5452474454494E434C5553414F08000800000000000F545247555345
      52494E434C5553414F0100490000000100055749445448020002001E000D4D4F
      45434F4449474F50524F4A08000400000000000C4944434F4E545241544F5F31
      08000400000000000C4E4F4D45434F4E545241544F0100490000000100055749
      445448020002003C000C434F44504F5254464F524D4108000400000000000D49
      44454E44434F4252414E434108000400000000000F434F4443454E54524F5245
      53504F4E01004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A00084944504553534F4108000400000000
      000E4944454E44434F52524553504F4E08000400000000000C4944454E44454E
      5452454741080004000000000009554E49444E45474F43080004000000000009
      4944434F4E5441544F0800040000000000084944464F52434C49080004000000
      00000B4D4F45434F4449474F5F3108000400000000000D4944524553504F4E53
      4156454C08000400000000000C5449504F434F4E545241544F01004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      00020001001144455343524943414F434F4E545241544F04004B000000020007
      53554254595045020049000500546578740005574944544802000200F4010E44
      415441415353494E415455524108000800000000000E434F44415558434F4E54
      5241544F01004900000001000557494454480200020014001156414C4F524241
      5345434F4E545241544F0800040000000000104441544142415345434F4E5452
      41544F08000800000000000F4441544150524556454E43455252410800080000
      0000000D5052415A4F44454E554E43494108000400000000000F434F44434F4E
      545241544F454D505201004900000001000557494454480200020014000A464C
      47454D50454E484F01004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020001000F4441544145464554454E43
      4552524108000800000000000D4D4F5449564F454E4345525241010049000000
      0100055749445448020002003C000E464C4746494D434F4E545241544F010049
      00000002000753554254595045020049000A0046697865644368617200055749
      44544802000200010009434F44544950444F4308000400000000000F54524744
      54494E434C5553414F5F3108000800000000001154524755534552494E434C55
      53414F5F310100490000000100055749445448020002001E000952454E4F5641
      43414F04004B0000000200075355425459504502004900050054657874000557
      4944544802000200F4010A4F42534552564143414F04004B0000000200075355
      4254595045020049000500546578740005574944544802000200F4010C494441
      444954414D454E544F08000400000000000A494454454C45464F4E4508000400
      00000000104944524553455256414F5243414D454E0800040000000000054156
      49534F08000400000000001149445449504F50524F434553534F524144080004
      00000000000E464C47474552414E4F5441444542010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      0A44415441494E4943494F08000800000000000D494450524F434553534F5241
      440800040000000000074D4F4544455343010049000000010005574944544802
      00020014000E49444F424A544F444F434F4E545208000400000000000F494449
      54454D544F444F434F4E54520800040000000000094453435F415449564F0100
      4900000001000557494454480200020007000B44415441454645544956410800
      0800000000000C444553435449504F434F525201004900000001000557494454
      4802000200120002000D44454641554C545F4F52444552020082000200000004
      001500044C4349440400010009080000}
  end
end
