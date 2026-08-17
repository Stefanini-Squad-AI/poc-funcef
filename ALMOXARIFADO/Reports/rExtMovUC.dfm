inherited RptExtMovUC: TRptExtMovUC
  Left = 663
  Top = 278
  Width = 289
  Height = 158
  Caption = 'Extrato da Movimentação por Unidade de Custeio'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Extrato da Movimentação por Unidade de Custeio'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Unidade de Custeio'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODCUSTEIO, DESCCUSTEIO'
          'FROM UNCUSTEI'
          'ORDER BY 2')
        LookupSettings.Chave = 'CODCUSTEIO'
        LookupSettings.Display = 'DESCCUSTEIO'
        LookupSettings.Descricao = 'DESCCUSTEIO'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Unidade de Custeio'
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
        Caption = 'Data Inicial'
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
        MostraComboCompara = False
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataInicial'
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
        Caption = 'Data Final'
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
        MostraComboCompara = False
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataFinal'
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
        Caption = 'Item'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          
            'SELECT (P.DESCPROD || '#39' '#39' || T.DESCTAMANHO || '#39' '#39' || C.DESCCOR) ' +
            'AS DESCRICAO,'
          '       A.CODARTIGO '
          'FROM ARTIGO A, TAMANHO T, PRODUTO P, COR C'
          'WHERE P.CODPRODUTO = A.CODPRODUTO '
          '   AND A.CODCOR = C.CODCOR(+) '
          '   AND A.CODTAMANHO = T.CODTAMANHO(+) '
          'Order By DESCRICAO')
        LookupSettings.Chave = 'CODARTIGO'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'DESCRICAO'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Item'
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
        Caption = 'Grupo de Produtos'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCGRUPOPROD, CODGRUPOPROD'
          'FROM GRUPPROD'
          'WHERE STATUSGRUPO = '#39'A'#39
          'ORDER BY DESCGRUPOPROD')
        LookupSettings.Chave = 'CODGRUPOPROD'
        LookupSettings.Display = 'DESCGRUPOPROD'
        LookupSettings.Descricao = 'DESCGRUPOPROD'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Grupo de Produtos'
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
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 200
    FormWidth = 440
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptExtMovUC
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object BdeExtMovUC: TppBDEPipeline
    DataSource = dsExtMovUC
    UserName = 'BdeExtMovUC'
    Left = 81
    Top = 63
  end
  object dsExtMovUC: TwwDataSource
    DataSet = CdsExtMovUC
    Left = 140
    Top = 64
  end
  object RptExtMovUC: TppReport
    AutoStop = False
    DataPipeline = BdeExtMovUC
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 1270
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 24
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand25: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 130704
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel150: TppLabel
        UserName = 'ppLabel150'
        Caption = 'Unidade de Custeio : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 20108
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel153: TppLabel
        UserName = 'ppLabel153'
        Caption = 'EXTRATO DA MOVIMENTAÇÃO DE ITEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 103717
        mmTop = 8996
        mmWidth = 82021
        BandType = 0
      end
      object LbUnCusteio: TppLabel
        UserName = 'LbUnCusteio'
        Caption = 'LbUnCusteio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 37042
        mmTop = 20108
        mmWidth = 19315
        BandType = 0
      end
      object LbPeriodo: TppLabel
        UserName = 'LbPeriodo'
        Caption = 'LbPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 15081
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText58: TppDBText
        UserName = 'ppDBText58'
        DataField = 'DATAMOV'
        DataPipeline = BdeExtMovUC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'ppDBText61'
        AutoSize = True
        DataField = 'NUMDOCUMENTO'
        DataPipeline = BdeExtMovUC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 14817
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        AutoSize = True
        DataField = 'ENTRADA'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 46302
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'ppDBText63'
        AutoSize = True
        DataField = 'SAIDA'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 74083
        mmTop = 265
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'ppDBText64'
        AutoSize = True
        DataField = 'SALDOQTDEMOV'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 83873
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'ppDBText65'
        AutoSize = True
        DataField = 'V_ENTRADA'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 113506
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'ppDBText66'
        AutoSize = True
        DataField = 'V_SAIDA'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 142611
        mmTop = 265
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'ppDBText67'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 167482
        mmTop = 265
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'ppDBText68'
        AutoSize = True
        DataField = 'CUSTOMEDIOMOV'
        DataPipeline = BdeExtMovUC
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 168805
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'ppDBText69'
        AutoSize = True
        DataField = 'DATALANCMOV'
        DataPipeline = BdeExtMovUC
        DisplayFormat = 'dd/mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 251884
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'ppDBText70'
        DataField = 'CODTIPOMOV'
        DataPipeline = BdeExtMovUC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 195527
        mmTop = 265
        mmWidth = 2910
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'ppDBText71'
        DataField = 'HISTORICO'
        DataPipeline = BdeExtMovUC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 199232
        mmTop = 265
        mmWidth = 32544
        BandType = 4
      end
      object RptExtMovUCDBText1: TppDBText
        UserName = 'RptExtMovUCDBText1'
        DataField = 'ALMOXORIG'
        DataPipeline = BdeExtMovUC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 234421
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object RptExtMovUCDBText2: TppDBText
        UserName = 'RptExtMovUCDBText2'
        DataField = 'ALMOXDEST'
        DataPipeline = BdeExtMovUC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 248180
        mmTop = 265
        mmWidth = 10583
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object LblSistema: TppLabel
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
        mmLeft = 1058
        mmTop = 794
        mmWidth = 40746
        BandType = 8
      end
      object ppLine63: TppLine
        UserName = 'ppLine63'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 273051
        BandType = 8
      end
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 119327
        mmTop = 529
        mmWidth = 45508
        BandType = 8
      end
      object ppCalc49: TppSystemVariable
        UserName = 'Calc49'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 239184
        mmTop = 529
        mmWidth = 29633
        BandType = 8
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'CODARTIGO'
      DataPipeline = BdeExtMovUC
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23019
        mmPrintPosition = 0
        object ppLine64: TppLine
          UserName = 'ppLine64'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 10848
          mmWidth = 273315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel158: TppLabel
          UserName = 'ppLabel158'
          Caption = 'Data Movimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 15346
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel159: TppLabel
          UserName = 'ppLabel159'
          Caption = 'Artigo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1588
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLine65: TppLine
          UserName = 'ppLine65'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 20373
          mmWidth = 273580
          BandType = 3
          GroupNo = 0
        end
        object ppLabel160: TppLabel
          UserName = 'ppLabel160'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 22490
          mmTop = 15346
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel161: TppLabel
          UserName = 'ppLabel161'
          Caption = 'Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 47890
          mmTop = 15610
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel162: TppLabel
          UserName = 'ppLabel162'
          Caption = 'Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 74083
          mmTop = 15346
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel163: TppLabel
          UserName = 'ppLabel163'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 97631
          mmTop = 15346
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel164: TppLabel
          UserName = 'ppLabel164'
          Caption = 'Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 118269
          mmTop = 15346
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel165: TppLabel
          UserName = 'ppLabel165'
          Caption = 'Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 143934
          mmTop = 15346
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel166: TppLabel
          UserName = 'ppLabel166'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 167217
          mmTop = 15346
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel167: TppLabel
          UserName = 'ppLabel167'
          Caption = ' Quantidade  na Unidade de Transf /Compra '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          mmHeight = 3969
          mmLeft = 39423
          mmTop = 8202
          mmWidth = 64823
          BandType = 3
          GroupNo = 0
        end
        object ppLine66: TppLine
          UserName = 'ppLine66'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 37571
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppLine67: TppLine
          UserName = 'ppLine67'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 106363
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppLabel168: TppLabel
          UserName = 'ppLabel168'
          Caption = ' Valor '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          mmHeight = 3969
          mmLeft = 137054
          mmTop = 8202
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLine68: TppLine
          UserName = 'ppLine68'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 177007
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppLabel169: TppLabel
          UserName = 'ppLabel169'
          Caption = ' P. Médio '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          mmHeight = 3969
          mmLeft = 179123
          mmTop = 8202
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel170: TppLabel
          UserName = 'ppLabel170'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 185473
          mmTop = 15346
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel171: TppLabel
          UserName = 'ppLabel171'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 208492
          mmTop = 15346
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel172: TppLabel
          UserName = 'ppLabel172'
          Caption = 'Data Lanc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 260351
          mmTop = 15346
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLine69: TppLine
          UserName = 'ppLine69'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 194469
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppDBText72: TppDBText
          UserName = 'ppDBText72'
          DataField = 'CODARTIGO'
          DataPipeline = BdeExtMovUC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 13229
          mmTop = 1588
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel173: TppLabel
          UserName = 'ppLabel173'
          Caption = 'Unid.: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 102659
          mmTop = 1588
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppDBText73: TppDBText
          UserName = 'ppDBText73'
          DataField = 'DESCMEDIDA'
          DataPipeline = BdeExtMovUC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 113771
          mmTop = 1588
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel174: TppLabel
          UserName = 'ppLabel174'
          Caption = 'Saldo Anterior '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 137848
          mmTop = 1588
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText74: TppDBText
          UserName = 'ppDBText74'
          AutoSize = True
          DataField = 'SALDOANT'
          DataPipeline = BdeExtMovUC
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 199232
          mmTop = 1588
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel175: TppLabel
          UserName = 'ppLabel175'
          Caption = 'Valor : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 223573
          mmTop = 1588
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppDBText75: TppDBText
          UserName = 'ppDBText75'
          AutoSize = True
          DataField = 'VALORANT'
          DataPipeline = BdeExtMovUC
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 240771
          mmTop = 1588
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel176: TppLabel
          UserName = 'ppLabel176'
          Caption = 'Quantidade : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168540
          mmTop = 1588
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel177: TppLabel
          UserName = 'ppLabel177'
          AutoSize = False
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35983
          mmTop = 1588
          mmWidth = 1588
          BandType = 3
          GroupNo = 0
        end
        object ppDBText76: TppDBText
          UserName = 'ppDBText76'
          DataField = 'DESCPROD'
          DataPipeline = BdeExtMovUC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38100
          mmTop = 1588
          mmWidth = 63500
          BandType = 3
          GroupNo = 0
        end
        object ppImage1: TppImage
          UserName = 'ppImage1'
          MaintainAspectRatio = False
          AutoSize = True
          Picture.Data = {
            07544269746D61706A000000424D6A000000000000003E000000280000001000
            00000B00000001000100000000002C0000000000000000000000020000000200
            000000000000FFFFFF00FFFF0000FFFF0000FF3F0000FF9F0000FFCF0000E007
            0000E0070000FFCF0000FF9F0000FF3F0000FFFF0000}
          mmHeight = 2910
          mmLeft = 163513
          mmTop = 2646
          mmWidth = 4233
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovUCLine1: TppLine
          UserName = 'RptExtMovUCLine1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 233098
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovUCLine2: TppLine
          UserName = 'RptExtMovUCLine2'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 259557
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovUCLabel1: TppLabel
          UserName = 'RptExtMovUCLabel1'
          Caption = '  Almoxarifado  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          mmHeight = 3969
          mmLeft = 235215
          mmTop = 8202
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovUCLabel2: TppLabel
          UserName = 'RptExtMovUCLabel2'
          Caption = 'Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 249503
          mmTop = 15346
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object RptExtMovUCLabel3: TppLabel
          UserName = 'RptExtMovUCLabel3'
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 235480
          mmTop = 15346
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'ppShape3'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 265
          mmWidth = 271728
          BandType = 5
          GroupNo = 0
        end
        object ppLabel178: TppLabel
          UserName = 'ppLabel178'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 1588
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'ppDBCalc15'
          AutoSize = True
          DataField = 'ENTRADA'
          DataPipeline = BdeExtMovUC
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 33867
          mmTop = 1588
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'ppDBCalc16'
          AutoSize = True
          DataField = 'SAIDA'
          DataPipeline = BdeExtMovUC
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 62442
          mmTop = 1588
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'ppDBCalc17'
          AutoSize = True
          DataField = 'V_ENTRADA'
          DataPipeline = BdeExtMovUC
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 100806
          mmTop = 1588
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'ppDBCalc18'
          AutoSize = True
          DataField = 'V_SAIDA'
          DataPipeline = BdeExtMovUC
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 130440
          mmTop = 1588
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlParExtMovUC: TCMSqlParams
    SQL.Strings = (
      'SELECT M.CODARTIGO,'
      '       M.DATAMOV,'
      '       M.QTDEMOV,'
      '       M.VALORMOV,'
      '       M.DATALANCMOV,'
      '       M.CUSTOMEDIOMOV,'
      '       M.SALDOQTDEMOV,'
      '       M.NUMDOCUMENTO,'
      '       M.CODTIPOMOV,'
      '       U.DESCMEDIDA,'
      '       M.IDMOV,'
      '       T.DESCTIPOMOV,'
      '       P.DESCPROD,'
      
        '       ( DECODE( SIGN( M.QTDEMOV ),   1, M.QTDEMOV ) ) AS ENTRAD' +
        'A,'
      
        '       ( DECODE( SIGN( M.QTDEMOV ),  -1, ABS( M.QTDEMOV ) ) ) AS' +
        ' SAIDA,'
      
        '       ( DECODE( SIGN( M.VALORMOV ),  1, M.VALORMOV ) ) AS V_ENT' +
        'RADA,'
      
        '       ( DECODE( SIGN( M.VALORMOV ), -1, ABS( M.VALORMOV ) ) ) A' +
        'S V_SAIDA,'
      '       ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV) AS VALOR,'
      
        '       ( DECODE( SIGN( M.QTDEMOV ), 1, ( ABS( M.QTDEMOV ) - M.SA' +
        'LDOQTDEMOV ), ( ABS( M.QTDEMOV ) + M.SALDOQTDEMOV ) ) ) AS SALDO' +
        'ANT,'
      
        '       ( DECODE( SIGN( M.QTDEMOV ), 1, ( ABS( M.VALORMOV ) - ( M' +
        '.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) ), ( ABS( M.VALORMOV ) + (M.SA' +
        'LDOQTDEMOV * M.CUSTOMEDIOMOV ) ) ) ) AS VALORANT,'
      '       T.DESCRESUMIDA AS HISTORICO,'
      '       M.CODALMOXARIFADO AS ALMOXORIG,'
      '       M.CODALMOXTRANSF  AS ALMOXDEST'
      'FROM MOVIMENT M,'
      '     PRODUTO  P,'
      '     UNMEDIDA U,'
      '     TIPOMOV T,'
      '     ALMOX A'
      'WHERE ( M.CODALMOXARIFADO IN ( SELECT CODALMOXARIFADO'
      '                                 FROM ALMOX'
      '                                WHERE ( CODCUSTEIO = :UC ) ) )'
      '  AND ( M.IDPESSOA = :IDEMPRESA )'
      '  AND ( M.DATAMOV >= :DATAINI )'
      '  AND ( M.DATAMOV <= :DATAFIM )'
      '  AND ( M.CODARTIGO = :ITEM )'
      '  AND ( P.CODGRUPOPROD = :GRUPO )'
      '  AND ( SUBSTR( M.CODARTIGO, 1, 6 ) = P.CODPRODUTO )'
      '  AND ( M.CODTIPOMOV  = T.CODTIPOMOV )'
      '  AND ( P.CODMEDCUSTO = U.CODMEDIDA )'
      '  AND ( M.CODALMOXARIFADO = A.CODALMOXARIFADO )'
      'ORDER BY M.CODARTIGO, M.DATAMOV, M.IDMOV')
    ClientDataSet = CdsExtMovUC
    Left = 200
    Top = 8
  end
  object CdsExtMovUC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 64
  end
end
