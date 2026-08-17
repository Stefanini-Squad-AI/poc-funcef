inherited rptDemoLayout: TrptDemoLayout
  Left = 352
  Top = 330
  Width = 291
  Height = 244
  Caption = 'rptDemoLayout'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemReports: TMemo [0]
    Left = 107
    Top = 98
    Width = 161
    Height = 19
    ScrollBars = ssVertical
    TabOrder = 0
    Visible = False
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório Demonstrativo Orçamentário - Modelo de Layout'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Exercício'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT '
          '   EXERCICIO '
          'FROM '
          '   PERIODOORCAMEN '
          'WHERE'
          '   IDPESSOA = :IDPESSOA'
          'ORDER BY '
          '   EXERCICIO')
        LookupSettings.Chave = 'EXERCICIO'
        LookupSettings.Display = 'EXERCICIO'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Exercicio'
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
        Width = 185
      end
      item
        Caption = 'Período'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PERIODO, NOMEPERIODO '
          'FROM PERIODOORCAMEN'
          'WHERE IDPESSOA = :IDPESSOA '
          'ORDER BY PERIODO')
        LookupSettings.Chave = 'PERIODO'
        LookupSettings.Display = 'NOMEPERIODO'
        LookupSettings.Descricao = 'Período'
        LookupSettings.Tamanho = '60'
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
        Name = 'Periodo'
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
        Width = 185
      end
      item
        Caption = 'Relatório'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDRELATORC, NOMERELATORC'
          'FROM '
          '   RELATORC '
          'ORDER BY '
          '  NOMERELATORC')
        LookupSettings.Chave = 'IDRELATORC'
        LookupSettings.Display = 'NOMERELATORC'
        LookupSettings.Descricao = 'Relatório'
        LookupSettings.Tamanho = '40'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Relatorio'
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
        Width = 185
      end
      item
        Caption = 'Layout Orçamentário'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDDESENHOORC, NOMELAYOUT '
          'FROM '
          '   DESENHOORC '
          'ORDER BY '
          '   NOMELAYOUT')
        LookupSettings.Chave = 'IDDESENHOORC'
        LookupSettings.Display = 'NOMELAYOUT'
        LookupSettings.Descricao = 'Layout'
        LookupSettings.Tamanho = '60'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Layout'
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
        Width = 185
      end
      item
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TipoLayout'
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
        Width = 185
      end
      item
        Caption = 'Imprimir linhas com valores zerados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        Name = 'ValoresZerados'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 222
    FormWidth = 350
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpDemoLayout
    LabelSistema = ppLabel196
  end
  object sqlDemoColMes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  (0) AS R01_Janeiro, (0) AS R02_Fevereiro, (0) AS R03_Marco, (0' +
        ') AS R04_Abril,'
      
        '  (0) AS R05_Maio, (0) AS R06_Junho, (0) AS R07_Julho, (0) AS R0' +
        '8_Agosto,'
      '  (0) AS R09_Setembro, (0) AS R10_Outubro, (0) AS R11_Novembro,'
      '  (0) AS R12_Dezembro, (0) AS SomaLinhaReal,'
      
        '  (0) AS O01_Janeiro, (0) AS O02_Fevereiro, (0) AS O03_Marco, (0' +
        ') AS O04_Abril,'
      
        '  (0) AS O05_Maio, (0) AS O06_Junho, (0) AS O07_Julho, (0) AS O0' +
        '8_Agosto,'
      '  (0) AS O09_Setembro, (0) AS O10_Outubro, (0) AS O11_Novembro, '
      '  (0) AS O12_Dezembro, (0) AS SomaLinhaOrc,'
      '  (0) AS AR01_Janeiro, (0) AS AR02_Fevereiro, (0) AS AR03_Marco,'
      
        '  (0) AS AR04_Abril, (0) AS AR05_Maio, (0) AS AR06_Junho, (0) AS' +
        ' AR07_Julho,'
      
        '  (0) AS AR08_Agosto, (0) AS AR09_Setembro, (0) AS AR10_Outubro,' +
        ' '
      
        '  (0) AS AR11_Novembro, (0) AS AR12_Dezembro, (0) AS SomaLinhaAR' +
        'eal,'
      
        '  (0) AS AO01_Janeiro, (0) AS AO02_Fevereiro, (0) AS AO03_Marco,' +
        ' '
      
        '  (0) AS AO04_Abril, (0) AS AO05_Maio, (0) AS AO06_Junho, (0) AS' +
        ' AO07_Julho, '
      
        '  (0) AS AO08_Agosto, (0) AS AO09_Setembro, (0) AS AO10_Outubro,' +
        ' '
      
        '  (0) AS AO11_Novembro, (0) AS AO12_Dezembro, (0) AS SomaLinhaAO' +
        'rc,'
      '  R.FLGIMPRIMENEG AS FlagTipoNegativo,'
      
        '  ('#39'                                                            ' +
        '                  '#39')'
      '  AS NomeContaInd,'
      
        '  C.NOMECONTAORCAMEN AS NomeConta, L.IDLINHASRELATORC AS NumLinh' +
        'a,'
      '  L.IDCONTAORCAMEN AS CodigoConta,'
      '  L.FLGINDENTACAO AS Indentacao, L.NUMDECIMAIS AS NumDecimais,'
      
        '  L.FLGTIPOLINHA AS FlagInterna1, C.FLGCONTAMONETARIA AS FlagMon' +
        'etaria,'
      
        '  ('#39' '#39') AS Linha1, ('#39' '#39') AS Linha2, ('#39' '#39') AS Linha3, ('#39' '#39') AS Li' +
        'nha4,'
      '  ('#39'               '#39') AS PERIODO, ('#39'    '#39') AS EXERCICIO'
      'FROM'
      '  CONTASORCAMEN C, RELATORC R, LINHASRELATORC L'
      'WHERE'
      '  (L.IDRELATORC = :IDRELATORC) AND'
      '  (C.IDCONTAORCAMEN = L.IDCONTAORCAMEN) AND'
      '  (C.IDPLANOORCAMEN = L.IDPLANOORCAMEN) AND'
      '  ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '  (R.IDRELATORC = L.IDRELATORC)'
      'ORDER BY'
      '  NumLinha'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsDemoColMes
    Left = 16
    Top = 48
  end
  object dsDemoLayout: TwwDataSource
    Left = 88
    Top = 48
  end
  object pplDemoLayout: TppBDEPipeline
    DataSource = dsDemoLayout
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lDemoLayout'
    Left = 128
    Top = 48
  end
  object rpDemoLayout: TppReport
    AutoStop = False
    DataPipeline = pplDemoLayout
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 8000
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMMThousandths
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 168
    Top = 48
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDemoLayout'
    object ppHeaderBand22: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
    end
    object ppDetailBand21: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5200
      mmPrintPosition = 0
    end
    object ppFooterBand22: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLabel196: TppLabel
        UserName = 'ppLabel196'
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
        mmTop = 2117
        mmWidth = 109273
        BandType = 8
      end
      object ppLine54: TppLine
        UserName = 'ppLine54'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 282650
        BandType = 8
      end
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 2117
        mmWidth = 42333
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245269
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsDemoColMes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 48
  end
  object cdsDemoNormal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 88
  end
  object sqlDemoNormal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  (0) AS SaldoOrcPerEAT, (0) AS SaldoOrcAcumEAT, (0) AS SaldoRea' +
        'lPerEAT,'
      
        '  (0) AS SaldoRealAcumEAT, (0) AS SaldoRealPerEAN, (0) AS SaldoR' +
        'ealAcumEAN,'
      
        '  (0) AS SaldoRealAEAT, (0) AS SaldoRealAcumAEAT, (0) AS SaldoOr' +
        'cAEAT,'
      
        '  (0) AS SaldoOrcAcumAEAT, (0) AS AV_OrcPerEAT, (0) AS AV_OrcAcu' +
        'mEAT,'
      
        '  (0) AS AV_RealPerEAT, (0) AS AV_RealAcumEAT, (0) AS AV_RealPer' +
        'EAN,'
      
        '  (0) AS AV_RealAcumEAN, (0) AS AV_OrcAEAT, (0) AS AV_OrcAcumAEA' +
        'T,'
      
        '  (0) AS AV_RealAEAT, (0) AS AV_RealAcumAEAT, (0) AS DifOrcRealP' +
        'erEAT,'
      
        '  (0) AS DifOrcRealAcumEAT, (0) AS DifOrcRealPerEAN, (0) AS DifO' +
        'rcRealAcumEAN,'
      
        '  (0) AS DifOrcRealAEAT, (0) AS DifOrcReaAcumAEAT, (0) AS AH_Orc' +
        'RealPerEAT,'
      
        '  (0) AS AH_OrcRealAcumEAT, (0) AS AH_ExAtuAntPer, (0) AS AH_Per' +
        'AtuAntEAT,'
      '  (0) AS AH_ExAtuAntAcum,'
      '  R.FLGIMPRIMENEG AS FlagTipoNegativo,'
      
        '  ('#39'                                                            ' +
        '                  '#39') AS NomeContaInd,'
      
        '  C.NOMECONTAORCAMEN AS NomeConta, L.IDLINHASRELATORC AS NumLinh' +
        'a,'
      
        '  L.IDCONTAORCAMEN AS CodigoConta, L.IDCONTAPARA100 AS CodigoCon' +
        'ta100,'
      '  L.FLGINDENTACAO AS Indentacao, L.NUMDECIMAIS AS NumDecimais,'
      
        '  L.FLGTIPOLINHA AS FlagInterna1, C.FLGCONTAMONETARIA AS FlagMon' +
        'etaria,'
      
        '  ('#39' '#39') AS Linha1, ('#39' '#39') AS Linha2, ('#39' '#39') AS Linha3, ('#39' '#39') AS Li' +
        'nha4,'
      '  ('#39'               '#39') AS PERIODO, ('#39'    '#39') AS EXERCICIO'
      'FROM'
      '  CONTASORCAMEN C, RELATORC R, LINHASRELATORC L'
      'WHERE'
      '  (L.IDRELATORC = :IDRELATORC) AND'
      '  (C.IDCONTAORCAMEN = L.IDCONTAORCAMEN) AND'
      '  (C.IDPLANOORCAMEN = L.IDPLANOORCAMEN) AND'
      '  ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '  (R.IDRELATORC = L.IDRELATORC)'
      'ORDER BY'
      '  NumLinha'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsDemoNormal
    Left = 16
    Top = 88
  end
  object sqlLayout: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDDESENHOORC, IDRELATORC, NOMELAYOUT,'
      '  FLGTIPOLAYOUT, IDREPORTS, ORIGEMCM'
      'FROM'
      '  DESENHOORC'
      'WHERE'
      '  (IDRELATORC = :IDRELATORC) AND (IDDESENHOORC = :IDDESENHOORC)'
      'ORDER BY'
      '  NOMELAYOUT'
      ' ')
    ClientDataSet = cdsLayout
    Left = 24
    Top = 152
  end
  object cdsLayout: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 152
  end
  object sqlReports: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '  (REPORTS.IDREPORTS = :PIDREPORTS) AND'
      '  (REPORTS.ORIGEMCM  = :PORIGEMCM)'
      ' ')
    ClientDataSet = cdsReports
    Left = 24
    Top = 184
  end
  object cdsReports: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 64
    Top = 184
  end
  object sqlCalculos: TCMSqlParams
    ClientDataSet = cdsCalculos
    Left = 144
    Top = 144
  end
  object cdsCalculos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 144
  end
end
