inherited RptVara: TRptVara
  Left = 285
  Top = 203
  Width = 255
  Height = 268
  Caption = 'RptVara'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem dos Órgãos Jurisdicionais (Varas)'
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
    Report = rpVara
    ConnectionType = cntBDE
  end
  object rpVara: TppReport
    AutoStop = False
    DataPipeline = ppVara
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
    object rpVaraHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object rpVaraLbl1: TppLabel
        UserName = 'rpVaraLbl1'
        Caption = 'Listagem dos Órgãos Jurisdicionais (Varas)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 61648
        mmTop = 10054
        mmWidth = 74083
        BandType = 0
      end
      object rpVaraLbl2: TppLabel
        UserName = 'rpVaraLbl2'
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
        mmTop = 6350
        mmWidth = 9260
        BandType = 0
      end
      object rpVaraLbl3: TppLabel
        UserName = 'rpVaraLbl3'
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
        mmWidth = 14288
        BandType = 0
      end
      object rpVaraLbl4: TppLabel
        UserName = 'rpVaraLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 18256
        mmWidth = 15000
        BandType = 0
      end
      object rpVaraLbl5: TppLabel
        UserName = 'rpVaraLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 18256
        mmWidth = 116681
        BandType = 0
      end
      object rpVaraLine1: TppLine
        UserName = 'rpVaraLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 1852
        mmTop = 22490
        mmWidth = 188000
        BandType = 0
      end
      object rpVaraDBTxt1: TppDBText
        UserName = 'rpVaraDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppVara
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
      object rpVaraSysVar1: TppSystemVariable
        UserName = 'rpVaraSysVar1'
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
        mmTop = 6350
        mmWidth = 23283
        BandType = 0
      end
      object rpVaraSysVar2: TppSystemVariable
        UserName = 'rpVaraSysVar2'
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Sigla UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 18256
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Nome UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 18256
        mmWidth = 22490
        BandType = 0
      end
    end
    object rpVaraDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rpVaraDBTxt3: TppDBText
        UserName = 'rpVaraDBTxt3'
        DataField = 'DESCRICAO'
        DataPipeline = ppVara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 794
        mmWidth = 116681
        BandType = 4
      end
      object rpVaraDBTxt2: TppDBText
        UserName = 'rpVaraDBTxt2'
        DataField = 'IDVARAJUSTICA'
        DataPipeline = ppVara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 794
        mmWidth = 15000
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'UF'
        DataPipeline = ppVara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMEESTADO'
        DataPipeline = ppVara
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 794
        mmWidth = 35983
        BandType = 4
      end
    end
    object rpVaraFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpVaraSmryBnd: TppSummaryBand
      BeforePrint = rpVaraSmryBndBeforePrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpVaraGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppVara
      UserName = 'rpVaraGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpVaraGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpVaraGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpVaraLbl6: TppLabel
          UserName = 'rpVaraLbl6'
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
        object rpVaraDBCalc1: TppDBCalc
          UserName = 'rpVaraDBCalc1'
          DataField = 'IDVARAJUSTICA'
          DataPipeline = ppVara
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpVaraGrp1
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
  object ppVara: TppBDEPipeline
    DataSource = dsVara
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Vara'
    Left = 205
    Top = 48
    object ppVarappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDVARAJUSTICA'
      FieldName = 'IDVARAJUSTICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppVarappField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppVarappField3: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object ppVarappField4: TppField
      FieldAlias = 'NOMEESTADO'
      FieldName = 'NOMEESTADO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
  end
  object dsVara: TwwDataSource
    DataSet = CdsVara
    Left = 205
    Top = 96
  end
  object sqlVara: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  1234567890 IDVARAJUSTICA, '
      '  '#39'1234567890123456789012345678901234567890'#39' DESCRICAO, '
      '  '#39'XYZ'#39' UF, '
      '  '#39'123456789012345678901234567890'#39' NOMEESTADO'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)'
      ' ')
    ClientDataSet = CdsVara
    Left = 205
    Top = 192
  end
  object CdsVara: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 205
    Top = 144
    Data = {
      D90000009619E0BD010000001800000004000000000003000000D9000D494456
      4152414A55535449434108000400000000000944455343524943414F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      544802000200280002554601004900000002000753554254595045020049000A
      00466978656443686172000557494454480200020003000A4E4F4D4545535441
      444F01004900000002000753554254595045020049000A004669786564436861
      7200055749445448020002001E000100044C4349440400010009080000}
  end
end
