inherited RptRecEncargos: TRptRecEncargos
  Left = 373
  Top = 262
  Width = 293
  Height = 275
  Caption = 'RptRecEncargos'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Recolhimento de Encargos'
    Params = <
      item
        Caption = 'Lançamento dos Encargos Inicial'
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
        Caption = 'Lançamento dos Encargos Final'
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
        Caption = 'Tipo do Encargo'
        Controle = tcComboBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   TIPOAGRE.DESCCUSTAGREG,'
          '   TIPOAGRE.CODTIPOCUSTAGREG'
          'FROM'
          '   TIPOAGRE,'
          '   TIPOALTERADOR'
          'WHERE'
          '   ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND'
          '   ( TIPOAGRE.CODTRATFISCD IN ('#39'8'#39','#39'9'#39','#39'A'#39') ) ')
        LookupSettings.Chave = 'CODTIPOCUSTAGREG'
        LookupSettings.Display = 'DESCCUSTAGREG'
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
      end
      item
        Caption = 'Data para Recolhimento'
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
    Formheight = 170
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptRecEnc
    LabelEmpresa = ppLabel9
    LabelSistema = ppLabel14
  end
  object PpRecEnc: TppBDEPipeline
    DataSource = DsRecEnc
    UserName = 'PpRecEnc'
    Left = 161
    Top = 51
  end
  object DsRecEnc: TwwDataSource
    DataSet = CdsRecEnc
    Left = 113
    Top = 67
  end
  object RptRecEnc: TppReport
    AutoStop = False
    DataPipeline = PpRecEnc
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 224
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpRecEnc'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Recolhimento de Encargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 114829
        mmTop = 8731
        mmWidth = 54769
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30427
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128323
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptRecEncLabel1: TppLabel
        UserName = 'RptRecEncLabel1'
        Caption = 'Encargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 0
        mmTop = 15875
        mmWidth = 15346
        BandType = 0
      end
      object RptRecEncLabel2: TppLabel
        UserName = 'RptRecEncLabel2'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 20373
        mmWidth = 14288
        BandType = 0
      end
      object RptRecEncLabel3: TppLabel
        UserName = 'RptRecEncLabel3'
        Caption = 'Data para recolhimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 24871
        mmWidth = 40746
        BandType = 0
      end
      object LblEncargo: TppLabel
        UserName = 'LblEncargo'
        Caption = 'Encargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 42069
        mmTop = 15875
        mmWidth = 12965
        BandType = 0
      end
      object LblPeriodo: TppLabel
        UserName = 'LblPeriodo'
        Caption = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 20373
        mmWidth = 11642
        BandType = 0
      end
      object LblData: TppLabel
        UserName = 'LblData'
        Caption = 'Data Recolhimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 24871
        mmWidth = 29104
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object RptRecEncDBText1: TppDBText
        UserName = 'RptRecEncDBText1'
        DataField = 'IDFORCLI'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object RptRecEncDBText2: TppDBText
        UserName = 'RptRecEncDBText2'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 0
        mmWidth = 82815
        BandType = 4
      end
      object RptRecEncDBText3: TppDBText
        UserName = 'RptRecEncDBText3'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object RptRecEncDBText4: TppDBText
        UserName = 'RptRecEncDBText4'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object RptRecEncDBText5: TppDBText
        UserName = 'RptRecEncDBText5'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 195792
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object RptRecEncDBText6: TppDBText
        UserName = 'RptRecEncDBText6'
        DataField = 'VLRBASE'
        DataPipeline = PpRecEnc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 233363
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptRecEncDBText8: TppDBText
        UserName = 'RptRecEncDBText8'
        DataField = 'DATARETENCAO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 214048
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object RptRecEncDBText7: TppDBText
        UserName = 'RptRecEncDBText7'
        DataField = 'VLRRETIDO'
        DataPipeline = PpRecEnc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 0
        mmWidth = 28311
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 0
        mmWidth = 46567
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 183357
        mmTop = 265
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
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
        mmTop = 3440
        mmWidth = 27252
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 3440
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptRecEncSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object RptRecEncLabel12: TppLabel
        UserName = 'RptRecEncLabel12'
        Caption = 'Total a Recolher'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 201084
        mmTop = 794
        mmWidth = 27781
        BandType = 7
      end
      object RptRecEncDBCalc1: TppDBCalc
        UserName = 'RptRecEncDBCalc1'
        DataField = 'VLRRETIDO'
        DataPipeline = PpRecEnc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 4233
        mmLeft = 254001
        mmTop = 794
        mmWidth = 28310
        BandType = 7
      end
      object RptRecEncLine1: TppLine
        UserName = 'RptRecEncLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 5819
        mmWidth = 284300
        BandType = 7
      end
      object RptRecEncLine2: TppLine
        UserName = 'RptRecEncLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODTIPOCUSTAGREG'
      DataPipeline = PpRecEnc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpRecEnc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 12700
          mmTop = 8731
          mmWidth = 271463
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 794
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel4: TppLabel
          UserName = 'RptRecEncLabel4'
          Caption = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 12700
          mmTop = 8202
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel5: TppLabel
          UserName = 'RptRecEncLabel5'
          Caption = 'Razão Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25665
          mmTop = 8202
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'Label49'
          Caption = 'CNPJ/CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 109802
          mmTop = 8202
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel6: TppLabel
          UserName = 'RptRecEncLabel6'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 158221
          mmTop = 8202
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel10: TppLabel
          UserName = 'RptRecEncLabel10'
          Caption = 'Compl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 182298
          mmTop = 8202
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel7: TppLabel
          UserName = 'RptRecEncLabel7'
          Caption = 'Data Prog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 195792
          mmTop = 8202
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel11: TppLabel
          UserName = 'RptRecEncLabel11'
          Caption = 'Data Ret.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 214313
          mmTop = 8202
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel8: TppLabel
          UserName = 'RptRecEncLabel8'
          Caption = 'Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 242094
          mmTop = 8202
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object RptRecEncLabel9: TppLabel
          UserName = 'RptRecEncLabel9'
          Caption = 'Valor a Recolher'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 254001
          mmTop = 8202
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCCUSTAGREG'
          DataPipeline = PpRecEnc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 4233
          mmLeft = 18256
          mmTop = 1323
          mmWidth = 155311
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Encargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRRETIDO'
          DataPipeline = PpRecEnc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 3440
          mmLeft = 254265
          mmTop = 4763
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRBASE'
          DataPipeline = PpRecEnc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 3440
          mmLeft = 225161
          mmTop = 4763
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 212990
          mmTop = 4763
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlRecEnc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IR.CODTIPOCUSTAGREG,'
      '   IR.DATARETENCAO,'
      '   IR.VLRBASE,'
      '   ROUND(IR.VLRRETIDO,2) VLRRETIDO,'
      '   D.DATAPROGRAMADA,'
      '   D.NODOCUMENTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.IDFORCLI,'
      '   P.RAZAOSOCIAL,'
      '   P.NUMDOCUMENTO'
      'FROM'
      '   IMPOSTORETIDO IR, DOCUMENTO D, PESSOA P'
      'WHERE'
      '   (IR.CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG) AND'
      '   (D.IDPESSOA = :IDPESSOA) AND'
      '   (IR.DATARETENCAO BETWEEN :DATAINI AND :DATAFIN) AND'
      '   (IR.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      
        '    d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE ' +
        'a.RECPAG = :recpag and not exists'
      '    (select 1 from UsuarioxTpdocto b where B.recpag=:recpag'
      '     and b.idusuario=:idusuario)'
      '      union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a'
      '       WHERE a.RECPAG =   :recpag  and exists'
      
        '        (select 1 from UsuarioxTpdocto b where B.recpag=:recpag ' +
        'and a.codtipdoc=b.codtipdoc'
      '        and b.idusuario=:idusuario)) and          '
      '   (D.IDFORCLI = P.IDPESSOA)'
      'ORDER BY '
      '  IR.DATARETENCAO,'
      '  P.RAZAOSOCIAL, D.IDFORCLI'
      ''
      '  '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsRecEnc
    Left = 64
    Top = 64
  end
  object CdsRecEnc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 56
  end
end
