inherited RptCAFMovAnaPer: TRptCAFMovAnaPer
  Left = 439
  Top = 181
  Width = 298
  Height = 213
  Caption = 'Movimentação Analítica no Periodo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimentação Analítica no Periodo'
    DataBaseName = 'Basedados'
    Params = <
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
        Caption = 'Grupo Contábil'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CLASSE, NOME, IDGRUPO'
          'FROM GRUPO'
          'WHERE TIPO = '#39'A'#39
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Descrição|Código'
        LookupSettings.Tamanho = '40|15'
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
        Caption = 'Movimentação'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Entradas'
          'Saídas'
          'Transferências')
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
        MostraComboCompara = True
        Required = True
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
        Caption = 'Ordenado por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Placa'
          'Descrição')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
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
    Formheight = 254
    FormWidth = 521
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpMovAnaPer
    LabelEmpresa = ppLabel96
    LabelSistema = ppLabel97
  end
  object sqlMovAnaPer: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT /*+ RULE */ L.NOME AS DESCLOCAL,'
      '       BEM.PLACA,'
      '       G.CLASSE AS CODGRUPO,'
      '       ROUND(NVL(VMOV.VALOR, 0), 2) AS VALOFI,'
      '       (0.00) AS VALCTB,'
      '       F.NOME  AS NOMEFORNEC,'
      '       D.NOME  AS NOMEDESTIN,'
      '       LA.NOME AS DESCLOCALANT,'
      '       BEM.DESBEM AS DESCBEM,'
      '       HMOV.IDBEM,'
      '       HMOV.IDPESSOA,'
      '       HMOV.DATAMOVIMENTACAO,'
      '       HMOV.IDTIPOMOVIMENTACAO, HMOV.IDMOVIMENTACAO'
      ''
      'FROM BEM,'
      '     HISTORICOMOVIMENTACAO HMOV,'
      '     VLRHISTMOVBEM VMOV,'
      '     SALDOCONTABBEM SCB,'
      '     GRUPO G,'
      '     LOCALIZACAO L,'
      '     PESSOA F,'
      '     LOCALIZACAO LA,'
      '     SELBAIXABENS SBB,'
      '     SELBAIXA SB,'
      '     PESSOA D'
      ''
      'WHERE HMOV.IDPESSOA = :IDPESSOA'
      
        '  AND (HMOV.DATAMOVIMENTACAO >= :DATAMOVINI AND HMOV.DATAMOVIMEN' +
        'TACAO <= :DATAMOVFIM)'
      ''
      '  AND G.FLGIMOVEL = 0'
      '  AND BEM.DATAINICIODEP <= :DATAMOVFIM'
      '  AND SCB.MOECODIGO = :MOECODIGO'
      '  AND VMOV.MOECODIGO = :MOECODIGO'
      '  AND (VMOV.IDTAXADEP = :IDTAXADEP OR VMOV.IDTAXADEP = 0)'
      ''
      ''
      '  AND HMOV.IDBEM = BEM.IDBEM'
      '  AND HMOV.IDPESSOA = BEM.IDPESSOA'
      '  AND HMOV.IDBEM = SCB.IDBEM'
      '  AND HMOV.IDPESSOA = SCB.IDPESSOA'
      '  AND HMOV.DATAMOVIMENTACAO = SCB.DATASLDBEM'
      '  AND SCB.IDGRUPO = G.IDGRUPO(+)'
      '  AND SCB.IDLOCALIZACAO = L.IDLOCALIZACAO(+)'
      '  AND SCB.IDPESSOA = L.IDPESSOA(+)'
      '  AND BEM.IDFORNSERV = F.IDPESSOA(+)'
      '  AND HMOV.IDLOCALANT = LA.IDLOCALIZACAO(+)'
      '  AND HMOV.IDPESSOA = LA.IDPESSOA(+)'
      '  AND BEM.IDBEM = SBB.IDBEM(+)'
      '  AND BEM.IDPESSOA = SBB.IDPESSOA(+)'
      '  AND SBB.IDSELBAIXA = SB.IDSELBAIXA(+)'
      '  AND SB.IDDESTINOBAIXA = D.IDPESSOA(+)'
      '  AND HMOV.IDMOVIMENTACAO = VMOV.IDMOVIMENTACAO(+)'
      ''
      'ORDER BY HMOV.DATAMOVIMENTACAO, HMOV.IDMOVIMENTACAO, BEM.PLACA'
      ''
      ' ')
    ClientDataSet = cdsMovAnaPer
    Left = 232
    Top = 63
  end
  object cdsMovAnaPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 80
  end
  object dsMovAnaPer: TwwDataSource
    DataSet = cdsMovAnaPer
    Left = 241
    Top = 18
  end
  object ppMovAnaPer: TppBDEPipeline
    DataSource = dsMovAnaPer
    UserName = 'MovAnaPer'
    Left = 201
    Top = 65533
  end
  object rpMovAnaPer: TppReport
    AutoStop = False
    DataPipeline = ppMovAnaPer
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 193
    Top = 24
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppMovAnaPer'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel95: TppLabel
        UserName = 'ppLabel95'
        Caption = 'Movimentação Analítica no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106363
        mmTop = 8731
        mmWidth = 71438
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel118: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Movimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 128059
        mmTop = 15346
        mmWidth = 29369
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object rpMovAnaPerDBCalc1: TppDBCalc
        UserName = 'rpMovAnaPerDBCalc1'
        DataField = 'PLACA'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object rpMovAnaPerDBText1: TppDBText
        UserName = 'rpMovAnaPerDBText1'
        DataField = 'DESCLOCAL'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 0
        mmWidth = 79111
        BandType = 4
      end
      object rpMovAnaPerDBText2: TppDBText
        UserName = 'rpMovAnaPerDBText2'
        DataField = 'PLACA'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object rpMovAnaPerDBText3: TppDBText
        UserName = 'rpMovAnaPerDBText3'
        DataField = 'CODGRUPO'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 3704
        mmLeft = 115888
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object rpMovAnaPerDBText4: TppDBText
        UserName = 'rpMovAnaPerDBText4'
        DataField = 'VALOFI'
        DataPipeline = ppMovAnaPer
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 3704
        mmLeft = 140494
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object rpMovAnaPerDBText5: TppDBText
        UserName = 'rpMovAnaPerDBText5'
        DataField = 'NOMEFORNEC'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 6879
        mmLeft = 162190
        mmTop = 0
        mmWidth = 53446
        BandType = 4
      end
      object rpMovAnaPerDBMemo1: TppDBMemo
        UserName = 'rpMovAnaPerDBMemo1'
        CharWrap = True
        DataField = 'DESCBEM'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 12171
        mmLeft = 223838
        mmTop = 0
        mmWidth = 59531
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
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
        mmTop = 1058
        mmWidth = 67998
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 1058
        mmWidth = 71702
        BandType = 8
      end
    end
    object rpMovAnaPerSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object rpMovAnaPerLabel10: TppLabel
        UserName = 'rpMovAnaPerLabel10'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 7144
        BandType = 7
      end
      object rpMovAnaPerLine3: TppLine
        UserName = 'rpMovAnaPerLine3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 7
      end
      object rpMovAnaPerDBCalc3: TppDBCalc
        UserName = 'rpMovAnaPerDBCalc3'
        DataField = 'VALCTB'
        DataPipeline = ppMovAnaPer
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppMovAnaPer'
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28840
        BandType = 7
      end
      object rpMovAnaPerLine4: TppLine
        UserName = 'rpMovAnaPerLine4'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 5027
        mmWidth = 284692
        BandType = 7
      end
    end
    object rpMovAnaPerGroup1: TppGroup
      BreakName = 'DATAMOVIMENTACAO'
      DataPipeline = ppMovAnaPer
      OutlineSettings.CreateNode = True
      UserName = 'rpMovAnaPerGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppMovAnaPer'
      object rpMovAnaPerGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object rpMovAnaPerLabel1: TppLabel
          UserName = 'rpMovAnaPerLabel1'
          AutoSize = False
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 6615
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel2: TppLabel
          UserName = 'rpMovAnaPerLabel2'
          AutoSize = False
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 9790
          mmTop = 6615
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel3: TppLabel
          UserName = 'rpMovAnaPerLabel3'
          AutoSize = False
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 92604
          mmTop = 6615
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel4: TppLabel
          UserName = 'rpMovAnaPerLabel4'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115888
          mmTop = 6615
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel5: TppLabel
          UserName = 'rpMovAnaPerLabel5'
          AutoSize = False
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 141023
          mmTop = 6615
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel6: TppLabel
          UserName = 'rpMovAnaPerLabel6'
          AutoSize = False
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 162190
          mmTop = 6615
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel7: TppLabel
          UserName = 'rpMovAnaPerLabel7'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 224103
          mmTop = 6615
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLine1: TppLine
          UserName = 'rpMovAnaPerLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11377
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel8: TppLabel
          UserName = 'rpMovAnaPerLabel8'
          Caption = 'Movimentação em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerDBText6: TppDBText
          UserName = 'rpMovAnaPerDBText6'
          DataField = 'DATAMOVIMENTACAO'
          DataPipeline = ppMovAnaPer
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppMovAnaPer'
          mmHeight = 4233
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
      end
      object rpMovAnaPerGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpMovAnaPerLine2: TppLine
          UserName = 'rpMovAnaPerLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 0
        end
        object rpMovAnaPerLabel9: TppLabel
          UserName = 'rpMovAnaPerLabel9'
          Caption = 'Soma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1058
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object rpMovAnaPerDBCalc2: TppDBCalc
          UserName = 'rpMovAnaPerDBCalc2'
          DataField = 'VALCTB'
          DataPipeline = ppMovAnaPer
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpMovAnaPerGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppMovAnaPer'
          mmHeight = 3704
          mmLeft = 115094
          mmTop = 794
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 80
  end
  object sqlVerUltFec: TCMSqlParams
    SQL.Strings = (
      'SELECT MAX(PG.DATAULTFEC) AS DATAULT'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      
        'WHERE (G.FLGIMOVEL = :PFLGIMOVELINI OR G.FLGIMOVEL = :PFLGIMOVEL' +
        'FIM)'
      '  AND PG.IDPESSOA = :PIDPESSOA'
      '  AND G.TIPO = '#39'A'#39
      '  AND PG.DATAULTFEC IS NOT NULL'
      '  AND PG.IDGRUPO = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 112
    Top = 104
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      
        'SELECT C.MOEDAOFICIAL, C.MOEDAFISCAL, C.MOEDAGERENCIAL, C.NUMDIA' +
        'SANO,'
      '       C.MASCCODGRUPO, C.ALUGUELINTERNO, C.GERARREQMAT,'
      '       C.DATAULTDEP, C.DATARECALCDEP, C.DTAULTALUG, C.SEQBEMEMP,'
      
        '       C.EDITACODBEM, C.EDITACODGRUPO, C.SISTEMAS, C.DATAINICIAL' +
        ','
      
        '       C.ULTTXTCONTAB, C.FLGCALCCM, C.FLGTIPOCALC, C.MASCARACLAS' +
        'SE,'
      
        '       C.INTEGRACONTAB, C.INTEGRACAP, C.INTEGRACAR, C.PLANOVIGEN' +
        'TE,'
      
        '       C.FLGREAVAL, C.TIPOPERCTB, C.FLGREMOVEPLANCTB, C.ATIVPROJ' +
        'ETO,'
      
        '       C.PROXIMAPLACA,C.FLGCLSDESBEM, C.DIGMASCPLACA, C.PATROPAD' +
        'RAO,'
      
        '       C.PLANPREVPADRAO, C.TIPATUSALDOCONTAB, C.DTANCAF, C.TIPOC' +
        'ONJUNTO,'
      
        '       I.FLGINTCAFCONT, C.FLGCONTABFECHAM, PC.PACDOBRADA, I.FLGD' +
        'IARIO,'
      '       G.MASCARACC'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC,'
      '       PARAMGLOBAL G'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)'
      '  AND C.IDPESSOA = G.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 24
    Top = 104
  end
  object cdsSldCtb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 136
  end
  object sqlSldCtb: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDBEM, SB.IDPESSOA,'
      '       ROUND(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      
        '             SB.REAVVALORG + SB.REAVCMBEM - SB.REAVDEPLANC - SB.' +
        'REAVCMDEP +'
      
        '             SB.ULTREAVVALORG + SB.ULTREAVCMBEM - SB.ULTREAVDEPL' +
        'ANC - SB.ULTREAVCMDEP, 2) AS VALCTB'
      ''
      
        'FROM (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      
        '             SCB1.VALORG,  SCB1.REAVVALORG,    SCB1.ULTREAVVALOR' +
        'G,'
      
        '             SCB1.CMBEM,   SCB1.REAVCMBEM,     SCB1.ULTREAVCMBEM' +
        ','
      
        '             SCD1.DEPLANC, SCD1.REAVDEPLANC,   SCD1.ULTREAVDEPLA' +
        'NC,'
      
        '             SCD1.CMDEP,   SCD1.REAVCMDEP,     SCD1.ULTREAVCMDEP' +
        ','
      
        '             SCB1.IDGRUPO, SCB1.IDLOCALIZACAO, SCB1.IDRESPONSAVE' +
        'L'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE IDBEM = :IDBEM'
      '              AND DATASLDBEM <= :DATASLD'
      '              AND MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE SCB1.IDBEM = :IDBEM'
      '        AND SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCB1.IDBEM = DTAMAX.IDBEM'
      '        AND SCB1.IDBEM = SCD1.IDBEM'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM) SB'
      ''
      'WHERE SB.IDBEM = :IDBEM'
      '  AND SB.IDPESSOA = :IDPESSOA'
      '  AND SB.MOECODIGO = :MOECODIGO'
      '  AND SB.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '')
    ClientDataSet = cdsSldCtb
    Left = 232
    Top = 120
  end
end
