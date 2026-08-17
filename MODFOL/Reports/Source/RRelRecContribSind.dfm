inherited RptRelRecContribSind: TRptRelRecContribSind
  Left = 237
  Top = 192
  Width = 313
  Height = 270
  Caption = 'RptRelRecContribSind'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
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
        Caption = 'ListaIdSindicato'
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
        Name = 'ListaIdSindicato'
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
        Caption = 'ListaIdRubrica1'
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
        Name = 'ListaIdRubrica1'
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
        Caption = 'ListaIdRubrica2'
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
        Name = 'ListaIdRubrica2'
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
        Caption = 'TipoPagamento'
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
        Name = 'TipoPagamento'
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
    Report = rpRelRecContribSind
    ConnectionType = cntBDE
  end
  object rpRelRecContribSind: TppReport
    AutoStop = False
    DataPipeline = ppRelRecContribSind
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação do Recolhimento da Contribuição Sindical'
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
    Left = 227
    Version = '5.5'
    mmColumnWidth = 197300
    object rpRelRecContribSindHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object rpRelRecContribSindLbl2: TppLabel
        UserName = 'rpFolhaEmprRubLbl4'
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
        mmLeft = 152665
        mmTop = 7673
        mmWidth = 15875
        BandType = 0
      end
      object rpRelRecContribSindLbl3: TppLabel
        UserName = 'rpFolhaEmprRubLbl5'
        AutoSize = False
        Caption = 'Mês de Ref:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 11642
        mmWidth = 19579
        BandType = 0
      end
      object rpRelRecContribSindLbl1: TppLabel
        UserName = 'rpFolhaEmprRubLbl3'
        AutoSize = False
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155840
        mmTop = 3704
        mmWidth = 12700
        BandType = 0
      end
      object rpRelRecContribSindDBTxt1: TppDBText
        UserName = 'rpRelRecContribSindDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppRelRecContribSind
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 2646
        mmWidth = 123031
        BandType = 0
      end
      object rpRelRecContribSindDBTxt2: TppDBText
        UserName = 'rpRelRecContribSindDBTxt2'
        DataField = 'CNPJ'
        DataPipeline = ppRelRecContribSind
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 7673
        mmWidth = 123031
        BandType = 0
      end
      object rpRelRecContribSindDBTxt3: TppDBText
        UserName = 'rpRelRecContribSindDBTxt3'
        DataField = 'ENDERECO'
        DataPipeline = ppRelRecContribSind
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 12435
        mmWidth = 123031
        BandType = 0
      end
      object rpRelRecContribSindDBTxt4: TppDBText
        UserName = 'rpRelRecContribSindDBTxt4'
        DataField = 'MES_REF'
        DataPipeline = ppRelRecContribSind
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 11642
        mmWidth = 23813
        BandType = 0
      end
      object rpRelRecContribSindSysVar1: TppSystemVariable
        UserName = 'rpRelRecContribSindSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 3704
        mmWidth = 13758
        BandType = 0
      end
      object rpRelRecContribSindSysVar2: TppSystemVariable
        UserName = 'rpRelRecContribSindSysVar2'
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
        mmLeft = 169598
        mmTop = 7673
        mmWidth = 23813
        BandType = 0
      end
      object rpRelRecContribSindLbl4: TppLabel
        UserName = 'rpRelRecContribSindLbl4'
        Caption = 'RELAÇÃO DO RECOLHIMENTO DA CONTRIBUIÇÃO SINDICAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 47625
        mmTop = 19579
        mmWidth = 106098
        BandType = 0
      end
    end
    object rpRelRecContribSindDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpRelRecContribSindDBTxt6: TppDBText
        UserName = 'rpRelRecContribSindDBTxt6'
        DataField = 'EMPREGADO'
        DataPipeline = ppRelRecContribSind
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 529
        mmWidth = 86254
        BandType = 4
      end
      object rpRelRecContribSindDBTxt8: TppDBText
        UserName = 'rpRelRecContribSindDBTxt8'
        DataField = 'REMUNERACAO'
        DataPipeline = ppRelRecContribSind
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 145257
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object rpRelRecContribSindDBTxt9: TppDBText
        UserName = 'rpRelRecContribSindDBTxt9'
        DataField = 'CONTRIBUICAO'
        DataPipeline = ppRelRecContribSind
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
      object rpRelRecContribSindDBTxt7: TppDBText
        UserName = 'rpRelRecContribSindDBTxt7'
        DataField = 'CARGO'
        DataPipeline = ppRelRecContribSind
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 95515
        mmTop = 529
        mmWidth = 48419
        BandType = 4
      end
    end
    object rpRelRecContribSindFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2381
      mmPrintPosition = 0
    end
    object rpRelRecContribSindSmryBnd: TppSummaryBand
      AfterPrint = rpRelRecContribSindSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
    object rpRelRecContribSindGrp1: TppGroup
      BreakName = 'SINDICATO'
      DataPipeline = ppRelRecContribSind
      UserName = 'rpRelRecContribSindGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRecContribSindGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpRelRecContribSindDBTxt5: TppDBText
          UserName = 'rpRelRecContribSindDBTxt5'
          DataField = 'SINDICATO'
          DataPipeline = ppRelRecContribSind
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 3175
          mmWidth = 123825
          BandType = 3
          GroupNo = 0
        end
        object rpRelRecContribSindLine1: TppLine
          UserName = 'rpRelRecContribSindLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 7938
          mmTop = 2117
          mmWidth = 185209
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRelRecContribSindGrpFooTBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpRelRecContribSindLbl9: TppLabel
          UserName = 'rpRelRecContribSindLbl9'
          AutoSize = False
          Caption = 'QUANTIDADE DE FUNCIONÁRIOS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 1323
          mmWidth = 47096
          BandType = 5
          GroupNo = 0
        end
        object rpRelRecContribSindDBCalc1: TppDBCalc
          UserName = 'rpRelRecContribSindDBCalc1'
          DataField = 'EMPREGADO'
          DataPipeline = ppRelRecContribSind
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 55827
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpRelRecContribSindLbl10: TppLabel
          UserName = 'rpRelRecContribSindLbl10'
          AutoSize = False
          Caption = 'TOTAL:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpRelRecContribSindDBCalc2: TppDBCalc
          UserName = 'rpRelRecContribSindDBCalc2'
          DataField = 'CONTRIBUICAO'
          DataPipeline = ppRelRecContribSind
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169863
          mmTop = 1323
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object rpRelRecContribSindLine3: TppLine
          UserName = 'rpRelRecContribSindLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 7938
          mmTop = 0
          mmWidth = 185209
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpRelRecContribSindGrp2: TppGroup
      BreakName = 'SINDICATO'
      DataPipeline = ppRelRecContribSind
      UserName = 'rpRelRecContribSindGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelRecContribSindGrpHdrBnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpRelRecContribSindLine2: TppLine
          UserName = 'rpRelRecContribSindLine2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 7938
          mmTop = 4762
          mmWidth = 185209
          BandType = 3
          GroupNo = 0
        end
        object rpRelRecContribSindLbl5: TppLabel
          UserName = 'rpRelRecContribSindLbl5'
          AutoSize = False
          Caption = 'NOME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7938
          mmTop = 1323
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object rpRelRecContribSindLbl8: TppLabel
          UserName = 'rpRelRecContribSindLbl8'
          AutoSize = False
          Caption = 'CONTRIBUIÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 169863
          mmTop = 1323
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object rpRelRecContribSindLbl6: TppLabel
          UserName = 'rpRelRecContribSindLbl6'
          AutoSize = False
          Caption = 'CARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 95515
          mmTop = 1323
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
        object rpRelRecContribSindLbl7: TppLabel
          UserName = 'rpRelRecContribSindLbl7'
          AutoSize = False
          Caption = 'REMUNERAÇÃO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 145257
          mmTop = 1323
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRelRecContribSindGrpFootBnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppRelRecContribSind: TppBDEPipeline
    DataSource = dsRelRecContribSind
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppRelRecContribSind'
    Left = 227
    Top = 48
  end
  object dsRelRecContribSind: TDataSource
    DataSet = CdsRelRecContribSind
    Left = 227
    Top = 96
  end
  object sqlRelRecContribSind: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  0 AS PAGINA,'
      '  '#39'12345678901234567'#39' AS FOLHA,'
      '  '#39'12345678901234567890'#39' AS MES_REF,'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      '  '#39'123456789012345678901234567890'#39' AS C_CUSTO,'
      '  '#39'12345678901234567890123456789012345678901234567890'#39' AS CARGO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS CGC,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      '  /* 1º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA1,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA1,'
      '  '#39'1234567890'#39' AS REFERENCIA1,'
      '  0 AS PROVENTO1,'
      '  0 AS DESCONTO1,'
      '  /* 2º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA2,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA2,'
      '  '#39'1234567890'#39' AS REFERENCIA2,'
      '  0 AS PROVENTO2,'
      '  0 AS DESCONTO2,'
      '  /* 3º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA3,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA3,'
      '  '#39'1234567890'#39' AS REFERENCIA3,'
      '  0 AS PROVENTO3,'
      '  0 AS DESCONTO3,'
      '  /* 4º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA4,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA4,'
      '  '#39'1234567890'#39' AS REFERENCIA4,'
      '  0 AS PROVENTO4,'
      '  0 AS DESCONTO4,'
      '  /* 5º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA5,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA5,'
      '  '#39'1234567890'#39' AS REFERENCIA5,'
      '  0 AS PROVENTO5,'
      '  0 AS DESCONTO5,'
      '  /* 6º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA6,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA6,'
      '  '#39'1234567890'#39' AS REFERENCIA6,'
      '  0 AS PROVENTO6,'
      '  0 AS DESCONTO6,'
      '  /* 7º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA7,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA7,'
      '  '#39'1234567890'#39' AS REFERENCIA7,'
      '  0 AS PROVENTO7,'
      '  0 AS DESCONTO7,'
      '  /* 8º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA8,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA8,'
      '  '#39'1234567890'#39' AS REFERENCIA8,'
      '  0 AS PROVENTO8,'
      '  0 AS DESCONTO8,'
      '  /* 9º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA9,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA9,'
      '  '#39'1234567890'#39' AS REFERENCIA9,'
      '  0 AS PROVENTO9,'
      '  0 AS DESCONTO9,'
      '  /* 10º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA10,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA10,'
      '  '#39'1234567890'#39' AS REFERENCIA10,'
      '  0 AS PROVENTO10,'
      '  0 AS DESCONTO10,'
      '  /* 11º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA11,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA11,'
      '  '#39'1234567890'#39' AS REFERENCIA11,'
      '  0 AS PROVENTO11,'
      '  0 AS DESCONTO11,'
      '  /* 12º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA12,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA12,'
      '  '#39'1234567890'#39' AS REFERENCIA12,'
      '  0 AS PROVENTO12,'
      '  0 AS DESCONTO12,'
      '  /* 13º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA13,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA13,'
      '  '#39'1234567890'#39' AS REFERENCIA13,'
      '  0 AS PROVENTO13,'
      '  0 AS DESCONTO13,'
      '  /* 14º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA14,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA14,'
      '  '#39'1234567890'#39' AS REFERENCIA14,'
      '  0 AS PROVENTO14,'
      '  0 AS DESCONTO14,'
      '  /* 15º LINHA */'
      '  '#39'1234567890'#39' AS CODRUBRICA15,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS RUBRICA15,'
      '  '#39'1234567890'#39' AS REFERENCIA15,'
      '  0 AS PROVENTO15,'
      '  0 AS DESCONTO15,'
      '  /* OUTROS DADOS */'
      '  0 AS SALBASE,'
      '  0 AS BASEINSS,'
      '  0 AS BASEFGTS,'
      '  0 AS FGTSMES,'
      '  0 AS BASEIRRF,'
      '  0 AS TOT_PROVENTOS,'
      '  0 AS TOT_DESCONTOS,'
      '  '#39'12345678901234567890'#39' AS TOT_GERAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsRelRecContribSind
    Left = 227
    Top = 190
  end
  object CdsRelRecContribSind: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsRelRecContribSindAfterScroll
    Left = 227
    Top = 144
  end
end
