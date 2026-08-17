inherited RptMotivoJur: TRptMotivoJur
  Left = 254
  Top = 190
  Width = 278
  Height = 268
  Caption = 'RptMotivoJur'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem dos Motivos de Exclusão de Pessoas'
    Params = <
      item
        Caption = 'Sequência'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Por Código'
          'Alfabética')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
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
    Formheight = 120
    FormWidth = 350
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMotivoJur
    ConnectionType = cntBDE
  end
  object rpMotivoJur: TppReport
    AutoStop = False
    DataPipeline = ppMotivoJur
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
    Left = 216
    Version = '5.5'
    mmColumnWidth = 197300
    object rpMotivoJurHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpMotivoJurLbl1: TppLabel
        UserName = 'rpMotivoJurLbl1'
        Caption = 'Listagem dos Motivos de Exclusão de Pessoas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 60590
        mmTop = 10054
        mmWidth = 79640
        BandType = 0
      end
      object rpMotivoJurLbl2: TppLabel
        UserName = 'rpMotivoJurLbl2'
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
        mmLeft = 155311
        mmTop = 6350
        mmWidth = 9525
        BandType = 0
      end
      object rpMotivoJurLbl3: TppLabel
        UserName = 'rpMotivoJurLbl3'
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
        mmLeft = 150548
        mmTop = 10583
        mmWidth = 14288
        BandType = 0
      end
      object rpMotivoJurLbl4: TppLabel
        UserName = 'rpMotivoJurLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpMotivoJurLbl5: TppLabel
        UserName = 'rpMotivoJurLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 17992
        mmWidth = 93398
        BandType = 0
      end
      object rpMotivoJurLine1: TppLine
        UserName = 'rpMotivoJurLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object rpMotivoJurDBTxt1: TppDBText
        UserName = 'rpMotivoJurDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppMotivoJur
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
      object rpMotivoJurLbl6: TppLabel
        UserName = 'rpMotivoJurLbl6'
        AutoSize = False
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 17992
        mmWidth = 61119
        BandType = 0
      end
      object rpMotivoJurSysVar1: TppSystemVariable
        UserName = 'rpMotivoJurSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 6350
        mmWidth = 23548
        BandType = 0
      end
      object rpMotivoJurSysVar2: TppSystemVariable
        UserName = 'rpMotivoJurSysVar2'
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
        mmLeft = 165629
        mmTop = 10583
        mmWidth = 23548
        BandType = 0
      end
    end
    object rpMotivoJurDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object rpMotivoJurDBTxt3: TppDBText
        UserName = 'rpMotivoJurDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppMotivoJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 1588
        mmWidth = 93398
        BandType = 4
      end
      object rpMotivoJurDBTxt2: TppDBText
        UserName = 'rpMotivoJurDBTxt2'
        DataField = 'IDMOTIVO'
        DataPipeline = ppMotivoJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 1588
        mmWidth = 22490
        BandType = 4
      end
      object rpMotivoJurDBMemo1: TppDBMemo
        UserName = 'rpMotivoJurDBMemo1'
        KeepTogether = True
        CharWrap = False
        DataField = 'OBSERVACAO'
        DataPipeline = ppMotivoJur
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 20373
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 60590
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object rpMotivoJurFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpMotivoJurSmryBnd: TppSummaryBand
      AfterPrint = rpMotivoJurSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpMotivoJurGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppMotivoJur
      UserName = 'rpMotivoJurGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMotivoJurGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpMotivoJurGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpMotivoJurLbl7: TppLabel
          UserName = 'rpMotivoJurLbl7'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpMotivoJurDBCalc1: TppDBCalc
          UserName = 'rpMotivoJurDBCalc1'
          DataField = 'IDMOTIVO'
          DataPipeline = ppMotivoJur
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpMotivoJurGrp1
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
  object ppMotivoJur: TppBDEPipeline
    DataSource = dsMotivoJur
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo3'
    Left = 216
    Top = 48
    object ppMotivoJurppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppMotivoJurppField2: TppField
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppMotivoJurppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppMotivoJurppField4: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsMotivoJur: TwwDataSource
    DataSet = CdsMotivoJur
    Left = 216
    Top = 96
  end
  object sqlMotivoJur: TCMSqlParams
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
    ClientDataSet = CdsMotivoJur
    Left = 216
    Top = 192
  end
  object CdsMotivoJur: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsMotivoJurAfterOpen
    AfterScroll = CdsMotivoJurAfterScroll
    Left = 216
    Top = 144
  end
end
