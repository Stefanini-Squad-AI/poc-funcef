inherited RptMaiorFornCli: TRptMaiorFornCli
  Left = 522
  Top = 300
  Width = 292
  Height = 260
  Caption = 'RptMaiorFornCli'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Maiores Fornecedores'
    Params = <
      item
        Caption = 'Data de Lançamento dos Documentos Inicial'
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
        Caption = 'Data de Lançamento dos Documentos Final'
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
        Caption = 'Lista os maiores Fornecedores'
        Controle = tcSpinEdit
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
        TextDefault = '10'
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 10
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
    FormWidth = 700
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptMaiorFornCli
    LabelEmpresa = ppLabel23
    LabelSistema = ppLabel24
  end
  object DsMaiorFornCli: TwwDataSource
    DataSet = CdsMaiorFornCli
    Left = 89
    Top = 69
  end
  object CdsMaiorFornCli: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 72
    Data = {
      590000009619E0BD01000000180000000200000000000300000059000A464F52
      4E454345444F520100490000000100055749445448020002003C000A56414C4F
      52544F54414C08000400000000000100044C4349440400010009080000}
  end
  object SqlMaiorFornCli: TCMSqlParams
    SQL.Strings = (
      'SELECT PFORCLI.RAZAOSOCIAL AS FORNECEDOR,  (0) as VALORTOTAL'
      ' FROM'
      ' PESSOA PFORCLI,'
      ' LANCTODOCUM LC,'
      ' DOCUMENTO DOC,'
      ' RATEIODOCUM RA'
      ' WHERE'
      ' 1=2')
    ClientDataSet = CdsMaiorFornCli
    Left = 48
    Top = 72
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 48
    Top = 112
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 112
  end
  object RptMaiorFornCli: TppReport
    AutoStop = False
    DataPipeline = PpMaiorFornCli
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 189
    Top = 75
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object LblTitMaiorForCli: TppLabel
        UserName = 'LblTitMaiorForCli'
        AutoSize = False
        Caption = 'Maiores Fornecedores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 8731
        mmWidth = 183886
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 185000
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 76994
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object RptMaiorFornCliLabel1: TppLabel
        UserName = 'RptMaiorFornCliLabel1'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 32015
        mmTop = 28046
        mmWidth = 23548
        BandType = 0
      end
      object RptMaiorFornCliLabel2: TppLabel
        UserName = 'RptMaiorFornCliLabel2'
        Caption = 'Total Negociado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 118798
        mmTop = 28046
        mmWidth = 33073
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object RptMaiorFornCliDBText1: TppDBText
        UserName = 'RptMaiorFornCliDBText1'
        AutoSize = True
        DataField = 'FORNECEDOR'
        DataPipeline = PpMaiorFornCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 32015
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object RptMaiorFornCliDBText2: TppDBText
        UserName = 'RptMaiorFornCliDBText2'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = PpMaiorFornCli
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 185000
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        AutoSize = False
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
        mmWidth = 46302
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 183621
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptMaiorFornCliSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 93927
      mmPrintPosition = 0
      object RptMaiorFornCliDBCalc1: TppDBCalc
        UserName = 'RptMaiorFornCliDBCalc1'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = PpMaiorFornCli
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 0
        mmWidth = 34396
        BandType = 7
      end
      object RptMaiorFornCliLabel3: TppLabel
        UserName = 'RptMaiorFornCliLabel3'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 31221
        mmTop = 0
        mmWidth = 11642
        BandType = 7
      end
      object RptMaiorFornCliDBTeeChart1: TppDBTeeChart
        UserName = 'RptMaiorFornCliDBTeeChart1'
        mmHeight = 79640
        mmLeft = 0
        mmTop = 8731
        mmWidth = 184150
        BandType = 7
        object TppDBTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Title.Text.Strings = (
            '')
          AxisVisible = False
          ClipPoints = False
          Frame.Visible = False
          Legend.TextStyle = ltsLeftPercent
          View3DWalls = False
          BevelOuter = bvNone
          Color = clWhite
          object Series1: TPieSeries
            Marks.ArrowLength = 8
            Marks.Style = smsLabelPercent
            Marks.Visible = False
            DataSource = CdsMaiorFornCli
            SeriesColor = clRed
            ValueFormat = '#,##0.00'
            XLabelsSource = 'FORNECEDOR'
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'VALORTOTAL'
          end
        end
      end
    end
  end
  object PpMaiorFornCli: TppBDEPipeline
    DataSource = DsMaiorFornCli
    CloseDataSource = True
    UserName = 'PpMaiorFornCli'
    Left = 133
    Top = 75
    object PpMaiorFornClippField1: TppField
      FieldAlias = 'FORNECEDOR'
      FieldName = 'FORNECEDOR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object PpMaiorFornClippField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
  end
end
