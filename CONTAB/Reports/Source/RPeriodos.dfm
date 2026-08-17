inherited RptPeriodos: TRptPeriodos
  Left = 268
  Top = 181
  Width = 295
  Height = 232
  Caption = 'Relatório da listagem de períodos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem de períodos contábeis'
    Params = <
      item
        Caption = 'Exercício Inicial'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT'
          '   PEREXERCICIO'
          'FROM'
          '   PERIODO'
          'WHERE'
          '   (IDPESSOA = 1)'
          'ORDER BY  PEREXERCICIO')
        LookupSettings.Chave = 'PEREXERCICIO'
        LookupSettings.Display = 'PEREXERCICIO'
        LookupSettings.Descricao = 'Exercício'
        LookupSettings.Tamanho = '10'
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
        Name = 'Exercício Inicial'
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
        Caption = 'Exercício Final'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT'
          '   PEREXERCICIO'
          'FROM'
          '   PERIODO'
          'WHERE'
          '   (IDPESSOA = 1)'
          'ORDER BY  PEREXERCICIO')
        LookupSettings.Chave = 'PEREXERCICIO'
        LookupSettings.Display = 'PEREXERCICIO'
        LookupSettings.Descricao = 'Exercício'
        LookupSettings.Tamanho = '10'
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
        Name = 'Exercício Final'
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
    Formheight = 160
    Top = 104
  end
  inherited DevRptCM: TExtraOptions
    Left = 20
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptPeriodo
    LabelEmpresa = ppLabel39
    LabelSistema = ppLabel43
    Left = 20
    Top = 56
  end
  object dsPeriodo: TwwDataSource
    DataSet = cdsPeriodo
    Left = 232
    Top = 104
  end
  object pplPeriodo: TppBDEPipeline
    DataSource = dsPeriodo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lPeriodo'
    Left = 237
    Top = 56
  end
  object rptPeriodo: TppReport
    AutoStop = False
    DataPipeline = pplPeriodo
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 237
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplPeriodo'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'ppLabel37'
        Caption = 'Listagem de Períodos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76465
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'ppLine24'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'ppLabel39'
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
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'ppLabel40'
        Caption = 'Exercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 24342
        mmWidth = 12965
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29104
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'ppLabel41'
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 24342
        mmWidth = 11377
        BandType = 0
      end
      object ppLblTituloPeriodo2: TppLabel
        UserName = 'ppLblTituloPeriodo2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 14023
        mmWidth = 14817
        BandType = 0
      end
      object rptPeriodoLabel1: TppLabel
        UserName = 'rptPeriodoLabel1'
        Caption = 'Data Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 24342
        mmWidth = 17727
        BandType = 0
      end
      object rptPeriodoLabel2: TppLabel
        UserName = 'rptPeriodoLabel2'
        Caption = 'Data Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 24342
        mmWidth = 16140
        BandType = 0
      end
      object rptPeriodoLabel3: TppLabel
        UserName = 'rptPeriodoLabel3'
        Caption = 'Bloqueado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 20373
        mmWidth = 15346
        BandType = 0
      end
      object rptPeriodoLabel4: TppLabel
        UserName = 'rptPeriodoLabel4'
        Caption = 'Integrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 24342
        mmWidth = 14023
        BandType = 0
      end
      object rptPeriodoLabel5: TppLabel
        UserName = 'rptPeriodoLabel5'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 24342
        mmWidth = 7144
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'PEREXERCICIO'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        DataField = 'PERNOME'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 529
        mmWidth = 75406
        BandType = 4
      end
      object rptPeriodoDBText1: TppDBText
        UserName = 'rptPeriodoDBText1'
        DataField = 'PERNUMERO'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object rptPeriodoDBText2: TppDBText
        UserName = 'rptPeriodoDBText2'
        DataField = 'PERDATINI'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 109273
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object rptPeriodoDBText3: TppDBText
        UserName = 'rptPeriodoDBText3'
        DataField = 'PERDATFIM'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
      object rptPeriodoDBText4: TppDBText
        UserName = 'rptPeriodoDBText4'
        DataField = 'PERBLOINT'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object rptPeriodoDBText5: TppDBText
        UserName = 'rptPeriodoDBText5'
        DataField = 'PERBLOQUE'
        DataPipeline = pplPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplPeriodo'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object rptPeriodoLabel6: TppLabel
        UserName = 'rptPeriodoLabel6'
        AutoSize = False
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 26988
        mmTop = 529
        mmWidth = 1852
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel43: TppLabel
        UserName = 'ppLabel43'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsPeriodo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 152
  end
  object sqlPeriodo: TCMSqlParams
    SQL.Strings = (
      'SELECT                                          '
      '   PEREXERCICIO, PERNUMERO, PERNOME,             '
      '   PERDATINI, PERDATFIM, PERBLOQUE, PERBLOINT  '
      'FROM                                             '
      '   PERIODO                  ')
    ClientDataSet = cdsPeriodo
    Left = 144
    Top = 152
  end
end
