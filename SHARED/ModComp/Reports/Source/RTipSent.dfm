inherited RptTipSent: TRptTipSent
  Left = 250
  Top = 211
  Width = 264
  Height = 264
  Caption = 'RptTipSent'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem dos Tipos de Sentença'
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
    Report = rpTipSent
    ConnectionType = cntBDE
  end
  object rpTipSent: TppReport
    AutoStop = False
    DataPipeline = ppTipSent
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
    Left = 205
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTipSentHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpTipSentLbl1: TppLabel
        UserName = 'rpTipSentLbl1'
        Caption = 'Listagem dos Tipos de Sentença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 70908
        mmTop = 10054
        mmWidth = 55563
        BandType = 0
      end
      object rpTipSentLbl2: TppLabel
        UserName = 'rpTipSentLbl2'
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
        mmLeft = 143669
        mmTop = 6085
        mmWidth = 9260
        BandType = 0
      end
      object rpTipSentLbl3: TppLabel
        UserName = 'rpTipSentLbl3'
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
        mmLeft = 138642
        mmTop = 10583
        mmWidth = 14228
        BandType = 0
      end
      object rpTipSentLbl4: TppLabel
        UserName = 'rpTipSentLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 17992
        mmWidth = 22490
        BandType = 0
      end
      object rpTipSentLbl5: TppLabel
        UserName = 'rpTipSentLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 17992
        mmWidth = 126207
        BandType = 0
      end
      object rpTipSentLine1: TppLine
        UserName = 'rpTipSentLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 22754
        mmTop = 22490
        mmWidth = 153988
        BandType = 0
      end
      object rpTipSentDBTxt1: TppDBText
        UserName = 'rpTipSentDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTipSent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2646
        mmWidth = 17198
        BandType = 0
      end
      object rpTipSentSysVar1: TppSystemVariable
        UserName = 'rpTipSentSysVar1'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 153723
        mmTop = 6085
        mmWidth = 23283
        BandType = 0
      end
      object rpTipSentSysVar2: TppSystemVariable
        UserName = 'rpTipSentSysVar2'
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
        mmLeft = 153723
        mmTop = 10583
        mmWidth = 23283
        BandType = 0
      end
    end
    object rpTipSentDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpTipSentDBTxt3: TppDBText
        UserName = 'rpTipSentDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppTipSent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 48948
        mmTop = 529
        mmWidth = 126207
        BandType = 4
      end
      object rpTipSentDBTxt2: TppDBText
        UserName = 'rpTipSentDBTxt2'
        DataField = 'CODTIPOSENT'
        DataPipeline = ppTipSent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24606
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpTipSentFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpTipSentSmryBnd: TppSummaryBand
      AfterPrint = rpTipSentSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpTipSentGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTipSent
      UserName = 'rpTipSentGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTipSentGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTipSentGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpTipSentLbl6: TppLabel
          UserName = 'rpTipSentLbl6'
          AutoSize = False
          Caption = 'Total de Registros Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24606
          mmTop = 2117
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTipSentDBCalc1: TppDBCalc
          UserName = 'rpTipSentDBCalc1'
          DataField = 'CODTIPOSENT'
          DataPipeline = ppTipSent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpTipSentGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 62177
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTipSent: TppBDEPipeline
    DataSource = dsTipSent
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo6'
    Left = 205
    Top = 48
    object ppTipSentppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppTipSentppField2: TppField
      FieldAlias = 'CODTIPOSENT'
      FieldName = 'CODTIPOSENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppTipSentppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object dsTipSent: TwwDataSource
    DataSet = CdsTipSent
    Left = 205
    Top = 96
  end
  object sqlTipSent: TCMSqlParams
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
    ClientDataSet = CdsTipSent
    Left = 205
    Top = 192
  end
  object CdsTipSent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsTipSentAfterOpen
    AfterScroll = CdsTipSentAfterScroll
    Left = 205
    Top = 144
  end
end
