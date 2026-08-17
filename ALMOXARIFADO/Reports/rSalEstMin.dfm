inherited RptSalEstMin: TRptSalEstMin
  Width = 261
  Height = 144
  Caption = 'Produtos com Saldo acima do Estoque Máximo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Produtos com Saldo acima do Estoque Máximo'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CodAlmoxarifado, DescAlmox '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CodAlmoxarifado'
        LookupSettings.Display = 'DescAlmox'
        LookupSettings.Descricao = 'Almoxarifado'
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
        LookupSettings.Descricao = 'Grupo de Produtos'
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
        Name = 'Grupo'
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
        Caption = 'Ordem'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Alfabética'
          'Código'
          'Valor')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
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
        Name = 'Ordem'
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
    Formheight = 180
    FormWidth = 480
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptSalEstMin
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object bdeSalEstMin: TppBDEPipeline
    DataSource = dsSalEstMin
    UserName = 'bdeSalEstMin'
    Left = 84
    Top = 60
  end
  object dsSalEstMin: TwwDataSource
    DataSet = CdsSalEstMin
    Left = 140
    Top = 60
  end
  object RptSalEstMin: TppReport
    AutoStop = False
    DataPipeline = bdeSalEstMin
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand28: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29369
      mmPrintPosition = 0
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Produtos com Saldo acima do Estoque Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 51065
        mmTop = 7408
        mmWidth = 95250
        BandType = 0
      end
      object ppLine74: TppLine
        UserName = 'ppLine74'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22754
        mmWidth = 197300
        BandType = 0
      end
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
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object RptSalEstMinLine1: TppLine
        UserName = 'RptSalEstMinLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29103
        mmWidth = 197300
        BandType = 0
      end
      object RptSalEstMinLabel1: TppLabel
        UserName = 'RptSalEstMinLabel1'
        Caption = 'Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 9260
        mmTop = 24077
        mmWidth = 7408
        BandType = 0
      end
      object RptSalEstMinLabel2: TppLabel
        UserName = 'RptSalEstMinLabel2'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 143669
        mmTop = 24077
        mmWidth = 7938
        BandType = 0
      end
      object RptSalEstMinLabel4: TppLabel
        UserName = 'RptSalEstMinLabel4'
        Caption = 'Almoxarifado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8731
        mmTop = 14288
        mmWidth = 20108
        BandType = 0
      end
      object RptSalEstMinLabel5: TppLabel
        UserName = 'RptSalEstMinLabel5'
        Caption = 'Grupo de Produtos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 18521
        mmWidth = 28575
        BandType = 0
      end
      object lbAlmox12: TppLabel
        UserName = 'lbAlmox12'
        Caption = 'Almoxarifado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 30427
        mmTop = 14288
        mmWidth = 16933
        BandType = 0
      end
      object LbGrupo2: TppLabel
        UserName = 'LbGrupo2'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object RptSalEstMinLabel6: TppLabel
        UserName = 'RptSalEstMinLabel6'
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 24077
        mmWidth = 11642
        BandType = 0
      end
      object RptSalEstMinLabel8: TppLabel
        UserName = 'RptSalEstMinLabel8'
        Caption = 'Estoque Máximo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 24077
        mmWidth = 24077
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptSalEstMinDBText1: TppDBText
        UserName = 'RptSalEstMinDBText1'
        DataField = 'CODARTIGO'
        DataPipeline = bdeSalEstMin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object RptSalEstMinDBText2: TppDBText
        UserName = 'RptSalEstMinDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = bdeSalEstMin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 0
        mmWidth = 79375
        BandType = 4
      end
      object RptSalEstMinDBText3: TppDBText
        UserName = 'RptSalEstMinDBText3'
        AutoSize = True
        DataField = 'SALDOQTDE'
        DataPipeline = bdeSalEstMin
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 134144
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object RptSalEstMinDBText5: TppDBText
        UserName = 'RptSalEstMinDBText5'
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdeSalEstMin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 121179
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object RptSalEstMinDBText4: TppDBText
        UserName = 'RptSalEstMinDBText4'
        AutoSize = True
        DataField = 'ESTMAXIMO'
        DataPipeline = bdeSalEstMin
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppFooterBand28: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine75: TppLine
        UserName = 'ppLine75'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc54: TppSystemVariable
        UserName = 'Calc54'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 529
        mmWidth = 52388
        BandType = 8
      end
      object ppCalc55: TppSystemVariable
        UserName = 'Calc55'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object SqlSalEstMin: TCMSqlParams
    ClientDataSet = CdsSalEstMin
    Left = 192
    Top = 8
  end
  object CdsSalEstMin: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 60
  end
end
