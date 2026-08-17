inherited RptProfiss: TRptProfiss
  Left = 263
  Top = 212
  Width = 266
  Height = 269
  Caption = 'RptProfiss'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaCodProfissao'
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
        Name = 'ListaCodProfissao'
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
    Report = rpProfis
    ConnectionType = cntBDE
  end
  object rpProfis: TppReport
    AutoStop = False
    DataPipeline = ppProfis
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 206
    Version = '5.5'
    mmColumnWidth = 197300
    object ProfisHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ProfisLbl1: TppLabel
        UserName = 'ProfisLbl1'
        Caption = 'LISTAGEM DE PROFISSÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 10054
        mmWidth = 46831
        BandType = 0
      end
      object ProfisLbl2: TppLabel
        UserName = 'ProfisLbl2'
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
      object ProfisLbl3: TppLabel
        UserName = 'ProfisLbl3'
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
      object ProfisLbl4: TppLabel
        UserName = 'ProfisLbl4'
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
      object ProfisLbl5: TppLabel
        UserName = 'ProfisLbl5'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 17992
        mmWidth = 123825
        BandType = 0
      end
      object ProfisLine1: TppLine
        UserName = 'ProfisLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object ProfisDBTxt1: TppDBText
        UserName = 'ProfisDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppProfis
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
        mmWidth = 17198
        BandType = 0
      end
      object ProfisCalc1: TppSystemVariable
        UserName = 'ProfisCalc1'
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
      object ProfisCalc2: TppSystemVariable
        UserName = 'ProfisCalc2'
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
    object ProfisDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ProfisDBTxt2: TppDBText
        UserName = 'ProfisDBTxt2'
        DataField = 'DESCRICAO'
        DataPipeline = ppProfis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 794
        mmWidth = 123825
        BandType = 4
      end
      object ProfisDBTxt3: TppDBText
        UserName = 'ProfisDBTxt3'
        DataField = 'IDPROFISS'
        DataPipeline = ppProfis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
    end
    object ProfisFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object ProfisSmryBnd1: TppSummaryBand
      AfterPrint = ProfisSmryBnd1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
    end
    object ProfisGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppProfis
      UserName = 'ProfisGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ProfisGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ProfisGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ProfisLbl6: TppLabel
          UserName = 'ProfisLbl6'
          Caption = 'Total de Profissões Listadas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 2117
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object ProfisDBCalc1: TppDBCalc
          UserName = 'ProfisDBCalc1'
          DataField = 'CODCENTROCUSTO'
          DataPipeline = ppProfis
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ProfisGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 51065
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppProfis: TppBDEPipeline
    DataSource = dsProfis
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Profis'
    Left = 206
    Top = 48
  end
  object dsProfis: TwwDataSource
    DataSet = CdsProfiss
    Left = 206
    Top = 96
  end
  object sqlProfiss: TCMSqlParams
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
    ClientDataSet = CdsProfiss
    Left = 206
    Top = 192
  end
  object CdsProfiss: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsProfissAfterOpen
    AfterScroll = CdsProfissAfterScroll
    Left = 206
    Top = 144
  end
end
