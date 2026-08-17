inherited rptTransf: TrptTransf
  Left = 349
  Top = 365
  Width = 232
  Height = 153
  Caption = 'rptTransf'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Num Alteração'
        Controle = tcEdit
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
      end
      item
        Caption = 'Valor'
        Controle = tcEdit
        TipodeDado = tdReal
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
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpTransf
    LabelEmpresa = ppLabel167
    LabelSistema = ppLabel175
  end
  object cdsTransf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 56
    Top = 48
  end
  object dsTransf: TwwDataSource
    DataSet = cdsTransf
    Left = 96
    Top = 48
  end
  object pplTransf: TppBDEPipeline
    DataSource = dsTransf
    UserName = 'lTransf'
    Left = 136
    Top = 48
    object pplTransfppField1: TppField
      FieldAlias = 'IDCONTAORIGEM'
      FieldName = 'IDCONTAORIGEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplTransfppField2: TppField
      FieldAlias = 'CONTAORI'
      FieldName = 'CONTAORI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplTransfppField3: TppField
      FieldAlias = 'IDCONTADESTINO'
      FieldName = 'IDCONTADESTINO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 2
    end
    object pplTransfppField4: TppField
      FieldAlias = 'CONTADES'
      FieldName = 'CONTADES'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplTransfppField5: TppField
      FieldAlias = 'OBSALTERORCAMEN'
      FieldName = 'OBSALTERORCAMEN'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplTransfppField6: TppField
      FieldAlias = 'DATAREFERENCIA'
      FieldName = 'DATAREFERENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplTransfppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMALTERACAO'
      FieldName = 'NUMALTERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplTransfppField8: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object pplTransfppField9: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object pplTransfppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSOLICITADO'
      FieldName = 'VLRSOLICITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rpTransf: TppReport
    AutoStop = False
    DataPipeline = pplTransf
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 176
    Top = 48
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplTransf'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel166: TppLabel
        UserName = 'ppLabel166'
        Caption = 'Transferência Orçamentária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 71967
        mmTop = 8731
        mmWidth = 55827
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'ppLine43'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel167: TppLabel
        UserName = 'ppLabel167'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 27781
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 211932
      mmPrintPosition = 0
      object rptTransfShape1: TppShape
        UserName = 'rptTransfShape1'
        mmHeight = 17727
        mmLeft = 3704
        mmTop = 193146
        mmWidth = 187061
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'ppShape3'
        mmHeight = 141023
        mmLeft = 3704
        mmTop = 39158
        mmWidth = 186267
        BandType = 4
      end
      object ppLabel168: TppLabel
        UserName = 'ppLabel168'
        Caption = 'Centro de Responsabilidade : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 12700
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'ppDBText65'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 12700
        mmWidth = 22490
        BandType = 4
      end
      object ppLabel169: TppLabel
        UserName = 'ppLabel169'
        Caption = 'Conta Orçamentária Origem : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 18521
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'ppDBText66'
        DataField = 'NOME'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 12700
        mmWidth = 95515
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'ppDBText67'
        DataField = 'IDCONTAORIGEM'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 18521
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'ppDBText68'
        DataField = 'CONTAORI'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 18521
        mmWidth = 95515
        BandType = 4
      end
      object ppLabel170: TppLabel
        UserName = 'ppLabel170'
        AutoSize = False
        Caption = 'Observações da Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 33867
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'ppDBText70'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 5821
        mmLeft = 21431
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel172: TppLabel
        UserName = 'ppLabel172'
        Caption = 'Data : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 4498
        mmTop = 1852
        mmWidth = 15610
        BandType = 4
      end
      object ppLabel173: TppLabel
        UserName = 'ppLabel173'
        AutoSize = False
        Caption = 'Nº Transferência : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5821
        mmLeft = 109802
        mmTop = 1852
        mmWidth = 45773
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'ppDBText71'
        DataField = 'NUMALTERACAO'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 5821
        mmLeft = 157427
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel174: TppLabel
        UserName = 'ppLabel174'
        AutoSize = False
        Caption = 'Valor : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 73554
        mmTop = 181769
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'ppDBText72'
        DataField = 'VLRSOLICITADO'
        DataPipeline = pplTransf
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 181769
        mmWidth = 34660
        BandType = 4
      end
      object ppLine44: TppLine
        UserName = 'ppLine44'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9790
        mmWidth = 197300
        BandType = 4
      end
      object rptTransfLabel1: TppLabel
        UserName = 'rptTransfLabel1'
        Caption = 'Conta Orçamentária Destino : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 24077
        mmWidth = 50536
        BandType = 4
      end
      object rptTransfDBText1: TppDBText
        UserName = 'rptTransfDBText1'
        DataField = 'IDCONTADESTINO'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 24077
        mmWidth = 22490
        BandType = 4
      end
      object rptTransfDBText2: TppDBText
        UserName = 'rptTransfDBText2'
        DataField = 'CONTADES'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 24077
        mmWidth = 95515
        BandType = 4
      end
      object rptTransfLine1: TppLine
        UserName = 'rptTransfLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 5821
        mmTop = 203994
        mmWidth = 28840
        BandType = 4
      end
      object rptTransfLabel2: TppLabel
        UserName = 'rptTransfLabel2'
        Caption = 'Gestor Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 205317
        mmWidth = 24342
        BandType = 4
      end
      object rptTransfLabel3: TppLabel
        UserName = 'rptTransfLabel3'
        Caption = 'Diretoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 193146
        mmWidth = 12965
        BandType = 4
      end
      object rptTransfLabel4: TppLabel
        UserName = 'rptTransfLabel4'
        Caption = 'Gestor Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 205317
        mmWidth = 23548
        BandType = 4
      end
      object rptTransfLine3: TppLine
        UserName = 'rptTransfLine3'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 35983
        mmTop = 203994
        mmWidth = 28840
        BandType = 4
      end
      object rptTransfLine4: TppLine
        UserName = 'rptTransfLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 17198
        mmLeft = 66411
        mmTop = 193411
        mmWidth = 1323
        BandType = 4
      end
      object rptTransfLabel5: TppLabel
        UserName = 'rptTransfLabel5'
        Caption = 'Gestor Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 70379
        mmTop = 205317
        mmWidth = 24342
        BandType = 4
      end
      object rptTransfLine2: TppLine
        UserName = 'rptTransfLine2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 67733
        mmTop = 203994
        mmWidth = 28840
        BandType = 4
      end
      object rptTransfLabel6: TppLabel
        UserName = 'rptTransfLabel6'
        Caption = 'Gestor Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 205317
        mmWidth = 23548
        BandType = 4
      end
      object rptTransfLine5: TppLine
        UserName = 'rptTransfLine5'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 97896
        mmTop = 203994
        mmWidth = 28840
        BandType = 4
      end
      object rptTransfLabel7: TppLabel
        UserName = 'rptTransfLabel7'
        Caption = 'Disup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135467
        mmTop = 205317
        mmWidth = 7144
        BandType = 4
      end
      object rptTransfLine6: TppLine
        UserName = 'rptTransfLine6'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 127794
        mmTop = 203994
        mmWidth = 20373
        BandType = 4
      end
      object rptTransfLine7: TppLine
        UserName = 'rptTransfLine7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 17198
        mmLeft = 151607
        mmTop = 193411
        mmWidth = 1323
        BandType = 4
      end
      object rptTransfLabel8: TppLabel
        UserName = 'rptTransfLabel8'
        Caption = 'Assoc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 168540
        mmTop = 205317
        mmWidth = 9260
        BandType = 4
      end
      object rptTransfLine8: TppLine
        UserName = 'rptTransfLine8'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 153988
        mmTop = 203994
        mmWidth = 33602
        BandType = 4
      end
      object txtSaldoTransf: TppLabel
        UserName = 'txtSaldoTransf'
        AutoSize = False
        Caption = 'txtSaldoTransf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 155575
        mmTop = 181769
        mmWidth = 34660
        BandType = 4
      end
      object rptTransfLabel10: TppLabel
        UserName = 'rptTransfLabel10'
        AutoSize = False
        Caption = 'Saldo : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 133615
        mmTop = 181769
        mmWidth = 20108
        BandType = 4
      end
      object rptTransfDBMemo1: TppDBMemo
        UserName = 'rptTransfDBMemo1'
        CharWrap = False
        DataField = 'OBSALTERORCAMEN'
        DataPipeline = pplTransf
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplTransf'
        mmHeight = 138907
        mmLeft = 4763
        mmTop = 40217
        mmWidth = 183357
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel251: TppLabel
        UserName = 'rptTransfLabel101'
        AutoSize = False
        Caption = 'Saldo Ant: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 181769
        mmWidth = 20108
        BandType = 4
      end
      object txtSaldoAntTransf: TppLabel
        UserName = 'txtSaldoAntTransf'
        AutoSize = False
        Caption = 'txtSaldoAntTransf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 181769
        mmWidth = 34660
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine46: TppLine
        UserName = 'ppLine46'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel175: TppLabel
        UserName = 'ppLabel175'
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
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc35: TppSystemVariable
        UserName = 'Calc35'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object sqlTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   A.IDCONTAORIGEM, C1.NOMECONTAORCAMEN AS CONTAORI,'
      '   A.IDCONTADESTINO, C2.NOMECONTAORCAMEN AS CONTADES,'
      '   A.OBSALTERORCAMEN,'
      '   A.DATAREFERENCIA, A.NUMALTERACAO,'
      '   CR.CODCENTRORESPON, CR.NOME, A.VLRSOLICITADO'
      'FROM'
      
        '   ALTERORCAMENTO A, CENTRESPON CR, CONTASORCAMEN C1, CONTASORCA' +
        'MEN C2'
      'WHERE'
      '   (A.FLGTIPOALTER = '#39'T'#39') AND'
      '   (A.IDCONTAORIGEM  = C1.IDCONTAORCAMEN) AND'
      '   (A.IDPLANOORCAMEN = C1.IDPLANOORCAMEN) AND'
      '   (A.IDCONTADESTINO = C2.IDCONTAORCAMEN) AND'
      '   (A.IDPLANOORCAMEN = C2.IDPLANOORCAMEN) AND'
      '   (C1.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND'
      '   (C1.IDPESSOA = CR.IDPESSOA(+))  AND'
      '   (A.NUMALTERACAO =:NUMALTERACAO) AND'
      '   (A.IDPESSOA =:IDPESSOA)')
    ClientDataSet = cdsTransf
    Left = 16
    Top = 48
  end
end
