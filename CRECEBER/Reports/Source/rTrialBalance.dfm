inherited RptTrialBalance: TRptTrialBalance
  Left = 597
  Top = 246
  Width = 324
  Height = 403
  Caption = 'RptTrialBalance'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Trial Balance'
    Params = <
      item
        Caption = ' Indique a Data Limite Para o Relatório '
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
        Caption = 'Incluir Adiantamentos no Relatório'
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
        Caption = ' Tipo de Cliente '
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  IDTIPOCLIENTE,'
          '  DESCRICAO'
          'FROM'
          '  TIPOCLIENTE'
          'ORDER BY'
          '  DESCRICAO')
        LookupSettings.Chave = 'IDTIPOCLIENTE'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '40'
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
    Formheight = 150
    FormWidth = 600
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptAgingtpcli
    LabelEmpresa = ppLabel45
    LabelSistema = ppLabel46
  end
  object DsAgingtpcli: TwwDataSource
    DataSet = CdsAgingtpcli
    Left = 76
    Top = 65
  end
  object PpAgingtpcli: TppBDEPipeline
    DataSource = DsAuxAgingtpcli
    CloseDataSource = True
    UserName = 'PpAgingtpcli'
    Left = 132
    Top = 65
  end
  object RptAgingtpcli: TppReport
    AutoStop = False
    DataPipeline = PpAgingtpcli
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 190
    Top = 65
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpAgingtpcli'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel45: TppLabel
        UserName = 'ppLabel45'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121444
        mmTop = 529
        mmWidth = 28046
        BandType = 0
      end
      object LblPosSaldos: TppLabel
        UserName = 'LblPosSaldos'
        Caption = 'Trial Balance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 122767
        mmTop = 6615
        mmWidth = 26194
        BandType = 0
      end
      object LblTipoCli: TppLabel
        UserName = 'LblTipoCli'
        Caption = 'TipoDeCliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 4763
        mmLeft = 122238
        mmTop = 12435
        mmWidth = 27252
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
      object RptAgingtpcliDBText1: TppDBText
        UserName = 'RptAgingtpcliDBText1'
        DataField = 'DOCUMENTO'
        DataPipeline = PpAgingtpcli
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 47890
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptAgingtpcliDBText2: TppDBText
        UserName = 'RptAgingtpcliDBText2'
        AutoSize = True
        DataField = 'COMPL'
        DataPipeline = PpAgingtpcli
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 66146
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object RptAgingtpcliDBText3: TppDBText
        UserName = 'RptAgingtpcliDBText3'
        AutoSize = True
        DataField = 'DTEMISSAO'
        DataPipeline = PpAgingtpcli
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 88106
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object RptAgingtpcliDBText4: TppDBText
        UserName = 'RptAgingtpcliDBText4'
        AutoSize = True
        DataField = 'DTVENCTO'
        DataPipeline = PpAgingtpcli
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 122238
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
      object RptAgingtpcliDBText5: TppDBText
        UserName = 'RptAgingtpcliDBText5'
        AutoSize = True
        DataField = 'DTPROG'
        DataPipeline = PpAgingtpcli
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 153459
        mmTop = 0
        mmWidth = 10583
        BandType = 4
      end
      object RptAgingtpcliDBText6: TppDBText
        UserName = 'RptAgingtpcliDBText6'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 193675
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object RptAgingtpcliLine2: TppLine
        UserName = 'RptAgingtpcliLine2'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 250296
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'ppLabel46'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object RptAgingLine1: TppLine
        UserName = 'RptAgingLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1058
        mmWidth = 272000
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 3175
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245005
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptAgingSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'ppLine25'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 272000
        BandType = 7
      end
      object LTOTAVENC: TppDBCalc
        UserName = 'LTOTAVENC'
        AutoSize = True
        DataField = 'AVENCER'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 46831
        mmTop = 1852
        mmWidth = 21167
        BandType = 7
      end
      object LTOT30: TppDBCalc
        UserName = 'LTOT30'
        AutoSize = True
        DataField = 'D30'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 77258
        mmTop = 1852
        mmWidth = 13758
        BandType = 7
      end
      object LTOT60: TppDBCalc
        UserName = 'LTOT60'
        AutoSize = True
        DataField = 'D60'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 102394
        mmTop = 1852
        mmWidth = 13758
        BandType = 7
      end
      object LTOT90: TppDBCalc
        UserName = 'LTOT90'
        AutoSize = True
        DataField = 'D90'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 127529
        mmTop = 1852
        mmWidth = 13758
        BandType = 7
      end
      object LTOT120: TppDBCalc
        UserName = 'LTOT120'
        AutoSize = True
        DataField = 'D120'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 151342
        mmTop = 1852
        mmWidth = 15081
        BandType = 7
      end
      object LTOT150: TppDBCalc
        UserName = 'LTOT150'
        AutoSize = True
        DataField = 'D150'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 176477
        mmTop = 1852
        mmWidth = 15081
        BandType = 7
      end
      object LTOT180: TppDBCalc
        UserName = 'LTOT180'
        AutoSize = True
        DataField = 'D180'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 201613
        mmTop = 1852
        mmWidth = 15081
        BandType = 7
      end
      object LTOTM180: TppDBCalc
        UserName = 'LTOTM180'
        AutoSize = True
        DataField = 'DM180'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 224896
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object LTOTGER: TppDBCalc
        UserName = 'LTOTGER'
        AutoSize = True
        DataField = 'DTOTFORN'
        DataPipeline = PpAgingtpcli
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingtpcli'
        mmHeight = 2910
        mmLeft = 248180
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
    end
    object RptAgingtpcliGroup2: TppGroup
      BreakName = 'RptAgingtpcliDBText8'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'RptAgingtpcliGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object RptAgingtpcliGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object RptAgingtpcliDBText8: TppDBText
          UserName = 'RptAgingtpcliDBText8'
          DataField = 'CODTPCLI'
          DataPipeline = PpAgingtpcli
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 4233
          mmTop = 6085
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliDBText9: TppDBText
          UserName = 'RptAgingtpcliDBText9'
          AutoSize = True
          DataField = 'TIPOCLIENTE'
          DataPipeline = PpAgingtpcli
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 22225
          mmTop = 265
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel7: TppLabel
          UserName = 'RptAgingtpcliLabel7'
          CharWrap = True
          Caption = 'Tipo de Cliente:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 265
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object RptAgingLine2: TppLine
          UserName = 'RptAgingLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 4233
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
        object RptAgingLine5: TppLine
          UserName = 'RptAgingLine5'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 78581
          mmTop = 6879
          mmWidth = 169334
          BandType = 3
          GroupNo = 0
        end
        object LblTotalForn: TppLabel
          UserName = 'LblTotalForn'
          Caption = 'Totais'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 262203
          mmTop = 10054
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object LblMais180: TppLabel
          UserName = 'LblMais180'
          Caption = '+ 180'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 235480
          mmTop = 10054
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object Lbl180: TppLabel
          UserName = 'Lbl180'
          Caption = '180'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 212196
          mmTop = 10054
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object Lbl150: TppLabel
          UserName = 'Lbl150'
          Caption = '150'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 187061
          mmTop = 10054
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object Lbl120: TppLabel
          UserName = 'Lbl120'
          Caption = '120'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 161925
          mmTop = 10054
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object Lbl90: TppLabel
          UserName = 'Lbl90'
          Caption = '90'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 137848
          mmTop = 10054
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object Lbl60: TppLabel
          UserName = 'Lbl60'
          Caption = '60'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 112713
          mmTop = 10054
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object Lbl30: TppLabel
          UserName = 'Lbl30'
          Caption = '30'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 87577
          mmTop = 10054
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object LblCliFor: TppLabel
          UserName = 'LblCliFor'
          Caption = 'Fornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 10054
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object RptAgingLabel1: TppLabel
          UserName = 'RptAgingLabel1'
          Caption = 'A Vencer'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 55563
          mmTop = 10054
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object RptAgingLabel2: TppLabel
          UserName = 'RptAgingLabel2'
          Caption = '  Vencidos  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          mmHeight = 2910
          mmLeft = 155311
          mmTop = 5292
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLine3: TppLine
          UserName = 'RptAgingtpcliLine3'
          Position = lpLeft
          Style = lsDouble
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 250296
          mmTop = 4498
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
      end
      object RptAgingtpcliGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object RptAgingtpcliLine4: TppLine
          UserName = 'RptAgingtpcliLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 3175
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc1: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc1'
          AutoSize = True
          DataField = 'AVENCER'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 46831
          mmTop = 4233
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc2: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc2'
          AutoSize = True
          DataField = 'D30'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 77258
          mmTop = 4233
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc3: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc3'
          AutoSize = True
          DataField = 'D60'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 102394
          mmTop = 4233
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc4: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc4'
          AutoSize = True
          DataField = 'D90'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 127529
          mmTop = 4233
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc5: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc5'
          AutoSize = True
          DataField = 'D120'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 151342
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc6: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc6'
          AutoSize = True
          DataField = 'D150'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 176477
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc7: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc7'
          AutoSize = True
          DataField = 'D180'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 201613
          mmTop = 4233
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc8: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc8'
          AutoSize = True
          DataField = 'DM180'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 224896
          mmTop = 4233
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliDBCalc9: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc9'
          AutoSize = True
          DataField = 'DTOTFORN'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 248180
          mmTop = 3969
          mmWidth = 23019
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliLabel8: TppLabel
          UserName = 'RptAgingtpcliLabel8'
          Caption = 'Total Tipo de Cliente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 265
          mmTop = 0
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object RptAgingtpcliLine5: TppLine
          UserName = 'RptAgingtpcliLine5'
          Position = lpLeft
          Style = lsDouble
          Weight = 0.75
          mmHeight = 3175
          mmLeft = 250296
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptAgingtpcliGroup1: TppGroup
      BreakName = 'RptAgingtpcliDBText7'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      UserName = 'RptAgingtpcliGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object RptAgingtpcliGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object LTOTFORN: TppDBText
          UserName = 'LTOTFORN'
          AutoSize = True
          DataField = 'DTOTFORN'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 257440
          mmTop = 1058
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object LM180: TppDBText
          UserName = 'LM180'
          AutoSize = True
          DataField = 'DM180'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 234950
          mmTop = 1058
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object L180: TppDBText
          UserName = 'L180'
          AutoSize = True
          DataField = 'D180'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 211403
          mmTop = 1058
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object L150: TppDBText
          UserName = 'L150'
          AutoSize = True
          DataField = 'D150'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 186267
          mmTop = 1058
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object L120: TppDBText
          UserName = 'L120'
          AutoSize = True
          DataField = 'D120'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 161132
          mmTop = 1058
          mmWidth = 5821
          BandType = 3
          GroupNo = 0
        end
        object L90: TppDBText
          UserName = 'L90'
          AutoSize = True
          DataField = 'D90'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 137054
          mmTop = 1058
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object L60: TppDBText
          UserName = 'L60'
          AutoSize = True
          DataField = 'D60'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 111919
          mmTop = 1323
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object L30: TppDBText
          UserName = 'L30'
          AutoSize = True
          DataField = 'D30'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 86784
          mmTop = 1058
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object LAVENC: TppDBText
          UserName = 'LAVENC'
          AutoSize = True
          DataField = 'AVENCER'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 56356
          mmTop = 1058
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLine1: TppLine
          UserName = 'RptAgingtpcliLine1'
          ParentHeight = True
          Position = lpLeft
          Style = lsDouble
          Weight = 0.75
          mmHeight = 8467
          mmLeft = 250296
          mmTop = 0
          mmWidth = 1588
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel1: TppLabel
          UserName = 'RptAgingtpcliLabel1'
          Caption = 'Documento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 49213
          mmTop = 5556
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel2: TppLabel
          UserName = 'RptAgingtpcliLabel2'
          Caption = 'Compl.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 66146
          mmTop = 5556
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel3: TppLabel
          UserName = 'RptAgingtpcliLabel3'
          Caption = 'Dt. Emissão'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 88106
          mmTop = 5556
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel4: TppLabel
          UserName = 'RptAgingtpcliLabel4'
          Caption = 'Dt. Vencto.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 121973
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel5: TppLabel
          UserName = 'RptAgingtpcliLabel5'
          Caption = 'Dt. Programada'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 153194
          mmTop = 5556
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliLabel6: TppLabel
          UserName = 'RptAgingtpcliLabel6'
          Caption = 'Saldo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 193411
          mmTop = 5556
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliDBText7: TppDBText
          UserName = 'RptAgingtpcliDBText7'
          DataField = 'CODFORN'
          DataPipeline = PpAgingtpcli
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 1852
          mmLeft = 5821
          mmTop = 5556
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object RptAgingtpcliDBText10: TppDBText
          UserName = 'RptAgingtpcliDBText10'
          DataField = 'FORNECEDOR'
          DataPipeline = PpAgingtpcli
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsUnderline]
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 1058
          mmWidth = 43127
          BandType = 3
          GroupNo = 1
        end
      end
      object RptAgingtpcliGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object RptAgingtpcliDBCalc10: TppDBCalc
          UserName = 'RptAgingtpcliDBCalc10'
          AutoSize = True
          DataField = 'SALDO'
          DataPipeline = PpAgingtpcli
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptAgingtpcliGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAgingtpcli'
          mmHeight = 2910
          mmLeft = 184415
          mmTop = 529
          mmWidth = 17727
          BandType = 5
          GroupNo = 1
        end
        object RptAgingtpcliLine6: TppLine
          UserName = 'RptAgingtpcliLine6'
          ParentHeight = True
          Position = lpLeft
          Style = lsDouble
          Weight = 0.75
          mmHeight = 3440
          mmLeft = 250296
          mmTop = 0
          mmWidth = 3440
          BandType = 5
          GroupNo = 1
        end
        object RptAgingtpcliLine7: TppLine
          UserName = 'RptAgingtpcliLine7'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 179123
          mmTop = 0
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object DsAuxAgingtpcli: TwwDataSource
    DataSet = CdsAuxAgingtpcli
    Left = 100
    Top = 113
  end
  object DSAuxAgingtpcliDOCS: TwwDataSource
    DataSet = CdsAuxAgingtpcliDOCS
    Left = 100
    Top = 151
  end
  object CdsAuxAgingtpcliDOCS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 152
  end
  object SqlAuxAgingtpcli: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '('#39'                                                              ' +
        '                           '#39') AS TIPOCLIENTE,    '
      
        '('#39'                                                              ' +
        '                           '#39') AS FORNECEDOR,'
      '(0) AS CODFORN,'
      '(0) AS CODTPCLI,'
      '(0) AS AVENCER,'
      '(0) AS D30,'
      '(0) AS D60,'
      '(0) AS D90,'
      '(0) AS D120,'
      '(0) AS D150,'
      '(0) AS D180,'
      '(0) AS DM180,'
      '(0) AS DTOTFORN ,'
      '(0) AS DOCUMENTO,'
      '('#39'   '#39' )         AS COMPL,'
      '('#39'          '#39' )  AS DTEMISSAO,'
      '('#39'          '#39' )  AS DTVENCTO,'
      '('#39'          '#39' )  AS DTPROG ,'
      '(0.00) AS SALDO FROM'
      ' DUAL'
      ''
      '')
    ClientDataSet = CdsAuxAgingtpcli
    Left = 40
    Top = 112
  end
  object CdsAuxAgingtpcli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 112
  end
  object SqlAuxAgingtpcliDOCS: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '(0) AS DOCUMENTO,'
      '('#39'   '#39' )         AS COMPL,'
      '('#39'          '#39' )  AS DTEMISSAO,'
      '('#39'          '#39' )  AS DTVENCTO,'
      '('#39'          '#39' )  AS DTPROG ,'
      '(0.00)           AS SALDO,'
      '(0) AS CODFORN,'
      '(0) AS CODTPCLI,'
      
        '('#39'                                                              ' +
        '                           '#39') AS TIPOCLIENTE,    '
      
        '('#39'                                                              ' +
        '                           '#39') AS FORNECEDOR'
      'FROM DUAL'
      '')
    ClientDataSet = CdsAuxAgingtpcliDOCS
    Left = 48
    Top = 152
  end
  object CdsAgingtpcli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 64
  end
  object SqlAgingtpcli: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   P.RAZAOSOCIAL,  DOCUMENTO.IDFORCLI, T.IDTIPOCLIENTE, T.DESCRI' +
        'CAO,'
      
        '   DOCUMENTO.CODDOCUMENTO, DOCUMENTO.NODOCUMENTO,DOCUMENTO.COMPL' +
        'DOCUMENTO,DOCUMENTO.DATAPROGRAMADA,DOCUMENTO.DATAEMISSAO,DOCUMEN' +
        'TO.DATAVENCTO,'
      
        '   DECODE(DOCUMENTO.OPERACAO,'#39'3 '#39',  S2.SALDOS2 *  SUM(DECODE(DOC' +
        'UMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALO' +
        'R*-1,LANCTODOCUM.VALOR),'
      
        '   DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODOCUM.V' +
        'ALOR*-1)))/S1.SALDOS1 ,'
      
        '   SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39 +
        ',LANCTODOCUM.VALOR*-1,'
      
        '   LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.' +
        'VALOR,LANCTODOCUM.VALOR*-1)))) AS SALDO'
      'FROM'
      
        '   DOCUMENTO, LANCTODOCUM, PESSOA P, TIPOCLIENTE T, CLIENTEPESS ' +
        'C,'
      '   (SELECT'
      
        '        D.NUMFATURA,  SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D' +
        #39',L.VALOR*-1,L.VALOR),'
      '        DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) AS SALDOS1'
      '    FROM'
      '        DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '        (L.ESTORNO IS NULL) AND   (L.VALOR <> 0) and'
      
        '        (RTRIM(D.OPERACAO) = '#39'1'#39') AND ((D.NUMFATURA IS NOT NULL)' +
        ' AND (D.NUMFATURA <> 0)) AND'
      '        (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '    GROUP BY'
      '         D.NUMFATURA'
      
        '    having SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-' +
        '1,L.VALOR),'
      '        DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) <> 0    ) S1,'
      '   (SELECT'
      
        '         D.NUMFATURA, SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D' +
        #39',L.VALOR*-1,L.VALOR),'
      '         DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) AS SALDOS2'
      '    FROM'
      '         DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '         (L.ESTORNO IS NULL) AND    '
      
        '         (L.DATALANCTO <= :PDATAFIM) AND (RTRIM(D.OPERACAO) = '#39'1' +
        #39') AND'
      
        '         ((D.NUMFATURA IS NOT NULL) AND (D.NUMFATURA <> 0)) AND ' +
        'D.CODDOCUMENTO = L.CODDOCUMENTO'
      '    GROUP BY'
      '         D.NUMFATURA) S2'
      'WHERE'
      '    (DOCUMENTO.IDPESSOA = :PIDPESSOA) AND'
      '    (LANCTODOCUM.ESTORNO IS NULL) AND'
      
        '    (((LANCTODOCUM.DATALANCTO <= :PDATAFIM) AND (LANCTODOCUM.OPE' +
        'RACAO <> '#39'3'#39')) OR (LANCTODOCUM.OPERACAO = '#39'3'#39')) AND'
      '    (DOCUMENTO.RECPAG =  :PRECPAG )  AND'
      
        '    (((RTRIM(DOCUMENTO.OPERACAO) = '#39'1'#39') AND DOCUMENTO.STATUS <> ' +
        #39'2'#39') OR RTRIM(DOCUMENTO.OPERACAO) IN ('#39'2'#39','#39'3'#39','#39'15'#39')) AND'
      '    (LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO) AND'
      '    (P.IDPESSOA = DOCUMENTO.IDFORCLI)  AND'
      '    (S1.NUMFATURA(+) = DOCUMENTO.NUMFATURA) AND'
      '    (S2.NUMFATURA(+) = DOCUMENTO.NUMFATURA) AND'
      '    (DOCUMENTO.IDFORCLI = C.IDPESSOA(+)) AND'
      '    (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+))'
      'GROUP BY'
      
        '    P.RAZAOSOCIAL,  DOCUMENTO.IDFORCLI,  DOCUMENTO.CODDOCUMENTO,' +
        '  DOCUMENTO.NODOCUMENTO, DOCUMENTO.COMPLDOCUMENTO,'
      
        '    T.IDTIPOCLIENTE, T.DESCRICAO,DOCUMENTO.DATAPROGRAMADA,DOCUME' +
        'NTO.DATAEMISSAO,'
      
        '    DOCUMENTO.DATAVENCTO, DOCUMENTO.OPERACAO, S1.SALDOS1, S2.SAL' +
        'DOS2'
      'HAVING'
      
        '    DECODE(DOCUMENTO.OPERACAO,'#39'3 '#39',  S2.SALDOS2 *  SUM(DECODE(DO' +
        'CUMENTO.RECPAG,'#39'P'#39','
      
        '    DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR*-1,LANCTODOC' +
        'UM.VALOR),'
      
        '    DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODOCUM.' +
        'VALOR*-1)))/S1.SALDOS1,'
      
        '    SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D' +
        #39',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),'
      
        '    DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODOCUM.' +
        'VALOR*-1)))) <> 0'
      'ORDER BY'
      
        '    T.DESCRICAO, T.IDTIPOCLIENTE, P.RAZAOSOCIAL, DOCUMENTO.IDFOR' +
        'CLI,DOCUMENTO.DATAPROGRAMADA'
      '')
    ClientDataSet = CdsAgingtpcli
    Left = 40
    Top = 64
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 48
    Top = 192
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 192
  end
end
