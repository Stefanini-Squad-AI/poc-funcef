inherited rptSaldos: TrptSaldos
  Left = 291
  Top = 328
  Width = 307
  Height = 115
  Caption = 'rptSaldos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Posição dos Saldos Orçamentários - Analítico'
    DataBaseName = 'BaseDados'
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
        Name = 'DataIni'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        MaskEditSettings.EditMask = '99/99/9999'
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
        Name = 'DataFim'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        MaskEditSettings.EditMask = '99/99/9999'
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
        Caption = 'Código da Conta'
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
        Name = 'Conta'
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
        Name = 'NomeConta'
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
        Caption = 'Grupo de Contas'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   IDGRUPOORCAMEN, '
          '  (CODGRUPOORC + '#39' - '#39' + NOMEGRUPOORCAMEN) AS NOMEGRUPO '
          'FROM'
          '   GRUPOORCAMEN')
        LookupSettings.Chave = 'IDGRUPOORCAMEN'
        LookupSettings.Display = 'NOMEGRUPO'
        LookupSettings.Descricao = 'Grupo de Contas'
        LookupSettings.Tamanho = '50'
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
        Width = 185
      end
      item
        Caption = 'Ordenação'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'por Ordem de Código de Contas'
          'por Ordem de Nome de Contas ')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 77
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
      end
      item
        Caption = 'Valores por'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Valores'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        MaskEditSettings.EditMask = '999999999,99'
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
        Caption = 'Plano Orçamentário'
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
    Formheight = 308
    FormWidth = 350
    Left = 84
  end
  inherited DevRptCM: TExtraOptions
    Left = 8
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpSaldos
    LabelEmpresa = ppLabel5
    LabelSistema = ppLabel14
    Left = 43
  end
  object sqlSaldos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  S.IDPESSOA, S.IDPLANOORCAMEN, S.IDCONTAORCAMEN, S.DATAREFERENC' +
        'IA,'
      
        '  S.EXERCICIO,S.PERIODO,S.VLRREALIZADO/:VALORDIV as VLRREALIZADO' +
        ','
      '  S.VLRORCADO/:VALORDIV AS VLRORCADO,'
      '  S.VLRRESERVADO/:VALORDIV AS VLRRESERVADO,'
      '  S.VLRCOMPROMETIDO/:VALORDIV AS VLRCOMPROMETIDO,'
      '  S.VLRORCACUM/:VALORDIV AS VLRORCACUM,'
      '  S.VLRREALACUM/:VALORDIV AS VLRREALACUM,'
      
        '  C.NOMECONTAORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, P.NOMEP' +
        'ERIODO'
      'FROM'
      
        '  SALDOORCADO S, CONTASORCAMEN C, GRUPOORCAMEN G, PERIODOORCAMEN' +
        ' P'
      'WHERE'
      '  :CONTA'
      '  :GRUPO'
      '  (S.DATAREFERENCIA BETWEEN :DATAINI AND :DATAFIM) AND'
      '  (S.IDPESSOA = :IDPESSOA) AND'
      '  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND'
      '  (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND'
      '  (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND            '
      '  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND'
      '  ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '  (S.EXERCICIO = P.EXERCICIO) AND'
      '  (S.PERIODO   = P.PERIODO) AND'
      '  (S.IDPESSOA  = P.IDPESSOA)'
      ':ORDENACAO'
      ''
      ''
      ' ')
    OnFormartParam = sqlSaldosFormartParam
    ClientDataSet = cdsSaldos
    Left = 8
    Top = 48
  end
  object cdsSaldos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 40
    Top = 48
  end
  object dsSaldos: TwwDataSource
    DataSet = cdsSaldos
    Left = 77
    Top = 48
  end
  object pplSaldos: TppBDEPipeline
    DataSource = dsSaldos
    UserName = 'lSaldos'
    Left = 117
    Top = 48
  end
  object rpSaldos: TppReport
    AutoStop = False
    DataPipeline = pplSaldos
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 157
    Top = 48
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldos'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Posição dos Saldos Orçamentários - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 34925
        mmTop = 8731
        mmWidth = 91811
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 66146
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpSaldosLabel13: TppLabel
        UserName = 'rpSaldosLabel13'
        Caption = 'rpSaldosLabel13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 173302
        mmTop = 11906
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplSaldos
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 3704
        mmLeft = 15875
        mmTop = 265
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'VLRORCADO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 3704
        mmLeft = 75406
        mmTop = 265
        mmWidth = 26194
        BandType = 4
      end
      object rpSaldosDBText1: TppDBText
        UserName = 'rpSaldosDBText1'
        DataField = 'VLRREALIZADO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 265
        mmWidth = 26194
        BandType = 4
      end
      object rpSaldosDBText2: TppDBText
        UserName = 'rpSaldosDBText2'
        DataField = 'VLRRESERVADO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 3704
        mmLeft = 133879
        mmTop = 265
        mmWidth = 26194
        BandType = 4
      end
      object rpSaldosDBText3: TppDBText
        UserName = 'rpSaldosDBText3'
        DataField = 'VLRCOMPROMETIDO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 265
        mmWidth = 26194
        BandType = 4
      end
      object rpSaldosDBText6: TppDBText
        UserName = 'rpSaldosDBText6'
        DataField = 'NOMEPERIODO'
        DataPipeline = pplSaldos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 3704
        mmLeft = 33867
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
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
        mmWidth = 75671
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
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
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpSaldosSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object rpSaldosDBCalc1: TppDBCalc
        UserName = 'rpSaldosDBCalc1'
        DataField = 'VLRORCADO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 4233
        mmLeft = 75406
        mmTop = 2910
        mmWidth = 26194
        BandType = 7
      end
      object rpSaldosDBCalc2: TppDBCalc
        UserName = 'rpSaldosDBCalc2'
        DataField = 'VLRREALIZADO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 4233
        mmLeft = 104775
        mmTop = 2910
        mmWidth = 26194
        BandType = 7
      end
      object rpSaldosDBCalc3: TppDBCalc
        UserName = 'rpSaldosDBCalc3'
        DataField = 'VLRRESERVADO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 4233
        mmLeft = 133879
        mmTop = 2910
        mmWidth = 26194
        BandType = 7
      end
      object rpSaldosDBCalc4: TppDBCalc
        UserName = 'rpSaldosDBCalc4'
        DataField = 'VLRCOMPROMETIDO'
        DataPipeline = pplSaldos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldos'
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 2910
        mmWidth = 26194
        BandType = 7
      end
      object rpSaldosLine1: TppLine
        UserName = 'rpSaldosLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object rpSaldosLabel9: TppLabel
        UserName = 'rpSaldosLabel9'
        Caption = 'Totais Gerais :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 48154
        mmTop = 2910
        mmWidth = 24077
        BandType = 7
      end
    end
    object rpSaldosGroup1: TppGroup
      BreakName = 'IDCONTAORCAMEN'
      DataPipeline = pplSaldos
      OutlineSettings.CreateNode = True
      UserName = 'rpSaldosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldos'
      object rpSaldosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 26458
        mmPrintPosition = 0
        object rpSaldosShape1: TppShape
          UserName = 'rpSaldosShape1'
          ParentWidth = True
          mmHeight = 11906
          mmLeft = 0
          mmTop = 3175
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'ppDBText1'
          DataField = 'IDCONTAORCAMEN'
          DataPipeline = pplSaldos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 9525
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'ppDBText2'
          DataField = 'NOMECONTAORCAMEN'
          DataPipeline = pplSaldos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 25135
          mmTop = 9525
          mmWidth = 85990
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'ppLabel7'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 4763
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Nome da Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 25135
          mmTop = 4763
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'ppLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 16140
          mmTop = 25665
          mmWidth = 181240
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 15875
          mmTop = 20902
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'ppLabel13'
          Caption = 'Data de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 15875
          mmTop = 16933
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel1: TppLabel
          UserName = 'rpSaldosLabel1'
          Caption = 'Orçado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 91281
          mmTop = 20902
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel2: TppLabel
          UserName = 'rpSaldosLabel2'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 91281
          mmTop = 16933
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel3: TppLabel
          UserName = 'rpSaldosLabel3'
          Caption = 'Realizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 117211
          mmTop = 20902
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel4: TppLabel
          UserName = 'rpSaldosLabel4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 117211
          mmTop = 16933
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel5: TppLabel
          UserName = 'rpSaldosLabel5'
          Caption = 'Reservado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 20902
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel6: TppLabel
          UserName = 'rpSaldosLabel6'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 16933
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel7: TppLabel
          UserName = 'rpSaldosLabel7'
          Caption = 'Comprometido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 166952
          mmTop = 20902
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel8: TppLabel
          UserName = 'rpSaldosLabel8'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 166952
          mmTop = 16933
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel11: TppLabel
          UserName = 'rpSaldosLabel11'
          Caption = 'Grupo de Contas Orçamentárias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 113242
          mmTop = 4763
          mmWidth = 53711
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosDBText4: TppDBText
          UserName = 'rpSaldosDBText4'
          DataField = 'CODGRUPOORC'
          DataPipeline = pplSaldos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 113242
          mmTop = 9525
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosDBText5: TppDBText
          UserName = 'rpSaldosDBText5'
          DataField = 'NOMEGRUPOORCAMEN'
          DataPipeline = pplSaldos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 139965
          mmTop = 9525
          mmWidth = 56356
          BandType = 3
          GroupNo = 0
        end
        object rpSaldosLabel10: TppLabel
          UserName = 'rpSaldosLabel10'
          Caption = 'Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 33867
          mmTop = 20902
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSaldosGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpSaldosDBCalc5: TppDBCalc
          UserName = 'rpSaldosDBCalc5'
          DataField = 'VLRORCADO'
          DataPipeline = pplSaldos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSaldosGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 75406
          mmTop = 2381
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object rpSaldosDBCalc6: TppDBCalc
          UserName = 'rpSaldosDBCalc6'
          DataField = 'VLRREALIZADO'
          DataPipeline = pplSaldos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSaldosGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 104775
          mmTop = 2381
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object rpSaldosDBCalc7: TppDBCalc
          UserName = 'rpSaldosDBCalc7'
          DataField = 'VLRRESERVADO'
          DataPipeline = pplSaldos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSaldosGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 133879
          mmTop = 2381
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object rpSaldosDBCalc8: TppDBCalc
          UserName = 'rpSaldosDBCalc8'
          DataField = 'VLRCOMPROMETIDO'
          DataPipeline = pplSaldos
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpSaldosGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldos'
          mmHeight = 3704
          mmLeft = 162984
          mmTop = 2381
          mmWidth = 26194
          BandType = 5
          GroupNo = 0
        end
        object rpSaldosLine2: TppLine
          UserName = 'rpSaldosLine2'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 16140
          mmTop = 794
          mmWidth = 181240
          BandType = 5
          GroupNo = 0
        end
        object rpSaldosLabel12: TppLabel
          UserName = 'rpSaldosLabel12'
          Caption = 'Totais da Conta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 48154
          mmTop = 2381
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPOORCAMEN,  CODGRUPOORC,'
      '  NOMEGRUPOORCAMEN'
      'FROM'
      '   GRUPOORCAMEN'
      'WHERE'
      '  IDGRUPOORCAMEN = :IDGRUPOORCAMEN ')
    ClientDataSet = cdsGrupo
    Left = 216
    Top = 48
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 256
    Top = 48
  end
end
