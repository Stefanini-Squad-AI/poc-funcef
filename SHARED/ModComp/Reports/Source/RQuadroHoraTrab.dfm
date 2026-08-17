inherited RptQuadroHoraTrab: TRptQuadroHoraTrab
  Left = 484
  Top = 183
  Width = 316
  Height = 269
  Caption = 'RptQuadroHoraTrab'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
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
  inherited DevRptCM: TExtraOptions
    Left = 32
    Top = 88
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpQuadroHoraTrab
  end
  object rpQuadroHoraTrab: TppReport
    AutoStop = False
    DataPipeline = ppQuadroHoraTrab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'QuadroHoraTrab'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 296863
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
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
    Left = 228
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppQuadroHoraTrab'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label2'
        Caption = 'QUADRO DE HORÁRIOS DE TRABALHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 101553
        mmTop = 7673
        mmWidth = 81322
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESA'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 1852
        mmWidth = 102923
        BandType = 0
      end
      object ppDBTextCGC: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CNPJ'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3260
        mmLeft = 9790
        mmTop = 6085
        mmWidth = 7408
        BandType = 0
      end
      object ppDBTextEstMun: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'ESTADUALMUNICIPAL'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3260
        mmLeft = 9790
        mmTop = 10319
        mmWidth = 30395
        BandType = 0
      end
      object ppDBTextEnder: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3260
        mmLeft = 9790
        mmTop = 14552
        mmWidth = 16044
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label3'
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
        mmLeft = 234686
        mmTop = 6085
        mmWidth = 15875
        BandType = 0
      end
      object ppCalc3: TppCalc
        UserName = 'Calc1'
        AutoSize = False
        CalcType = ctPageSetDesc
        CustomType = dtString
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 251355
        mmTop = 6085
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label4'
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
        mmLeft = 234686
        mmTop = 10319
        mmWidth = 15875
        BandType = 0
      end
      object ppCalc4: TppCalc
        UserName = 'Calc2'
        CalcType = ctPrintDateTime
        CustomType = dtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 251355
        mmTop = 10319
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 234686
        mmTop = 1852
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText5'
        DataField = 'UF'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 251355
        mmTop = 1852
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Atividade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9525
        mmTop = 18785
        mmWidth = 15081
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText36'
        DataField = 'ATIVIDADE_EMPRESARIAL'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 18785
        mmWidth = 75671
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9790
        mmTop = 24342
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 29898
        mmTop = 24342
        mmWidth = 67469
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 98954
        mmTop = 24342
        mmWidth = 50006
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'CTPS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 24342
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 24342
        mmWidth = 53446
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Semanal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 228071
        mmTop = 24342
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Visto Fiscal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 248180
        mmTop = 24342
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Descanso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 228071
        mmTop = 19844
        mmWidth = 18785
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 27781
        mmWidth = 265907
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpQuadroHoraTrabDBText15: TppDBText
        UserName = 'DBText13'
        DataField = 'DESCANSO_SEMANAL'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 228071
        mmTop = 529
        mmWidth = 18785
        BandType = 4
      end
      object rpQuadroHoraTrabDBText14: TppDBText
        UserName = 'DBText12'
        DataField = 'HORARIO'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 529
        mmWidth = 53446
        BandType = 4
      end
      object rpQuadroHoraTrabDBText13: TppDBText
        UserName = 'DBText11'
        DataField = 'CTPS'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 150548
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object rpQuadroHoraTrabDBText12: TppDBText
        UserName = 'DBText10'
        DataField = 'CARGO'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 98954
        mmTop = 529
        mmWidth = 50006
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 248180
        mmTop = 3440
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText101'
        DataField = 'MATRICULA'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText7'
        DataField = 'EMPREGADO'
        DataPipeline = ppQuadroHoraTrab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppQuadroHoraTrab'
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 529
        mmWidth = 67469
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 0
        mmWidth = 265907
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 159279
        mmTop = 16404
        mmWidth = 86519
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label16'
        Caption = '(Ass. do Empregador ou seu Responsável Legal)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 19844
        mmWidth = 74083
        BandType = 8
      end
      object rpQuadroHoraTrabLblData: TppLabel
        UserName = 'rpQuadroHoraTrabLblData'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 28046
        mmTop = 12171
        mmWidth = 83344
        BandType = 8
      end
    end
    object rpQuadroHoraTrabSmryBnd: TppSummaryBand
      AfterPrint = rpQuadroHoraTrabSmryBndAfterPrint
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
    end
  end
  object ppQuadroHoraTrab: TppDBPipeline
    DataSource = dsQuadroHoraTrab
    CloseDataSource = True
    OpenDataSource = False
    AutoCreateFields = False
    SkipWhenNoRecords = False
    UserName = 'QuadroHoraTrab'
    Left = 228
    Top = 48
    object ppQuadroHoraTrabppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object ppQuadroHoraTrabppField2: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object ppQuadroHoraTrabppField3: TppField
      FieldAlias = 'ESTADUALMUNICIPAL'
      FieldName = 'ESTADUALMUNICIPAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object ppQuadroHoraTrabppField4: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object ppQuadroHoraTrabppField5: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppQuadroHoraTrabppField6: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppQuadroHoraTrabppField7: TppField
      FieldAlias = 'ATIVIDADE_EMPRESARIAL'
      FieldName = 'ATIVIDADE_EMPRESARIAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object ppQuadroHoraTrabppField8: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object ppQuadroHoraTrabppField9: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object ppQuadroHoraTrabppField10: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object ppQuadroHoraTrabppField11: TppField
      FieldAlias = 'CTPS'
      FieldName = 'CTPS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object ppQuadroHoraTrabppField12: TppField
      FieldAlias = 'IDHORARIO'
      FieldName = 'IDHORARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object ppQuadroHoraTrabppField13: TppField
      FieldAlias = 'HORARIO'
      FieldName = 'HORARIO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object ppQuadroHoraTrabppField14: TppField
      FieldAlias = 'DESCANSO_SEMANAL'
      FieldName = 'DESCANSO_SEMANAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
  end
  object dsQuadroHoraTrab: TwwDataSource
    DataSet = CdsQuadroHoraTrab
    Left = 228
    Top = 96
  end
  object sqlQuadroHoraTrab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'1'#39' AS EMPRESA,'
      '  '#39'1'#39' AS CNPJ,'
      '  '#39'1'#39' AS ESTADUALMUNICIPAL,'
      '  '#39'1'#39' AS ENDERECO,'
      '  '#39'1'#39' AS CIDADE,'
      '  '#39'1'#39' AS UF,'
      '  '#39'1'#39' AS ATIVIDADE_EMPRESARIAL,'
      '  '#39'1'#39' AS MATRICULA,'
      '  '#39'1'#39' AS EMPREGADO,'
      '  '#39'1'#39' AS CARGO,'
      '  '#39'1'#39' AS CTPS,'
      '  '#39'1'#39' AS IDHORARIO,'
      '  '#39'1'#39' AS HORARIO,'
      '  '#39'1'#39' AS DESCANSO_SEMANAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsQuadroHoraTrab
    Left = 228
    Top = 190
  end
  object CdsQuadroHoraTrab: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'EMPRESA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CNPJ'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ESTADUALMUNICIPAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ENDERECO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CIDADE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'UF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ATIVIDADE_EMPRESARIAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MATRICULA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EMPREGADO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CARGO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CTPS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IDHORARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'HORARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCANSO_SEMANAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterScroll = CdsQuadroHoraTrabAfterScroll
    Left = 228
    Top = 144
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 100
    Top = 136
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPRESA,'
      '  LPAD('#39'1'#39',13,'#39'1'#39') AS MATRICULA,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS CODCENTROCUSTO,'
      '  LPAD('#39'1'#39',30,'#39'1'#39') AS NOMECENTROCUSTO,'
      '  '#39'1234567890'#39' AS DATA_REF_INI,'
      '  '#39'1234567890'#39' AS DATA_REF_FIN,'
      
        '  0 AS OCORRIDA_01, '#39'1200000012'#39' AS PERIODO_01, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_01, '#39'123'#39' AS NOME_MES_01,'
      
        '  0 AS OCORRIDA_02, '#39'1200000012'#39' AS PERIODO_02, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_02, '#39'123'#39' AS NOME_MES_02,'
      
        '  0 AS OCORRIDA_03, '#39'1200000012'#39' AS PERIODO_03, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_03, '#39'123'#39' AS NOME_MES_03,'
      
        '  0 AS OCORRIDA_04, '#39'1200000012'#39' AS PERIODO_04, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_04, '#39'123'#39' AS NOME_MES_04,'
      
        '  0 AS OCORRIDA_05, '#39'1200000012'#39' AS PERIODO_05, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_05, '#39'123'#39' AS NOME_MES_05,'
      
        '  0 AS OCORRIDA_06, '#39'1200000012'#39' AS PERIODO_06, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_06, '#39'123'#39' AS NOME_MES_06,'
      
        '  0 AS OCORRIDA_07, '#39'1200000012'#39' AS PERIODO_07, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_07, '#39'123'#39' AS NOME_MES_07,'
      
        '  0 AS OCORRIDA_08, '#39'1200000012'#39' AS PERIODO_08, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_08, '#39'123'#39' AS NOME_MES_08,'
      
        '  0 AS OCORRIDA_09, '#39'1200000012'#39' AS PERIODO_09, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_09, '#39'123'#39' AS NOME_MES_09,'
      
        '  0 AS OCORRIDA_10, '#39'1200000012'#39' AS PERIODO_10, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_10, '#39'123'#39' AS NOME_MES_10,'
      
        '  0 AS OCORRIDA_11, '#39'1200000012'#39' AS PERIODO_11, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_11, '#39'123'#39' AS NOME_MES_11,'
      
        '  0 AS OCORRIDA_12, '#39'1200000012'#39' AS PERIODO_12, '#39'1234567'#39' AS TIP' +
        'O_PERIODO_12, '#39'123'#39' AS NOME_MES_12,'
      '  0 AS NUM_REGISTRO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsAux
    Left = 100
    Top = 182
  end
end
