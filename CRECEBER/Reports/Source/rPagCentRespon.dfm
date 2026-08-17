inherited RptPagCentRespon: TRptPagCentRespon
  Left = 466
  Top = 307
  Height = 352
  Caption = 'RptPagCentRespon'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Data Pagamento do Documento Inicial'
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
        Caption = 'Data Pagamento do Documento Final'
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
        Caption = 'Centro de Responsabilidade'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CODCENTRORESPON, NOME '
          'FROM CENTRESPON ORDER BY NOME')
        LookupSettings.Chave = 'CODCENTRORESPON'
        LookupSettings.Display = 'Nome'
        LookupSettings.Descricao = 'Nome'
        LookupSettings.Tamanho = '30'
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
        Caption = 'Cliente'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDFORCLI'
        LookupSettings.Display = 'RAZAOSOCIAL'
        LookupSettings.Descricao = 'Cliente'
        LookupSettings.Tamanho = '60'
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
    Formheight = 170
    FormWidth = 590
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptPagCentRespon
    LabelEmpresa = ppLabel114
    LabelSistema = ppLabel116
  end
  object DsPagCentRespon: TwwDataSource
    DataSet = CdsPagCentRespon
    Left = 81
    Top = 68
  end
  object PpPagCentRespon: TppBDEPipeline
    DataSource = DsPagCentRespon
    CloseDataSource = True
    UserName = 'PpPagCentRespon'
    Left = 145
    Top = 72
  end
  object RptPagCentRespon: TppReport
    AutoStop = False
    DataPipeline = PpPagCentRespon
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
    Left = 209
    Top = 60
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpPagCentRespon'
    object ppHeaderBand26: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        Caption = 'Valores Pagos por Centro de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 88106
        mmTop = 8731
        mmWidth = 96044
        BandType = 0
      end
      object ppLabel114: TppLabel
        UserName = 'ppLabel114'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121973
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel119: TppLabel
        UserName = 'ppLabel119'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2646
        mmTop = 19315
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel120: TppLabel
        UserName = 'ppLabel120'
        Caption = 'Chq\Borderô'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 95779
        mmTop = 19315
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'ppLabel124'
        Caption = 'Forma de Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 19315
        mmWidth = 39423
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'ppLabel127'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 19315
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'ppLabel121'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 261938
        mmTop = 19315
        mmWidth = 8996
        BandType = 0
      end
      object RptPagCentResponLabel3: TppLabel
        UserName = 'RptPagCentResponLabel3'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 158221
        mmTop = 19579
        mmWidth = 14552
        BandType = 0
      end
    end
    object ppDetailBand27: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText43: TppDBText
        UserName = 'ppDBText43'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpPagCentRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 0
        mmWidth = 63500
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'ppDBText44'
        DataField = 'NUMCHQBORDERO'
        DataPipeline = PpPagCentRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'ppDBText46'
        AutoSize = True
        DataField = 'VALORRATEIO'
        DataPipeline = PpPagCentRespon
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 3175
        mmLeft = 250825
        mmTop = 265
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'PORTFORMA'
        DataPipeline = PpPagCentRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 3704
        mmLeft = 117740
        mmTop = 0
        mmWidth = 39952
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        DataField = 'DOCCOMPL'
        DataPipeline = PpPagCentRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object RptPagCentResponDBText2: TppDBText
        UserName = 'RptPagCentResponDBText2'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpPagCentRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 0
        mmWidth = 73819
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine51: TppLine
        UserName = 'ppLine51'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel116: TppLabel
        UserName = 'ppLabel116'
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
      object ppCalc46: TppSystemVariable
        UserName = 'Calc46'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 3175
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc47: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 244740
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand8: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel117: TppLabel
        UserName = 'ppLabel117'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 195527
        mmTop = 794
        mmWidth = 19844
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'ppDBCalc12'
        AutoSize = True
        DataField = 'VALORRATEIO'
        DataPipeline = PpPagCentRespon
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpPagCentRespon'
        mmHeight = 4233
        mmLeft = 232569
        mmTop = 794
        mmWidth = 39158
        BandType = 7
      end
      object RptPagCentResponLine3: TppLine
        UserName = 'RptPagCentResponLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 265
        mmWidth = 272000
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = PpPagCentRespon
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpPagCentRespon'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object RptPagCentResponLabel1: TppLabel
          UserName = 'RptPagCentResponLabel1'
          Caption = 'Centro de Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 794
          mmWidth = 54504
          BandType = 3
          GroupNo = 0
        end
        object RptPagCentResponDBText1: TppDBText
          UserName = 'RptPagCentResponDBText1'
          AutoSize = True
          DataField = 'CENTRESPON'
          DataPipeline = PpPagCentRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpPagCentRespon'
          mmHeight = 4498
          mmLeft = 55033
          mmTop = 794
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLine50: TppLine
          UserName = 'ppLine50'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
        object RptPagCentResponLine1: TppLine
          UserName = 'RptPagCentResponLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5821
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel128: TppLabel
          UserName = 'ppLabel128'
          Caption = 'Tota Centro Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 186796
          mmTop = 529
          mmWidth = 44715
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'ppDBCalc14'
          AutoSize = True
          DataField = 'VALORRATEIO'
          DataPipeline = PpPagCentRespon
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup8
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpPagCentRespon'
          mmHeight = 3175
          mmLeft = 240242
          mmTop = 265
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptPagCentResponGroup1: TppGroup
      BreakName = 'DATALANCTO'
      DataPipeline = PpPagCentRespon
      OutlineSettings.CreateNode = True
      UserName = 'RptPagCentResponGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpPagCentRespon'
      object RptPagCentResponGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel118: TppLabel
          UserName = 'ppLabel118'
          Caption = 'Data de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 529
          mmWidth = 34925
          BandType = 3
          GroupNo = 1
        end
        object ppDBText51: TppDBText
          UserName = 'ppDBText51'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = PpPagCentRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpPagCentRespon'
          mmHeight = 3969
          mmLeft = 38100
          mmTop = 529
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object RptPagCentResponLine2: TppLine
          UserName = 'RptPagCentResponLine2'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 8467
          mmTop = 4763
          mmWidth = 263261
          BandType = 3
          GroupNo = 1
        end
      end
      object RptPagCentResponGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object RptPagCentResponLabel2: TppLabel
          UserName = 'RptPagCentResponLabel2'
          Caption = 'Total Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 216694
          mmTop = 794
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
        object RptPagCentResponDBCalc1: TppDBCalc
          UserName = 'RptPagCentResponDBCalc1'
          AutoSize = True
          DataField = 'VALORRATEIO'
          DataPipeline = PpPagCentRespon
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptPagCentResponGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpPagCentRespon'
          mmHeight = 3175
          mmLeft = 240242
          mmTop = 794
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
        object ppLine52: TppLine
          UserName = 'ppLine52'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 8467
          mmTop = 5027
          mmWidth = 263261
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object SqlPagCentRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '   C.NOME AS CENTRESPON, '
      '   L.DATALANCTO, '
      '   RP.NUMCHQBORDERO, '
      '   PF.DESCRICAO AS PORTFORMA, '
      
        '   (RTRIM(TO_CHAR(D.NODOCUMENTO)) || '#39' '#39' || D.COMPLDOCUMENTO) AS' +
        ' DOCCOMPL,'
      '   P.RAZAOSOCIAL, P.IDPESSOA, '
      '   C.CODCENTRORESPON, '
      '   DOCINI.HISTORICOCOMPL, '
      '   SUM(((L.VALOR * R.VALOR) /DOCINI.VALOR)) AS VALORRATEIO '
      'FROM '
      '   PORTADORFORMA PF, '
      '   DOCUMENTO D, '
      '   PESSOA P, '
      '   LANCTODOCUM L, '
      '   CENTRESPON C, '
      '   RATEIODOCUM R, '
      '   RECBTOPAGTO RP, '
      
        '   (SELECT D.CODDOCUMENTO,L.VALOR, L.HISTORICOCOMPL FROM DOCUMEN' +
        'TO D, LANCTODOCUM L WHERE D.CODDOCUMENTO = L.CODDOCUMENTO '
      '   AND L.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'10'#39','#39'15'#39')) DOCINI '
      'WHERE '
      '  (D.IDPESSOA = :PIDEMPRESA) AND'
      '  (L.DATALANCTO BETWEEN :PDATAINI AND :PDATAFIM) AND'
      '  (D.RECPAG = :PRECPAG)'
      'GROUP BY'
      
        '  L.DATALANCTO,C.NOME, D.CODCENTROCUSTO, RP.NUMCHQBORDERO,PF.DES' +
        'CRICAO, DOCINI.HISTORICOCOMPL,'
      
        '  D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCOM' +
        'PL,C.CODCENTRORESPON, P.IDPESSOA'
      'ORDER BY'
      
        '  C.NOME,C.CODCENTRORESPON, L.DATALANCTO, P.RAZAOSOCIAL, P.IDPES' +
        'SOA '
      '')
    ClientDataSet = CdsPagCentRespon
    Left = 96
    Top = 48
  end
  object CdsPagCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 48
  end
  object CdsPrevObra: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 120
  end
  object SqlPrevObra: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.NOME, D.DATAPROGRAMADA,'
      
        '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCO' +
        'MPL,C.CODCENTRORESPON,'
      '   SUM(((SALDO.SVALOR * R.VALOR) / L.VALOR)) AS SALDORATEIO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L,'
      '   CENTRESPON C,'
      '   RATEIODOCUM R,'
      
        '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAM' +
        'OEDA) AS SVALOROUTRAMOEDA FROM'
      '     (SELECT DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1) AS VREAL,'
      
        '        DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA ' +
        '* -1) AS VOUTRAMOEDA,'
      '        L.CODDOCUMENTO'
      '        FROM LANCTODOCUM L ,DOCUMENTO D'
      
        '        WHERE L.CODDOCUMENTO = D.CODDOCUMENTO AND D.RECPAG = '#39'P'#39 +
        ' AND D.IDPESSOA = :PIDPESSOA)  S'
      '        GROUP BY S.CODDOCUMENTO) SALDO'
      'WHERE'
      '   (RTRIM(C.CODCENTRORESPON) = RTRIM(:OBRA)) AND'
      
        '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,'#39'dd/mm/yyyy'#39') AND' +
        ' to_date(:PDATAFIM,'#39'dd/mm/yyyy'#39')) AND'
      '   (D.IDPESSOA = :PIDPESSOA) AND'
      '   (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39')) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)) AND'
      '   (D.RECPAG = '#39'P'#39')  AND'
      
        '    ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHER' +
        'E a.RECPAG ='#39'P'#39
      '       and not exists  (select 1 from UsuarioxTpdocto b where'
      '       b.idusuario=:idusuario)'
      
        '       union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.REC' +
        'PAG ='#39'P'#39
      
        '       and exists (select 1 from UsuarioxTpdocto b where a.codti' +
        'pdoc=b.codtipdoc and'
      '        b.idusuario=:idusuario )) ) and'
      '   (L.ESTORNO IS NULL) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '   (L.Valor <> 0 ) AND'
      '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND'
      '   (R.IDPESSOA = C.IDPESSOA(+)) AND'
      '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)'
      'GROUP BY'
      '    C.NOME, D.DATAPROGRAMADA,'
      
        '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOC' +
        'OMPL, C.CODCENTRORESPON'
      'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0'
      'ORDER BY  C.NOME, D.DATAPROGRAMADA,P.RAZAOSOCIAL'
      ''
      '')
    ClientDataSet = CdsPrevObra
    Left = 96
    Top = 120
  end
  object CdsPrevObra2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 160
  end
  object SqlPrevObra2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   C.NOME, D.DATAPROGRAMADA,'
      
        '   D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOCO' +
        'MPL, C.CODCENTRORESPON,'
      '   SUM((SALDO.SVALOR * R.VALOR/ L.VALOR)) AS SALDORATEIO'
      'FROM'
      '   DOCUMENTO D,'
      '   PESSOA P,'
      '   LANCTODOCUM L,'
      '   CENTRESPON C,'
      '   RATEIODOCUM R,'
      
        '   (SELECT S.CODDOCUMENTO, SUM(S.VREAL) AS SVALOR, SUM(S.VOUTRAM' +
        'OEDA) AS SVALOROUTRAMOEDA FROM'
      
        '      (SELECT DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR * -1) AS VREAL' +
        ','
      
        '        DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA ' +
        '* -1) AS VOUTRAMOEDA,'
      '        L.CODDOCUMENTO'
      '        FROM LANCTODOCUM L ,DOCUMENTO D'
      
        '        WHERE (L.CODDOCUMENTO = D.CODDOCUMENTO) AND (D.RECPAG = ' +
        #39'P'#39') AND (D.IDPESSOA = :PIDPESSOA))  S'
      '        GROUP BY S.CODDOCUMENTO) SALDO'
      'WHERE'
      
        '   (D.DATAPROGRAMADA BETWEEN to_date(:PDATAINI,'#39'dd/mm/yyyy'#39') AND' +
        ' to_date(:PDATAFIM,'#39'dd/mm/yyyy'#39')) AND'
      '   (D.IDPESSOA = :PIDPESSOA) AND'
      ''
      
        '     ( D.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHE' +
        'RE a.RECPAG ='#39'P'#39
      '       and not exists  (select 1 from UsuarioxTpdocto b where'
      '       b.idusuario=:idusuario)'
      
        '       union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.REC' +
        'PAG ='#39'P'#39
      
        '       and exists (select 1 from UsuarioxTpdocto b where a.codti' +
        'pdoc=b.codtipdoc and'
      '        b.idusuario=:idusuario )) ) and'
      ''
      '   (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39')) AND'
      '   ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL)) AND'
      '   (D.RECPAG = '#39'P'#39') AND'
      '   (L.ESTORNO IS NULL) AND'
      '   (D.IDFORCLI = P.IDPESSOA) AND'
      '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '   (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND'
      '   (R.CODCENTRORESPON = C.IDPESSOA(+)) AND'
      '   (L.valor <> 0)    AND'
      '   (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)'
      'GROUP BY     C.NOME, D.DATAPROGRAMADA,'
      
        '    D.NODOCUMENTO, D.COMPLDOCUMENTO, P.RAZAOSOCIAL, L.HISTORICOC' +
        'OMPL, C.CODCENTRORESPON'
      'HAVING SUM((SALDO.SVALOR * R.VALOR / L.VALOR))  > 0'
      'ORDER BY'
      ' C.NOME, D.DATAPROGRAMADA,P.RAZAOSOCIAL')
    ClientDataSet = CdsPrevObra2
    Left = 96
    Top = 160
  end
end
