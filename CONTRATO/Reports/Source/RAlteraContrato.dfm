inherited RptAlteraContrato: TRptAlteraContrato
  Left = 289
  Top = 207
  Width = 484
  Height = 262
  Caption = 'RptAlteraContrato'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 96
    Top = 208
    Width = 336
    Height = 13
    Caption = 'RELATÓRIO COM SUB-REPORTS TRAVA EM 3 CAMADAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Alterações Contratuais'
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
          'Cadastrados'
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
        TipodeDado = tdString
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
        TipodeDado = tdString
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
    Top = 3
  end
  inherited DevRptCM: TExtraOptions
    Left = 120
    Top = 3
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpAlteraContrato
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
    Left = 224
    Top = 3
  end
  object dsContratos: TwwDataSource
    DataSet = qryContratos
    Left = 224
    Top = 53
  end
  object pplContratos: TppBDEPipeline
    DataSource = dsContratos
    SkipWhenNoRecords = False
    UserName = 'lContratos'
    Left = 328
    Top = 53
    object pplContratosppField1: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplContratosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplContratosppField3: TppField
      FieldAlias = 'NOMEFORCLI'
      FieldName = 'NOMEFORCLI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplContratosppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRESPONSAVEL'
      FieldName = 'IDRESPONSAVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplContratosppField5: TppField
      FieldAlias = 'NOMERESP'
      FieldName = 'NOMERESP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplContratosppField6: TppField
      FieldAlias = 'DATAASSINATURA'
      FieldName = 'DATAASSINATURA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplContratosppField7: TppField
      FieldAlias = 'DATABASECONTRATO'
      FieldName = 'DATABASECONTRATO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object pplContratosppField8: TppField
      FieldAlias = 'DATAPREVENCERRA'
      FieldName = 'DATAPREVENCERRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplContratosppField9: TppField
      FieldAlias = 'DATAEFETENCERRA'
      FieldName = 'DATAEFETENCERRA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplContratosppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDITEM'
      FieldName = 'IDITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplContratosppField11: TppField
      FieldAlias = 'NOME_ITEM'
      FieldName = 'NOME_ITEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 10
    end
    object pplContratosppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOBJETO'
      FieldName = 'IDOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplContratosppField13: TppField
      FieldAlias = 'NOMEOBJETO'
      FieldName = 'NOMEOBJETO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 12
    end
    object pplContratosppField14: TppField
      FieldAlias = 'DATABASEITEM'
      FieldName = 'DATABASEITEM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object pplContratosppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplContratosppField16: TppField
      FieldAlias = 'MOEDESC'
      FieldName = 'MOEDESC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object pplContratosppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEITEM'
      FieldName = 'QTDEITEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplContratosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORUNITARIOOBJETO'
      FieldName = 'VALORUNITARIOOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplContratosppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTALOBJETO'
      FieldName = 'VALORTOTALOBJETO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplContratosppField20: TppField
      FieldAlias = 'DATAINICIOCOBR'
      FieldName = 'DATAINICIOCOBR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object pplContratosppField21: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 250
      DisplayWidth = 250
      Position = 20
    end
    object pplContratosppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORBASECONTRATO'
      FieldName = 'VALORBASECONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplContratosppField23: TppField
      FieldAlias = 'TIPOC'
      FieldName = 'TIPOC'
      FieldLength = 9
      DisplayWidth = 9
      Position = 22
    end
    object pplContratosppField24: TppField
      FieldAlias = 'FREQ'
      FieldName = 'FREQ'
      FieldLength = 6
      DisplayWidth = 6
      Position = 23
    end
    object pplContratosppField25: TppField
      FieldAlias = 'TPCOB'
      FieldName = 'TPCOB'
      FieldLength = 3
      DisplayWidth = 3
      Position = 24
    end
    object pplContratosppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCRATEIOCONTR'
      FieldName = 'PERCRATEIOCONTR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplContratosppField27: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 30
      DisplayWidth = 30
      Position = 26
    end
    object pplContratosppField28: TppField
      FieldAlias = 'DATAADITAMENTO'
      FieldName = 'DATAADITAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 27
    end
    object pplContratosppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATO'
      FieldName = 'IDCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
  end
  object rpAlteraContrato: TppReport
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
    Left = 415
    Top = 53
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContratos'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Relatório de Alterações Contratuais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 107950
        mmTop = 8731
        mmWidth = 72231
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'rpNomeEmpresa'
        Caption = 'Nome Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 123561
        mmTop = 1852
        mmWidth = 35719
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'rpContratosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLine11: TppLine
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
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText1: TppDBText
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
      object ppDBText2: TppDBText
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
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 265
        mmTop = 794
        mmWidth = 281782
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'ppLabel9'
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
      object ppLine12: TppLine
        UserName = 'rpContratosLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
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
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel12: TppLabel
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
        mmTop = 265
        mmWidth = 32808
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'IDCONTRATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 265
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOMECONTRATO'
      DataPipeline = pplContratos
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'rpContratosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratos'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20108
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'rpContratosShape1'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
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
        object ppLabel13: TppLabel
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
          mmTop = 11377
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'rpContratosLabel2'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 11377
          mmTop = 11377
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
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
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
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
          mmTop = 11377
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
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
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
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
          mmTop = 11377
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
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
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'rpContratosLabel5'
          Caption = 'Encerramento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 70115
          mmTop = 11377
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
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
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
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
          mmTop = 11377
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
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
          mmTop = 16404
          mmWidth = 76994
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
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
          mmTop = 11377
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
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
          mmTop = 16404
          mmWidth = 66675
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
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
          mmTop = 11377
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
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
          mmTop = 16404
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
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
          mmTop = 16404
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label2'
          Caption = 'Informações Originais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 6615
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'pplAditamentos'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = pplAditamentos
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
            Left = 256
            Top = 104
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'pplAditamentos'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppLabel30: TppLabel
                UserName = 'Label30'
                Caption = 'Aditamentos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold, fsItalic]
                Transparent = True
                mmHeight = 4233
                mmLeft = 0
                mmTop = 1323
                mmWidth = 21431
                BandType = 1
              end
              object ppLine13: TppLine
                UserName = 'Line13'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 529
                mmWidth = 284300
                BandType = 1
              end
            end
            object ppDetailBand5: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 7408
              mmPrintPosition = 0
              object ppDBText19: TppDBText
                UserName = 'DBText1'
                DataField = 'DATAASSADITAMENTO'
                DataPipeline = pplAditamentos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplAditamentos'
                mmHeight = 3175
                mmLeft = 15610
                mmTop = 794
                mmWidth = 15875
                BandType = 4
              end
              object ppDBText20: TppDBText
                UserName = 'DBText2'
                DataField = 'CODADITAMENTO'
                DataPipeline = pplAditamentos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'pplAditamentos'
                mmHeight = 3175
                mmLeft = 52388
                mmTop = 794
                mmWidth = 19050
                BandType = 4
              end
              object ppLabel35: TppLabel
                UserName = 'Label35'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 7408
                mmTop = 794
                mmWidth = 5821
                BandType = 4
              end
              object ppLabel36: TppLabel
                UserName = 'Label36'
                Caption = 'Processo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 35190
                mmTop = 794
                mmWidth = 12435
                BandType = 4
              end
              object ppDBMemo1: TppDBMemo
                UserName = 'DBMemo1'
                CharWrap = True
                DataField = 'DESCADITAMENTO'
                DataPipeline = pplAditamentos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'pplAditamentos'
                mmHeight = 6615
                mmLeft = 73290
                mmTop = 792
                mmWidth = 210609
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppSummaryBand3: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 7408
              mmPrintPosition = 0
              object ppLine14: TppLine
                UserName = 'Line14'
                Pen.Width = 2
                ParentWidth = True
                Weight = 1.5
                mmHeight = 6085
                mmLeft = 0
                mmTop = 1323
                mmWidth = 284300
                BandType = 7
              end
            end
            object ppGroup6: TppGroup
              BreakName = 'IDADITAMENTO'
              DataPipeline = pplAditamentos
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group6'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'pplAditamentos'
              object ppGroupHeaderBand6: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
              object ppGroupFooterBand6: TppGroupFooterBand
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 5027
                mmPrintPosition = 0
                object ppSubReport2: TppSubReport
                  UserName = 'SubReport2'
                  ExpandAll = False
                  NewPrintJob = False
                  OutlineSettings.CreateNode = True
                  TraverseAllData = False
                  DataPipelineName = 'pplLog'
                  mmHeight = 5027
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 284300
                  BandType = 5
                  GroupNo = 0
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  object ppChildReport2: TppChildReport
                    AutoStop = False
                    DataPipeline = pplLog
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
                    Left = 328
                    Top = 176
                    Version = '7.04'
                    mmColumnWidth = 0
                    DataPipelineName = 'pplLog'
                    object ppTitleBand2: TppTitleBand
                      mmBottomOffset = 0
                      mmHeight = 529
                      mmPrintPosition = 0
                    end
                    object ppDetailBand6: TppDetailBand
                      mmBottomOffset = 0
                      mmHeight = 4233
                      mmPrintPosition = 0
                      object ppDBText23: TppDBText
                        UserName = 'DBText23'
                        DataField = 'DESCRICAO'
                        DataPipeline = pplLog
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplLog'
                        mmHeight = 3175
                        mmLeft = 19315
                        mmTop = 529
                        mmWidth = 62971
                        BandType = 4
                      end
                      object ppDBText24: TppDBText
                        UserName = 'DBText24'
                        DataField = 'VLRANTERIOR'
                        DataPipeline = pplLog
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplLog'
                        mmHeight = 3175
                        mmLeft = 88106
                        mmTop = 529
                        mmWidth = 70908
                        BandType = 4
                      end
                      object ppDBText25: TppDBText
                        UserName = 'DBText25'
                        DataField = 'VLRATUAL'
                        DataPipeline = pplLog
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        Transparent = True
                        DataPipelineName = 'pplLog'
                        mmHeight = 3175
                        mmLeft = 162984
                        mmTop = 529
                        mmWidth = 77523
                        BandType = 4
                      end
                    end
                    object ppSummaryBand4: TppSummaryBand
                      mmBottomOffset = 0
                      mmHeight = 0
                      mmPrintPosition = 0
                    end
                    object ppGroup5: TppGroup
                      BreakName = 'DSC_ITEM'
                      DataPipeline = pplLog
                      KeepTogether = True
                      OutlineSettings.CreateNode = True
                      UserName = 'Group5'
                      mmNewColumnThreshold = 0
                      mmNewPageThreshold = 0
                      DataPipelineName = 'pplLog'
                      object ppGroupHeaderBand5: TppGroupHeaderBand
                        mmBottomOffset = 0
                        mmHeight = 7408
                        mmPrintPosition = 0
                        object ppLabel31: TppLabel
                          UserName = 'Label31'
                          Caption = 'Item'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 7673
                          mmTop = 0
                          mmWidth = 5556
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppLabel32: TppLabel
                          UserName = 'Label32'
                          Caption = 'Informação Alterada'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 19315
                          mmTop = 4233
                          mmWidth = 26723
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppLabel33: TppLabel
                          UserName = 'Label33'
                          Caption = 'Valor Anterior'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 88106
                          mmTop = 4233
                          mmWidth = 18521
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppLabel34: TppLabel
                          UserName = 'Label34'
                          Caption = 'Valor Atual'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = [fsBold]
                          Transparent = True
                          mmHeight = 3175
                          mmLeft = 162984
                          mmTop = 4233
                          mmWidth = 14552
                          BandType = 3
                          GroupNo = 0
                        end
                        object ppDBText22: TppDBText
                          UserName = 'DBText22'
                          DataField = 'DSC_ITEM'
                          DataPipeline = pplLog
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 8
                          Font.Style = []
                          Transparent = True
                          DataPipelineName = 'pplLog'
                          mmHeight = 3175
                          mmLeft = 19315
                          mmTop = 529
                          mmWidth = 170392
                          BandType = 3
                          GroupNo = 0
                        end
                      end
                      object ppGroupFooterBand5: TppGroupFooterBand
                        mmBottomOffset = 0
                        mmHeight = 2381
                        mmPrintPosition = 0
                        object ppLine15: TppLine
                          UserName = 'Line15'
                          ParentWidth = True
                          Weight = 0.75
                          mmHeight = 1588
                          mmLeft = 0
                          mmTop = 792
                          mmWidth = 284300
                          BandType = 5
                          GroupNo = 0
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOMEOBJETO'
      DataPipeline = pplContratos
      OutlineSettings.CreateNode = True
      UserName = 'rpContratosGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratos'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14023
        mmPrintPosition = 0
        object ppLabel21: TppLabel
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
        object ppDBText12: TppDBText
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
        object ppLabel22: TppLabel
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
        object ppLabel23: TppLabel
          UserName = 'rpContratosLabel11'
          Caption = ' Início Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 134938
          mmTop = 9790
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object ppLabel24: TppLabel
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
        object ppLabel25: TppLabel
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
        object ppLabel26: TppLabel
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
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME_ITEM'
      DataPipeline = pplContratos
      OutlineSettings.CreateNode = True
      UserName = 'rpContratosGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratos'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppDBText13: TppDBText
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
        object ppDBText14: TppDBText
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
        object ppDBText15: TppDBText
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
        object ppDBText16: TppDBText
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
        object ppDBText17: TppDBText
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
        object ppLabel27: TppLabel
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
        object ppDBText18: TppDBText
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
        object ppLabel28: TppLabel
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
        object ppLabel29: TppLabel
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
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsAditamentos: TwwDataSource
    DataSet = qryAditamentos
    Left = 224
    Top = 101
  end
  object pplAditamentos: TppBDEPipeline
    DataSource = dsAditamentos
    SkipWhenNoRecords = False
    UserName = 'lAditamentos'
    Left = 328
    Top = 101
    MasterDataPipelineName = 'pplContratos'
    object pplAditamentosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATO'
      FieldName = 'IDCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplAditamentosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADITAMENTO'
      FieldName = 'IDADITAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplAditamentosppField3: TppField
      FieldAlias = 'NOMECONTRATO'
      FieldName = 'NOMECONTRATO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplAditamentosppField4: TppField
      FieldAlias = 'DATAASSADITAMENTO'
      FieldName = 'DATAASSADITAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplAditamentosppField5: TppField
      FieldAlias = 'CODADITAMENTO'
      FieldName = 'CODADITAMENTO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplAditamentosppField6: TppField
      FieldAlias = 'DESCADITAMENTO'
      FieldName = 'DESCADITAMENTO'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 5
      Searchable = False
      Sortable = False
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDCONTRATO'
      DetailFieldName = 'IDCONTRATO'
      DetailSortOrder = soAscending
    end
  end
  object dsLog: TwwDataSource
    DataSet = qryLog
    Left = 224
    Top = 149
  end
  object pplLog: TppBDEPipeline
    DataSource = dsLog
    SkipWhenNoRecords = False
    UserName = 'lLog'
    Left = 328
    Top = 149
    MasterDataPipelineName = 'pplAditamentos'
    object pplLogppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDADITAMENTO'
      FieldName = 'IDADITAMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplLogppField2: TppField
      FieldAlias = 'DSC_ITEM'
      FieldName = 'DSC_ITEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 1
    end
    object pplLogppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 2
    end
    object pplLogppField4: TppField
      FieldAlias = 'VLRANTERIOR'
      FieldName = 'VLRANTERIOR'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplLogppField5: TppField
      FieldAlias = 'VLRATUAL'
      FieldName = 'VLRATUAL'
      FieldLength = 500
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object TppMasterFieldLink
      MasterFieldName = 'IDADITAMENTO'
      DetailFieldName = 'IDADITAMENTO'
      DetailSortOrder = soAscending
    end
  end
  object qryLog: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsAditamentos
    SQL.Strings = (
      'SELECT L.IDADITAMENTO,'
      
        '       DECODE(L.IDITEM, NULL, '#39'Contrato'#39', I.NOME_ITEM) AS DSC_IT' +
        'EM,'
      
        '       DECODE(F.DESCRICAO, NULL, F.FIELDNAME, SUBSTR(F.DESCRICAO' +
        ',1,40) ) AS DESCRICAO,'
      '       L.VLRANTERIOR,'
      '       L.VLRATUAL'
      '  FROM LOGADITAMENTO L, ITEMCONTRATUAL I,'
      '       DDFIELD F'
      ' WHERE L.IDDDFIELD = F.IDDDFIELD'
      '   AND L.IDITEM = I.IDITEM(+)'
      '   AND L.IDADITAMENTO = :IDADITAMENTO'
      ' ORDER BY DSC_ITEM, DESCRICAO'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 134
    Top = 148
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDADITAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAditamentos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsContratos
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO,'
      '   A.IDADITAMENTO,'
      '   C.NOMECONTRATO,'
      '   A.DATAASSADITAMENTO,'
      '   A.CODADITAMENTO,'
      '   A.DESCADITAMENTO'
      'FROM'
      '   CONTRATOORIG C,ADITAMENTO A'
      'WHERE'
      '   (C.IDCONTRATO = :IDCONTRATO) AND'
      '   (A.IDCONTRATO = C.IDCONTRATO)'
      'ORDER BY'
      '   C.NOMECONTRATO,'
      '   C.IDCONTRATO,'
      '   A.DATAASSADITAMENTO,'
      '   A.CODADITAMENTO'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 134
    Top = 100
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
  end
  object qryContratos: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO,'
      '   C.NOMECONTRATO,'
      '   C.IDFORCLI,'
      '   P.NOME NOMEFORCLI,'
      '   C.IDRESPONSAVEL,'
      '   RS.NOME NOMERESP,'
      '   C.DATAASSINATURA,'
      '   C.DATABASECONTRATO,'
      '   C.DATAPREVENCERRA,'
      '   C.DATAEFETENCERRA,'
      '   OI.IDITEM,'
      '   I.NOME_ITEM,'
      '   OI.IDOBJETO,'
      '   O.NOMEOBJETO,'
      '   OI.DATABASEITEM,'
      '   OI.MOECODIGO,'
      '   M.MOEDESC,'
      '   OI.QTDEITEM,'
      '   OI.VALORUNITARIOOBJETO,'
      '   OI.VALORTOTALOBJETO,'
      '   OI.DATAINICIOCOBR,'
      '   OI.OBSERVACAO,'
      '   C.VALORBASECONTRATO,'
      '   DECODE (C.TIPOCONTRATO,'#39'P'#39','#39'A Pagar'#39','#39'R'#39','#39'A Receber'#39') TIPOC,'
      
        '   DECODE (OI.FREQUENCIA,'#39'M'#39','#39'mensal'#39','#39'U'#39','#39'unica'#39','#39'D'#39','#39'diaria'#39','#39 +
        'A'#39','#39'anual'#39') FREQ,'
      
        '   DECODE (i.tipocobranca, '#39'PQ'#39','#39'Sim'#39','#39'PV'#39','#39'Sim'#39','#39'EQ'#39','#39'Sim'#39','#39'EV'#39 +
        ','#39'Sim'#39','#39'AQ'#39','#39'Sim'#39','#39'AV'#39','#39'Sim'#39','#39'Nao'#39') TPCOB,'
      '   R.PERCRATEIOCONTR,'
      '   CC.NOME NOMECC,'
      '   ADT.DATAASSADITAMENTO AS DATAADITAMENTO'
      ''
      'FROM'
      '   CONTRATOORIG C,'
      '   OBJXITORIG OI,'
      '   OBJETOCONTRATUAL O,'
      '   ITEMCONTRATUAL I,'
      '   RATEIOCENTROCUSTO R,'
      '   CENTCUST CC,'
      '   PESSOA P,'
      '   PESSOA RS,'
      '   MOEDA M,'
      '   CONTRATOUSUARIO CXU,'
      ''
      '   (SELECT AD1.DATAASSADITAMENTO,'
      '           AD1.IDCONTRATO'
      '    FROM ADITAMENTO AD1'
      '    WHERE (AD1.IDADITAMENTO=(SELECT MAX(AD2.IDADITAMENTO)'
      '                             FROM ADITAMENTO AD2'
      
        '                             WHERE (AD2.IDCONTRATO= AD1.IDCONTRA' +
        'TO)))) ADT'
      'WHERE'
      '    (C.IDFORCLI=P.IDPESSOA(+)) AND'
      '    (C.IDRESPONSAVEL=RS.IDPESSOA(+)) AND'
      '    (C.IDCONTRATO=OI.IDCONTRATO(+)) AND'
      '    (C.IDCONTRATO = ADT.IDCONTRATO(+)) AND'
      '    (C.IDPESSOA = :IDPESSOA) AND'
      '    (OI.IDITEM=I.IDITEM) AND'
      '    (OI.IDOBJETO=O.IDOBJETO) AND'
      '    (OI.MOECODIGO=M.MOECODIGO(+)) AND'
      '    (OI.IDCONTRATO=R.IDCONTRATO(+)) AND'
      '    (OI.IDOBJETO=R.IDOBJETO(+)) AND'
      '    (OI.IDITEM=R.IDITEM(+)) AND'
      '    (R.IDEMPRESA=CC.IDEMPRESA) AND'
      '    (R.CODCENTROCUSTO=CC.CODCENTROCUSTO) AND'
      
        '    ((RTRIM(C.FLGFIMCONTRATO) = :TIPOCONTRATO) OR ('#39'TODOS'#39' = :FL' +
        'GCONTRATO)) AND'
      
        '    ((C.DATAASSINATURA  BETWEEN :DTINICIO AND :DTFIM) OR ('#39'DTASS' +
        #39' <> :TIPODATA)) AND'
      
        '    ((C.DATAPREVENCERRA BETWEEN :DTINICIO AND :DTFIM) OR ('#39'DTVNC' +
        #39' <> :TIPODATA)) AND'
      '    (CXU.IDCONTRATO = C.IDCONTRATO) AND'
      '    (CXU.IDUSUARIO = :IDUSUARIO) AND'
      
        '    ((C.DATAPREVENCERRA IS NOT NULL) OR ('#39'DTVENCD'#39' <> :FLGDATAEN' +
        'C)) AND'
      '    ((C.DATAPREVENCERRA IS NULL) OR ('#39'DTVENCI'#39' <> :FLGDATAENC))'
      
        'ORDER BY C.NOMECONTRATO, C.IDCONTRATO, O.NOMEOBJETO, I.NOME_ITEM' +
        ', CC.NOME'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 135
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'TIPOCONTRATO'
        ParamType = ptInput
        Value = '_'
      end
      item
        DataType = ftString
        Name = 'FLGCONTRATO'
        ParamType = ptInput
        Value = 'TODOS'
      end
      item
        DataType = ftDate
        Name = 'DTINICIO'
        ParamType = ptUnknown
        Value = '30/12/1899'
      end
      item
        DataType = ftDate
        Name = 'DTFIM'
        ParamType = ptUnknown
        Value = '30/12/1899'
      end
      item
        DataType = ftString
        Name = 'TIPODATA'
        ParamType = ptInput
        Value = '_'
      end
      item
        DataType = ftDate
        Name = 'DTINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DTFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'TIPODATA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDUSUARIO'
        ParamType = ptInput
        Value = '54790'
      end
      item
        DataType = ftString
        Name = 'FLGDATAENC'
        ParamType = ptInput
        Value = 'TODAS'
      end
      item
        DataType = ftString
        Name = 'FLGDATAENC'
        ParamType = ptInput
      end>
  end
  object spContratos: TCMSqlParams
    ClientDataSet = cdsContratos
    Left = 24
    Top = 13
  end
  object cdsContratos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 24
    Top = 27
  end
  object spAditamentos: TCMSqlParams
    ClientDataSet = cdsAditamentos
    Left = 24
    Top = 93
  end
  object cdsAditamentos: TCMClientDataSet
    Aggregates = <>
    MasterSource = dsContratos
    PacketRecords = 0
    Params = <>
    Left = 24
    Top = 106
  end
  object spLog: TCMSqlParams
    ClientDataSet = cdsLog
    Left = 24
    Top = 165
  end
  object cdsLog: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 24
    Top = 179
  end
end
