inherited RptCargos: TRptCargos
  Left = 249
  Top = 200
  Width = 268
  Height = 269
  Caption = 'RptCargos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaCodGrupoFunc'
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
        Name = 'ListaCodGrupoFunc'
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
        Caption = 'ImprimeDescricao'
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
        Name = 'ImprimeDescricao'
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
    Report = rpCargos
    ConnectionType = cntBDE
  end
  object rpCargos: TppReport
    AutoStop = False
    DataPipeline = ppCargos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 4350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 208
    Version = '5.5'
    mmColumnWidth = 197300
    object CargosHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object CargosLbl1: TppLabel
        UserName = 'CargosLbl1'
        Caption = 'LISTAGEM DE CARGOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 76729
        mmTop = 10054
        mmWidth = 39158
        BandType = 0
      end
      object CargosLbl2: TppLabel
        UserName = 'CargosLbl2'
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 6350
        mmWidth = 8467
        BandType = 0
      end
      object CargosLbl3: TppLabel
        UserName = 'CargosLbl3'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 10583
        mmWidth = 13229
        BandType = 0
      end
      object CargosLbl4: TppLabel
        UserName = 'CargosLbl4'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object CargosLbl5: TppLabel
        UserName = 'CargosLbl5'
        Caption = 'Título do Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 17992
        mmWidth = 104511
        BandType = 0
      end
      object CargosLine1: TppLine
        UserName = 'CargosLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object CargosLbl6: TppLabel
        UserName = 'CargosLbl6'
        AutoSize = False
        Caption = 'CBO 2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 17992
        mmWidth = 21167
        BandType = 0
      end
      object CargosDBText1: TppDBText
        UserName = 'CargosDBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppCargos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 2646
        mmWidth = 17463
        BandType = 0
      end
      object CargosCalc1: TppSystemVariable
        UserName = 'CargosCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 6350
        mmWidth = 7938
        BandType = 0
      end
      object CargosCalc2: TppSystemVariable
        UserName = 'CargosCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 10583
        mmWidth = 22225
        BandType = 0
      end
    end
    object CargosDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object CargosDBText3: TppDBText
        UserName = 'CargosDBText3'
        DataField = 'TITULO'
        DataPipeline = ppCargos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 1323
        mmWidth = 104511
        BandType = 4
      end
      object CargosDBText2: TppDBText
        UserName = 'CargosDBText2'
        DataField = 'CODIGO'
        DataPipeline = ppCargos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 1323
        mmWidth = 22490
        BandType = 4
      end
      object CargosDBText4: TppDBText
        UserName = 'CargosDBText4'
        DataField = 'CBO2002'
        DataPipeline = ppCargos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153459
        mmTop = 1323
        mmWidth = 21167
        BandType = 4
      end
      object CargosDBMem1: TppDBMemo
        UserName = 'CargosDBMem1'
        CharWrap = False
        DataField = 'DESCRICAO'
        DataPipeline = ppCargos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 20373
        mmLeft = 36777
        mmTop = 7408
        mmWidth = 133879
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object CargosFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object CargosSmryBnd1: TppSummaryBand
      AfterPrint = CargosSmryBnd1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpCargosGroup1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppCargos
      UserName = 'rpCargosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object CargosGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object CargosGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object CargosLbl7: TppLabel
          UserName = 'CargosLbl7'
          Caption = 'Total de Cargos Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 2117
          mmWidth = 32544
          BandType = 5
          GroupNo = 0
        end
        object CargosDBCalc1: TppDBCalc
          UserName = 'CargosDBCalc1'
          DataField = 'CODIGO'
          DataPipeline = ppCargos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpCargosGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 46567
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppCargos: TppBDEPipeline
    DataSource = dsCargos
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'ppCargos'
    Left = 208
    Top = 48
  end
  object dsCargos: TwwDataSource
    DataSet = CdsCargos
    Left = 208
    Top = 96
  end
  object sqlCargos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS ESTAB,'
      '  '#39'2'#39' AS MATRICULA,'
      '  '#39'3'#39' AS LOGRADOURO,'
      '  '#39'4'#39' AS CIDADE,'
      '  '#39'5'#39' AS BAIRRO,'
      '  '#39'6'#39' AS CEP,'
      '  '#39'7'#39' AS ESTCIVIL,'
      '  '#39'8'#39' AS CTPS,'
      '  '#39'9'#39' AS CTPS_UF,'
      '  '#39'0'#39' AS CPF,'
      '  '#39'1'#39' AS TELEFONE,'
      '  '#39'2'#39' AS UF,'
      '  '#39'3'#39' AS EMPREGADO,'
      '  '#39'4'#39' AS DEPENDENTE,'
      '  '#39'5'#39' AS DATANASC,'
      '  '#39'6'#39' AS DEPENDENCIA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsCargos
    Left = 208
    Top = 192
  end
  object CdsCargos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsCargosAfterOpen
    AfterScroll = CdsCargosAfterScroll
    Left = 208
    Top = 144
  end
end
