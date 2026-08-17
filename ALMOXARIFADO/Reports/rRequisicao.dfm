inherited RptRequisicao: TRptRequisicao
  Left = 434
  Top = 280
  Width = 274
  Height = 156
  Caption = 'Requisições Lançadas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Requisições Lançadas'
    DataBaseName = 'BaseDados'
    Params = <
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
        Required = True
        Name = 'DataInicial'
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
        Required = True
        Name = 'DataFinal'
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
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY DESCALMOX')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'DESCALMOX'
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
        Name = 'Almoxarifado'
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
        LookupSettings.SQL.Strings = (
          'Select CODCENTROCUSTO,Nome From CentCust')
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'Nome'
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
        MostraComboCompara = False
        Required = False
        Name = 'Centro de Custo'
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
        Caption = 'Requisição'
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
        Name = 'Requisição'
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
        Caption = 'Só imprimir itens estocáveis'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
        Name = 'Só imprimir itens estocáveis'
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
        Caption = 'Tipos de Lançamento'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Baixa por Custo'
          'Baixa por Perda'
          'Transferência')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
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
        Name = 'Tipos de Lançamento'
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
        Caption = 'Ordenado por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Alfabética'
          'Lançamento')
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
        MostraComboCompara = False
        Required = False
        Name = 'Ordenado por'
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
    Formheight = 340
    FormWidth = 440
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpRequisicao
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object pplRequisicao: TppBDEPipeline
    DataSource = dsRequisicao
    UserName = 'lRequisicao'
    Left = 84
    Top = 60
  end
  object dsRequisicao: TwwDataSource
    DataSet = CdsRequisicao
    Left = 144
    Top = 60
  end
  object rpRequisicao: TppReport
    AutoStop = False
    DataPipeline = pplRequisicao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpExtratoContaLabel10: TppLabel
        UserName = 'rpExtratoContaLabel10'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 125677
        mmTop = 11377
        mmWidth = 12435
        BandType = 0
      end
      object lbData: TppLabel
        UserName = 'lbData'
        Caption = 'lbData'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 11642
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Requisições Lançadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 75671
        mmTop = 8731
        mmWidth = 46038
        BandType = 0
      end
      object rpRequisicaoLabel13: TppLabel
        UserName = 'rpRequisicaoLabel13'
        Caption = 'Tipos :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 11377
        mmWidth = 9790
        BandType = 0
      end
      object LbTipo: TppLabel
        UserName = 'LbTipo'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 11377
        mmWidth = 8996
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpRequisicaoDBText4: TppDBText
        UserName = 'rpRequisicaoDBText4'
        AutoSize = True
        DataField = 'CODARTIGO'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpRequisicaoDBText6: TppDBText
        UserName = 'rpRequisicaoDBText6'
        AutoSize = True
        DataField = 'QTDEMOV'
        DataPipeline = pplRequisicao
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object rpRequisicaoDBText8: TppDBText
        UserName = 'rpRequisicaoDBText8'
        AutoSize = True
        DataField = 'CUSTOMEDIOMOV'
        DataPipeline = pplRequisicao
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 133615
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object rpRequisicaoDBText5: TppDBText
        UserName = 'rpRequisicaoDBText5'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27252
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object rpRequisicaoDBText9: TppDBText
        UserName = 'rpRequisicaoDBText9'
        AutoSize = True
        DataField = 'CODTIPOMOV'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object rpRequisicaoDBText7: TppDBText
        UserName = 'rpRequisicaoDBText7'
        AutoSize = True
        DataField = 'VALORMOV'
        DataPipeline = pplRequisicao
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 161661
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpRequisicaoDBText12: TppDBText
        UserName = 'rpRequisicaoDBText12'
        AutoSize = True
        DataField = 'CODMEDCUSTO'
        DataPipeline = pplRequisicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 794
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 794
        mmWidth = 17463
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 171450
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRequisicaoGroup3: TppGroup
      BreakName = 'ALMOXARIFADO'
      DataPipeline = pplRequisicao
      NewPage = True
      UserName = 'rpRequisicaoGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRequisicaoGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpRequisicaoLabel10: TppLabel
          UserName = 'rpRequisicaoLabel10'
          Caption = 'Almoxarifado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 117740
          mmTop = 0
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoDBText10: TppDBText
          UserName = 'rpRequisicaoDBText10'
          AutoSize = True
          DataField = 'ALMOXARIFADO'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 139965
          mmTop = 265
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRequisicaoGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpRequisicaoLabel12: TppLabel
          UserName = 'rpRequisicaoLabel12'
          Caption = 'Total Geral:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 134673
          mmTop = 1323
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object rpRequisicaoLine3: TppLine
          UserName = 'rpRequisicaoLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpRequisicaoLine4: TppLine
          UserName = 'rpRequisicaoLine4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpRequisicaoDBCalc2: TppDBCalc
          UserName = 'rpRequisicaoDBCalc2'
          AutoSize = True
          DataField = 'VALORMOV'
          DataPipeline = pplRequisicao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = rpRequisicaoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 146579
          mmTop = 1323
          mmWidth = 30956
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpRequisicaoGroup1: TppGroup
      BreakName = 'DATAMOV'
      DataPipeline = pplRequisicao
      UserName = 'rpRequisicaoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRequisicaoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpRequisicaoDBText1: TppDBText
          UserName = 'rpRequisicaoDBText1'
          AutoSize = True
          DataField = 'DATAMOV'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 11377
          mmTop = 794
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoLabel2: TppLabel
          UserName = 'rpRequisicaoLabel2'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoLine1: TppLine
          UserName = 'rpRequisicaoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpRequisicaoLine2: TppLine
          UserName = 'rpRequisicaoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpRequisicaoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpRequisicaoGroup2: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplRequisicao
      UserName = 'rpRequisicaoGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRequisicaoGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object rpRequisicaoLabel8: TppLabel
          UserName = 'rpRequisicaoLabel8'
          Caption = 'Requisição nº'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4498
          mmTop = 2117
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel1: TppLabel
          UserName = 'rpRequisicaoLabel1'
          Caption = 'Artigo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 4763
          mmTop = 8996
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel3: TppLabel
          UserName = 'rpRequisicaoLabel3'
          AutoSize = False
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 27252
          mmTop = 8996
          mmWidth = 20108
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoDBText3: TppDBText
          UserName = 'rpRequisicaoDBText3'
          AutoSize = True
          DataField = 'NUMERO'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 25665
          mmTop = 2117
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel9: TppLabel
          UserName = 'rpRequisicaoLabel9'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 47096
          mmTop = 2117
          mmWidth = 24871
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoDBText2: TppDBText
          UserName = 'rpRequisicaoDBText2'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 74348
          mmTop = 2117
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel6: TppLabel
          UserName = 'rpRequisicaoLabel6'
          Caption = 'Preço Médio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 140229
          mmTop = 8996
          mmWidth = 18785
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel5: TppLabel
          UserName = 'rpRequisicaoLabel5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 169598
          mmTop = 8996
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel7: TppLabel
          UserName = 'rpRequisicaoLabel7'
          Caption = 'Tipo Mov.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 180975
          mmTop = 8996
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoDBText11: TppDBText
          UserName = 'rpRequisicaoDBText11'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplRequisicao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 95515
          mmTop = 2117
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel4: TppLabel
          UserName = 'rpRequisicaoLabel4'
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 127794
          mmTop = 8996
          mmWidth = 7144
          BandType = 3
          GroupNo = 2
        end
        object rpRequisicaoLabel14: TppLabel
          UserName = 'rpRequisicaoLabel14'
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 107950
          mmTop = 8996
          mmWidth = 7408
          BandType = 3
          GroupNo = 2
        end
      end
      object rpRequisicaoGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object rpRequisicaoLabel11: TppLabel
          UserName = 'rpRequisicaoLabel11'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 143669
          mmTop = 265
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
        object rpRequisicaoDBCalc1: TppDBCalc
          UserName = 'rpRequisicaoDBCalc1'
          AutoSize = True
          DataField = 'VALORMOV'
          DataPipeline = pplRequisicao
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpRequisicaoGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 151077
          mmTop = 265
          mmWidth = 26458
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object SqlParRequisicao: TCMSqlParams
    SQL.Strings = (
      'SELECT AL.DESCALMOX AS ALMOXARIFADO,'
      '       SL.LOCALIZACAO,'
      '       M.NUMDOCUMENTO AS NUMERO,'
      '       M.IDMOV,'
      '       M.DATAMOV,'
      '       M.CODCENTROCUSTO,'
      '       M.CODARTIGO,'
      '       PR.CODMEDCUSTO,'
      
        '       PR.DESCPROD || '#39' '#39' || A.CODCOR || '#39' '#39' || A.CODTAMANHO AS ' +
        'DESCRICAO,'
      '       ( M.QTDEMOV * ( -1 ) )  AS QTDEMOV,'
      '       ( M.VALORMOV * ( -1 ) ) AS VALORMOV,'
      '       M.CUSTOMEDIOMOV,'
      '       M.CODTIPOMOV,'
      '       C.NOME,'
      '       M.NUMDOCUMENTO || M.CODCENTROCUSTO AS GRUPO'
      '  FROM MOVIMENT M,'
      '       SALDO sl,'
      '       PRODUTO PR,'
      '       ARTIGO A,'
      '       ALMOX AL,'
      '       CENTCUST C'
      ' WHERE'
      '   AND ( M.IDPESSOA = :idempresa )'
      '   AND ( C.IDEMPRESA = :idempresa )'
      '   AND ( RTRIM( M.NUMDOCUMENTO ) = :numreq )'
      '   AND :tipomov'
      '   AND ( M.DATAMOV >= :dataini )'
      '   AND ( M.DATAMOV <= :datafim )'
      '   AND ( M.CODALMOXARIFADO = :almox )'
      '   AND ( RTRIM( M.CODCENTROCUSTO ) = :ccusto )'
      '   AND ( PR.ITEMESTOCAVEL = :estoque )'
      '   AND ( A.CODARTIGO = M.CODARTIGO )'
      '   AND ( A.CODPRODUTO = PR.CODPRODUTO )'
      '   AND ( M.CODALMOXARIFADO = AL.CODALMOXARIFADO )'
      '   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO )'
      '   AND ( SL.CODARTIGO = A.CODARTIGO(+)  )'
      '   AND ( SL.CODALMOXARIFADO = AL.CODALMOXARIFADO(+) )'
      
        ' ORDER BY ALMOXARIFADO, M.DATAMOV, NUMERO, M.CODCENTROCUSTO, :or' +
        'dem')
    OnFormartParam = SqlParRequisicaoFormartParam
    ClientDataSet = CdsRequisicao
    Left = 200
    Top = 8
  end
  object CdsRequisicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 60
  end
end
