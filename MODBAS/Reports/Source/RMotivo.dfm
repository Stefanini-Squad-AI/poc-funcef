inherited RptMotivo: TRptMotivo
  Left = 241
  Top = 198
  Width = 263
  Height = 270
  Caption = 'RptMotivo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem de Motivos e Ações'
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
    Formheight = 130
    FormWidth = 340
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpMotivo
    ConnectionType = cntBDE
  end
  object rpMotivo: TppReport
    AutoStop = False
    DataPipeline = ppMotivo
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
    object MotivoHdrBnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object MotivoLbl1: TppLabel
        UserName = 'MotivoLbl1'
        Caption = 'LISTAGEM DE MOTIVOS E AÇÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 69321
        mmTop = 10054
        mmWidth = 56621
        BandType = 0
      end
      object MotivoLbl2: TppLabel
        UserName = 'MotivoLbl2'
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
      object MotivoLbl3: TppLabel
        UserName = 'MotivoLbl3'
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
      object MotivoLbl4: TppLabel
        UserName = 'MotivoLbl4'
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
      object MotivoLbl5: TppLabel
        UserName = 'MotivoLbl5'
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
        mmWidth = 115094
        BandType = 0
      end
      object MotivoLine1: TppLine
        UserName = 'MotivoLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 180446
        BandType = 0
      end
      object MotivoDBTxt1: TppDBText
        UserName = 'MotivoDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppMotivo
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
      object rpMotivoLabel1: TppLabel
        UserName = 'rpMotivoLabel1'
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 17992
        mmWidth = 39688
        BandType = 0
      end
      object MotivoCalc1: TppSystemVariable
        UserName = 'MotivoCalc1'
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
      object MotivoCalc2: TppSystemVariable
        UserName = 'MotivoCalc2'
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
    object MotivoDtlBnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object MotivoDBTxt3: TppDBText
        UserName = 'MotivoDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppMotivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 529
        mmWidth = 115094
        BandType = 4
      end
      object MotivoDBTxt2: TppDBText
        UserName = 'MotivoDBTxt2'
        DataField = 'IDMOTIVO'
        DataPipeline = ppMotivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object rpMotivoDBText1: TppDBText
        UserName = 'rpMotivoDBText1'
        DataField = 'GRUPO'
        DataPipeline = ppMotivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 529
        mmWidth = 39688
        BandType = 4
      end
    end
    object MotivoFootBnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object MotivoSmryBnd1: TppSummaryBand
      AfterPrint = MotivoSmryBnd1AfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
    object MotivoGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppMotivo
      UserName = 'MotivoGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object MotivoGrpHdrBnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object MotivoGrpFootBnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object MotivoLbl6: TppLabel
          UserName = 'MotivoLbl6'
          Caption = 'Total de Motivos e Ações Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 2117
          mmWidth = 44715
          BandType = 5
          GroupNo = 0
        end
        object MotivoDBCalc1: TppDBCalc
          UserName = 'MotivoDBCalc1'
          DataField = 'IDMOTIVO'
          DataPipeline = ppMotivo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = MotivoGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 58738
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppMotivo: TppBDEPipeline
    DataSource = dsMotivo
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo'
    Left = 205
    Top = 48
  end
  object dsMotivo: TwwDataSource
    DataSet = CdsMotivo
    Left = 205
    Top = 96
  end
  object sqlMotivo: TCMSqlParams
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
    ClientDataSet = CdsMotivo
    Left = 205
    Top = 192
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsMotivoAfterOpen
    AfterScroll = CdsMotivoAfterScroll
    Left = 205
    Top = 144
  end
end
