inherited RptPenhora: TRptPenhora
  Width = 300
  Height = 282
  Caption = 'RptPenhora'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Selecao'
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
        Name = 'Selecao'
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
        Caption = 'Desvio'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'Desvio'
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
        Caption = 'NumProcessos'
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
        Name = 'NumProcessos'
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
    Report = rpPenhora
  end
  object rpPenhora: TppReport
    AutoStop = False
    DataPipeline = ppPenhora
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
    Left = 216
    Top = 7
    Version = '5.5'
    mmColumnWidth = 197300
    object rpPenhoraHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object rpPenhoraLbl1: TppLabel
        UserName = 'rpPenhoraLbl1'
        Caption = 'Excesso ou Insuficiência de Penhora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 10054
        mmWidth = 61913
        BandType = 0
      end
      object rpPenhoraLbl2: TppLabel
        UserName = 'rpPenhoraLbl2'
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
      object rpPenhoraLbl3: TppLabel
        UserName = 'rpPenhoraLbl3'
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
      object rpPenhoraLbl4: TppLabel
        UserName = 'rpPenhoraLbl4'
        AutoSize = False
        Caption = 'Nº Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 22490
        BandType = 0
      end
      object rpPenhoraLbl5: TppLabel
        UserName = 'rpPenhoraLbl5'
        AutoSize = False
        Caption = 'Contraparte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 22490
        mmWidth = 83873
        BandType = 0
      end
      object rpPenhoraLine1: TppLine
        UserName = 'rpPenhoraLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8996
        mmTop = 26988
        mmWidth = 180446
        BandType = 0
      end
      object rpPenhoraDBTxt1: TppDBText
        UserName = 'rpPenhoraDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppPenhora
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
      object rpPenhoraLbl6: TppLabel
        UserName = 'rpPenhoraLbl6'
        AutoSize = False
        Caption = 'Estimado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 121709
        mmTop = 22490
        mmWidth = 15875
        BandType = 0
      end
      object rpPenhoraSysVar1: TppSystemVariable
        UserName = 'rpPenhoraSysVar1'
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
      object rpPenhoraSysVar2: TppSystemVariable
        UserName = 'rpPenhoraSysVar2'
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Penhorado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 22490
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Excesso(+) / Insuf.(-)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 159544
        mmTop = 22490
        mmWidth = 29898
        BandType = 0
      end
      object LblDesvio: TppLabel
        UserName = 'LblDesvio'
        Caption = 'Desvio Acima de xxx%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 83344
        mmTop = 16140
        mmWidth = 30692
        BandType = 0
      end
    end
    object rpPenhoraDtlBnd: TppDetailBand
      BeforePrint = rpPenhoraDtlBndBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object rpPenhoraDBTxt3: TppDBText
        UserName = 'rpPenhoraDBTxt3'
        DataField = 'CONTRAPARTE'
        DataPipeline = ppPenhora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 1058
        mmWidth = 83873
        BandType = 4
      end
      object rpPenhoraDBTxt2: TppDBText
        UserName = 'rpPenhoraDBTxt2'
        DataField = 'PROCJCJNUM'
        DataPipeline = ppPenhora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 1058
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'ESTIMADO'
        DataPipeline = ppPenhora
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120386
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PENHORADO'
        DataPipeline = ppPenhora
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 1058
        mmWidth = 15346
        BandType = 4
      end
      object dbTxtDiferenca: TppDBText
        UserName = 'dbTxtDiferenca'
        DataField = 'DIFERENCA'
        DataPipeline = ppPenhora
        DisplayFormat = '#,0.00;#,0.00-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160000
        mmTop = 1058
        mmWidth = 22490
        BandType = 4
      end
    end
    object rpPenhoraFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
    end
    object rpPenhoraSmryBnd: TppSummaryBand
      AfterPrint = rpPenhoraSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2117
      mmPrintPosition = 0
    end
    object rpPenhoraGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppPenhora
      UserName = 'rpPenhoraGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPenhoraGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpPenhoraGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpPenhoraLbl7: TppLabel
          UserName = 'rpPenhoraLbl7'
          AutoSize = False
          Caption = 'Total de Processos Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 2117
          mmWidth = 37571
          BandType = 5
          GroupNo = 0
        end
        object rpPenhoraDBCalc1: TppDBCalc
          UserName = 'rpPenhoraDBCalc1'
          DataField = 'PROCJCJNUM'
          DataPipeline = ppPenhora
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpPenhoraGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppPenhora: TppBDEPipeline
    DataSource = dsPenhora
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Motivo3'
    Left = 216
    Top = 55
    object ppPenhorappField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppPenhorappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppPenhorappField3: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 25
      DisplayWidth = 25
      Position = 2
    end
    object ppPenhorappField4: TppField
      FieldAlias = 'CONTRAPARTE'
      FieldName = 'CONTRAPARTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppPenhorappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ESTIMADO'
      FieldName = 'ESTIMADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppPenhorappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PENHORADO'
      FieldName = 'PENHORADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppPenhorappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsPenhora: TwwDataSource
    DataSet = CdsPenhora
    Left = 216
    Top = 103
  end
  object CdsPenhora: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterOpen = CdsPenhoraAfterOpen
    AfterScroll = CdsPenhoraAfterScroll
    Left = 216
    Top = 151
    Data = {
      130100009619E0BD010000001800000007000000000003000000130107454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002003C000B4E554D50524F435452414208000400
      000000000A50524F434A434A4E554D0100490000000200075355425459504502
      0049000A00466978656443686172000557494454480200020019000B434F4E54
      5241504152544501004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002003C0008455354494D41444F08000400
      000000000950454E484F5241444F0800040000000000094449464552454E4341
      08000400000000000100044C4349440400010009040000}
  end
  object sqlPenhora: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  0 AS NUMPROCTRAB,'
      '  '#39'1234567890123456789012345'#39' AS PROCJCJNUM,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS CONTRAPARTE,'
      '  0 AS ESTIMADO,'
      '  0 AS PENHORADO,'
      '  0 AS DIFERENCA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      '')
    ClientDataSet = CdsPenhora
    Left = 216
    Top = 199
  end
end
