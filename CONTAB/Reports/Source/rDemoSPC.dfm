inherited RptDemoPadraoSPC: TRptDemoPadraoSPC
  Left = 397
  Top = 173
  Width = 266
  Height = 369
  Caption = 'RptDemoPadraoSPC'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Exercicio'
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
        Caption = 'Periodo Final'
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
        Caption = 'Demonstrativo'
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
        Caption = 'Dividir por 1000'
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
        Caption = 'Desconsidera contas'
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
        Caption = 'Plano'
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
        Caption = 'Patro'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptDRE
    LabelEmpresa = lbDemoEmpresa
    LabelSistema = lbDemoSistema
  end
  object rptDRE: TppReport
    AutoStop = False
    DataPipeline = pplDRE
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 32
    Top = 248
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplDRE'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38894
      mmPrintPosition = 0
      object lbDemoEmpresa: TppLabel
        Tag = 1
        UserName = 'lbDemoEmpresa'
        Caption = 'FUNDAÇÃO MODELO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 24871
        mmTop = 2646
        mmWidth = 51329
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Demonstração de Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 8996
        mmWidth = 44450
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 22754
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'EXERCICIOANT'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3969
        mmLeft = 179388
        mmTop = 27517
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'EXERCICIO'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3969
        mmLeft = 140759
        mmTop = 27517
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PERIODOFIM'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3969
        mmLeft = 179388
        mmTop = 33073
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PERIODOFIM'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3969
        mmLeft = 140759
        mmTop = 33073
        mmWidth = 17198
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplLogo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplLogo'
        mmHeight = 13758
        mmLeft = 2381
        mmTop = 2646
        mmWidth = 19579
        BandType = 0
      end
      object lbDivMil: TppLabel
        UserName = 'lbDivMil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 184415
        mmTop = 17727
        mmWidth = 12171
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEELEMENTOIND'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3440
        mmLeft = 529
        mmTop = 1323
        mmWidth = 112977
        BandType = 4
      end
      object lbSaldoExercAtual: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'SALDOREALACUMEAT'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3175
        mmLeft = 127000
        mmTop = 1588
        mmWidth = 30956
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 160602
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object lbSaldoExercAnt: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'SALDOREALACUMEAN'
        DataPipeline = pplDRE
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDRE'
        mmHeight = 3175
        mmLeft = 165365
        mmTop = 1588
        mmWidth = 31221
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 2381
        mmWidth = 17463
        BandType = 8
      end
      object lbDemoSistema: TppLabel
        Tag = 1
        UserName = 'LblModSisOrigem1'
        Caption = 'Contabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 2117
        mmWidth = 18785
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'INDENTACAO'
      DataPipeline = pplDRE
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDRE'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplDRE: TppDBPipeline
    DataSource = dsDRE
    UserName = 'lDRE'
    Left = 32
    Top = 192
    object pplDREppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALPEREAT'
      FieldName = 'SALDOREALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplDREppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOORCPEREAT'
      FieldName = 'SALDOORCPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDREppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALACUMEAT'
      FieldName = 'SALDOREALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplDREppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOORCACUMEAT'
      FieldName = 'SALDOORCACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplDREppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALPEREAN'
      FieldName = 'SALDOREALPEREAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplDREppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREALACUMEAN'
      FieldName = 'SALDOREALACUMEAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplDREppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOREAPERANTEAT'
      FieldName = 'SALDOREAPERANTEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplDREppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDREALPEREATS'
      FieldName = 'SALDREALPEREATS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplDREppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDORCPEREATS'
      FieldName = 'SALDORCPEREATS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplDREppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDREALACUMEATS'
      FieldName = 'SALDREALACUMEATS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplDREppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDORCACUMEATS'
      FieldName = 'SALDORCACUMEATS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplDREppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDREALPEREANS'
      FieldName = 'SALDREALPEREANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplDREppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDREALACUMEANS'
      FieldName = 'SALDREALACUMEANS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplDREppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDREAPERANTEATS'
      FieldName = 'SALDREAPERANTEATS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplDREppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALPEREAT'
      FieldName = 'DIFORCREALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplDREppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALPEREAT'
      FieldName = 'AV_REALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplDREppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_ORCPEREAT'
      FieldName = 'AV_ORCPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplDREppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_ORCREALPEREAT'
      FieldName = 'AH_ORCREALPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplDREppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFORCREALACUMEAT'
      FieldName = 'DIFORCREALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplDREppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALACUMEAT'
      FieldName = 'AV_REALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplDREppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_ORCACUMEAT'
      FieldName = 'AV_ORCACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplDREppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_ORCREALACUMEAT'
      FieldName = 'AH_ORCREALACUMEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplDREppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFEXATUANTPER'
      FieldName = 'DIFEXATUANTPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplDREppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALPEREAN'
      FieldName = 'AV_REALPEREAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplDREppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_EXATUANTPER'
      FieldName = 'AH_EXATUANTPER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplDREppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFEXATUANTACUM'
      FieldName = 'DIFEXATUANTACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object pplDREppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALACUMEAN'
      FieldName = 'AV_REALACUMEAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplDREppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_EXATUANTACUM'
      FieldName = 'AH_EXATUANTACUM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object pplDREppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFPERATUANTEAT'
      FieldName = 'DIFPERATUANTEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object pplDREppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'AV_REALPERANTEAT'
      FieldName = 'AV_REALPERANTEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object pplDREppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'AH_PERATUANTEAT'
      FieldName = 'AH_PERATUANTEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pplDREppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOINIEAT'
      FieldName = 'SALDOINIEAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 31
    end
    object pplDREppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALDEBPEREAT'
      FieldName = 'TOTALDEBPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object pplDREppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALCREPEREAT'
      FieldName = 'TOTALCREPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 33
    end
    object pplDREppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOVPEREAT'
      FieldName = 'MOVPEREAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 34
    end
    object pplDREppField36: TppField
      FieldAlias = 'FLAGCALCINTERNA'
      FieldName = 'FLAGCALCINTERNA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 35
    end
    object pplDREppField37: TppField
      FieldAlias = 'FLAGTIPONEGATIVO'
      FieldName = 'FLAGTIPONEGATIVO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 36
    end
    object pplDREppField38: TppField
      FieldAlias = 'NOMEELEMENTOIND'
      FieldName = 'NOMEELEMENTOIND'
      FieldLength = 78
      DisplayWidth = 78
      Position = 37
    end
    object pplDREppField39: TppField
      FieldAlias = 'NOMEELEMENTO'
      FieldName = 'NOMEELEMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 38
    end
    object pplDREppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEMELEMENTO'
      FieldName = 'ORDEMELEMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object pplDREppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODIGOELEMENTO'
      FieldName = 'CODIGOELEMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 40
    end
    object pplDREppField42: TppField
      FieldAlias = 'TIPOELEMENTO'
      FieldName = 'TIPOELEMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 41
    end
    object pplDREppField43: TppField
      FieldAlias = 'NATUREZAELEMENTO'
      FieldName = 'NATUREZAELEMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 42
    end
    object pplDREppField44: TppField
      FieldAlias = 'INDENTACAO'
      FieldName = 'INDENTACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 43
    end
    object pplDREppField45: TppField
      FieldAlias = 'FLAGMONETARIA'
      FieldName = 'FLAGMONETARIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 44
    end
    object pplDREppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'ELEMANALISEVERT'
      FieldName = 'ELEMANALISEVERT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object pplDREppField47: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 46
    end
    object pplDREppField48: TppField
      FieldAlias = 'SALTAPAG'
      FieldName = 'SALTAPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 47
    end
    object pplDREppField49: TppField
      FieldAlias = 'LINHA1'
      FieldName = 'LINHA1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 48
    end
    object pplDREppField50: TppField
      FieldAlias = 'DATAULTDIA'
      FieldName = 'DATAULTDIA'
      FieldLength = 9
      DisplayWidth = 9
      Position = 49
    end
    object pplDREppField51: TppField
      FieldAlias = 'LINHA2'
      FieldName = 'LINHA2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 50
    end
    object pplDREppField52: TppField
      FieldAlias = 'LINHA3'
      FieldName = 'LINHA3'
      FieldLength = 1
      DisplayWidth = 1
      Position = 51
    end
    object pplDREppField53: TppField
      FieldAlias = 'CCUSTO'
      FieldName = 'CCUSTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 52
    end
    object pplDREppField54: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 10
      DisplayWidth = 10
      Position = 53
    end
    object pplDREppField55: TppField
      FieldAlias = 'FLAGINTERNA1'
      FieldName = 'FLAGINTERNA1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 54
    end
    object pplDREppField56: TppField
      FieldAlias = 'FLAGINTERNA2'
      FieldName = 'FLAGINTERNA2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 55
    end
    object pplDREppField57: TppField
      FieldAlias = 'PERIODOINI'
      FieldName = 'PERIODOINI'
      FieldLength = 15
      DisplayWidth = 15
      Position = 56
    end
    object pplDREppField58: TppField
      FieldAlias = 'PERIODOFIM'
      FieldName = 'PERIODOFIM'
      FieldLength = 15
      DisplayWidth = 15
      Position = 57
    end
    object pplDREppField59: TppField
      FieldAlias = 'EXERCICIO'
      FieldName = 'EXERCICIO'
      FieldLength = 4
      DisplayWidth = 4
      Position = 58
    end
    object pplDREppField60: TppField
      FieldAlias = 'EXERCICIOANT'
      FieldName = 'EXERCICIOANT'
      FieldLength = 4
      DisplayWidth = 4
      Position = 59
    end
  end
  object CdsDRE: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 128
    Data = {
      B39C01009619E0BD01000000180000003C000F010000030000003C080F53414C
      444F5245414C50455245415408000400000000000E53414C444F4F5243504552
      45415408000400000000001053414C444F5245414C4143554D45415408000400
      000000000F53414C444F4F52434143554D45415408000400000000000F53414C
      444F5245414C50455245414E08000400000000001053414C444F5245414C4143
      554D45414E08000400000000001153414C444F524541504552414E5445415408
      000400000000000F53414C445245414C5045524541545308000400000000000E
      53414C444F52435045524541545308000400000000001053414C445245414C41
      43554D4541545308000400000000000F53414C444F52434143554D4541545308
      000400000000000F53414C445245414C50455245414E53080004000000000010
      53414C445245414C4143554D45414E5308000400000000001153414C44524541
      504552414E54454154530800040000000000104449464F52435245414C504552
      45415408000400000000000D41565F5245414C50455245415408000400000000
      000C41565F4F524350455245415408000400000000001041485F4F5243524541
      4C5045524541540800040000000000114449464F52435245414C4143554D4541
      5408000400000000000E41565F5245414C4143554D4541540800040000000000
      0D41565F4F52434143554D45415408000400000000001141485F4F5243524541
      4C4143554D45415408000400000000000E4449464558415455414E5450455208
      000400000000000D41565F5245414C50455245414E08000400000000000E4148
      5F4558415455414E5450455208000400000000000F4449464558415455414E54
      4143554D08000400000000000E41565F5245414C4143554D45414E0800040000
      0000000F41485F4558415455414E544143554D08000400000000000F44494650
      4552415455414E5445415408000400000000001041565F5245414C504552414E
      5445415408000400000000000F41485F504552415455414E5445415408000400
      000000000B53414C444F494E4945415408000400000000000E544F54414C4445
      4250455245415408000400000000000E544F54414C4352455045524541540800
      040000000000094D4F5650455245415408000400000000000F464C414743414C
      43494E5445524E4101004900000002000753554254595045020049000A004669
      786564436861720005574944544802000200010010464C41475449504F4E4547
      415449564F01004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020001000F4E4F4D45454C454D454E544F494E
      4401004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002004E000C4E4F4D45454C454D454E544F010049000000
      0100055749445448020002003C000D4F5244454D454C454D454E544F08000400
      000000000E434F4449474F454C454D454E544F08000400000000000C5449504F
      454C454D454E544F01004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000100104E41545552455A41454C45
      4D454E544F01004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020001000A494E44454E544143414F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020001000D464C41474D4F4E45544152494101004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      01000F454C454D414E414C49534556455254080004000000000006434F444947
      4F01004900000001000557494454480200020012000853414C54415041470100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000100064C494E484131010049000000020007535542545950
      45020049000A00466978656443686172000557494454480200020001000A4441
      5441554C5444494101004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000900064C494E4841320100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000100064C494E484133010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000100064343555354
      4F01004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002000A00084154495650524F4A01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      0A000C464C4147494E5445524E41310100490000000200075355425459504502
      0049000A00466978656443686172000557494454480200020001000C464C4147
      494E5445524E413201004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020001000A504552494F444F494E4901
      004900000002000753554254595045020049000A004669786564436861720005
      5749445448020002000F000A504552494F444F46494D01004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      0F000945584552434943494F0100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020004000C45584552434943
      494F414E5401004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020004000100044C4349440400010016080000
      0000000000000000000041401400400000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E01001550726F6772616D6120507265766964656E6369
      616C00000000000008400154014401530100010001000100010001000100014E
      0100010001000100000000000000000000004140140040000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E0100085245434549544153000000
      00000010400143014401530100010001000100010001000100014E0100010001
      0001000000000000000000000041401400400000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000014E01000844455350455341530000000000001440
      0143014401530100010001000100010001000100014E01000100010001000000
      0000000000000000414014004000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E0100285245435552534F53204F5249554E444F532F545241
      4E534620502F50524F472E204153534953542E00000000000018400143014401
      530100010001000100010001000100014E010001000100010000000000000000
      0000004140140040000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E0100164355535445494F2041444D494E49535452415449564F00000000
      00001C400143014401530100010001000100010001000100014E010001000100
      0100000000000000000000004140140040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E0100265245435552534F53204F5249554E444F53
      2050524F472E2041444D494E49535452415449564F0000000000002040014301
      4401530100010001000100010001000100014E01000100010001000000000000
      0000000000414014004000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E01001D524553554C542E20494E564553542E20505245564944454E
      4349414953000000000000224001430144015301000100010001000100010001
      00014E0100010001000100000000000000000000004140140040000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E01002053414C444F204449
      53504F4E4956454C20502F434F4E535449545549434F45530000000000002440
      0153014401530100010001000100010001000100014E01000100010001000000
      0000000000000000414014004000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E01001F464F524D4143414F205245564552532F5245532E4D
      4154454D41544943415300000000000026400143014401530100010001000100
      010001000100014E010001000100010000000000000000000000414014004000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E010018464F52
      4D4143414F2F524556455253414F2046554E444F530000000000002840014301
      4401530100010001000100010001000100014E01000100010001000000000000
      0000000000414014004000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E01001F464F524D4143414F2F524556455253414F20434F4E54494E
      47454E434941530000000000002A400143014401530100010001000100010001
      000100014E010001000100010000000000000000000000414014004000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E010025415455414C49
      5A2F5245564552532E20524553554C542E20455820414E544552494F52455300
      00000000002C400143014401530100010001000100010001000100014E010001
      0001000100000000000000000000004140140040000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E010016524553554C5441444F20444F2045
      584552434943494F0000000000002E4001530144015301000100010001000100
      01000100014E0100010001000100000000000000000000004140140040000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E01001550524F4752
      414D4120415353495354454E4349414C00000000000031400154014401530100
      010001000100010001000100014E010001000100010000000000000000000000
      4140140040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      0100085245434549544153000000000000324001430144015301000100010001
      00010001000100014E0100010001000100000000000000000000004140140040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E0100084445
      5350455341530000000000003340014301440153010001000100010001000100
      0100014E01000100010001000000000000000000000041401400400000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E0100255245435552534F
      53204F5249554E444F532F5452414E534620502F50524F4720505245562E0000
      0000000034400143014401530100010001000100010001000100014E01000100
      0100010000000000000000000000414014004000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E0100164355535445494F2041444D494E4953
      5452415449564F00000000000035400143014401530100010001000100010001
      000100014E010001000100010000000000000000000000414014004000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E010025524543555253
      4F53204F5249554E444F532050524F472041444D494E49535452415449564F00
      000000000036400143014401530100010001000100010001000100014E010001
      0001000100000000000000000000004140140040000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E010029524553554C5441444F20444F5320
      494E56455354494D454E544F5320505245564944454E43494149530000000000
      0037400143014401530100010001000100010001000100014E01000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D01001050617472696D6F6E696F20546F74616C
      00000000000024400000000000003A4001430143013101530100010001000100
      010001000100014E014501000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014D0100
      24526573756C7461646F20506F73697469766F20646F7320496E76657374696D
      656E746F7300000000000034400000000000003C400143014301310153010001
      0001000100010001000100014E01450100010001000100000000000000000000
      0000001400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      4E014D01001950657263656E7475616C2064652052656D756E65726163616F00
      00000000003E400000000000003D400153014401310153010001000100010001
      0001000100014E01450100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E014D010029
      46756E646F2041646D696E69737472617469766F20416E746573206461205265
      6D756E65726163616F00000000000044400000000000003E4001430143013101
      530100010001000100010001000100014E014501000100010001000000000000
      0000000000000014000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E014D01001D282D29205265616C697A6176656C2041646D696E6973
      7472617469766F00000000000049400000000000003F40014301440131015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014D01000E282D29205065726D616E656E74650000000000004E400000
      00000000404001430144013101530100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014D01001C46756E646F2041646D
      696E69737472617469766F204C69717569646F00000000008051400000000000
      80404001530143013101530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D01001456616C6F722064612052656D
      756E65726163616F000000000000544000000000000041400153014301310153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D010019546F74616C20646F2046756E646F2052656D756E657261
      646F000000000080564000000000008041400153014301310153010001000100
      0100010001000100014E01450100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E014D
      01000A5245414C495A4156454C0000000000003E400000000000804440014301
      44013201530100010001000100010001000100014E0145010001000100010000
      0000000000000000000000140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000014E014D01001550524F4752414D4120505245564944454E43
      49414C0000000000004440000000000000454001430144013301530100010001
      000100010001000100014E014E01000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      4D01001750524F4752414D412041444D494E49535452415449564F0000000000
      0049400000000000804540014301440133015301000100010001000100010001
      00014E014E010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E014D01000E52454E44
      4120564152494156454C00000000000054400000000000004740014301440133
      01530100010001000100010001000100014E014E010001000100010000000000
      0000000000000000140000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000014E014D01000E544F54414C20444F20415449564F0000000000005E
      4000000000008049400153014401320153010001000100010001000100010001
      4E01470100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014E010014455849474956
      454C204F5045524143494F4E414C00000000008061400000000000004C400143
      01430132014E0100010001000100010001000100014E01450100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014E01001550524F4752414D4120505245564944454E
      4349414C0000000000C062400000000000004D40014301430133015301000100
      01000100010001000100014E014E010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014E01001750524F4752414D412041444D494E49535452415449564F00000000
      000064400000000000804D400143014301330153010001000100010001000100
      0100014E014E0100010001000100000000000000000000000000140000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E014E010019455849
      474956454C20444520434F4E54494E47454E4349414C00000000008066400000
      000000804E4001430143013201530100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014E01001550524F4752414D4120
      505245564944454E4349414C0000000000C067400000000000804F4001430143
      013301530100010001000100010001000100014E014E01000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E014E010011455849474956454C20415455415249414C0000
      000000806B400000000000805040014301430132015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014E01001550
      524F564953D54553204D4154454D4154494341530000000000C06C4000000000
      00C0504001430143013301530100010001000100010001000100014E014E0100
      0100010001000000000000000000000000001400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000014E014E01001542454E45464943494F5320
      4120434F4E43454445520000000000406F400000000000405140014301430134
      01530100010001000100010001000100014E014E010001000100010000000000
      0000000000000000140000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000014E014E01001D282D292044454649434954205445434E49434F2041
      43554D554C41444F0000000000D071400000000000C051400143014401330153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014E01001550524F4752414D4120505245564944454E4349414C0000
      0000002072400000000000405240014301430133015301000100010001000100
      01000100014E014E010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014E01001750
      524F4752414D412041444D494E49535452415449564F0000000000C072400000
      00000080524001430143013301530100010001000100010001000100014E014E
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014E01001950524F4752414D4120
      444520494E56455354494D454E544F5300000000006073400000000000C05240
      01430143013301530100010001000100010001000100014E0145010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E014E010010544F54414C20444F20504153534956
      4F00000000000074400000000000005340015301430131015301000100010001
      00010001000100014E0145010001000100010000000000000000000000000014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000014E014E01
      0010415449564F205245414C495A4156454C00000000000034400000000000C0
      5B4001430144013101530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014E010010415449564F20444953504F4E49
      56454C00000000000024400000000000805B4001430144013101530100010001
      000100010001000100014E014501000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      4E010022415449564F205245414C495A5C50524F4752414D4120505245564944
      454E4349414C0000000000003E400000000000805C4001430144013201530100
      010001000100010001000100014E014501000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E014E010022415449564F205245414C495A5C50524F4752414D4120415353
      495354454E4349414C00000000000044400000000000C05C4001430143013201
      530100010001000100010001000100014E014501000100010001000000000000
      0000000000000014000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E014E010024415449564F205245414C495A5C50524F4752414D4120
      41444D494E49535452415449564F00000000000049400000000000005D400143
      0144013201530100010001000100010001000100014E01450100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014E010026415449564F205245414C495A5C50524F47
      52414D4120444520494E56455354494D454E544F530000000000004E40000000
      0000405D4001430144013201530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014E01002D415449564F205245414C
      495A5C50524F472E20444520494E564553544D454E544F535C52454E44412046
      49584100000000008051400000000000805D4001430144013301530100010001
      000100010001000100014E014501000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      4E010031415449564F205245414C495A5C50524F472E20444520494E56455354
      4D454E544F535C52454E444120564152494156454C0000000000005440000000
      0000C05D4001430144013301530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014E010030415449564F205245414C
      495A5C50524F472E20444520494E564553544D454E544F535C494E564553542E
      20494D4F422E00000000008056400000000000005E4001430144013301530100
      010001000100010001000100014E014501000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E014E010039415449564F205245414C495A5C50524F472E20444520494E56
      4553544D454E544F5C4F5045522E20434F4D205041525449434950414E544553
      00000000000059400000000000405E4001430144013301530100010001000100
      010001000100014E014501000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014E0100
      35415449564F205245414C495A5C50524F472E20444520494E564553544D454E
      544F535C4F5554524F53205245414C495AC1564549530000000000805B400000
      000000805E4001430144013301530100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014E010010415449564F20504552
      4D414E454E54450000000000005E400000000000C05E40014301440131015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014D010017504153532E20455849472E204F5045524143494F4E414C00
      000000006060400000000000005F400143014301310153010001000100010001
      0001000100014E01450100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E014D010026
      504153532E20455849472E204F5045525C50524F4752414D4120505245564944
      454E4349414C00000000008061400000000000405F4001430143013101530100
      010001000100010001000100014E014501000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E014D010026504153532E20455849472E204F5045525C50524F4752414D41
      20415353495354454E4349414C0000000000C062400000000000805F40014301
      43013201530100010001000100010001000100014E0145010001000100010000
      0000000000000000000000140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000014E014D010028504153532E20455849472E204F5045525C50
      524F4752414D412041444D494E49535452415449564F00000000000064400000
      000000C05F4001430143013201530100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014D01002A504153532E20455849
      472E204F5045525C50524F4752414D4120444520494E56455354494D454E544F
      5300000000004065400000000000006040014301430132015301000100010001
      00010001000100014E0145010001000100010000000000000000000000000014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000014E014D01
      0011504153532E20455849472E20434F4E542E00000000008066400000000000
      20604001430143013201530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D010014504153532E20455849472E20
      415455415249414C0000000000C06C4000000000004060400143014301310153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D01002A504153532E20455849472E20415455415249414C5C5052
      4F564953D54553204D4154454D4154494341530000000000006E400000000000
      60604001430143013201530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D010034504153532E20455849472E20
      415455415249414C5C50524F562E4D41542E5C42454E45464943494F5320434F
      4E43454449444F530000000000406F400000000000A060400143014301330153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D010034504153532E20455849472E20415455415249414C5C5052
      4F562E4D41542E5C42454E45464943494F53204120434F4E4345444552000000
      00004070400000000000C0604001430143013301530100010001000100010001
      000100014E014501000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D0100335041
      53532E20455849472E20415455415249414C5C50524F562E4D41542E5C20282D
      292050524F564953D54553204D4154454D0000000000E070400000000000E060
      4001430143013301530100010001000100010001000100014E01450100010001
      0001000000000000000000000000001400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000014E014D01003A504153532E205245532E20452046
      554E444F535C45512E2054C9432E5C5245532E205245414C2E5C444546494349
      54205445434E49434F282D290000000000007440000000000060614001430143
      013101530100010001000100010001000100014E014501000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E014D01001A504153532E205245532E20452046554E444F53
      5C46554E444F5300000000004075400000000000806140014301430131015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014D010027504153532E20455849472E20434F4E542E5C50524F475241
      4D4120505245564944454E4349414C0000000000C067400000000000A0614001
      430143013201530100010001000100010001000100014E014501000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D010027504153532E20455849472E20434F4E54
      2E5C50524F4752414D4120415353495354454E4349414C000000000000694000
      00000000C0614001430143013201530100010001000100010001000100014E01
      4501000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014D010029504153532E204558
      49472E20434F4E542E5C50524F4752414D412041444D494E4953545241544956
      4F0000000000406A400000000000E06140014301430132015301000100010001
      00010001000100014E0145010001000100010000000000000000000000000014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000014E014D01
      002B504153532E20455849472E20434F4E542E5C50524F4752414D4120444520
      494E56455354494D454E544F530000000000806B400000000000006240014301
      43013201530100010001000100010001000100014E0145010001000100010000
      0000000000000000000000140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000014E014E01000B415449564F20544F54414C00000000004060
      4000000000004062400143014401310153010001000100010001000100010001
      4E01450100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014D01000D504153534956
      4F20544F54414C00000000006078400000000000806240014301430131015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014E01001C415449564F205045524D414E454E54455C494D4F42494C49
      5A41444F0000000000005F400000000000006F40014301440132015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014E010019415449564F205045524D414E454E54455C444946455249444F0000
      0000000060400000000000206F40014301440132015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014D01001F50
      415452494DD44E494F20494E54454752414C495A41444F202D20434254550000
      0000000035400000000000907040014301430132015301000100010001000100
      01000100014E0146010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014D01001A50
      415452494DD44E494F204CCD515549444F202D20524646534100000000000024
      4000000000006070400153014301310153010001000100010001000100010001
      4E01460100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014D01002050415452494D
      D44E494F20494E54454752414C495A41444F202D205246465341000000000000
      3440000000000040704001430143013201530100010001000100010001000100
      014E014601000100010001000000000000000000000000001400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E014D0100215041545249
      4DD44E494F20C020494E54454752414C495A4152202D20524646534100000000
      00003E4000000000005070400143014301320153010001000100010001000100
      0100014E01460100010001000100000000000000000000000000140000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E014D010020504154
      52494DD44E494F20C020494E54454752414C495A4152202D2043425455000000
      0000003F400000000000A0704001430143013201530100010001000100010001
      000100014E014601000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D0100195041
      5452494D4F4E494F204CCD515549444F202D2043425455000000000000264000
      00000000C0704001530143013101530100010001000100010001000100014E01
      4601000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014D010005415449564F000000
      00000024400000000000F0704001540144013101530100010001000100010001
      000100014E014401000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D01000A4449
      53504F4E4956454C000000000000344000000000000071400143014401320153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D01000A5245414C495A4156454C0000000000003E400000000000
      10714001430144013201530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D01001950524F4752414D4120444520
      494E56455354494D454E544F530000000000004E400000000000407140014301
      44013301530100010001000100010001000100014E0145010001000100010000
      0000000000000000000000140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000014E014D01000A52454E444120464958410000000000805140
      000000000050714001430144013301530100010001000100010001000100014E
      014E010001000100010000000000000000000000000004000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014D01001852454752412044
      4520434F4E53495354454E43494120303100000000000034400000000000F072
      40015301440131015309524547524130315F5301000100010001000100010001
      00014E0145010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E014D01001A494E5645
      5354494D454E544F5320494D4F42494C494152494F5300000000008056400000
      00000070714001430144013301530100010001000100010001000100014E014E
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014D01001C4F50455241C7D54553
      20434F4D20504154524F43494E41444F52415300000000000059400000000000
      80714001430144013301530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D01000A5045524D414E454E54450000
      000000805B400000000000907140014301440132015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000004000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014D01000D54
      4F54414C205041535349564F0000000000004440000000000010734001430144
      013101530C544F545041535349564F5F53010001000100010001000100010001
      4E01440100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014E010007504153534956
      4F00000000004060400000000000B07140015401430131014E01000100010001
      00010001000100014E0144010001000100010000000000000000000000000014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000014E014E01
      0014455849474956454C204F5045524143494F4E414C00000000008061400000
      000000C07140014301430132014E0100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014E01001550524F4752414D4120
      505245564944454E4349414C0000000000C062400000000000D0714001430143
      013301530100010001000100010001000100014E014E01000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E014E01001750524F4752414D412041444D494E4953545241
      5449564F00000000000064400000000000E07140014301430133015301000100
      01000100010001000100014E014E010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014E01001950524F4752414D4120444520494E56455354494D454E544F530000
      0000004065400000000000F07140014301430133015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014E01001945
      5849474956454C20444520434F4E54494E47454E4349414C0000000000806640
      000000000000724001430143013201530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014E01001550524F4752414D
      4120505245564944454E4349414C0000000000C0674000000000001072400143
      0143013301530100010001000100010001000100014E014E0100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014E01001750524F4752414D412041444D494E495354
      52415449564F0000000000006940000000000020724001430143013301530100
      010001000100010001000100014E014E01000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E014E01001950524F4752414D4120444520494E56455354494D454E544F53
      0000000000406A40000000000030724001430143013301530100010001000100
      010001000100014E014501000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014E0100
      11455849474956454C20415455415249414C0000000000806B40000000000040
      724001430143013201530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014E01001550524F564953D54553204D4154
      454D4154494341530000000000C06C4000000000005072400143014301330153
      0100010001000100010001000100014E014E0100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014E01001542454E45464943494F5320434F4E43454449444F530000
      000000006E400000000000607240014301430134015301000100010001000100
      01000100014E014E010001000100010000000000000000000000000004000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E015001000B54
      4F54414C20415449564F0000000000003E400000000000307340014301440131
      01530A544F54415449564F5F530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014E010018282D2920524553455256
      4153204120414D4F5254495A4152000000000040704000000000008072400143
      0144013401530100010001000100010001000100014E014E0100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014E01000646554E444F530000000000007240000000
      000090724001430144013201530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014E01001152455345525641532045
      2046554E444F5300000000008071400000000000A07240014301430132015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014D01001F50415452494D4F4E494F20494E54454752414C495A41444F
      202D204350544D00000000000036400000000000607340014301430132015301
      00010001000100010001000100014E0146010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014D01002550415452494DD44E494F20494E54454752414C495A41444F
      202D20464C554D495452454E5300000000000037400000000000707340014301
      43013201530100010001000100010001000100014E0146010001000100010000
      0000000000000000000000140000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000014E014D01002050415452494DD44E494F20494E5445475241
      4C495A41444F202D205245464552000000000000384000000000008073400143
      0143013201530100010001000100010001000100014E01460100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014D01002050415452494DD44E494F20494E54454752
      414C495A41444F202D204D455452D40000000000003940000000000090734001
      430143013201530100010001000100010001000100014E014601000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D01002050415452494DD44E494F20C020494E54
      454752414C495A4152202D204350544D00000000000040400000000000B07340
      01430143013201530100010001000100010001000100014E0146010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E014D01002650415452494DD44E494F20C020494E
      54454752414C495A4152202D20464C554D495452454E53000000000080404000
      00000000E0734001430143013201530100010001000100010001000100014E01
      4601000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014D01002150415452494DD44E
      494F20C020494E54454752414C495A4152202D204D455452D400000000008041
      400000000000F073400143014301320153010001000100010001000100010001
      4E01460100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014D01002150415452494D
      D44E494F20C020494E54454752414C495A4152202D2052454645520000000000
      0041400000000000107440014301430132015301000100010001000100010001
      00014E0146010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E014D01001950415452
      494DD44E494F204CCD515549444F202D204350544D0000000000002840000000
      000040744001530143013101530100010001000100010001000100014E014601
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014D01001F50415452494DD44E494F
      204CCD515549444F202D20464C554D495452454E530000000000002A40000000
      000050744001530143013101530100010001000100010001000100014E014601
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014D01001A50415452494DD44E494F
      204CCD515549444F202D2052454645520000000000002C400000000000607440
      01530143013101530100010001000100010001000100014E0146010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E014D01001A50415452494DD44E494F206CCD5155
      49444F202D204D455452D40000000000002E4000000000008074400153014301
      3101530100010001000100010001000100014E01460100010001000100000000
      0000000000000000001400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000014E014D01001C46554E444F2041444D494E49535452415449564F
      202D20524646534100000000000044400000000000A074400143014301310153
      0100010001000100010001000100014E01460100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D01001B46554E444F2041444D494E49535452415449564F202D20
      4342545500000000008044400000000000B07440014301430131015301000100
      01000100010001000100014E0146010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D01001B46554E444F2041444D494E49535452415449564F202D204350544D
      00000000000045400000000000C0744001430143013101530100010001000100
      010001000100014E014601000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014D0100
      2146554E444F2041444D494E49535452415449564F202D20464C554D49545245
      4E5300000000008045400000000000D074400143014301310153010001000100
      0100010001000100014E01460100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E014D
      01001C46554E444F2041444D494E49535452415449564F202D20524546455200
      000000000046400000000000E074400143014301310153010001000100010001
      0001000100014E01460100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E014D01001C
      46554E444F2041444D494E49535452415449564F202D204D455452D400000000
      008046400000000000F074400143014301310153010001000100010001000100
      0100014E01460100010001000100000000000000000000000000140000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E014D01001B504154
      52494DD44E494F20415455415249414C202D2052464653410000000000004940
      000000000010754001530143013101530100010001000100010001000100014E
      0146010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E015001001A50415452494DD4
      4E494F20415455415249414C202D204342545500000000008049400000000000
      30754001530143013101530100010001000100010001000100014E0146010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D01001A50415452494DD44E494F2041
      5455415249414C202D204350544D0000000000004A4000000000004075400153
      0144013101530100010001000100010001000100014E01460100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014D01002050415452494DD44E494F20415455415249
      414C202D20464C554D495452454E530000000000804A40000000000050754001
      530143013101530100010001000100010001000100014E014601000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D01001B50415452494DD44E494F204154554152
      49414C202D2052454645520000000000004B4000000000006075400153014301
      3101530100010001000100010001000100014E01460100010001000100000000
      0000000000000000001400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000014E014D01001B50415452494DD44E494F20415455415249414C20
      2D204D455452D40000000000804B400000000000707540015301430131015301
      00010001000100010001000100014E0146010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E015001001C5245434549544120505245564944454E4349414C202D2052
      4646534100000000000034400000000000B07540014301430132015301000100
      01000100010001000100014E0146010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      015001001B5245434549544120505245564944454E4349414C202D2043425455
      00000000000035400000000000C0754001430143013201530100010001000100
      010001000100014E014601000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E01500100
      1B5245434549544120505245564944454E4349414C202D204350544D00000000
      000036400000000000D075400143014301320153010001000100010001000100
      0100014E01460100010001000100000000000000000000000000140000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E0150010021524543
      4549544120505245564944454E4349414C202D20464C554D495452454E530000
      0000000037400000000000E07540014301430132015301000100010001000100
      01000100014E0146010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E015001001C52
      45434549544120505245564944454E4349414C202D2052454645520000000000
      0038400000000000F07540014301430132015301000100010001000100010001
      00014E0146010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E015001001C52454345
      49544120505245564944454E4349414C202D204D455452D40000000000003940
      000000000000764001430143013201530100010001000100010001000100014E
      0146010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E015001001E52454345495441
      2041444D494E495354524154495641202D20544F54414C000000000000424000
      0000000020764001430143013201530100010001000100010001000100014E01
      4601000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E015001001C4445535045534120
      505245564944454E4349414C202D205246465341000000000000494000000000
      0030764001430143013201530100010001000100010001000100014E01460100
      0100010001000000000000000000000000001400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000014E015001001B4445535045534120505245
      564944454E4349414C202D204342545500000000008049400000000000507640
      01430144013201530100010001000100010001000100014E0146010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E015001001B444553504553412050524556494445
      4E4349414C202D204350544D0000000000004A40000000000080764001430144
      013201530100010001000100010001000100014E014601000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E01500100214445535045534120505245564944454E434941
      4C202D20464C554D495452454E530000000000804A400000000000A076400143
      0144013201530100010001000100010001000100014E01460100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E015001001C4445535045534120505245564944454E43
      49414C202D2052454645520000000000004B400000000000B076400143014401
      3201530100010001000100010001000100014E01460100010001000100000000
      0000000000000000001400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000014E015001001C4445535045534120505245564944454E4349414C
      202D204D455452D40000000000804B400000000000C076400143014401320153
      0100010001000100010001000100014E01460100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E015001001E524543454954412041444D494E49535452415449564120
      2D2052464653410000000000003E400000000000E07640014301430132015301
      00010001000100010001000100014E0146010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E015001001D524543454954412041444D494E495354524154495641202D
      20434254550000000000003F400000000000F076400153014301320153010001
      0001000100010001000100014E01460100010001000100000000000000000000
      0000001400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      4E015001001D524543454954412041444D494E495354524154495641202D2043
      50544D0000000000004040000000000000774001430143013201530100010001
      000100010001000100014E014601000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      50010023524543454954412041444D494E495354524154495641202D20464C55
      4D495452454E5300000000008040400000000000107740014301430132015301
      00010001000100010001000100014E0146010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E015001001E524543454954412041444D494E495354524154495641202D
      2052454645520000000000004140000000000020774001430143013201530100
      010001000100010001000100014E014601000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E015001001E524543454954412041444D494E495354524154495641202D20
      4D455452D4000000000080414000000000003077400143014301320153010001
      0001000100010001000100014E01460100010001000100000000000000000000
      0000001400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      4E015001001E444553504553412041444D494E495354524154495641202D2052
      464653410000000000004E400000000000507740014301440132015301000100
      01000100010001000100014E0146010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      015001001D444553504553412041444D494E495354524154495641202D204342
      54550000000000804E4000000000006077400143014401320153010001000100
      0100010001000100014E01460100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E0150
      01001D444553504553412041444D494E495354524154495641202D204350544D
      0000000000004F40000000000070774001430144013201530100010001000100
      010001000100014E014601000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E01500100
      23444553504553412041444D494E495354524154495641202D20464C554D4954
      52454E530000000000804F400000000000807740014301440132015301000100
      01000100010001000100014E0146010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      015001001E444553504553412041444D494E495354524154495641202D205245
      4645520000000000005040000000000090774001430144013201530100010001
      000100010001000100014E014601000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      5001001E444553504553412041444D494E495354524154495641202D204D4554
      52D400000000004050400000000000A077400143014401320153010001000100
      0100010001000100014E01460100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E0150
      01001E444553504553412041444D494E495354524154495641202D20544F5441
      4C00000000008050400000000000B07740014301440132015301000100010001
      00010001000100014E0146010001000100010000000000000000000000000014
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000014E015001
      001C4445535045534120505245564944454E4349414C202D20544F54414C0000
      000000004C400000000000D07740015301440132015301000100010001000100
      01000100014E0146010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E015001001552
      45434549544120544F54414C202D205246465341000000000000244000000000
      00F0774001530143013101530100010001000100010001000100014E01460100
      0100010001000000000000000000000000001400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000014E01500100145245434549544120544F54
      414C202D20434254550000000000002640000000000000784001530143013101
      530100010001000100010001000100014E014601000100010001000000000000
      0000000000000014000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E01500100145245434549544120544F54414C202D204350544D0000
      0000000028400000000000107840015301430131015301000100010001000100
      01000100014E0146010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E015001001A52
      45434549544120544F54414C202D20464C554D495452454E530000000000002A
      4000000000002078400153014301310153010001000100010001000100010001
      4E01460100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E0150010015524543454954
      4120544F54414C202D2052454645520000000000002C40000000000030784001
      530143013101530100010001000100010001000100014E014601000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E01500100155245434549544120544F54414C202D20
      4D455452D40000000000002E4000000000004078400153014301310153010001
      0001000100010001000100014E01460100010001000100000000000000000000
      0000001400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      4E01500100154445535045534120544F54414C202D2052464653410000000000
      0044400000000000607840015301440131015301000100010001000100010001
      00014E0146010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E015001001444455350
      45534120544F54414C202D204342545500000000008044400000000000707840
      01530144013101530100010001000100010001000100014E0146010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E01500100144445535045534120544F54414C202D
      204350544D000000000000454000000000008078400153014401310153010001
      0001000100010001000100014E01460100010001000100000000000000000000
      0000001400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      4E015001001A4445535045534120544F54414C202D20464C554D495452454E53
      0000000000804540000000000090784001530144013101530100010001000100
      010001000100014E014601000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E01500100
      154445535045534120544F54414C202D20524546455200000000000046400000
      000000A0784001530144013101530100010001000100010001000100014E0146
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E0150010015444553504553412054
      4F54414C202D204D455452D400000000008046400000000000B0784001530144
      013101530100010001000100010001000100014E014601000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E01500100155245434549544120544F54414C202D20544F54
      414C00000000000030400000000000D078400153014301310153010001000100
      0100010001000100014E01460100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E0150
      01001C5245434549544120505245564944454E4349414C202D20544F54414C00
      00000000003A400000000000F078400153014301310153010001000100010001
      0001000100014E01460100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E0150010015
      4445535045534120544F54414C202D20544F54414C0000000000004740000000
      000010794001530144013101530100010001000100010001000100014E014601
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014D010027504153532E205245532E
      20452046554E444F535C45512E2054C9432E5C5245532E205245414C2E000000
      0000C07240000000000070794001430143013301530100010001000100010001
      000100014E014501000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D0100135041
      53532E205245532E20452046554E444F53000000000080714000000000005079
      4001430143013101530100010001000100010001000100014E01450100010001
      0001000000000000000000000000001400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000014E014D01001C504153532E205245532E20452046
      554E444F535C45512E2054C9432E000000000020724000000000006079400143
      0143013201530100010001000100010001000100014E01450100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014D010039504153532E205245532E20452046554E44
      4F535C45512E2054C9432E5C5245532E205245414C2E5C53555045522E2054C9
      432E204143554D2E000000000060734000000000008079400143014401340153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D01002C504153532E205245532E20452046554E444F535C46554E
      444F535C5052472E20415353495354454E4349414C0000000000807640000000
      0000B0794001430144013101530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014D010032504153532E205245532E
      20452046554E444F535C45512E2054C9432E5C524553554C5441444F53204120
      5245414C495A41520000000000A074400000000000A079400143014301330153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D01002C504153532E205245532E20452046554E444F535C46554E
      444F535C5052472E20505245564944454E4349414C0000000000E07540000000
      0000F07A4001430144013101530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014D01002E504153532E205245532E
      20452046554E444F535C46554E444F535C5052472E2041444D494E4953545241
      5449564F00000000002077400000000000007B40014301440131015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D01002D504153532E205245532E20452046554E444F535C46554E444F535C
      5052472E20494E56455354494D454E544F530000000000C07740000000000010
      7B4001430144013101530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014E010010415449564F205245414C495A41
      56454C00000000000034400000000000C05BC001430144013101530100010001
      000100010001000100014E014501000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      4E010010415449564F20444953504F4E4956454C000000000000244000000000
      00805BC001430144013101530100010001000100010001000100014E01450100
      0100010001000000000000000000000000001400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000014E014E010022415449564F205245414C49
      5A5C50524F4752414D4120505245564944454E4349414C0000000000003E4000
      00000000805CC001430144013201530100010001000100010001000100014E01
      4501000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014E010022415449564F205245
      414C495A5C50524F4752414D4120415353495354454E4349414C000000000000
      44400000000000C05CC001430143013201530100010001000100010001000100
      014E014501000100010001000000000000000000000000001400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E014E010024415449564F
      205245414C495A5C50524F4752414D412041444D494E49535452415449564F00
      000000000049400000000000005DC00143014401320153010001000100010001
      0001000100014E01450100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E014E010026
      415449564F205245414C495A5C50524F4752414D4120444520494E5645535449
      4D454E544F530000000000004E400000000000405DC001430144013201530100
      010001000100010001000100014E014501000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E014E01002D415449564F205245414C495A5C50524F472E20444520494E56
      4553544D454E544F535C52454E44412046495841000000000080514000000000
      00805DC001430144013301530100010001000100010001000100014E01450100
      0100010001000000000000000000000000001400000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000014E014E010031415449564F205245414C49
      5A5C50524F472E20444520494E564553544D454E544F535C52454E4441205641
      52494156454C00000000000054400000000000C05DC001430144013301530100
      010001000100010001000100014E014501000100010001000000000000000000
      0000000014000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      014E014E010030415449564F205245414C495A5C50524F472E20444520494E56
      4553544D454E544F535C494E564553542E20494D4F422E000000000080564000
      00000000005EC001430144013301530100010001000100010001000100014E01
      4501000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014E010039415449564F205245
      414C495A5C50524F472E20444520494E564553544D454E544F5C4F5045522E20
      434F4D205041525449434950414E54455300000000000059400000000000405E
      C001430144013301530100010001000100010001000100014E01450100010001
      0001000000000000000000000000001400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000014E014E010035415449564F205245414C495A5C50
      524F472E20444520494E564553544D454E544F535C4F5554524F53205245414C
      495AC1564549530000000000805B400000000000805EC0014301440133015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014E010010415449564F205045524D414E454E54450000000000005E40
      0000000000C05EC001430144013101530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014D010017504153532E2045
      5849472E204F5045524143494F4E414C00000000006060400000000000005FC0
      01430143013101530100010001000100010001000100014E0145010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E014D010026504153532E20455849472E204F5045
      525C50524F4752414D4120505245564944454E4349414C000000000080614000
      00000000405FC001430143013101530100010001000100010001000100014E01
      4501000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014D010026504153532E204558
      49472E204F5045525C50524F4752414D4120415353495354454E4349414C0000
      000000C062400000000000805FC0014301430132015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014D01002850
      4153532E20455849472E204F5045525C50524F4752414D412041444D494E4953
      5452415449564F00000000000064400000000000C05FC0014301430132015301
      00010001000100010001000100014E0145010001000100010000000000000000
      0000000000140000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00014E014D01002A504153532E20455849472E204F5045525C50524F4752414D
      4120444520494E56455354494D454E544F530000000000406540000000000000
      60C001430143013201530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014D010011504153532E20455849472E2043
      4F4E542E000000000080664000000000002060C0014301430132015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D010014504153532E20455849472E20415455415249414C0000000000C06C
      4000000000004060C00143014301310153010001000100010001000100010001
      4E01450100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014D01002A504153532E20
      455849472E20415455415249414C5C50524F564953D54553204D4154454D4154
      494341530000000000006E4000000000006060C0014301430132015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D010034504153532E20455849472E20415455415249414C5C50524F562E4D
      41542E5C42454E45464943494F5320434F4E43454449444F530000000000406F
      400000000000A060C00143014301330153010001000100010001000100010001
      4E01450100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014D010034504153532E20
      455849472E20415455415249414C5C50524F562E4D41542E5C42454E45464943
      494F53204120434F4E434544455200000000004070400000000000C060C00143
      0143013301530100010001000100010001000100014E01450100010001000100
      0000000000000000000000001400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000014E014D010033504153532E20455849472E204154554152
      49414C5C50524F562E4D41542E5C20282D292050524F564953D54553204D4154
      454D0000000000E070400000000000E060C00143014301330153010001000100
      0100010001000100014E01450100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E014D
      01003A504153532E205245532E20452046554E444F535C45512E2054C9432E5C
      5245532E205245414C2E5C44454649434954205445434E49434F282D29000000
      000000744000000000006061C001430143013101530100010001000100010001
      000100014E014501000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D01001A5041
      53532E205245532E20452046554E444F535C46554E444F530000000000407540
      00000000008061C001430143013101530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014D010027504153532E2045
      5849472E20434F4E542E5C50524F4752414D4120505245564944454E4349414C
      0000000000C067400000000000A061C001430143013201530100010001000100
      010001000100014E014501000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014D0100
      27504153532E20455849472E20434F4E542E5C50524F4752414D412041535349
      5354454E4349414C00000000000069400000000000C061C00143014301320153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D010029504153532E20455849472E20434F4E542E5C50524F4752
      414D412041444D494E49535452415449564F0000000000406A400000000000E0
      61C001430143013201530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014D01002B504153532E20455849472E2043
      4F4E542E5C50524F4752414D4120444520494E56455354494D454E544F530000
      000000806B4000000000000062C0014301430132015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014E01000B41
      5449564F20544F54414C000000000040604000000000004062C0014301440131
      01530100010001000100010001000100014E0145010001000100010000000000
      0000000000000000140000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000014E014D01000D5041535349564F20544F54414C0000000000607840
      00000000008062C001430143013101530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014E01001C415449564F2050
      45524D414E454E54455C494D4F42494C495A41444F0000000000005F40000000
      0000006FC001430144013201530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014E010019415449564F205045524D
      414E454E54455C444946455249444F00000000000060400000000000206FC001
      430144013201530100010001000100010001000100014E014501000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D010027504153532E205245532E20452046554E
      444F535C45512E2054C9432E5C5245532E205245414C2E0000000000C0724000
      000000007079C001430143013301530100010001000100010001000100014E01
      4501000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014D010013504153532E205245
      532E20452046554E444F53000000000080714000000000005079C00143014301
      3101530100010001000100010001000100014E01450100010001000100000000
      0000000000000000001400000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000014E014D01001C504153532E205245532E20452046554E444F535C
      45512E2054C9432E000000000020724000000000006079C00143014301320153
      0100010001000100010001000100014E01450100010001000100000000000000
      0000000000001400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000014E014D010039504153532E205245532E20452046554E444F535C45512E
      2054C9432E5C5245532E205245414C2E5C53555045522E2054C9432E20414355
      4D2E000000000060734000000000008079C00143014401340153010001000100
      0100010001000100014E01450100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E014D
      01002C504153532E205245532E20452046554E444F535C46554E444F535C5052
      472E20415353495354454E4349414C00000000008076400000000000B079C001
      430144013101530100010001000100010001000100014E014501000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D010032504153532E205245532E20452046554E
      444F535C45512E2054C9432E5C524553554C5441444F532041205245414C495A
      41520000000000A074400000000000A079C00143014301330153010001000100
      0100010001000100014E01450100010001000100000000000000000000000000
      1400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000014E014D
      01002C504153532E205245532E20452046554E444F535C46554E444F535C5052
      472E20505245564944454E4349414C0000000000E075400000000000F07AC001
      430144013101530100010001000100010001000100014E014501000100010001
      0000000000000000000000000014000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000014E014D01002E504153532E205245532E20452046554E
      444F535C46554E444F535C5052472E2041444D494E49535452415449564F0000
      0000002077400000000000007BC0014301440131015301000100010001000100
      01000100014E0145010001000100010000000000000000000000000014000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000014E014D01002D50
      4153532E205245532E20452046554E444F535C46554E444F535C5052472E2049
      4E56455354494D454E544F530000000000C077400000000000107BC001430144
      013101530100010001000100010001000100014E014501000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E0150010016282B29205245435552534F5320434F4C455441
      444F53000000000000344000000000004054C001430143013201530100010001
      000100010001000100014E014E01000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      50010017282D29205245435552534F53205554494C495A41444F530000000000
      003E4000000000008054C0014301440132015301000100010001000100010001
      00014E014E010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E014D01001A282D2920
      4355535445494F2041444D494E49535452415449564F00000000000049400000
      000000707BC001430144013201530100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014D01001550524F4752414D4120
      505245564944454E4349414C00000000000024400000000000507BC001540144
      013101530100010001000100010001000100014E014501000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E014D01002E282D2F2B2920434F4E535449545549C7D54553
      2F524556455253D5455320444520434F4E54494E47CA4E434941530000000000
      0044400000000000607BC0014301440132015301000100010001000100010001
      00014E0145010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E014D010030282B2920
      5245435552534F53204F5249554E444F5320444F2050524F4752414D41204144
      4D494E49535452415449564F0000000000004E400000000000807BC001430144
      013201530100010001000100010001000100014E014501000100010001000000
      0000000000000000000014000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000014E014D010030282B2F2D2920524553554C5441444F5320444F
      5320494E56455354494D454E544F5320505245564944454E4349414953000000
      00008051400000000000907BC001430144013201530100010001000100010001
      000100014E014501000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D010034282D
      2F2B2920434F4E535449545549C7D545532F524556455253D545532044452050
      524F564953D545532041545541524941495300000000000054400000000000A0
      7BC001430144013201530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014D010027282D2F2B2920434F4E53544954
      5549C7D545532F524556455253D545532044452046554E444F53000000000080
      56400000000000B07BC001430144013201530100010001000100010001000100
      014E014501000100010001000000000000000000000000001400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E014D01001C282B2F2D29
      204F50455241C7D54553205452414E534954D352494153000000000000594000
      00000000C07BC001430144013201530100010001000100010001000100014E01
      4501000100010001000000000000000000000000001400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000014E014D01002C283D292053555045
      52C1564954202844C94649434954292054C9434E49434F20444F204558455243
      CD43494F0000000000805B400000000000D07BC0015301440132015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D01001550524F4752414D4120415353495354454E4349414C000000000000
      5E400000000000E07BC001540144013101530100010001000100010001000100
      014E014501000100010001000000000000000000000000001400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E014D010016282B292052
      45435552534F5320434F4C455441444F5300000000004060400000000000F07B
      C001430144013201530100010001000100010001000100014E01450100010001
      0001000000000000000000000000001400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000014E014D010017282D29205245435552534F532055
      54494C495A41444F5300000000008061400000000000007CC001430144013201
      530100010001000100010001000100014E014501000100010001000000000000
      0000000000000014000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E014D01002E282D2F2B2920434F4E535449545549C7D545532F5245
      56455253D5455320444520434F4E54494E47CA4E434941530000000000C06240
      0000000000107CC001430144013201530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014D01001A282D2920435553
      5445494F2041444D494E49535452415449564F00000000000064400000000000
      207CC001430144013201530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D010030282B29205245435552534F53
      204F5249554E444F5320444F2050524F4752414D412041444D494E4953545241
      5449564F00000000004065400000000000307CC0014301440132015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D010030282B2F2D2920524553554C5441444F5320444F5320494E56455354
      494D454E544F5320415353495354454E43494149530000000000806640000000
      0000407CC001430144013201530100010001000100010001000100014E014501
      0001000100010000000000000000000000000014000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000014E014D01001C282B2F2D29204F504552
      41C7D54553205452414E534954D3524941530000000000C06740000000000050
      7CC001430144013201530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014D010027283D2920434F4E535449545549
      C7D545532028524556455253D54553292044452046554E444F53000000000000
      69400000000000607CC001430144013201530100010001000100010001000100
      014E014501000100010001000000000000000000000000001400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E014D01001750524F4752
      414D412041444D494E49535452415449564F0000000000406A40000000000070
      7CC001540144013101530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014D010029282B29205245435552534F5320
      4F5249554E444F53204445204F5554524F532050524F4752414D415300000000
      00806B400000000000807CC00143014401320153010001000100010001000100
      0100014E01450100010001000100000000000000000000000000140000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000014E014D01000C282B29
      2052454345495441530000000000C06C400000000000907CC001430144013201
      530100010001000100010001000100014E014501000100010001000000000000
      0000000000000014000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E014D01000C282D292044455350455341530000000000006E400000
      000000A07CC001430144013201530100010001000100010001000100014E0145
      0100010001000100000000000000000000000000140000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000014E014D01002E282D2F2B2920434F4E
      535449545549C7D545532F524556455253D5455320444520434F4E54494E47CA
      4E434941530000000000406F400000000000B07CC00143014401320153010001
      0001000100010001000100014E01450100010001000100000000000000000000
      0000001400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      4E014D01003A282D29205245435552534F53205452414E53462E205041524120
      4F205052472E20505245564944454E4349414C2F415353495354454E4349414C
      00000000004070400000000000C07CC001430144013201530100010001000100
      010001000100014E014501000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014D0100
      32282B2F2D2920524553554C5441444F5320444F5320494E56455354494D454E
      544F532041444D494E49535452415449564F530000000000E070400000000000
      D07CC001430144013201530100010001000100010001000100014E0145010001
      0001000100000000000000000000000000140000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000014E014D01001C282B2F2D29204F50455241C7
      D54553205452414E534954D35249415300000000008071400000000000E07CC0
      01430144013201530100010001000100010001000100014E0145010001000100
      0100000000000000000000000000140000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000014E014D010027283D2920434F4E535449545549C7D5
      45532028524556455253D54553292044452046554E444F530000000000207240
      0000000000F07CC001430144013201530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014D01001950524F4752414D
      4120444520494E56455354494D454E544F530000000000C07240000000000000
      7DC001540144013101530100010001000100010001000100014E014501000100
      0100010000000000000000000000000014000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000014E014D010010282B2F2D292052454E44412046
      49584100000000006073400000000000107DC001430144013201530100010001
      000100010001000100014E014501000100010001000000000000000000000000
      0014000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000014E01
      4D010014282B2F2D292052454E44412056415249C156454C0000000000007440
      0000000000207DC001430144013201530100010001000100010001000100014E
      0145010001000100010000000000000000000000000014000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000014E014D010020282B2F2D292049
      4E56455354494D454E544F5320494D4F42494C49C152494F530000000000A074
      400000000000307DC00143014401320153010001000100010001000100010001
      4E01450100010001000100000000000000000000000000140000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000014E014D010021282B2F2D2920
      4F50455241C7D5455320434F4D205041525449434950414E5445530000000000
      4075400000000000407DC0014301440132015301000100010001000100010001
      00014E0145010001000100010000000000000000000000000014000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000014E014D010023282B2F2D
      292052454C4143494F4E41444F5320434F4D204F20444953504F4ECD56454C00
      00000000E075400000000000507DC00143014401320153010001000100010001
      0001000100014E01450100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E014D01001F
      282B2F2D292052454C4143494F4E41444F5320434F4D205452494255544F5300
      000000008076400000000000607DC00143014401320153010001000100010001
      0001000100014E01450100010001000100000000000000000000000000140000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000014E014D01001A
      282B2F2D29204F5554524F5320494E56455354494D454E544F53000000000020
      77400000000000707DC001430144013201530100010001000100010001000100
      014E014501000100010001000000000000000000000000001400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000014E014D01002E282D2F2B29
      20434F4E535449545549C7D545532F524556455253D5455320444520434F4E54
      494E47CA4E434941530000000000C077400000000000807DC001430144013201
      530100010001000100010001000100014E014501000100010001000000000000
      0000000000000014000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000014E014D01001A282D29204355535445494F2041444D494E4953545241
      5449564F00000000006078400000000000907DC0014301440132015301000100
      01000100010001000100014E0145010001000100010000000000000000000000
      0000140000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000014E
      014D01003B282B2F2D2920524553554C5441444F5320524543454249444F532F
      5452414E5346455249444F53204445204F5554524F532050524F4752414D4153
      00000000000079400000000000A07DC001430144013201530100010001000100
      010001000100014E014501000100010001000000000000000000000000001400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000014E014D0100
      1C282B2F2D29204F50455241C7D54553205452414E534954D352494153000000
      0000A079400000000000B07DC001430144013201530100010001000100010001
      000100014E014501000100010001000000000000000000000000001400000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000014E014D010027283D
      2920434F4E535449545549C7D545532028524556455253D54553292044452046
      554E444F530000000000407A400000000000C07DC00143014401320153010001
      0001000100010001000100014E01450100010001000100}
  end
  object dsDRE: TDataSource
    DataSet = CdsDRE
    Left = 32
    Top = 72
  end
  object CdsLogo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 72
  end
  object dsLogo: TDataSource
    DataSet = CdsLogo
    Left = 88
    Top = 120
  end
  object pplLogo: TppDBPipeline
    DataSource = dsLogo
    UserName = 'lLogo'
    Left = 88
    Top = 160
  end
end
