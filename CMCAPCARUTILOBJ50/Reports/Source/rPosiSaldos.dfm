inherited RptPosiSaldos: TRptPosiSaldos
  Left = 339
  Top = 85
  Width = 310
  Height = 276
  Caption = 'RptPosiSaldos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros Do Relatório Posição Dos Saldos'
    DataBaseName = 'BaseDados'
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
        Name = ' Indique a Data Limite Para o Relatório '
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 150
    FormWidth = 600
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptAging
    LabelEmpresa = LblEmpresa
    LabelSistema = NomeSistema
  end
  object PpAging: TppBDEPipeline
    DataSource = DsAging
    CloseDataSource = True
    UserName = 'PpAging'
    Left = 139
    Top = 77
  end
  object DsAging: TwwDataSource
    DataSet = CdsAging
    Left = 102
    Top = 74
  end
  object RptAging: TppReport
    AutoStop = False
    DataPipeline = PpAging
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
    BeforePrint = RptAgingBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 203
    Top = 77
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpAging'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
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
        mmLeft = 121444
        mmTop = 529
        mmWidth = 28046
        BandType = 0
      end
      object LblPosSaldos: TppLabel
        UserName = 'LblPosSaldos'
        Caption = 'Posição dos Saldos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 115359
        mmTop = 6615
        mmWidth = 40217
        BandType = 0
      end
      object LblCliFor: TppLabel
        UserName = 'LblCliFor'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 24871
        mmWidth = 15346
        BandType = 0
      end
      object RptAgingLabel1: TppLabel
        UserName = 'RptAgingLabel1'
        Caption = 'A Vencer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 24871
        mmWidth = 10583
        BandType = 0
      end
      object Lbl120: TppLabel
        UserName = 'Lbl120'
        Caption = '120'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163248
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object Lbl30: TppLabel
        UserName = 'Lbl30'
        Caption = '30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object Lbl60: TppLabel
        UserName = 'Lbl60'
        Caption = '60'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object Lbl90: TppLabel
        UserName = 'Lbl90'
        Caption = '90'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object Lbl150: TppLabel
        UserName = 'Lbl150'
        Caption = '150'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 188384
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object Lbl180: TppLabel
        UserName = 'Lbl180'
        Caption = '180'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 213519
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object LblMais180: TppLabel
        UserName = 'LblMais180'
        Caption = '+ 180'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 238919
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object LblTotalForn: TppLabel
        UserName = 'LblTotalForn'
        Caption = 'Totais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 262203
        mmTop = 24871
        mmWidth = 8996
        BandType = 0
      end
      object RptAgingLine2: TppLine
        UserName = 'RptAgingLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 18785
        mmWidth = 272000
        BandType = 0
      end
      object RptAgingLine3: TppLine
        UserName = 'RptAgingLine3'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 11377
        mmLeft = 250296
        mmTop = 18785
        mmWidth = 1588
        BandType = 0
      end
      object RptAgingLine5: TppLine
        UserName = 'RptAgingLine5'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 78581
        mmTop = 21696
        mmWidth = 169334
        BandType = 0
      end
      object RptAgingLabel2: TppLabel
        UserName = 'RptAgingLabel2'
        Caption = '  Vencidos  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3704
        mmLeft = 78317
        mmTop = 20108
        mmWidth = 169863
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
        mmLeft = 123561
        mmTop = 12435
        mmWidth = 27252
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptAgingLine4: TppLine
        UserName = 'RptAgingLine4'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 3704
        mmLeft = 250296
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object RptAgingDBText1: TppDBText
        UserName = 'RptAgingDBText1'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpAging
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 50536
        BandType = 4
      end
      object LAVENC: TppDBText
        UserName = 'LAVENC'
        AutoSize = True
        DataField = 'SALDOAV'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 52123
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object L30: TppDBText
        UserName = 'L30'
        AutoSize = True
        DataField = 'SALDO30'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 78581
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object L90: TppDBText
        UserName = 'L90'
        AutoSize = True
        DataField = 'SALDO90'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object L60: TppDBText
        UserName = 'L60'
        AutoSize = True
        DataField = 'SALDO60'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object L120: TppDBText
        UserName = 'L120'
        AutoSize = True
        DataField = 'SALDO120'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object LM180: TppDBText
        UserName = 'LM180'
        AutoSize = True
        DataField = 'SALDOM180'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 225690
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object L180: TppDBText
        UserName = 'L180'
        AutoSize = True
        DataField = 'SALDO180'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 202671
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object LTOTFORN: TppDBText
        UserName = 'LTOTFORN'
        AutoSize = True
        DataField = 'SALDOTOT'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 255853
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object L150: TppDBText
        UserName = 'L150'
        AutoSize = True
        DataField = 'SALDO150'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 177536
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object NomeSistema: TppLabel
        UserName = 'NomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 25665
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
        DataField = 'SALDOAV'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 1852
        mmWidth = 23813
        BandType = 7
      end
      object LTOT30: TppDBCalc
        UserName = 'LTOT30'
        AutoSize = True
        DataField = 'SALDO30'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 67998
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
      object LTOT60: TppDBCalc
        UserName = 'LTOT60'
        AutoSize = True
        DataField = 'SALDO60'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 93134
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
      object LTOT90: TppDBCalc
        UserName = 'LTOT90'
        AutoSize = True
        DataField = 'SALDO90'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
      object LTOT120: TppDBCalc
        UserName = 'LTOT120'
        AutoSize = True
        DataField = 'SALDO120'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 1852
        mmWidth = 24606
        BandType = 7
      end
      object LTOT150: TppDBCalc
        UserName = 'LTOT150'
        AutoSize = True
        DataField = 'SALDO150'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 1852
        mmWidth = 24606
        BandType = 7
      end
      object LTOT180: TppDBCalc
        UserName = 'LTOT180'
        AutoSize = True
        DataField = 'SALDO180'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 1852
        mmWidth = 24606
        BandType = 7
      end
      object LTOTM180: TppDBCalc
        UserName = 'LTOTM180'
        AutoSize = True
        DataField = 'SALDOM180'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 215107
        mmTop = 1852
        mmWidth = 26988
        BandType = 7
      end
      object LTOTGER: TppDBCalc
        UserName = 'LTOTGER'
        AutoSize = True
        DataField = 'SALDOTOT'
        DataPipeline = PpAging
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAging'
        mmHeight = 3175
        mmLeft = 245534
        mmTop = 1852
        mmWidth = 25665
        BandType = 7
      end
    end
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT DD30, DD60, DD90, DD120, DD150, DD180 '
      'FROM PARAMCAP '
      'WHERE RECPAG = :RECPAG  AND '
      '           IDPESSOA = :IDPESSOA')
    ClientDataSet = CdsAux
    Left = 96
    Top = 200
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 200
  end
  object CdsAging: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 72
  end
  object SqlAging: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,U.SALDO,0)) AS SALDOAV,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD30),1,U.SALDO,0))) AS SALDO30,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD30),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD60),1,U.SALDO,0)))) AS SALDO60,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD30),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD60),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD90),1,U.SALDO,0))))) AS SALDO90,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD30),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD60),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD90),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD120),1,U.SALDO,0)))))) AS SALDO120,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD30),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD60),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD90),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD120),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD150),1,U.SALDO,0))))))) AS SALDO150,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD30),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD60),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD90),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD120),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD150),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD180),1,U.SALDO,0)))))))) AS SALDO180,'
      
        '       SUM(DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')),1,0,'
      
        '           DECODE(SIGN(D.DATAPROGRAMADA-TO_DATE(:DATAREF,'#39'DD/MM/' +
        'YYYY'#39')+P.DD180),1,0,U.SALDO))) AS SALDOM180,'
      '       SUM(U.SALDO) AS SALDOTOT,'
      '       PE.RAZAOSOCIAL, D.IDFORCLI'
      'FROM'
      '('
      '(SELECT D.CODDOCUMENTO,'
      
        '        SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRA' +
        'MOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOED' +
        'A,L.VALOROUTRAMOEDA*-1))) AS SALDOOM,'
      
        '        SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VA' +
        'LOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDO'
      'FROM DOCUMENTO D,'
      '     LANCTODOCUM L'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (D.RECPAG = :RECPAG)'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (L.DATALANCTO <= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '  AND ((D.OPERACAO = '#39'2 '#39') OR'
      '       (D.OPERACAO = '#39'15'#39') OR'
      '       ((D.OPERACAO = '#39'1 '#39') AND (D.NUMFATURA IS NULL ) ) )'
      ' GROUP BY'
      '        D.CODDOCUMENTO'
      
        ' HAVING (ROUND(SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))),2) <> 0' +
        ')'
      ' )'
      ' UNION ALL'
      ' ('
      ' SELECT D.CODDOCUMENTO,'
      
        '        (SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTR' +
        'AMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOE' +
        'DA,L.VALOROUTRAMOEDA*-1))))*S1.SALDOOM1/S3.SALDOOM3 AS SALDOOM,'
      
        '        (SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.V' +
        'ALOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))))*S1.SALDO1/S3' +
        '.SALDO3 AS SALDO'
      ' FROM DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      (SELECT D.NUMFATURA,'
      
        '              SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALO' +
        'ROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUT' +
        'RAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM1,'
      
        '              SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALO' +
        'R,L.VALOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDO' +
        '1'
      '       FROM DOCUMENTO D,'
      '            LANCTODOCUM L'
      '       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '         AND (D.OPERACAO = '#39'1 '#39')'
      '         AND (D.RECPAG = :RECPAG)'
      '         AND (D.IDPESSOA = :IDPESSOA)'
      '         AND (L.DATALANCTO <= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '         AND (D.NUMFATURA IS NOT NULL)'
      '       GROUP BY D.NUMFATURA) S1,'
      '      (SELECT D.NUMFATURA,'
      
        '              SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALO' +
        'ROUTRAMOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUT' +
        'RAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM3,'
      
        '              SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALO' +
        'R,L.VALOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDO' +
        '3'
      '       FROM DOCUMENTO D,'
      '            LANCTODOCUM L'
      '       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '         AND (D.OPERACAO = L.OPERACAO)'
      '         AND (D.OPERACAO = '#39'3 '#39')'
      '         AND (D.RECPAG = :RECPAG)'
      '         AND (D.IDPESSOA = :IDPESSOA)'
      '         AND (D.NUMFATURA IS NOT NULL)'
      '       GROUP BY D.NUMFATURA) S3'
      ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '   AND (D.OPERACAO = L.OPERACAO)'
      '   AND (D.NUMFATURA = S1.NUMFATURA)'
      '   AND (D.NUMFATURA = S3.NUMFATURA)'
      '   AND (D.RECPAG = :RECPAG)'
      '   AND (D.IDPESSOA = :IDPESSOA)'
      '   AND (D.OPERACAO ='#39'3 '#39')'
      ' GROUP BY'
      '        D.CODDOCUMENTO,'
      '        S1.SALDOOM1,'
      '        S3.SALDOOM3,'
      '        S1.SALDO1,'
      '        S3.SALDO3'
      
        ' HAVING (ROUND((SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VA' +
        'LOR,L.VALOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))))*S1.SA' +
        'LDO1/S3.SALDO3,2) <> 0)'
      '        )'
      ' UNION ALL'
      ' ('
      ' SELECT D.CODDOCUMENTO,'
      
        '        SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRA' +
        'MOEDA,L.VALOROUTRAMOEDA*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOED' +
        'A,L.VALOROUTRAMOEDA*-1))) AS SALDOOM,'
      
        '        SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VA' +
        'LOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))) AS SALDO'
      ' FROM DOCUMENTO D,'
      '      LANCTODOCUM L'
      ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '   AND (D.RECPAG = :RECPAG)'
      '   AND (D.IDPESSOA = :IDPESSOA)'
      '   AND (L.DATALANCTO <= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '   AND (D.OPERACAO ='#39'3 '#39')'
      '   AND (L.OPERACAO <> '#39'3 '#39')'
      ' GROUP BY'
      '        D.CODDOCUMENTO'
      
        ' HAVING (ROUND(SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VAL' +
        'OR,L.VALOR*-1),DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1))),2) <> 0' +
        ')'
      '  )'
      ' ) U,'
      '   DOCUMENTO D,'
      '   PESSOA PE,'
      '   PARAMCAP P'
      'WHERE (U.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (D.RECPAG = P.RECPAG)'
      '  AND (D.IDPESSOA = P.IDPESSOA)'
      '  AND (D.RECPAG = :RECPAG)'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (D.IDFORCLI = PE.IDPESSOA)'
      'GROUP BY PE.RAZAOSOCIAL, D.IDFORCLI'
      'ORDER BY PE.RAZAOSOCIAL'
      '')
    ClientDataSet = CdsAging
    Left = 24
    Top = 72
  end
  object SqlTitulo: TCMSqlParams
    ClientDataSet = CdsTitulo
    Left = 136
    Top = 136
  end
  object CdsTitulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 136
  end
end
