inherited RptAgingListCliente: TRptAgingListCliente
  Height = 195
  Caption = 'RptAgingListCliente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Posição dos Saldos'
    Params = <
      item
        Caption = 'Indique a Data Limite'
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
      end>
    Formheight = 100
    FormWidth = 340
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptAginTipoCli
    LabelEmpresa = ppLabel16
    LabelSistema = ppLabel47
  end
  object PpAgingTipoCli: TppBDEPipeline
    DataSource = DsAgingTipoCli
    CloseDataSource = True
    UserName = 'PpAgingTipoCli'
    Left = 139
    Top = 57
  end
  object DsAgingTipoCli: TwwDataSource
    DataSet = CdsAgingTipoCli
    Left = 86
    Top = 57
  end
  object RptAginTipoCli: TppReport
    AutoStop = False
    DataPipeline = PpAgingTipoCli
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
    Left = 195
    Top = 57
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpAgingTipoCli'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 121179
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object LblPosSaldosTipo: TppLabel
        UserName = 'LblPosSaldosTipo'
        Caption = 'Posição dos Saldos Por Tipo de Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 96044
        mmTop = 8996
        mmWidth = 79640
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'ppLabel36'
        Caption = 'Tipo de Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 24871
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        Caption = 'A Vencer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 24871
        mmWidth = 11906
        BandType = 0
      end
      object Lblt120: TppLabel
        UserName = 'Lblt120'
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
      object Lblt30: TppLabel
        UserName = 'Lblt30'
        Caption = '30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 87842
        mmTop = 24871
        mmWidth = 3175
        BandType = 0
      end
      object Lblt60: TppLabel
        UserName = 'Lblt60'
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
      object Lblt90: TppLabel
        UserName = 'Lblt90'
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
      object Lblt150: TppLabel
        UserName = 'Lblt150'
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
      object Lblt180: TppLabel
        UserName = 'Lblt180'
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
      object Lbltm180: TppLabel
        UserName = 'Lbltm180'
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
      object ppLabel45: TppLabel
        UserName = 'ppLabel45'
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
      object ppLine26: TppLine
        UserName = 'ppLine26'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 17727
        mmWidth = 284300
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.75
        mmHeight = 11377
        mmLeft = 250296
        mmTop = 17992
        mmWidth = 1588
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 78581
        mmTop = 21696
        mmWidth = 169334
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'ppLabel46'
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
    end
    object ppDetailBand18: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppLine31: TppLine
        UserName = 'ppLine31'
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
      object RptAginTipoCliDBText1: TppDBText
        UserName = 'RptAginTipoCliDBText1'
        DataField = 'DESCRICAO'
        DataPipeline = PpAgingTipoCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 50536
        BandType = 4
      end
      object RptAginTipoCliDBText2: TppDBText
        UserName = 'RptAginTipoCliDBText2'
        AutoSize = True
        DataField = 'SALDOAV'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 52123
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object Lt30: TppDBText
        UserName = 'Lt30'
        AutoSize = True
        DataField = 'SALDO30'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 78581
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object Lt90: TppDBText
        UserName = 'Lt90'
        AutoSize = True
        DataField = 'SALDO90'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object Lt60: TppDBText
        UserName = 'Lt60'
        AutoSize = True
        DataField = 'SALDO60'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object Lt120: TppDBText
        UserName = 'Lt120'
        AutoSize = True
        DataField = 'SALDO120'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object Lt150: TppDBText
        UserName = 'Lt150'
        AutoSize = True
        DataField = 'SALDO150'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 177536
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object Ltm180: TppDBText
        UserName = 'Ltm180'
        AutoSize = True
        DataField = 'SALDOM180'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 225690
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object Lt180: TppDBText
        UserName = 'Lt180'
        AutoSize = True
        DataField = 'SALDO180'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 202671
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object RptAginTipoCliDBText10: TppDBText
        UserName = 'RptAginTipoCliDBText10'
        AutoSize = True
        DataField = 'SALDOTOT'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 255853
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel47: TppLabel
        UserName = 'ppLabel47'
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
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1058
        mmWidth = 272000
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
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
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine30: TppLine
        UserName = 'ppLine30'
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 250561
        BandType = 7
      end
      object RptAginTipoCliDBCalc1: TppDBCalc
        UserName = 'RptAginTipoCliDBCalc1'
        AutoSize = True
        DataField = 'SALDOAV'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 1852
        mmWidth = 23813
        BandType = 7
      end
      object Ltt30: TppDBCalc
        UserName = 'Ltt30'
        AutoSize = True
        DataField = 'SALDO30'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 67998
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
      object Ltt60: TppDBCalc
        UserName = 'Ltt60'
        AutoSize = True
        DataField = 'SALDO60'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 93134
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
      object Ltt90: TppDBCalc
        UserName = 'Ltt90'
        AutoSize = True
        DataField = 'SALDO90'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 1852
        mmWidth = 23019
        BandType = 7
      end
      object Ltt120: TppDBCalc
        UserName = 'Ltt120'
        AutoSize = True
        DataField = 'SALDO120'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 141817
        mmTop = 1852
        mmWidth = 24606
        BandType = 7
      end
      object Ltt150: TppDBCalc
        UserName = 'Ltt150'
        AutoSize = True
        DataField = 'SALDO150'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 1852
        mmWidth = 24606
        BandType = 7
      end
      object Ltt180: TppDBCalc
        UserName = 'Ltt180'
        AutoSize = True
        DataField = 'SALDO180'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 192088
        mmTop = 1852
        mmWidth = 24606
        BandType = 7
      end
      object Lttm180: TppDBCalc
        UserName = 'Lttm180'
        AutoSize = True
        DataField = 'SALDOM180'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 215107
        mmTop = 1852
        mmWidth = 26988
        BandType = 7
      end
      object RptAginTipoCliDBCalc9: TppDBCalc
        UserName = 'RptAginTipoCliDBCalc9'
        AutoSize = True
        DataField = 'SALDOTOT'
        DataPipeline = PpAgingTipoCli
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAgingTipoCli'
        mmHeight = 3175
        mmLeft = 245534
        mmTop = 1852
        mmWidth = 25665
        BandType = 7
      end
    end
  end
  object CdsAgingTipoCli: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 96
  end
  object SqlAgingTipoCli: TCMSqlParams
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
      '       T.IDTIPOCLIENTE, T.DESCRICAO'
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
      '  AND (D.RECPAG = '#39'R'#39')'
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
      '         AND (D.RECPAG = '#39'R'#39')'
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
      '         AND (D.RECPAG = '#39'R'#39')'
      '         AND (D.IDPESSOA = :IDPESSOA)'
      '         AND (D.NUMFATURA IS NOT NULL)'
      '       GROUP BY D.NUMFATURA) S3'
      ' WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '   AND (D.OPERACAO = L.OPERACAO)'
      '   AND (D.NUMFATURA = S1.NUMFATURA)'
      '   AND (D.NUMFATURA = S3.NUMFATURA)'
      '   AND (D.RECPAG = '#39'R'#39')'
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
      '   AND (D.RECPAG = '#39'R'#39')'
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
      '   CLIENTEPESS C,'
      '   TIPOCLIENTE T,'
      '   PARAMCAP P'
      'WHERE (U.CODDOCUMENTO = D.CODDOCUMENTO)'
      '  AND (D.RECPAG = P.RECPAG)'
      '  AND (D.IDPESSOA = P.IDPESSOA)'
      '  AND (D.RECPAG = '#39'R'#39')'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (D.IDFORCLI = C.IDPESSOA(+))'
      '  AND (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE(+))'
      'GROUP BY T.IDTIPOCLIENTE, T.DESCRICAO'
      'ORDER BY T.DESCRICAO'
      '')
    ClientDataSet = CdsAgingTipoCli
    Left = 88
    Top = 96
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 136
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 144
    Top = 136
  end
end
