inherited RptPresencaCasa: TRptPresencaCasa
  Left = 238
  Top = 195
  Width = 277
  Height = 268
  Caption = 'RptPresencaCasa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaCodEstacao'
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
        Name = 'ListaCodEstacao'
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
        Caption = 'ListaIdFunc'
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
        Name = 'ListaIdFunc'
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
        Caption = 'Sequencia'
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
        Name = 'Sequencia'
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
        Caption = 'DataInicial'
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
        Caption = 'DataFinal'
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
        Caption = 'Opcao'
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
        Name = 'Opcao'
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
  object rpPresencaCasa: TppReport [2]
    AutoStop = False
    DataPipeline = ppPresencaCasa
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
    Left = 210
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPresencaCasa'
    object rpOcorrPessHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'rpOcorrPessLbl1'
        Caption = 'Relatório de Presenças na Casa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 115200
        mmTop = 9790
        mmWidth = 53763
        BandType = 0
      end
      object rpOcorrPessLbl2: TppLabel
        UserName = 'rpOcorrPessLbl2'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpOcorrPessLbl3: TppLabel
        UserName = 'rpOcorrPessLbl3'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236538
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppPresencaCasa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 4191
        mmLeft = 133578
        mmTop = 2381
        mmWidth = 17272
        BandType = 0
      end
      object rpOcorrPessSysVar1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 252678
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessSysVar2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 252678
        mmTop = 10319
        mmWidth = 23283
        BandType = 0
      end
      object rpOcorrPessLbl4: TppLabel
        UserName = 'rpOcorrPessLbl4'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 18521
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessLblDATAINI: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 18521
        mmWidth = 23019
        BandType = 0
      end
      object rpOcorrPessLbl5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 146844
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object rpOcorrPessLblDATAFINAL: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 18521
        mmWidth = 23019
        BandType = 0
      end
      object ppLblAgora: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Agora -->'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 218017
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpOcorrPessLbl6: TppLabel
        UserName = 'rpTabCIDLbl4'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 25400
        mmWidth = 15875
        BandType = 0
      end
      object rpOcorrPessLbl7: TppLabel
        UserName = 'rpTabCIDLbl5'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 25400
        mmWidth = 78846
        BandType = 0
      end
      object rpOcorrPessLbl8: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Cargo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 25400
        mmWidth = 56621
        BandType = 0
      end
      object rpOcorrPessLbl9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Estação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 25400
        mmWidth = 28840
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'rpOcorrPessLbl101'
        AutoSize = False
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 191030
        mmTop = 25400
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Saída Interv.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 213519
        mmTop = 25400
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Retorno Interv.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 25400
        mmWidth = 22754
        BandType = 0
      end
      object rpOcorrPessLbl10: TppLabel
        UserName = 'rpOcorrPessLbl10'
        AutoSize = False
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 262203
        mmTop = 25400
        mmWidth = 17727
        BandType = 0
      end
    end
    object rpOcorrPessDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpOcorrPessDBTxt3: TppDBText
        UserName = 'rpOcorrPessDBTxt3'
        DataField = 'MATRICULA'
        DataPipeline = ppPresencaCasa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpOcorrPessDBTxt4: TppDBText
        UserName = 'rpOcorrPessDBTxt4'
        DataField = 'EMPREGADO'
        DataPipeline = ppPresencaCasa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 0
        mmWidth = 78846
        BandType = 4
      end
      object rpOcorrPessDBTxt5: TppDBText
        UserName = 'rpOcorrPessDBTxt5'
        DataField = 'CARGO'
        DataPipeline = ppPresencaCasa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 0
        mmWidth = 56621
        BandType = 4
      end
      object rpOcorrPessDBTxt6: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'DESCRICAO'
        DataPipeline = ppPresencaCasa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ENTRADA'
        DataPipeline = ppPresencaCasa
        DisplayFormat = 'DD/MM/YYYY HH:NN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 189177
        mmTop = 0
        mmWidth = 22500
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SAIDAINTERVALO'
        DataPipeline = ppPresencaCasa
        DisplayFormat = 'DD/MM/YYYY HH:NN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 0
        mmWidth = 22500
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'RETORNOINTERVALO'
        DataPipeline = ppPresencaCasa
        DisplayFormat = 'DD/MM/YYYY HH:NN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 236538
        mmTop = 0
        mmWidth = 22500
        BandType = 4
      end
      object rpOcorrPessDBTxt7: TppDBText
        UserName = 'DBText7'
        DataField = 'SAIDA'
        DataPipeline = ppPresencaCasa
        DisplayFormat = 'DD/MM/YYYY HH:NN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 260351
        mmTop = 0
        mmWidth = 22500
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpOcorrPessSmryBnd: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 2117
        mmTop = 3704
        mmWidth = 70379
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Total Geral de Presenças:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 5556
        mmWidth = 56092
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'EMPREGADO'
        DataPipeline = ppPresencaCasa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppPresencaCasa'
        mmHeight = 3704
        mmLeft = 61913
        mmTop = 5556
        mmWidth = 10054
        BandType = 7
      end
    end
    object rpOcorrPessGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppPresencaCasa
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpOcorrPessGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPresencaCasa'
      object rpOcorrPessGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpOcorrPessGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpOcorrPessLbl14: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Presenças no Estabelecimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 4763
          mmWidth = 59002
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'EMPREGADO'
          DataPipeline = ppPresencaCasa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOcorrPessGrp1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppPresencaCasa'
          mmHeight = 3704
          mmLeft = 61913
          mmTop = 4763
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2117
          mmTop = 2910
          mmWidth = 70379
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpOcorrPessGrp2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppPresencaCasa
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPresencaCasa'
      object rpOcorrPessGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOME'
          DataPipeline = ppPresencaCasa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppPresencaCasa'
          mmHeight = 4149
          mmLeft = 1058
          mmTop = 1323
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 1058
          mmTop = 0
          mmWidth = 281000
          BandType = 3
          GroupNo = 1
        end
      end
      object rpOcorrPessGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 2117
          mmTop = 529
          mmWidth = 70379
          BandType = 5
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Total de Presenças no Setor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 2381
          mmWidth = 42863
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'EMPREGADO'
          DataPipeline = ppPresencaCasa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpOcorrPessGrp2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppPresencaCasa'
          mmHeight = 3704
          mmLeft = 61913
          mmTop = 2381
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppPresencaCasa: TppBDEPipeline [3]
    DataSource = dsPresencaCasa
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'PresencaCasa'
    Left = 210
    Top = 48
  end
  object dsPresencaCasa: TwwDataSource [4]
    DataSet = CdsPresencaCasa
    Left = 210
    Top = 96
  end
  object sqlPresencaCasa: TCMSqlParams [5]
    SQL.Strings = (
      'SELECT'
      '  0 AS IDPESSOA,'
      '  RPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS NOME,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS EMPREGADO,'
      '  RPAD('#39'1'#39',40,'#39'1'#39') AS CARGO,'
      '  RPAD('#39'1'#39',30,'#39'1'#39')  AS ENTRADA,'
      '  RPAD('#39'1'#39',30,'#39'1'#39')  AS SAIDAINTERVALO,'
      '  RPAD('#39'1'#39',30,'#39'1'#39')  AS RETORNOINTERVALO,'
      '  RPAD('#39'1'#39',30,'#39'1'#39')  AS SAIDA,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS DESCRICAO,'
      '  RPAD('#39'1'#39',60,'#39'1'#39') AS EMPRESA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsPresencaCasa
    Left = 210
    Top = 192
  end
  object CdsPresencaCasa: TCMClientDataSet [6]
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CONTA1'
        DataType = ftFloat
      end
      item
        Name = 'CONTA2'
        DataType = ftFloat
      end
      item
        Name = 'CONTA3'
        DataType = ftFloat
      end
      item
        Name = 'CONTA4'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'MATRICULA'
        DataType = ftString
        Size = 13
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'CARGO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ENTRADA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SAIDAINTERVALO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RETORNOINTERVALO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'SAIDA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'INDPASSAGEM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'EMPRESA'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'TITULO4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMEMPREGADO'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsAcessoPessoaIndex1'
        CaseInsFields = 'NOME'
        Fields = 'NOME;ENTRADA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsAcessoPessoaIndex1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsPresencaCasaAfterScroll
    Left = 210
    Top = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpPresencaCasa
  end
end
