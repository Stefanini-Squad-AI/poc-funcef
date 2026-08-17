inherited dtmRelVeiculoMen: TdtmRelVeiculoMen
  Left = 307
  Top = 265
  Caption = 'dtmRelVeiculoMen'
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
        Caption = 'iAnoIni'
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
        Caption = 'iAnoFim'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppVeiculoMen
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  inherited cds: TClientDataSet
    Data = {
      280100009619E0BD01000000180000000E000000000003000000280107494D4F
      4E4F4D450100490000000100055749445448020002003C000E414E4F434F4D50
      4554454E434941080004000000000006564C524A414E08000400000000000656
      4C52464556080004000000000006564C524D4152080004000000000006564C52
      414252080004000000000006564C524D4149080004000000000006564C524A55
      4E080004000000000006564C524A554C080004000000000006564C5241474F08
      0004000000000006564C52534554080004000000000006564C524F5554080004
      000000000006564C524E4F56080004000000000006564C5244455A0800040000
      00000002000D44454641554C545F4F5244455202008200020000000100020004
      4C4349440400010009080000}
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT ANO.IMONOME, '
      '       ANO.ANOCOMPETENCIA, '
      '       NVL(JAN.VLRAPURACAO,0) AS VLRJAN, '
      '       NVL(FEV.VLRAPURACAO,0) AS VLRFEV, '
      '       NVL(MAR.VLRAPURACAO,0) AS VLRMAR, '
      '       NVL(ABR.VLRAPURACAO,0) AS VLRABR, '
      '       NVL(MAI.VLRAPURACAO,0) AS VLRMAI, '
      
        '       NVL(JUN.VLRAPURACAO,0) AS VLRJUN,                        ' +
        '     '
      '       NVL(JUL.VLRAPURACAO,0) AS VLRJUL, '
      '       NVL(AGO.VLRAPURACAO,0) AS VLRAGO, '
      '       NVL(SEB.VLRAPURACAO,0) AS VLRSET, '
      '       NVL(OUT.VLRAPURACAO,0) AS VLROUT, '
      '       NVL(NOV.VLRAPURACAO,0) AS VLRNOV, '
      
        '       NVL(DEZ.VLRAPURACAO,0) AS VLRDEZ                         ' +
        '           '
      '  FROM '
      '       ( '
      '         SELECT DISTINCT '
      '                AP.IDIMOVEL, '
      '                IM.IMONOME, '
      '                AP.ANOCOMPETENCIA'
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP, '
      '                IMOVEL IM '
      '          WHERE GI.IDSUBTIPO   = ST.IDSUBTIPO '
      '            AND GI.IDINDICADOR = AP.IDINDICADOR '
      '            AND AP.IDIMOVEL = IM.IDIMOVEL '
      '            AND ST.IDREPORTS = 3449 '
      '            AND AP.IDIMOVEL = 1227'
      
        '            AND AP.DATAAPURACAO >= TO_DATE('#39'01/01/2000'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      
        '            AND AP.DATAAPURACAO <= TO_DATE('#39'01/12/2002'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '       ) ANO, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 1             '
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) JAN, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 2             '
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) FEV, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 3             '
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) MAR, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 4             '
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) ABR, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 5'
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) MAI, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 6'
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) JUN, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 7'
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) JUL, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 8'
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) AGO, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 9 '
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) SEB, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 10 '
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) OUT, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 11'
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) NOV, '
      '       ( '
      
        '         SELECT AP.IDIMOVEL, AP.ANOCOMPETENCIA, SUM(AP.VLRAPURAC' +
        'AONUM) AS VLRAPURACAO '
      '           FROM INDGRPINDICADOR GI, '
      '                INDSUBTIPOINDICADOR ST, '
      '                INDAPURACAO AP '
      '           WHERE GI.IDSUBTIPO      = ST.IDSUBTIPO '
      '             AND GI.IDINDICADOR    = AP.IDINDICADOR'
      '             AND AP.MESCOMPETENCIA = 12'
      '             AND ST.IDREPORTS      = 3449           '
      '             AND AP.IDIMOVEL       = 1227 '
      '             AND AP.ANOCOMPETENCIA BETWEEN 2000 AND 2002 '
      '         GROUP BY AP.IDIMOVEL, AP.ANOCOMPETENCIA '
      '       ) DEZ '
      'WHERE ANO.IDIMOVEL       = JAN.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = JAN.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = FEV.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = FEV.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = MAR.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = MAR.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = ABR.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = ABR.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = MAI.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = MAI.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = JUN.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = JUN.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = JUL.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = JUL.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = AGO.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = AGO.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = SEB.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = SEB.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = OUT.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = OUT.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = NOV.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = NOV.ANOCOMPETENCIA(+) '
      '  AND ANO.IDIMOVEL       = DEZ.IDIMOVEL(+) '
      '  AND ANO.ANOCOMPETENCIA = DEZ.ANOCOMPETENCIA(+) '
      '  '
      'ORDER BY ANO.IMONOME, ANO.ANOCOMPETENCIA')
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 181
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'IMONOME'
      FieldName = 'IMONOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJAN'
      FieldName = 'VLRJAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRFEV'
      FieldName = 'VLRFEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMAR'
      FieldName = 'VLRMAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRABR'
      FieldName = 'VLRABR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMAI'
      FieldName = 'VLRMAI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUN'
      FieldName = 'VLRJUN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUL'
      FieldName = 'VLRJUL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAGO'
      FieldName = 'VLRAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSET'
      FieldName = 'VLRSET'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROUT'
      FieldName = 'VLROUT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNOV'
      FieldName = 'VLRNOV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDEZ'
      FieldName = 'VLRDEZ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object ppVeiculoMen: TppReport
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
    Left = 262
    Top = 64
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 14817
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
        mmLeft = 265
        mmTop = 2117
        mmWidth = 197380
        BandType = 0
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Fluxo de Veículos Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 265
        mmTop = 9260
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      AfterPrint = ppDetailBand1AfterPrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
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
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'VLRJAN'
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
        mmLeft = 15875
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VLRFEV'
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
        mmLeft = 29369
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VLRMAR'
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
        mmLeft = 42863
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'VLRABR'
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
        mmLeft = 56356
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'VLRMAI'
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
        mmLeft = 69850
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'VLRJUN'
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
        mmLeft = 83344
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VLRJUL'
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
        mmLeft = 96838
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object vTotAno: TppVariable
        UserName = 'vTotAno'
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
        mmLeft = 186267
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText101'
        BlankWhenZero = True
        DataField = 'VLRAGO'
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
        mmLeft = 110331
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRSET'
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
        mmLeft = 123825
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'VLROUT'
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
        mmLeft = 137319
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        BlankWhenZero = True
        DataField = 'VLRNOV'
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
        mmLeft = 150813
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        BlankWhenZero = True
        DataField = 'VLRDEZ'
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
        mmLeft = 164571
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
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
          Caption = 'JAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 19844
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel3: TppLabel
          UserName = 'OrcamentoLabel3'
          AutoSize = False
          Caption = 'FEV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 34131
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel6: TppLabel
          UserName = 'OrcamentoLabel6'
          AutoSize = False
          Caption = 'MAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 47890
          mmTop = 6879
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel7: TppLabel
          UserName = 'OrcamentoLabel7'
          AutoSize = False
          Caption = 'ABR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 60854
          mmTop = 6879
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel8: TppLabel
          UserName = 'OrcamentoLabel8'
          AutoSize = False
          Caption = 'MAI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75671
          mmTop = 6879
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel9: TppLabel
          UserName = 'OrcamentoLabel9'
          AutoSize = False
          Caption = 'JUN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 88371
          mmTop = 6879
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppOrcamentoLabel10: TppLabel
          UserName = 'OrcamentoLabel10'
          AutoSize = False
          Caption = 'JUL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 101600
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
          AutoSize = False
          Caption = 'Ano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 6879
          mmWidth = 6879
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
          mmLeft = 187325
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'OrcamentoLabel102'
          AutoSize = False
          Caption = 'AGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 115094
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'OrcamentoLabel103'
          AutoSize = False
          Caption = 'SET'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 128588
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'OrcamentoLabel104'
          AutoSize = False
          Caption = 'OUT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142082
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'NOV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155575
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'DEZ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 169334
          mmTop = 6879
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 122238
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 794
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppTeeChart1: TppTeeChart
          UserName = 'TeeChart1'
          mmHeight = 108744
          mmLeft = 794
          mmTop = 9790
          mmWidth = 196321
          BandType = 5
          GroupNo = 0
          object ppTeeChartControl1: TppTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -13
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Title.Text.Strings = (
              '')
            Title.Visible = False
            BottomAxis.LabelsSize = 8
            BottomAxis.Title.Caption = 'Meses'
            BottomAxis.TitleSize = 8
            LeftAxis.Title.Caption = 'KWh'
            LeftAxis.TitleSize = 8
            Legend.Alignment = laBottom
            Legend.ColorWidth = 30
            BevelOuter = bvNone
            Color = clWhite
            object BarSeries2: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              SeriesColor = clRed
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series1: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              SeriesColor = clTeal
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
            object Series2: TBarSeries
              Marks.ArrowLength = 20
              Marks.Visible = False
              SeriesColor = 16744448
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1
              YValues.Order = loNone
            end
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        44657461696C4265666F72655072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C3E01000070726F63656475726520
        44657461696C4265666F72655072696E743B0D0A626567696E0D0A202076546F
        74416E6F2E56616C7565203A3D2070706C5B27564C524A414E275D202B207070
        6C5B27564C52464556275D202B2070706C5B27564C524D4152275D202B0D0A20
        20202020202020202020202020202020202070706C5B27564C52414252275D20
        2B2070706C5B27564C524D4149275D202B2070706C5B27564C524A554E275D20
        2B0D0A2020202020202020202020202020202020202070706C5B27564C524A55
        4C275D202B2070706C5B27564C5241474F275D202B2070706C5B27564C525345
        54275D202B0D0A2020202020202020202020202020202020202070706C5B2756
        4C524F5554275D202B2070706C5B27564C524E4F56275D202B2070706C5B2756
        4C5244455A275D3B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060644657461696C094576656E744E616D65060B4265666F72655072696E
        74074576656E74494402180000}
    end
  end
end
