inherited dtmRelVeiculoSem: TdtmRelVeiculoSem
  Left = 311
  Top = 215
  Width = 334
  Height = 147
  Caption = 'dtmRelVeiculoSem'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'idImovel'
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
        Caption = 'dtIni'
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
        Caption = 'dtFim'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppVeiculoSem
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      6F0200009619E0BD01000000180000000A000400000003000000FB0007494D4F
      4E4F4D450100490000000100055749445448020002003C00074453435F4D4553
      01004900000001000557494454480200020009000E414E4F434F4D504554454E
      434941080004000000000006564C52444F4D080004000000000006564C525345
      47080004000000000006564C52544552080004000000000006564C5251554108
      0004000000000006564C52515549080004000000000006564C52534558080004
      000000000006564C52534142080004000000000002000D44454641554C545F4F
      524445520200820003000000010002000300044C434944040001000908000000
      0000000E4E6F7274652053686F7070696E670946455645524549524F00000000
      00489F4000000000002FC3400000000080DEC54000000000809EC64000000000
      00FBC24000000000809DC74000000000003EB54000000000002DC14000000000
      0E4E6F7274652053686F7070696E67094A414E4549524F20200000000000489F
      400000000000FBC24000000000809DC74000000000003FB9400000000000C7C6
      40000000008027C3400000000000D2C54000000000809EC640000000000E4E6F
      7274652053686F7070696E67094D4152C74F202020200000000000489F400000
      0000004AC7400000000000F2C640000000008028C740000000000067B3400000
      0000005BBD4000000000800EC240000000008046C440000000000E53686F7070
      696E672042617272610946455645524549524F0000000000489F400000000000
      2FC3400000000080DEC54000000000809EC6400000000000FBC2400000000080
      9DC74000000000003EB54000000000002DC140}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT ME.IMONOME,'
      '       ME.DSC_MES,'
      '       ME.ANOCOMPETENCIA,'
      '       NVL(DOM.VLRAPURACAO,0) AS VLRDOM,'
      '       NVL(SEG.VLRAPURACAO,0) AS VLRSEG,'
      '       NVL(TER.VLRAPURACAO,0) AS VLRTER,'
      '       NVL(QUA.VLRAPURACAO,0) AS VLRQUA,'
      '       NVL(QUI.VLRAPURACAO,0) AS VLRQUI,'
      '       NVL(SEX.VLRAPURACAO,0) AS VLRSEX,'
      '       NVL(SAB.VLRAPURACAO,0) AS VLRSAB'
      ''
      '  FROM'
      '       ('
      '         SELECT DISTINCT IM.IMONOME,'
      
        '                TO_CHAR(AP.ANOCOMPETENCIA) || TO_CHAR(AP.MESCOMP' +
        'ETENCIA) AS ANOMES,'
      '                AP.ANOCOMPETENCIA,'
      
        '                TO_CHAR( TO_DATE('#39'01/'#39'||TO_CHAR(AP.MESCOMPETENCI' +
        'A,'#39'00'#39')||TO_CHAR(AP.ANOCOMPETENCIA,'#39'0000'#39')), '#39'MONTH'#39') AS DSC_MES'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP,'
      '                IMOVEL IM'
      '          WHERE GI.IDSUBTIPO = 2'
      '            AND GI.IDINDICADOR = AP.IDINDICADOR'
      '            AND AP.IDIMOVEL = IM.IDIMOVEL'
      '       ) ME,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 1'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) DOM,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 2'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) SEG,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 3'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) TER,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 4'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) QUA,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 5'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) QUI,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 6'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) SEX,'
      '       ('
      
        '         SELECT TO_CHAR(ANOCOMPETENCIA)||TO_CHAR(MESCOMPETENCIA)' +
        ' AS ANOMES,'
      '                SUM(VLRAPURACAONUM) AS VLRAPURACAO'
      '           FROM INDGRPINDICADOR GI,'
      '                INDAPURACAO AP'
      '           WHERE GI.IDSUBTIPO = 2'
      '             AND GI.IDINDICADOR = AP.IDINDICADOR'
      '             AND TO_CHAR(AP.DATAAPURACAO,'#39'D'#39') = 7'
      '         GROUP BY MESCOMPETENCIA, ANOCOMPETENCIA'
      '       ) SAB'
      ''
      'WHERE ME.ANOMES = DOM.ANOMES(+)'
      '  AND ME.ANOMES = SEG.ANOMES(+)'
      '  AND ME.ANOMES = TER.ANOMES(+)'
      '  AND ME.ANOMES = QUA.ANOMES(+)'
      '  AND ME.ANOMES = QUI.ANOMES(+)'
      '  AND ME.ANOMES = SEX.ANOMES(+)'
      '  AND ME.ANOMES = SAB.ANOMES(+)'
      ''
      'ORDER BY IMONOME, DSC_MES, ANOCOMPETENCIA')
    ClientDataSet = nil
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 182
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplppField2: TppField
      FieldAlias = 'DSC_MES'
      FieldName = 'DSC_MES'
      FieldLength = 9
      DisplayWidth = 9
      Position = 1
    end
    object pplppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDOM'
      FieldName = 'VLRDOM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSEG'
      FieldName = 'VLRSEG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTER'
      FieldName = 'VLRTER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRQUA'
      FieldName = 'VLRQUA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRQUI'
      FieldName = 'VLRQUI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSEX'
      FieldName = 'VLRSEX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSAB'
      FieldName = 'VLRSAB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object ppVeiculoSem: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 261
    Top = 66
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Fluxo de Veículos Semanal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 7142
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4318
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DSC_MES'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 6615
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 29369
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRDOM'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 53446
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLRSEG'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 68263
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'VLRTER'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLRQUA'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 97367
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRQUI'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 111919
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRSEX'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRSAB'
        DataPipeline = ppl
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 141288
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object vTotMes: TppVariable
        UserName = 'vTotMes'
        CalcOrder = 0
        DataType = dtInteger
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 158221
        mmTop = 529
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IMONOME'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'IMONOME'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine1: TppLine
          UserName = 'OrcamentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel2: TppLabel
          UserName = 'OrcamentoLabel2'
          AutoSize = False
          Caption = 'DOM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 58208
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel3: TppLabel
          UserName = 'OrcamentoLabel3'
          AutoSize = False
          Caption = 'SEG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 73819
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel6: TppLabel
          UserName = 'OrcamentoLabel6'
          AutoSize = False
          Caption = 'TER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 88636
          mmTop = 6879
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel7: TppLabel
          UserName = 'OrcamentoLabel7'
          AutoSize = False
          Caption = 'QUA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 102659
          mmTop = 6879
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel8: TppLabel
          UserName = 'OrcamentoLabel8'
          AutoSize = False
          Caption = 'QUI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 118534
          mmTop = 6879
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel9: TppLabel
          UserName = 'OrcamentoLabel9'
          AutoSize = False
          Caption = 'SEX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 132292
          mmTop = 6879
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel10: TppLabel
          UserName = 'OrcamentoLabel10'
          AutoSize = False
          Caption = 'SAB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 146844
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLine2: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 10583
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 6615
          mmTop = 6879
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'OrcamentoLabel101'
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 164307
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 124884
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label2'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 6350
          mmTop = 2381
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object vTDom: TppVariable
          UserName = 'vTDom'
          AutoSize = False
          CalcOrder = 0
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 53446
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTSeg: TppVariable
          UserName = 'vTSeg'
          AutoSize = False
          CalcOrder = 1
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 68263
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTTer: TppVariable
          UserName = 'vTTer'
          AutoSize = False
          CalcOrder = 2
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 82815
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTQua: TppVariable
          UserName = 'vTQua'
          AutoSize = False
          CalcOrder = 3
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 97367
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTQui: TppVariable
          UserName = 'vTQui'
          AutoSize = False
          CalcOrder = 4
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 111919
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTSex: TppVariable
          UserName = 'vTSex'
          AutoSize = False
          CalcOrder = 5
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 126471
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTSab: TppVariable
          UserName = 'vTSab'
          AutoSize = False
          CalcOrder = 6
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 141288
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object vTGeral: TppVariable
          UserName = 'vTGeral'
          AutoSize = False
          CalcOrder = 7
          DataType = dtInteger
          DisplayFormat = '#,0;-#,0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 159544
          mmTop = 2381
          mmWidth = 13758
          BandType = 5
          GroupNo = 0
        end
        object ppGrafico: TppTeeChart
          UserName = 'Grafico'
          mmHeight = 107156
          mmLeft = 31221
          mmTop = 11906
          mmWidth = 133879
          BandType = 5
          GroupNo = 0
          object ppTeeChartControl1: TppTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            BackWall.Pen.Visible = False
            MarginBottom = 0
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -15
            Title.Font.Name = 'Arial'
            Title.Font.Style = []
            Title.Text.Strings = (
              'Fluxo de Veículos Semanal Acumulado')
            AxisVisible = False
            Chart3DPercent = 50
            ClipPoints = False
            Frame.Visible = False
            Legend.Alignment = laBottom
            Legend.ColorWidth = 20
            Legend.HorizMargin = 10
            Legend.TopPos = 25
            View3DWalls = False
            BevelOuter = bvNone
            Color = clWhite
            object PieSeries1: TPieSeries
              Marks.Arrow.Visible = False
              Marks.ArrowLength = 8
              Marks.BackColor = clWhite
              Marks.Frame.Visible = False
              Marks.Style = smsLegend
              Marks.Transparent = True
              Marks.Visible = False
              PercentFormat = '##0 %'
              SeriesColor = clRed
              Title = 'Pizza'
              ValueFormat = '#,##0'
              ExplodeBiggest = 1
              OtherSlice.Text = 'Other'
              PieValues.DateTime = False
              PieValues.Name = 'Pie'
              PieValues.Multiplier = 1
              PieValues.Order = loNone
            end
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C0201000070726F63656475726520
        44657461696C4265666F72655072696E743B0D0A626567696E0D0A2020207654
        6F744D65732E4173496E7465676572203A3D2070706C5B27564C52444F4D275D
        202B2070706C5B27564C52534547275D202B0D0A202020202020202020202020
        20202020202020202020202070706C5B27564C52544552275D202B2070706C5B
        27564C52515541275D202B0D0A20202020202020202020202020202020202020
        202020202070706C5B27564C52515549275D202B2070706C5B27564C52534558
        275D202B0D0A2020202020202020202020202020202020202020202020207070
        6C5B27564C52534142275D3B202020200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060644657461696C094576656E744E616D65060B4265666F7265
        5072696E74074576656E74494402180001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65061A47726F757048656164657242616E6431
        41667465725072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C1701000070726F6365647572652047726F75704865
        6164657242616E643141667465725072696E743B0D0A626567696E0D0A202020
        7654446F6D2E4173496E74656765722020203A3D20303B0D0A20202076545365
        672E4173496E74656765722020203A3D20303B0D0A20202076545465722E4173
        496E74656765722020203A3D20303B0D0A20202076545175612E4173496E7465
        6765722020203A3D20303B2020200D0A20202076545175692E4173496E746567
        65722020203A3D20303B0D0A20202076545365782E4173496E74656765722020
        203A3D20303B0D0A20202076545361622E4173496E74656765722020203A3D20
        303B0D0A2020207654476572616C2E4173496E7465676572203A3D20303B0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65061047726F75704865616465
        7242616E6431094576656E744E616D65060A41667465725072696E7407457665
        6E74494402170001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061044657461696C41667465725072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F757263650CB902000070726F63
        65647572652044657461696C41667465725072696E743B0D0A626567696E0D0A
        2020207654446F6D2E4173496E7465676572203A3D207654446F6D2E4173496E
        7465676572202B2070706C5B27564C52444F4D275D3B0D0A2020207654536567
        2E4173496E7465676572203A3D2076545365672E4173496E7465676572202B20
        70706C5B27564C52534547275D3B0D0A20202076545465722E4173496E746567
        6572203A3D2076545465722E4173496E7465676572202B2070706C5B27564C52
        544552275D3B0D0A20202076545175612E4173496E7465676572203A3D207654
        5175612E4173496E7465676572202B2070706C5B27564C52515541275D3B0D0A
        20202076545175692E4173496E7465676572203A3D2076545175692E4173496E
        7465676572202B2070706C5B27564C52515549275D3B0D0A2020207654536578
        2E4173496E7465676572203A3D2076545365782E4173496E7465676572202B20
        70706C5B27564C52534558275D3B2020200D0A20202076545361622E4173496E
        7465676572203A3D2076545361622E4173496E7465676572202B2070706C5B27
        564C52534142275D3B2020200D0A2020200D0A2020207654476572616C2E4173
        496E7465676572203A3D207654446F6D2E4173496E7465676572202B20765453
        65672E4173496E7465676572202B0D0A20202020202020202020202020202020
        202020202020202076545465722E4173496E7465676572202B2076545175612E
        4173496E7465676572202B0D0A20202020202020202020202020202020202020
        202020202076545175692E4173496E7465676572202B2076545365782E417349
        6E7465676572202B0D0A20202020202020202020202020202020202020202020
        202076545361622E4173496E74656765723B200D0A2020202020202020202020
        202020202020202020202020200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060644657461696C094576656E744E616D65060A41667465725072696E
        74074576656E74494402170000}
    end
  end
end
