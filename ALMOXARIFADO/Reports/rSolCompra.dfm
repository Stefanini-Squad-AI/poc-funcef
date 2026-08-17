inherited RptSolCompra: TRptSolCompra
  Left = 332
  Top = 90
  Width = 371
  Height = 148
  Caption = 'Solicitação de Compra'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Solicitação de Compra'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Status'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Não Impresso'
          'Já Impresso')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 44
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
        Name = 'Status'
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
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'Almoxarifado'
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
        Caption = 'Solicitação'
        Controle = tcMontaSelect
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
        Name = 'Solicitacao'
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
        MontaSelect = MsSolicitacao
        Width = 0
      end
      item
        Caption = 'Centro de Custo'
        Controle = tcMontaSelect
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
        Name = 'CentroCusto'
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
        MontaSelect = MsCentroCusto
        Width = 0
      end
      item
        Caption = 'Imprimir resumida'
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
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'resumida'
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
        Caption = 'Ordem'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Alfabética'
          'Código')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 44
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
        Name = 'Ordem'
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
    Formheight = 276
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = ppSolCompra
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object pplSolCompra: TppBDEPipeline
    DataSource = dsSolCompra
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lSolCompra'
    Left = 79
    Top = 61
    object pplSoliCompppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMSOLCOMPRA'
      FieldName = 'NUMSOLCOMPRA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplSoliCompppField2: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object pplSoliCompppField3: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object pplSoliCompppField4: TppField
      FieldAlias = 'IMPRESSO'
      FieldName = 'IMPRESSO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object pplSoliCompppField5: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object pplSoliCompppField6: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplSoliCompppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEPEDIDA'
      FieldName = 'QTDEPEDIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplSoliCompppField8: TppField
      FieldAlias = 'CODMEDIDA'
      FieldName = 'CODMEDIDA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 7
    end
    object pplSoliCompppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDE'
      FieldName = 'SALDOQTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplSoliCompppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTMAXIMO'
      FieldName = 'ESTMAXIMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplSoliCompppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplSoliCompppField12: TppField
      FieldAlias = 'CODMEDCUSTO'
      FieldName = 'CODMEDCUSTO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 11
    end
    object pplSoliCompppField13: TppField
      FieldAlias = 'CODPRODUTO'
      FieldName = 'CODPRODUTO'
      FieldLength = 6
      DisplayWidth = 6
      Position = 12
    end
    object pplSoliCompppField14: TppField
      FieldAlias = 'ITEMESTOCAVEL'
      FieldName = 'ITEMESTOCAVEL'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object pplSoliCompppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORUN'
      FieldName = 'VALORUN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplSoliCompppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplSoliCompppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplSoliCompppField18: TppField
      FieldAlias = 'OBSITEMSOLIC'
      FieldName = 'OBSITEMSOLIC'
      FieldLength = 200
      DisplayWidth = 200
      Position = 17
    end
    object pplSoliCompppField19: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 18
    end
    object pplSoliCompppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONSUMO'
      FieldName = 'CONSUMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplSoliCompppField21: TppField
      FieldAlias = 'DATAU'
      FieldName = 'DATAU'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object pplSoliCompppField22: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 21
    end
    object pplSoliCompppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplSoliCompppField24: TppField
      FieldAlias = 'UNID'
      FieldName = 'UNID'
      FieldLength = 4
      DisplayWidth = 4
      Position = 23
    end
    object pplSoliCompppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRECO'
      FieldName = 'PRECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplSoliCompppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRAZO'
      FieldName = 'PRAZO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplSoliCompppField27: TppField
      FieldAlias = 'PERIDO'
      FieldName = 'PERIDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 26
    end
    object pplSoliCompppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCVAR'
      FieldName = 'PERCVAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
  end
  object dsSolCompra: TwwDataSource
    DataSet = CdsSolCompra
    Left = 139
    Top = 60
  end
  object ppSolCompra: TppReport
    AutoStop = False
    DataPipeline = pplSolCompra
    OnPrintingComplete = ppSolCompraPrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 22
    Top = 62
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppLabel65: TppLabel
        UserName = 'ppLabel65'
        Caption = 'Solicitação de Compra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 119327
        mmTop = 8731
        mmWidth = 45508
        BandType = 0
      end
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
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object lbStatus: TppLabel
        UserName = 'lbStatus'
        Caption = 'lbStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 251884
        mmTop = 8467
        mmWidth = 12435
        BandType = 0
      end
      object rpSoliCompLabel7: TppLabel
        UserName = 'rpSoliCompLabel7'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 239184
        mmTop = 8467
        mmWidth = 10583
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object rpSoliCompDBText4: TppDBText
        UserName = 'rpSoliCompDBText4'
        DataField = 'PRODUTO'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 46831
        BandType = 4
      end
      object rpSoliCompDBText8: TppDBText
        UserName = 'rpSoliCompDBText8'
        DataField = 'VALORUN'
        DataPipeline = pplSolCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
      object rpSoliCompDBText5: TppDBText
        UserName = 'rpSoliCompDBText5'
        AutoSize = True
        DataField = 'QTDEPEDIDA'
        DataPipeline = pplSolCompra
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 221721
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object LbPerPreco: TppLabel
        UserName = 'LbPerPreco'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 174625
        mmTop = 529
        mmWidth = 5556
        BandType = 4
      end
      object rpSoliCompDBText3: TppDBText
        UserName = 'rpSoliCompDBText3'
        AutoSize = True
        DataField = 'SALDOQTDE'
        DataPipeline = pplSolCompra
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 529
        mmWidth = 17463
        BandType = 4
      end
      object rpSoliCompDBText12: TppDBText
        UserName = 'rpSoliCompDBText12'
        AutoSize = True
        DataField = 'CODMEDIDA'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 244211
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppSoliCompDBText1: TppDBText
        UserName = 'ppSoliCompDBText1'
        DataField = 'CODMEDCUSTO'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 29633
        mmTop = 5821
        mmWidth = 17198
        BandType = 4
      end
      object ppSoliCompDBText2: TppDBText
        UserName = 'ppSoliCompDBText2'
        DataField = 'ITEMESTOCAVEL'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 5821
        mmWidth = 17198
        BandType = 4
      end
      object ppSoliCompDBText4: TppDBText
        UserName = 'ppSoliCompDBText4'
        AutoSize = True
        DataField = 'FORNECEDOR'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 1588
        mmWidth = 20108
        BandType = 4
      end
      object ppSoliCompDBText3: TppDBText
        UserName = 'ppSoliCompDBText3'
        AutoSize = True
        DataField = 'DATAU'
        DataPipeline = pplSolCompra
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 5821
        mmWidth = 9525
        BandType = 4
      end
      object ppSoliCompDBText5: TppDBText
        UserName = 'ppSoliCompDBText5'
        DataField = 'PRAZO'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 91017
        mmTop = 5821
        mmWidth = 9525
        BandType = 4
      end
      object ppSoliCompDBText6: TppDBText
        UserName = 'ppSoliCompDBText6'
        DataField = 'PRECO'
        DataPipeline = pplSolCompra
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 5821
        mmWidth = 9525
        BandType = 4
      end
      object ppSoliCompDBText7: TppDBText
        UserName = 'ppSoliCompDBText7'
        AutoSize = True
        DataField = 'QTDE'
        DataPipeline = pplSolCompra
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 147638
        mmTop = 5821
        mmWidth = 7938
        BandType = 4
      end
      object ppSoliCompDBText8: TppDBText
        UserName = 'ppSoliCompDBText8'
        DataField = 'UNID'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 5821
        mmWidth = 9525
        BandType = 4
      end
      object rpSoliCompDBText11: TppDBText
        UserName = 'rpSoliCompDBText11'
        DataField = 'ESTMAXIMO'
        DataPipeline = pplSolCompra
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 203730
        mmTop = 529
        mmWidth = 16933
        BandType = 4
      end
      object ppSoliCompDBMemo1: TppDBMemo
        UserName = 'ppSoliCompDBMemo1'
        CharWrap = True
        DataField = 'OBSITEMSOLIC'
        DataPipeline = pplSolCompra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 9525
        mmLeft = 0
        mmTop = 9790
        mmWidth = 167217
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
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
        mmTop = 0
        mmWidth = 283634
        BandType = 8
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
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
        mmTop = 0
        mmWidth = 283369
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 0
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpSoliCompGroup1: TppGroup
      BreakName = 'NUMSOLCOMPRA'
      DataPipeline = pplSolCompra
      NewPage = True
      UserName = 'rpSoliCompGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpSoliCompGroupHeaderBand1: TppGroupHeaderBand
        BeforeGenerate = rpSoliCompGroupHeaderBand1BeforeGenerate
        mmBottomOffset = 0
        mmHeight = 17198
        mmPrintPosition = 0
        object rpSoliCompLine10: TppLine
          UserName = 'rpSoliCompLine10'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7144
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel1: TppLabel
          UserName = 'rpSoliCompLabel1'
          Caption = 'Solicitação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 529
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel2: TppLabel
          UserName = 'rpSoliCompLabel2'
          Caption = 'Necessidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 63236
          mmTop = 529
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object LbNumSoliComp: TppDBText
          UserName = 'LbNumSoliComp'
          AutoSize = True
          DataField = 'NUMSOLCOMPRA'
          DataPipeline = pplSolCompra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 16933
          mmTop = 529
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompDBText2: TppDBText
          UserName = 'rpSoliCompDBText2'
          AutoSize = True
          DataField = 'DATA'
          DataPipeline = pplSolCompra
          DisplayFormat = 'DD/MM/YYYY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 84667
          mmTop = 529
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel8: TppLabel
          UserName = 'rpSoliCompLabel8'
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 118798
          mmTop = 529
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompDBText7: TppDBText
          UserName = 'rpSoliCompDBText7'
          AutoSize = True
          DataField = 'CENTROCUSTO'
          DataPipeline = pplSolCompra
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 144727
          mmTop = 529
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine1: TppLine
          UserName = 'rpSoliCompLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel9: TppLabel
          UserName = 'rpSoliCompLabel9'
          Caption = 'P. Unitário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 259557
          mmTop = 12435
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine2: TppLine
          UserName = 'rpSoliCompLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 16933
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel11: TppLabel
          UserName = 'rpSoliCompLabel11'
          Caption = '  Última compra  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 93134
          mmTop = 5027
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel12: TppLabel
          UserName = 'rpSoliCompLabel12'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144727
          mmTop = 12435
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel13: TppLabel
          UserName = 'rpSoliCompLabel13'
          Caption = 'P. Unitário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 120650
          mmTop = 12435
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel14: TppLabel
          UserName = 'rpSoliCompLabel14'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 50800
          mmTop = 8202
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel5: TppLabel
          UserName = 'rpSoliCompLabel5'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50800
          mmTop = 12435
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel17: TppLabel
          UserName = 'rpSoliCompLabel17'
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 158486
          mmTop = 12435
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel20: TppLabel
          UserName = 'rpSoliCompLabel20'
          Caption = '% Var.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 8202
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine3: TppLine
          UserName = 'rpSoliCompLine3'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 48419
          mmTop = 7408
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine4: TppLine
          UserName = 'rpSoliCompLine4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 167217
          mmTop = 7144
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine5: TppLine
          UserName = 'rpSoliCompLine5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 182034
          mmTop = 7144
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel19: TppLabel
          UserName = 'rpSoliCompLabel19'
          Caption = '  Estoque  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 194734
          mmTop = 5027
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel22: TppLabel
          UserName = 'rpSoliCompLabel22'
          Caption = 'Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 194469
          mmTop = 12435
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel23: TppLabel
          UserName = 'rpSoliCompLabel23'
          Caption = 'Máximo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 209286
          mmTop = 12435
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine6: TppLine
          UserName = 'rpSoliCompLine6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 222250
          mmTop = 7144
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel24: TppLabel
          UserName = 'rpSoliCompLabel24'
          Caption = 'Pedida'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 230188
          mmTop = 12435
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLine7: TppLine
          UserName = 'rpSoliCompLine7'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 275167
          mmTop = 7144
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel25: TppLabel
          UserName = 'rpSoliCompLabel25'
          Caption = 'Preço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 12435
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel26: TppLabel
          UserName = 'rpSoliCompLabel26'
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 249238
          mmTop = 12435
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppSoliCompLabel1: TppLabel
          UserName = 'ppSoliCompLabel1'
          Caption = '  Quantidade  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          mmHeight = 3969
          mmLeft = 241300
          mmTop = 5027
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel31: TppLabel
          UserName = 'rpSoliCompLabel31'
          Caption = 'Estocavel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 12435
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppSoliCompLabel2: TppLabel
          UserName = 'ppSoliCompLabel2'
          Caption = '  Produto  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 14817
          mmTop = 5027
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpSoliCompLabel27: TppLabel
          UserName = 'rpSoliCompLabel27'
          Caption = 'Prazo em dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 84667
          mmTop = 12435
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppSoliCompLabel3: TppLabel
          UserName = 'ppSoliCompLabel3'
          Caption = 'Unid. Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 29633
          mmTop = 12435
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSoliCompGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 64558
        mmPrintPosition = 0
        object rpSoliCompLine8: TppLine
          UserName = 'rpSoliCompLine8'
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 3175
          mmTop = 57944
          mmWidth = 60325
          BandType = 5
          GroupNo = 0
        end
        object ppReport2Label8: TppLabel
          UserName = 'ppReport2Label8'
          ShiftWithParent = True
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 18256
          mmTop = 59531
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppReport2Label10: TppLabel
          UserName = 'ppReport2Label10'
          ShiftWithParent = True
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 83344
          mmTop = 59531
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppReport2Label9: TppLabel
          UserName = 'ppReport2Label9'
          ShiftWithParent = True
          Caption = 'Carimbo/Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 148432
          mmTop = 59531
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'ppLine26'
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 133350
          mmTop = 57944
          mmWidth = 60325
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine9: TppLine
          UserName = 'rpSoliCompLine9'
          ShiftWithParent = True
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 68263
          mmTop = 57944
          mmWidth = 60325
          BandType = 5
          GroupNo = 0
        end
        object Lb4Ult: TppLabel
          OnPrint = Lb4UltPrint
          UserName = 'Lb4Ult'
          Caption = '4 Últimos Fornecedores:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 199232
          mmTop = 3969
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine11: TppLine
          UserName = 'rpSoliCompLine11'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel10: TppLabel
          UserName = 'rpSoliCompLabel10'
          Caption = 'Fornec. A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 46038
          mmTop = 3969
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel35: TppLabel
          UserName = 'rpSoliCompLabel35'
          Caption = 'Fornec. C'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 96309
          mmTop = 3969
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel34: TppLabel
          UserName = 'rpSoliCompLabel34'
          Caption = 'Empresa Compradora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 21167
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel36: TppLabel
          UserName = 'rpSoliCompLabel36'
          Caption = 'Condição de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 16404
          mmWidth = 35190
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel38: TppLabel
          UserName = 'rpSoliCompLabel38'
          Caption = 'Nome do Contato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 11642
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel39: TppLabel
          UserName = 'rpSoliCompLabel39'
          Caption = 'Outros Encargos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 25929
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel40: TppLabel
          UserName = 'rpSoliCompLabel40'
          Caption = 'Data Cotação de Preço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 30692
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel41: TppLabel
          UserName = 'rpSoliCompLabel41'
          Caption = 'Fornec. B'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 71173
          mmTop = 3969
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel37: TppLabel
          UserName = 'rpSoliCompLabel37'
          Caption = 'Fornec. D'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 121444
          mmTop = 3969
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine12: TppLine
          UserName = 'rpSoliCompLine12'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 45508
          mmTop = 14288
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine13: TppLine
          UserName = 'rpSoliCompLine13'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 45508
          mmTop = 23813
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine14: TppLine
          UserName = 'rpSoliCompLine14'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 45508
          mmTop = 28575
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine15: TppLine
          UserName = 'rpSoliCompLine15'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 45508
          mmTop = 33338
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine16: TppLine
          UserName = 'rpSoliCompLine16'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 45508
          mmTop = 19050
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine17: TppLine
          UserName = 'rpSoliCompLine17'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 70644
          mmTop = 14288
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine18: TppLine
          UserName = 'rpSoliCompLine18'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 70644
          mmTop = 19050
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine19: TppLine
          UserName = 'rpSoliCompLine19'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 70644
          mmTop = 23813
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine20: TppLine
          UserName = 'rpSoliCompLine20'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 70644
          mmTop = 28575
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine21: TppLine
          UserName = 'rpSoliCompLine21'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 70644
          mmTop = 33338
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine22: TppLine
          UserName = 'rpSoliCompLine22'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 95779
          mmTop = 14288
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine23: TppLine
          UserName = 'rpSoliCompLine23'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120915
          mmTop = 14288
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine24: TppLine
          UserName = 'rpSoliCompLine24'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120915
          mmTop = 19050
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine25: TppLine
          UserName = 'rpSoliCompLine25'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 95779
          mmTop = 19050
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine26: TppLine
          UserName = 'rpSoliCompLine26'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 95779
          mmTop = 23813
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine27: TppLine
          UserName = 'rpSoliCompLine27'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120915
          mmTop = 23813
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine28: TppLine
          UserName = 'rpSoliCompLine28'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 95779
          mmTop = 28575
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine29: TppLine
          UserName = 'rpSoliCompLine29'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 95779
          mmTop = 33338
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine30: TppLine
          UserName = 'rpSoliCompLine30'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120915
          mmTop = 33338
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine31: TppLine
          UserName = 'rpSoliCompLine31'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 120915
          mmTop = 28575
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel33: TppLabel
          UserName = 'rpSoliCompLabel33'
          Caption = 'A)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 199232
          mmTop = 12700
          mmWidth = 3175
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel45: TppLabel
          UserName = 'rpSoliCompLabel45'
          Caption = 'B)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 199232
          mmTop = 23019
          mmWidth = 2910
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel47: TppLabel
          UserName = 'rpSoliCompLabel47'
          Caption = 'C)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 199232
          mmTop = 33338
          mmWidth = 2910
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLabel43: TppLabel
          UserName = 'rpSoliCompLabel43'
          Caption = 'D)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 199232
          mmTop = 43656
          mmWidth = 2910
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine33: TppLine
          UserName = 'rpSoliCompLine33'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 203994
          mmTop = 16404
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine34: TppLine
          UserName = 'rpSoliCompLine34'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 203994
          mmTop = 26723
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine35: TppLine
          UserName = 'rpSoliCompLine35'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 203994
          mmTop = 37042
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object rpSoliCompLine36: TppLine
          UserName = 'rpSoliCompLine36'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 203994
          mmTop = 47361
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object LbFornA: TppLabel
          UserName = 'LbFornA'
          AutoSize = False
          Caption = 'LbFornA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 12435
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object LbFornB: TppLabel
          UserName = 'LbFornB'
          AutoSize = False
          Caption = 'LbFornA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 22754
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object LbFornC: TppLabel
          UserName = 'LbFornC'
          AutoSize = False
          Caption = 'LbFornA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 33073
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object LbFornD: TppLabel
          UserName = 'LbFornD'
          AutoSize = False
          Caption = 'LbFornA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 43392
          mmWidth = 79111
          BandType = 5
          GroupNo = 0
        end
        object LbTelA: TppLabel
          UserName = 'LbTelA'
          Caption = 'LbTelA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 17198
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object LbTelB: TppLabel
          UserName = 'LbTelB'
          Caption = 'LbTelA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 27252
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object LbTelC: TppLabel
          UserName = 'LbTelC'
          Caption = 'LbTelA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 37571
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object LbTelD: TppLabel
          UserName = 'LbTelD'
          Caption = 'LbTelA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 203994
          mmTop = 47625
          mmWidth = 8996
          BandType = 5
          GroupNo = 0
        end
        object ppSoliCompLabel4: TppLabel
          UserName = 'ppSoliCompLabel4'
          Caption = 'Valor Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppSoliCompDBCalc1: TppDBCalc
          UserName = 'ppSoliCompDBCalc1'
          AutoSize = True
          DataField = 'VALORTOTAL'
          DataPipeline = pplSolCompra
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpSoliCompGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 11906
          mmTop = 794
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlSolCompra: TCMSqlParams
    ClientDataSet = CdsSolCompra
    Left = 192
    Top = 8
  end
  object CdsSolCompra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 60
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT P.RAZAOSOCIAL AS FORNECEDOR,'
      '       MAX( OC.DATAOC ) AS DATAOC,'
      
        '       MAX( '#39'Tel. ('#39' || RTRIM( T.DDD ) || '#39')  '#39' || RTRIM( T.NUME' +
        'RO ) ) AS TELEFONE'
      '  FROM OC OC,'
      '       ITEMOC IO,'
      '       PESSOA P,'
      '       TELENDPESS T,'
      '       ( SELECT CODARTIGO'
      '           FROM ITEMSOLI'
      '          WHERE ( NUMSOLCOMPRA = :NUMSOLCOMPRA )'
      '       ) AR'
      ' WHERE ( IO.CODARTIGO = AR.CODARTIGO )'
      '   AND ( OC.IDPESSOA = :IDPESSOA )'
      '   AND ( IO.NUMOC = OC.NUMOC )'
      '   AND ( OC.IDFORCLI = P.IDPESSOA )'
      '   AND ( T.TIPO LIKE '#39'%C%'#39' )'
      '   AND ( P.IDENDCOMERCIAL = T.IDENDERECO(+) )'
      ' GROUP BY P.RAZAOSOCIAL'
      ' ORDER BY DATAOC DESC')
    ClientDataSet = CdsAux
    Left = 248
    Top = 8
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 60
  end
  object MsSolicitacao: TMontaSelect
    Tag = 2
    Template.IdConsulta = 0
    Caption = 'Seleciona Solicitação'
    Colunas.Strings = (
      'SOLICOMP.NUMSOLCOMPRA'
      'SOLICOMP.DATAEMISSAO')
    TipodeDado.Strings = (
      'N'
      'D')
    Descricao.Strings = (
      'No. Solicitação'
      'Emissão')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SOLICOMP')
    CamposChave.Strings = (
      'SOLICOMP.NUMSOLCOMPRA'
      'SOLICOMP.NUMSOLCOMPRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 300
    Top = 8
  end
  object MsCentroCusto: TMontaSelect
    Tag = 3
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro Custo'
    Colunas.Strings = (
      'SOLICOMP.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SOLICOMP'
      'CENTCUST')
    CamposChave.Strings = (
      'SOLICOMP.CODCENTROCUSTO'
      'SOLICOMP.CODCENTROCUSTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    Left = 300
    Top = 60
  end
end
