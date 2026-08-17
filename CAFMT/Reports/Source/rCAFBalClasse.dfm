inherited RptCAFBalClasse: TRptCAFBalClasse
  Left = 320
  Top = 170
  Width = 355
  Height = 274
  Caption = 'Balancete Patrimonial por Classe'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Classificação de Bens'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Período Atualizado Até'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Classe'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODHIERARQ,DESCRICAO,IDCLASSEBEM'
          'FROM CLASSEDEBEM'
          'WHERE ANASINT = '#39'A'#39
          'ORDER BY CODHIERARQ'
          '')
        LookupSettings.Chave = 'IDCLASSEBEM'
        LookupSettings.Display = 'DESCRICAO|IDCLASSEBEM'
        LookupSettings.Descricao = 'Descrição|Código'
        LookupSettings.Tamanho = '60|10'
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
        Caption = 'Incluir Bens com Controle Físico'
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
        Caption = 'Somente Classes Sintéticas'
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
        Caption = 'Exibe as Classes sem Valor'
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
        Caption = 'Incluir Bens Baixados'
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
    Formheight = 130
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpBalPatClas
    LabelEmpresa = lblEmpresa
    LabelSistema = lblsistema
  end
  object ppBalPatClas: TppBDEPipeline
    DataSource = dsBalPatClas
    UserName = 'BalPatClas'
    Left = 212
    Top = 7
    object ppBalPatClasppField1: TppField
      FieldAlias = 'CODHIERARQ'
      FieldName = 'CODHIERARQ'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBalPatClasppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBalPatClasppField3: TppField
      FieldAlias = 'S_A'
      FieldName = 'S_A'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppBalPatClasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANT'
      FieldName = 'QUANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBalPatClasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORG'
      FieldName = 'VALORG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBalPatClasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMBEM'
      FieldName = 'CMBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBalPatClasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DEPLANC'
      FieldName = 'DEPLANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBalPatClasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CMDEP'
      FieldName = 'CMDEP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBalPatClasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCTB'
      FieldName = 'VALCTB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object dsBalPatClas: TwwDataSource
    Left = 28
    Top = 139
  end
  object rpBalPatClas: TppReport
    AutoStop = False
    DataPipeline = ppBalPatClas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpBalPatClasBeforePrint
    DeviceType = 'Screen'
    Left = 292
    Top = 11
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Balancete Patrimonial por Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 102923
        mmTop = 8731
        mmWidth = 81227
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24342
        mmWidth = 274267
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127794
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 19315
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 19315
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 138377
        mmTop = 19315
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 160073
        mmTop = 19315
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'ppLabel80'
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 194998
        mmTop = 19315
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'ppLabel82'
        Caption = 'C.M.Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 218282
        mmTop = 19315
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'ppLabel83'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 246857
        mmTop = 19315
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel84'
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 224103
        mmTop = 9525
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatClasLabelData: TppLabel
        UserName = 'rpBalPatClasLabelData'
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 254001
        mmTop = 9525
        mmWidth = 20108
        BandType = 0
      end
      object rpBalPatClasLabel1: TppLabel
        UserName = 'rpBalPatClasLabel1'
        Caption = 'Quant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111125
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      AfterPrint = ppDetailBand2AfterPrint
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpBalPatClasDBText1: TppDBText
        UserName = 'rpBalPatClasDBText1'
        DataField = 'CODHIERARQ'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 19579
        BandType = 4
      end
      object rpBalPatClasDBText2: TppDBText
        UserName = 'rpBalPatClasDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20108
        mmTop = 0
        mmWidth = 80963
        BandType = 4
      end
      object rpBalPatClasDBText5: TppDBText
        UserName = 'ppDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 0
        mmWidth = 31221
        BandType = 4
      end
      object rpBalPatClasDBText7: TppDBText
        UserName = 'rpBalPatClasDBText7'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 184944
        mmTop = 0
        mmWidth = 29898
        BandType = 4
      end
      object rpBalPatClasDBText8: TppDBText
        UserName = 'rpBalPatClasDBText8'
        BlankWhenZero = True
        DataField = 'CMDEP'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215900
        mmTop = 0
        mmWidth = 29633
        BandType = 4
      end
      object rpBalPatClasDBText9: TppDBText
        UserName = 'rpBalPatClasDBText9'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 246328
        mmTop = 0
        mmWidth = 28310
        BandType = 4
      end
      object rpBalPatClasDBText3: TppDBText
        UserName = 'rpBalPatClasDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatClas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object rpBalPatClasDBText6: TppDBText
        UserName = 'rpBalPatClasDBText6'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154782
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object rpBalPatClasDBText4: TppDBText
        UserName = 'rpBalPatClasDBText4'
        DataField = 'QUANT'
        DataPipeline = ppBalPatClas
        DisplayFormat = '#0;(#0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 109802
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 274267
        BandType = 8
      end
      object lblsistema: TppLabel
        UserName = 'lblsistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1058
        mmWidth = 23548
        BandType = 8
      end
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
        mmLeft = 122502
        mmTop = 1058
        mmWidth = 39158
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
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppSoma1: TppVariable
        UserName = 'ppSoma1'
        AutoSize = False
        CalcOrder = 0
        DataType = dtInteger
        DisplayFormat = '#0;(#0)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 107950
        mmTop = 794
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel75: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 794
        mmWidth = 23283
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 274267
        BandType = 7
      end
      object ppSoma2: TppVariable
        UserName = 'ppSoma2'
        AutoSize = False
        CalcOrder = 1
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 120386
        mmTop = 794
        mmWidth = 33073
        BandType = 7
      end
      object ppSoma3: TppVariable
        UserName = 'ppSoma3'
        AutoSize = False
        CalcOrder = 2
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 154252
        mmTop = 794
        mmWidth = 29369
        BandType = 7
      end
      object ppSoma4: TppVariable
        UserName = 'ppSoma4'
        AutoSize = False
        CalcOrder = 3
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 184415
        mmTop = 794
        mmWidth = 30427
        BandType = 7
      end
      object ppSoma5: TppVariable
        UserName = 'ppSoma5'
        AutoSize = False
        CalcOrder = 4
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 215636
        mmTop = 794
        mmWidth = 29898
        BandType = 7
      end
      object ppSoma6: TppVariable
        UserName = 'ppSoma6'
        AutoSize = False
        CalcOrder = 5
        DataType = dtCurrency
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 246328
        mmTop = 794
        mmWidth = 28310
        BandType = 7
      end
    end
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 192
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      'SELECT MASCARACLASSE, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ClientDataSet = cdsParamCaf
    Left = 296
    Top = 192
  end
  object cdsClasAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 88
  end
  object sqlClasAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT CB.CODHIERARQ,'
      '       CB.DESCRICAO,'
      '       CB.ANASINT,'
      '       COUNT(*) AS QUANT,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.REAVVALORG,0) + NVL(S' +
        'B.ULTREAVVALORG,0)),2)      AS VALORG0,'
      
        '       ROUND(SUM(NVL(SB.CMBEM,0) + NVL(SB.REAVCMBEM,0) + NVL(SB.' +
        'ULTREAVCMBEM,0)),2)         AS CMBEM0,'
      
        '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.REAVDEPLANC,0) + NVL' +
        '(SB.ULTREAVDEPLANC,0)),2)   AS DEPLANC0,'
      
        '       ROUND(SUM(NVL(SB.CMDEP,0) + NVL(SB.REAVCMDEP,0) + NVL(SB.' +
        'ULTREAVCMDEP,0)),2)         AS CMDEP0,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEP' +
        'LANC,0) - NVL(SB.CMDEP,0) +'
      '                 NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) -'
      '                 NVL(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') -'
      
        '                 NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,' +
        '0)),2)                      AS VALCTB0'
      ''
      
        'FROM (SELECT SCB.IDGRUPO, SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBE' +
        'M,'
      '             SCB.VALORG,   SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,    SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC,  SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,    SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM, IDPESSOA) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      
        '        AND (SCB.IDBEM = DTAMAX.IDBEM) AND (SCB.IDPESSOA = DTAMA' +
        'X.IDPESSOA) ) SB,'
      ''
      '     BEM B, CLASSEDEBEM CB, GRUPO G'
      ''
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (G.FLGIMOVEL = 0)'
      ''
      ''
      ''
      '  AND (SB.IDGRUPO  = G.IDGRUPO)'
      '  AND (SB.IDBEM    = B.IDBEM)'
      '  AND (SB.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDCLASSEBEM = CB.IDCLASSEBEM)'
      'GROUP BY CB.CODHIERARQ, CB.DESCRICAO, CB.ANASINT')
    ClientDataSet = cdsClasAnaliticos
    Left = 296
    Top = 88
  end
  object sqlClasSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT CODHIERARQ, DESCRICAO'
      'FROM CLASSEDEBEM'
      'WHERE (ANASINT = '#39'S'#39')'
      'ORDER BY CODHIERARQ')
    ClientDataSet = cdsClasSinteticos
    Left = 304
    Top = 144
  end
  object cdsClasSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 144
  end
  object cdsBalPatClas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 192
  end
  object sqlBalPatClas: TCMSqlParams
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       (0)  AS QUANT, '
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'ORDER BY CODHIERARQ'
      '')
    ClientDataSet = cdsBalPatClas
    Left = 104
    Top = 136
  end
  object cdsBalPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 184
  end
end
