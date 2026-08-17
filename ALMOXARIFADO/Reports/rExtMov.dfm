inherited RptExtMov: TRptExtMov
  Left = 610
  Top = 75
  Width = 280
  Height = 144
  Caption = 'Extrato da Movimentação de Item'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Extrato da Movimentação de Item'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALMOXARIFADO, DESCALMOX'
          'FROM ALMOX'
          'ORDER BY DESCALMOX')
        LookupSettings.Chave = 'CODALMOXARIFADO'
        LookupSettings.Display = 'DESCALMOX'
        LookupSettings.Descricao = 'DESCALMOX'
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
        Name = 'Almoxarifado'
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
          
            'SELECT A.CODARTIGO, (P.DESCPROD || '#39' '#39' || T.DESCTAMANHO || '#39' '#39' |' +
            '| C.DESCCOR) AS DESCRICAO'
          'FROM ARTIGO A, TAMANHO T, PRODUTO P, COR C'
          'WHERE P.CODPRODUTO = A.CODPRODUTO '
          'AND A.CODCOR = C.CODCOR(+) '
          'AND A.CODTAMANHO = T.CODTAMANHO(+) '
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
          'SELECT CODGRUPOPROD, DESCGRUPOPROD'
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
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptExtMov
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object bdeExtMov: TppBDEPipeline
    DataSource = dsExtMov
    UserName = 'bdeExtMov'
    Left = 85
    Top = 60
  end
  object dsExtMov: TwwDataSource
    DataSet = CdsExtMov
    Left = 140
    Top = 60
  end
  object rptExtMov: TppReport
    AutoStop = False
    DataPipeline = bdeExtMov
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
    Top = 61
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
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
        mmLeft = 121973
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object lbAlmox: TppLabel
        UserName = 'lbAlmox'
        Caption = 'LbAlmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 20108
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'EXTRATO DA MOVIMENTAÇÃO DE ITEM '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 95250
        mmTop = 8996
        mmWidth = 81227
        BandType = 0
      end
      object rptExtMovLabel3: TppLabel
        UserName = 'rptExtMovLabel3'
        Caption = 'Almoxarifado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 20108
        mmWidth = 24871
        BandType = 0
      end
      object lbPeriodo: TppLabel
        UserName = 'lbPeriodo'
        Caption = 'LbPeriodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 128059
        mmTop = 15081
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rptExtMovDBText1: TppDBText
        UserName = 'rptExtMovDBText1'
        DataField = 'DATAMOV'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText2: TppDBText
        UserName = 'rptExtMovDBText2'
        AutoSize = True
        DataField = 'NUMDOCUMENTO'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText4: TppDBText
        UserName = 'rptExtMovDBText4'
        AutoSize = True
        DataField = 'ENTRADA'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText5: TppDBText
        UserName = 'rptExtMovDBText5'
        AutoSize = True
        DataField = 'SAIDA'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText6: TppDBText
        UserName = 'rptExtMovDBText6'
        AutoSize = True
        DataField = 'SALDOQTDEMOV'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText8: TppDBText
        UserName = 'rptExtMovDBText8'
        AutoSize = True
        DataField = 'V_ENTRADA'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText9: TppDBText
        UserName = 'rptExtMovDBText9'
        AutoSize = True
        DataField = 'V_SAIDA'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText10: TppDBText
        UserName = 'rptExtMovDBText10'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText11: TppDBText
        UserName = 'rptExtMovDBText11'
        AutoSize = True
        DataField = 'CUSTOMEDIOMOV'
        DataPipeline = bdeExtMov
        DisplayFormat = '#,##0.000;-#,##0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 176213
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object rptExtMovDBText12: TppDBText
        UserName = 'rptExtMovDBText12'
        AutoSize = True
        DataField = 'DATALANCMOV'
        DataPipeline = bdeExtMov
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
      object rptExtMovDBText13: TppDBText
        UserName = 'rptExtMovDBText13'
        DataField = 'CODTIPOMOV'
        DataPipeline = bdeExtMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 199761
        mmTop = 265
        mmWidth = 2910
        BandType = 4
      end
      object rptExtMovDBText16: TppDBText
        UserName = 'rptExtMovDBText16'
        DataField = 'HISTORICO'
        DataPipeline = bdeExtMov
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 203465
        mmTop = 265
        mmWidth = 56886
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
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
        mmTop = 2910
        mmWidth = 40746
        BandType = 8
      end
      object rptExtMovLine2: TppLine
        UserName = 'rptExtMovLine2'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 794
        mmWidth = 273051
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 2646
        mmWidth = 45508
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
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
        mmTop = 2646
        mmWidth = 29633
        BandType = 8
      end
    end
    object rptExtMovGroup1: TppGroup
      BreakName = 'CODARTIGO'
      DataPipeline = bdeExtMov
      UserName = 'rptExtMovGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rptExtMovGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 23019
        mmPrintPosition = 0
        object rptExtMovLine1: TppLine
          UserName = 'rptExtMovLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 10848
          mmWidth = 273315
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel24: TppLabel
          UserName = 'rptExtMovLabel24'
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
        object rptExtMovLabel25: TppLabel
          UserName = 'rptExtMovLabel25'
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
        object rptExtMovLine7: TppLine
          UserName = 'rptExtMovLine7'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 20373
          mmWidth = 273580
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel29: TppLabel
          UserName = 'rptExtMovLabel29'
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
        object rptExtMovLabel30: TppLabel
          UserName = 'rptExtMovLabel30'
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
        object rptExtMovLabel31: TppLabel
          UserName = 'rptExtMovLabel31'
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
        object rptExtMovLabel33: TppLabel
          UserName = 'rptExtMovLabel33'
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
        object rptExtMovLabel34: TppLabel
          UserName = 'rptExtMovLabel34'
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
        object rptExtMovLabel35: TppLabel
          UserName = 'rptExtMovLabel35'
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
        object rptExtMovLabel36: TppLabel
          UserName = 'rptExtMovLabel36'
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
        object rptExtMovLabel37: TppLabel
          UserName = 'rptExtMovLabel37'
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
        object rptExtMovLine8: TppLine
          UserName = 'rptExtMovLine8'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 37571
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLine9: TppLine
          UserName = 'rptExtMovLine9'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 106363
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel38: TppLabel
          UserName = 'rptExtMovLabel38'
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
        object rptExtMovLine10: TppLine
          UserName = 'rptExtMovLine10'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 177007
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel39: TppLabel
          UserName = 'rptExtMovLabel39'
          Caption = ' Preço Médio '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          mmHeight = 3969
          mmLeft = 178594
          mmTop = 8202
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel40: TppLabel
          UserName = 'rptExtMovLabel40'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 185738
          mmTop = 15346
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel42: TppLabel
          UserName = 'rptExtMovLabel42'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 212725
          mmTop = 15346
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovLabel43: TppLabel
          UserName = 'rptExtMovLabel43'
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
        object rptExtMovLine11: TppLine
          UserName = 'rptExtMovLine11'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 199496
          mmTop = 10848
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object rptExtMovDBText3: TppDBText
          UserName = 'rptExtMovDBText3'
          DataField = 'CODARTIGO'
          DataPipeline = bdeExtMov
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
        object rptExtMovLabel2: TppLabel
          UserName = 'rptExtMovLabel2'
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
        object rptExtMovDBText7: TppDBText
          UserName = 'rptExtMovDBText7'
          DataField = 'DESCMEDIDA'
          DataPipeline = bdeExtMov
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
        object rptExtMovLabel4: TppLabel
          UserName = 'rptExtMovLabel4'
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
        object rptExtMovDBText14: TppDBText
          UserName = 'rptExtMovDBText14'
          AutoSize = True
          DataField = 'SALDOANT'
          DataPipeline = bdeExtMov
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
        object rptExtMovLabel5: TppLabel
          UserName = 'rptExtMovLabel5'
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
        object rptExtMovDBText15: TppDBText
          UserName = 'rptExtMovDBText15'
          AutoSize = True
          DataField = 'VALORANT'
          DataPipeline = bdeExtMov
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
        object rptExtMovLabel6: TppLabel
          UserName = 'rptExtMovLabel6'
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
        object rptExtMovLabel7: TppLabel
          UserName = 'rptExtMovLabel7'
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
        object rptExtMovDBText17: TppDBText
          UserName = 'rptExtMovDBText17'
          DataField = 'DESCPROD'
          DataPipeline = bdeExtMov
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
        object rptExtMovImage1: TppImage
          UserName = 'rptExtMovImage1'
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
      end
      object rptExtMovGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rptExtMovShape1: TppShape
          UserName = 'rptExtMovShape1'
          mmHeight = 6350
          mmLeft = 0
          mmTop = 265
          mmWidth = 271728
          BandType = 5
          GroupNo = 0
        end
        object rptExtMovLabel1: TppLabel
          UserName = 'rptExtMovLabel1'
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
        object rptExtMovDBCalc1: TppDBCalc
          UserName = 'rptExtMovDBCalc1'
          AutoSize = True
          DataField = 'ENTRADA'
          DataPipeline = bdeExtMov
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptExtMovGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 33867
          mmTop = 1588
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object rptExtMovDBCalc2: TppDBCalc
          UserName = 'rptExtMovDBCalc2'
          AutoSize = True
          DataField = 'SAIDA'
          DataPipeline = bdeExtMov
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptExtMovGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 62442
          mmTop = 1588
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object rptExtMovDBCalc3: TppDBCalc
          UserName = 'rptExtMovDBCalc3'
          AutoSize = True
          DataField = 'V_ENTRADA'
          DataPipeline = bdeExtMov
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptExtMovGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 100806
          mmTop = 1588
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object rptExtMovDBCalc4: TppDBCalc
          UserName = 'rptExtMovDBCalc4'
          AutoSize = True
          DataField = 'V_SAIDA'
          DataPipeline = bdeExtMov
          DisplayFormat = '#,##0.000;-#,##0.000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rptExtMovGroup1
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
  object SqlParExtMov: TCMSqlParams
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
      '       M.IDMOV,'
      '       U.DESCMEDIDA,'
      '       P.DESCPROD,'
      
        '       ( DECODE( SIGN( M.QTDEMOV ),   1, M.QTDEMOV ) )         a' +
        's ENTRADA,'
      
        '       ( DECODE( SIGN( M.QTDEMOV ),  -1, ABS( M.QTDEMOV ) ) )  a' +
        's SAIDA,'
      
        '       ( DECODE( SIGN( M.VALORMOV ),  1, M.VALORMOV ) )        a' +
        's V_ENTRADA,'
      
        '       ( DECODE( SIGN( M.VALORMOV ), -1, ABS( M.VALORMOV ) ) ) a' +
        's V_SAIDA,'
      '       ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV )    as VALOR,'
      '       ( M.SALDOQTDEMOV + ( M.QTDEMOV * -1 ) ) as SALDOANT,'
      '       VLR.VALORANT as VALORANT,'
      
        '       Decode( M.CODTIPOMOV, '#39'S'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'F'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'T'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'G'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'U'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'B'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'R'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( A.DESCALMOX ),'
      
        '                             '#39'A'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( PE.RAZAOSOCIAL ),'
      
        '                             '#39'K'#39', T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( PE.RAZAOSOCIAL ),'
      
        '                                  T.DESCRESUMIDA || '#39' '#39' || RTRIM' +
        '( C.NOME ) ) AS HISTORICO'
      '  FROM MOVIMENT M,'
      '       PESSOA PE,'
      '       ITENSRECEBDEVOL I,'
      '       NFRECEBDEVOL NF,'
      '       UNMEDIDA U,'
      '       ARTIGO AR,'
      '       PRODUTO  P,'
      '       ALMOX A,'
      '       CENTCUST C,'
      '       TIPOMOV T,'
      '       ( SELECT M.CODARTIGO,'
      '                ( M.SALDOQTDEMOV * M.CUSTOMEDIOMOV ) AS VALORANT'
      '           FROM MOVIMENT M,'
      '                ( SELECT M.CODARTIGO,'
      '                         MAX( M.IDMOV ) AS MAXIDMOV'
      '                    FROM MOVIMENT M,'
      
        '                         ( SELECT M.CODARTIGO, MAX( M.DATAMOV ) ' +
        'AS DATAMOV'
      '                             FROM MOVIMENT M'
      '                            WHERE ( M.CODALMOXARIFADO = :ALMOX )'
      '                              AND ( M.DATAMOV < :DATAINI )'
      '                              AND ( M.IDPESSOA = :IDEMPRESA )'
      '                              AND ( M.CODARTIGO = :ITEM )'
      '                            GROUP BY M.CODARTIGO'
      '                         ) SUB'
      '                   WHERE ( M.CODARTIGO = SUB.CODARTIGO )'
      '                     AND ( M.DATAMOV = SUB.DATAMOV )'
      '                     AND ( M.CODALMOXARIFADO = :ALMOX )'
      '                   GROUP BY M.CODARTIGO'
      '                ) AUX'
      '          WHERE ( M.CODARTIGO = AUX.CODARTIGO )'
      '            AND ( M.CODALMOXARIFADO = :ALMOX )'
      '            AND ( M.IDMOV = AUX.MAXIDMOV )'
      '       ) VLR'
      ' WHERE ( M.CODALMOXARIFADO = :ALMOX )'
      '   AND ( M.IDPESSOA        = :IDEMPRESA )'
      '   AND ( M.DATAMOV        >= :DATAINI )'
      '   AND ( M.DATAMOV        <= :DATAFIM )'
      '   AND ( M.CODARTIGO = :ITEM )'
      '   AND ( P.CODGRUPOPROD = :GRUPO )'
      '   AND ( M.CODARTIGO = AR.CODARTIGO )'
      '   AND ( AR.CODPRODUTO = P.CODPRODUTO )'
      '   AND ( M.CODARTIGO = VLR.CODARTIGO(+) )'
      '   AND ( M.CODTIPOMOV = T.CODTIPOMOV )'
      '   AND ( U.CODMEDIDA = P.CODMEDCUSTO )'
      '   AND ( M.IDMOV = I.IDMOV(+) )'
      '   AND ( I.IDNFRECEBDEVOL = NF.IDNFRECEBDEVOL(+) )'
      '   AND ( NF.IDFORCLI = PE.IDPESSOA(+) )'
      '   AND ( M.CODALMOXTRANSF = A.CODALMOXARIFADO(+) )'
      '   AND ( M.CODCENTROCUSTO = C.CODCENTROCUSTO(+) )'
      '   AND ( M.IDPESSOA = C.IDEMPRESA(+) )'
      ' ORDER BY M.CODARTIGO, M.DATAMOV, M.IDMOV')
    ClientDataSet = CdsExtMov
    Left = 208
    Top = 8
  end
  object CdsExtMov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 60
  end
end
