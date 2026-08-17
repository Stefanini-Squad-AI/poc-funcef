inherited RptLancRubIndiv: TRptLancRubIndiv
  Left = 201
  Top = 206
  Width = 292
  Height = 266
  Caption = 'RptLancRubIndiv'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdEstab'
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
        Name = 'ListaIdEstab'
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
        Caption = 'IdEmpresa'
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
        Name = 'IdEmpresa'
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
        Caption = 'ListaIdRubrica'
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
        Name = 'ListaIdRubrica'
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
        Caption = 'SelecionaAnoMesRef'
        Controle = tcEdit
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'SelecionaAnoMesRef'
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
        Caption = 'MesRef'
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
        Name = 'MesRef'
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
        Caption = 'AnoRef'
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
        Name = 'AnoRef'
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
        Caption = 'IncluirRubPermanentes'
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
        Name = 'IncluirRubPermanentes'
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
        Caption = 'Ordenacao'
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
        Name = 'Ordenacao'
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
    DataBaseName = 'BaseDados'
    Report = rpLancRubIndiv
    ConnectionType = cntBDE
  end
  object rpLancRubIndiv: TppReport
    AutoStop = False
    DataPipeline = ppLancRubIndiv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Lançamentos de Rubricas Individuais'
    PrinterSetup.PaperName = 'Carta 8 ½ x 11 pol'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 8350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 215
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLancRubIndiv'
    object rpLancRubIndivHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 4498
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 13229
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'ppLabel17'
        Caption = 'LANÇAMENTO DE RUBRICAS INDIVIDUAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 18521
        mmWidth = 70115
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 8996
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 13758
        BandType = 0
      end
      object ppLancRubIndivDBTextCGC: TppDBText
        UserName = 'LancRubIndivDBTextCGC'
        AutoSize = True
        DataField = 'CGC'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 7673
        mmWidth = 6350
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        AutoSize = True
        DataField = 'UF'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 4498
        mmWidth = 3704
        BandType = 0
      end
      object ppLancRubIndivDBTextEnder: TppDBText
        UserName = 'LancRubIndivDBTextEnder'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 12435
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'ppLabel19'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 35190
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 35190
        mmWidth = 8467
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 794
        mmLeft = 5027
        mmTop = 39688
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        AutoSize = False
        Caption = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 177536
        mmTop = 35190
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'CODIGORUBRICA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 27252
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'NOMERUBRICA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 27252
        mmWidth = 119592
        BandType = 0
      end
      object rpLancRubIndivLabel1: TppLabel
        UserName = 'rpLancRubIndivLabel1'
        Caption = 'Rubrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 27252
        mmWidth = 11642
        BandType = 0
      end
      object rpLancRubIndivLabel2: TppLabel
        UserName = 'rpLancRubIndivLabel2'
        AutoSize = False
        Caption = 'Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 35190
        mmWidth = 13229
        BandType = 0
      end
      object rpLancRubIndivLabel3: TppLabel
        UserName = 'rpLancRubIndivLabel3'
        AutoSize = False
        Caption = 'Permanente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 35190
        mmWidth = 19315
        BandType = 0
      end
      object rpLancRubIndivLabel4: TppLabel
        UserName = 'rpLancRubIndivLabel4'
        AutoSize = False
        Caption = 'Ocorrências'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 35190
        mmWidth = 19050
        BandType = 0
      end
      object rpLancRubIndivLabel5: TppLabel
        UserName = 'rpLancRubIndivLabel5'
        AutoSize = False
        Caption = 'Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 35190
        mmWidth = 13494
        BandType = 0
      end
      object rpLancRubIndivLabel6: TppLabel
        UserName = 'rpLancRubIndivLabel6'
        AutoSize = False
        Caption = 'Seq.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 35190
        mmWidth = 9525
        BandType = 0
      end
      object rpLancRubIndivLine1: TppLine
        UserName = 'rpLancRubIndivLine1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 5027
        mmTop = 24871
        mmWidth = 191559
        BandType = 0
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 8996
        mmWidth = 7938
        BandType = 0
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172509
        mmTop = 13229
        mmWidth = 22225
        BandType = 0
      end
    end
    object rpLancRubIndivDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'MATRICULA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 529
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'FUNCIONARIO'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 529
        mmWidth = 73025
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'VALORLANCADO'
        DataPipeline = ppLancRubIndiv
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 177536
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object rpLancRubIndivDBText1: TppDBText
        UserName = 'rpLancRubIndivDBText1'
        DataField = 'ANOMES'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 98690
        mmTop = 529
        mmWidth = 13229
        BandType = 4
      end
      object rpLancRubIndivDBText2: TppDBText
        UserName = 'rpLancRubIndivDBText2'
        DataField = 'PERMANENTE'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object rpLancRubIndivDBText3: TppDBText
        UserName = 'rpLancRubIndivDBText3'
        DataField = 'OCORRENCIAS'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object rpLancRubIndivDBText4: TppDBText
        UserName = 'rpLancRubIndivDBText4'
        DataField = 'PARCELAS'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 152929
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object rpLancRubIndivDBText5: TppDBText
        UserName = 'rpLancRubIndivDBText5'
        DataField = 'SEQUENCIA'
        DataPipeline = ppLancRubIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppLancRubIndiv'
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 529
        mmWidth = 9525
        BandType = 4
      end
    end
    object rpLancRubIndivFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8000
      mmPrintPosition = 0
    end
    object rpLancRubIndivSmryBnd: TppSummaryBand
      AfterPrint = rpLancRubIndivSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'CODIGORUBRICA'
      DataPipeline = ppLancRubIndiv
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppLancRubIndiv'
      object rpLancRubIndivGrpHdrBnd0: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpLancRubIndivGrpFootBnd0: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'ppLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 5027
          mmTop = 529
          mmWidth = 191559
          BandType = 5
          GroupNo = 1
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          AutoSize = False
          Caption = 'TOTAL LANÇADO:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 141288
          mmTop = 2381
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'VALORLANCADO'
          DataPipeline = ppLancRubIndiv
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancRubIndiv'
          mmHeight = 3704
          mmLeft = 170657
          mmTop = 2381
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'QUANT. LANÇAMENTOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 28310
          mmTop = 2381
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALORLANCADO'
          DataPipeline = ppLancRubIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppLancRubIndiv'
          mmHeight = 3704
          mmLeft = 66411
          mmTop = 2381
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppLancRubIndiv: TppBDEPipeline
    DataSource = dsLancRubIndiv
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'LancRubIndiv'
    Left = 215
    Top = 48
  end
  object dsLancRubIndiv: TDataSource
    DataSet = CdsLancRubIndiv
    Left = 215
    Top = 96
  end
  object sqlLancRubIndiv: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' CONTATO_NOME,'
      '  '#39'123'#39' AS DDD,'
      '  '#39'12345678901234567890'#39' AS TELEFONE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      '  '#39'12345678901234567890'#39' AS BAIRRO,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS CIDADE,'
      '  '#39'123'#39' AS UF,'
      '  '#39'12345678'#39' AS CEP,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO_TOMADOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' NOME_TOMADOR,'
      '  0 AS FPAS,'
      '  '#39'NÃO'#39' AS SIMPLES,'
      '  0 AS CNAE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' EMPREGADO,'
      '  '#39'123456789012345678'#39' AS PIS,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  0 AS CATEGORIA,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      '  '#39'12'#39' AS CODIGO_MOV,'
      '  0 AS TIPO_AVISO,'
      '  '#39'1234567890'#39' AS DISSIDIO,'
      '  '#39'1234567890'#39' AS DATANASC,'
      '  '#39'123456789012345678'#39' AS CTPS_NUM,'
      '  '#39'123'#39' AS CTPS_UF,'
      '  '#39'1234567890'#39' AS DATAOPCAOFGTS,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS LOCAL_DATA,'
      '  0 AS REM_MES_ANT,'
      '  0 AS REM_MES_RES,'
      '  0 AS AVISO_PREVIO,'
      '  0 AS SALDO_RES,'
      '  0 AS SOMA25A28,'
      '  0 AS MULTA_RES,'
      '  0 AS REM_MES_ANT2,'
      '  0 AS REM_MES_RES2,'
      '  0 AS AVISO_PREVIO2,'
      '  0 AS TOTAL_REC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsLancRubIndiv
    Left = 215
    Top = 190
  end
  object CdsLancRubIndiv: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsLancRubIndivAfterScroll
    Left = 215
    Top = 144
  end
end
