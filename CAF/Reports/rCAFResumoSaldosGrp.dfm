inherited RptCAFResumoSaldosGrp: TRptCAFResumoSaldosGrp
  Left = 263
  Top = 97
  Width = 327
  Height = 228
  Caption = 'Resumo de Saldos - Grupo Contábil'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object sqlResumoSaldosGrp: TCMSqlParams [0]
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS VALORGCM,'
      '       (0.00) AS DEPLANCCM,'
      '       (0.00) AS DEPR,'
      '       (0.00) AS VALCTB,'
      '       (0.00) AS VALORGCM2,'
      '       (0.00) AS DEPLANCCM2'
      'FROM GRUPO'
      'WHERE IDGRUPO IS NULL'
      'ORDER BY CLASSE'
      ' '
      '')
    ClientDataSet = cdsResumoSaldosGrp
    Left = 232
    Top = 63
  end
  object cdsResumoSaldosGrp: TCMClientDataSet [1]
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 49
  end
  object dsResumoSaldosGrp: TwwDataSource [2]
    DataSet = cdsResumoSaldosGrp
    Left = 232
    Top = 35
  end
  object ppResumoSaldosGrp: TppBDEPipeline [3]
    DataSource = dsResumoSaldosGrp
    UserName = 'ResumoSaldosGrp'
    Left = 232
    Top = 21
  end
  object rpResumoSaldosGrp: TppReport [4]
    AutoStop = False
    DataPipeline = ppResumoSaldosGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 7
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        Caption = 'Resumo de Saldos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 66411
        mmTop = 7144
        mmWidth = 44186
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 27516
        mmWidth = 177059
        BandType = 0
      end
      object LBLEMPRESA: TppLabel
        UserName = 'LBLEMPRESA'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 74348
        mmTop = 0
        mmWidth = 28310
        BandType = 0
      end
      object rpBalPatGrpLabel1: TppLabel
        UserName = 'rpBalPatGrpLabel1'
        AutoSize = False
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 17463
        mmWidth = 8202
        BandType = 0
      end
      object rpBalPatGrpLabel2: TppLabel
        UserName = 'rpBalPatGrpLabel2'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 13494
        BandType = 0
      end
      object rpBalPatGrpLabel3: TppLabel
        UserName = 'rpBalPatGrpLabel3'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object rpBalPatGrpLabel4: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        AutoSize = False
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 7673
        mmTop = 22754
        mmWidth = 17727
        BandType = 0
      end
      object rpBalPatGrpLabel5: TppLabel
        UserName = 'rpBalPatGrpLabel5'
        AutoSize = False
        Caption = 'Vlr Orig Corrigido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 29633
        mmTop = 22754
        mmWidth = 22225
        BandType = 0
      end
      object rpBalPatGrpLabel6: TppLabel
        UserName = 'rpBalPatGrpLabel6'
        AutoSize = False
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 53181
        mmTop = 22754
        mmWidth = 25135
        BandType = 0
      end
      object rpBalPatGrpLabel7: TppLabel
        UserName = 'rpBalPatGrpLabel7'
        AutoSize = False
        Caption = 'Vlr. Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 22754
        mmWidth = 15610
        BandType = 0
      end
      object rpBalPatGrpLabel8: TppLabel
        UserName = 'rpBalPatGrpLabel8'
        AutoSize = False
        Caption = 'Residual Cont.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 22754
        mmWidth = 21167
        BandType = 0
      end
      object rpBalPatGrpLabel9: TppLabel
        UserName = 'rpBalPatGrpLabel9'
        AutoSize = False
        Caption = 'Movimentação até '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 8731
        mmWidth = 28840
        BandType = 0
      end
      object rpBalPatGrpLabel10: TppLabel
        UserName = 'rpBalPatGrpLabel10'
        AutoSize = False
        Caption = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 155311
        mmTop = 8731
        mmWidth = 20902
        BandType = 0
      end
      object rpBalPatGrpLabel11: TppLabel
        UserName = 'rpBalPatGrpLabel11'
        AutoSize = False
        Caption = 'Depr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 80169
        mmTop = 22754
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Depr.Acumulada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 146050
        mmTop = 22754
        mmWidth = 22225
        BandType = 0
      end
      object lblMoedaSec: TppLabel
        UserName = 'lblMoedaSec'
        AutoSize = False
        Caption = 'Moeda : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 126207
        mmTop = 17463
        mmWidth = 42069
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object rpResumoSaldosGrpDBText1: TppDBText
        OnPrint = rpResumoSaldosGrpDBText1Print
        UserName = 'rpResumoSaldosGrpDBText1'
        DataField = 'CLASSE'
        DataPipeline = ppResumoSaldosGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 41010
        BandType = 4
      end
      object rpBalPatGrpDBText2: TppDBText
        UserName = 'rpBalPatGrpDBText2'
        DataField = 'DESCGRUPO'
        DataPipeline = ppResumoSaldosGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 41540
        mmTop = 0
        mmWidth = 127529
        BandType = 4
      end
      object rpBalPatGrpDBText4: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 4763
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText5: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        BlankWhenZero = True
        DataField = 'VALORGCM'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 4763
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText6: TppDBText
        UserName = 'rpBalPatGrpDBText6'
        BlankWhenZero = True
        DataField = 'DEPLANCCM'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 52917
        mmTop = 4763
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText7: TppDBText
        UserName = 'rpBalPatGrpDBText7'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'VALORGCM2'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 116681
        mmTop = 4763
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText8: TppDBText
        UserName = 'rpBalPatGrpDBText8'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 4763
        mmWidth = 27252
        BandType = 4
      end
      object rpBalPatGrpDBText3: TppDBText
        UserName = 'rpBalPatGrpDBText3'
        DataField = 'S_A'
        DataPipeline = ppResumoSaldosGrp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object rpBalPatGrpDBText9: TppDBText
        UserName = 'rpBalPatGrpDBText9'
        BlankWhenZero = True
        DataField = 'DEPR'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 79375
        mmTop = 4763
        mmWidth = 8467
        BandType = 4
      end
      object rpBalPatGrpDBText10: TppDBText
        UserName = 'rpBalPatGrpDBText10'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'DEPLANCCM2'
        DataPipeline = ppResumoSaldosGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 4763
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 177059
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 0
        mmTop = 2117
        mmWidth = 23834
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
        mmLeft = 70379
        mmTop = 2117
        mmWidth = 39158
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
        mmLeft = 151342
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Resumo de Saldos - Grupo Contábil'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Periodo Atualizado até'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
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
        LookupSettings.Descricao = 'Grupo Contábil|Código'
        LookupSettings.Tamanho = '40|8'
        CheckBoxSetings.ValueChecked = 'False'
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
        Caption = 'Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC'
          'FROM CAFMOEDAS CM,'
          '      MOEDA M'
          'WHERE CM.IDPESSOA = 1'
          '  AND CM.MOECODIGO = M.MOECODIGO'
          'ORDER BY CM.IDTIPOMOEDA')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Caption = 'Segunda Moeda'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CM.MOECODIGO, CM.IDPESSOA, CM.IDTIPOMOEDA, M.MOEDESC'
          'FROM CAFMOEDAS CM,'
          '      MOEDA M'
          'WHERE CM.IDPESSOA = 1'
          '  AND CM.MOECODIGO = M.MOECODIGO'
          'ORDER BY CM.IDTIPOMOEDA')
        LookupSettings.Chave = 'MOECODIGO'
        LookupSettings.Display = 'MOEDESC'
        LookupSettings.Descricao = 'Moeda'
        LookupSettings.Tamanho = '20'
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
        Caption = 'País'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CP.IDCAFPAISES, CP.IDPAIS, P.NOMEPAIS'
          'FROM CAFPAISES CP,'
          '     PAIS P'
          'WHERE CP.IDPESSOA = 1'
          '  AND CP.IDPAIS = P.IDPAIS'
          'ORDER BY P.NOMEPAIS')
        LookupSettings.Chave = 'IDCAFPAISES'
        LookupSettings.Display = 'NOMEPAIS'
        LookupSettings.Descricao = 'País'
        LookupSettings.Tamanho = '30'
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
        Caption = 'Grupos Contábeis dos Bens'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Imobiliários'
          'Todos')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
        Caption = 'Incluir Bens com Controle Físico'
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
      end
      item
        Caption = 'Incluir Bens Baixados'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
        Caption = 'Incluir Grupos sem Valor'
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
      end
      item
        Caption = 'Somente Grupos Sintéticos'
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
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 340
    FormWidth = 480
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpResumoSaldosGrp
    LabelEmpresa = LBLEMPRESA
    LabelSistema = LBLSISTEMA
  end
  object cdsGrpAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 144
  end
  object sqlGrpAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ SB1.IDGRUPO, SB1.IDPESSOA, COUNT(*) AS QUANT,'
      
        '       ROUND(SUM(NVL(SB1.VALORG,0) + NVL(SB1.REAVVALORG,0) + NVL' +
        '(SB1.ULTREAVVALORG,0)), 2) AS VALORG0,'
      
        '       ROUND(SUM(NVL(SB1.VALORG,0) + NVL(SB1.REAVVALORG,0) + NVL' +
        '(SB1.ULTREAVVALORG,0) +'
      
        '                 NVL(SB1.CMBEM,0) + NVL(SB1.REAVCMBEM,0) + NVL(S' +
        'B1.ULTREAVCMBEM,0)), 2) AS VALORGCM0,'
      
        '       ROUND(SUM(NVL(SD1.DEPLANC,0) + NVL(SD1.REAVDEPLANC,0) + N' +
        'VL(SD1.ULTREAVDEPLANC,0) +'
      
        '                 NVL(SD1.CMDEP,0) + NVL(SD1.REAVCMDEP,0) + NVL(S' +
        'D1.ULTREAVCMDEP,0)), 2) AS DEPLANCCM0,'
      
        '       ROUND(SUM(NVL(SB1.VALORG,0) + NVL(SB1.REAVVALORG,0) + NVL' +
        '(SB1.ULTREAVVALORG,0) +'
      
        '                 NVL(SB1.CMBEM,0) + NVL(SB1.REAVCMBEM,0) + NVL(S' +
        'B1.ULTREAVCMBEM,0) -'
      
        '                 NVL(SD1.DEPLANC,0) - NVL(SD1.REAVDEPLANC,0) - N' +
        'VL(SD1.ULTREAVDEPLANC,0) -'
      
        '                 NVL(SD1.CMDEP,0) - NVL(SD1.REAVCMDEP,0) - NVL(S' +
        'D1.ULTREAVCMDEP,0)), 2) AS VALCTB0'
      'FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '     (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '      FROM SALDOCONTABBEM'
      '      WHERE DATASLDBEM <= :DATASLD'
      '        AND MOECODIGO = :MOECODIGO'
      '        AND IDPESSOA = :IDPESSOA'
      '      GROUP BY IDBEM) MAX1,'
      '     BEM B1, GRUPO G1'
      'WHERE B1.IDPESSOA = :IDPESSOA'
      ''
      ''
      ''
      ''
      '  AND SB1.MOECODIGO = :MOECODIGO'
      '  AND SB1.IDPESSOA = :IDPESSOA'
      '  AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '  AND SD1.MOECODIGO = :MOECODIGO'
      '  AND SD1.IDPESSOA = :IDPESSOA'
      '  AND MAX1.IDBEM = SB1.IDBEM'
      '  AND MAX1.DATA = SB1.DATASLDBEM'
      '  AND SB1.IDBEM = SD1.IDBEM'
      '  AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '  AND SB1.IDBEM = B1.IDBEM'
      '  AND SB1.IDGRUPO = G1.IDGRUPO'
      ''
      'GROUP BY SB1.IDGRUPO, SB1.IDPESSOA'
      'ORDER BY SB1.IDGRUPO, SB1.IDPESSOA'
      '')
    ClientDataSet = cdsGrpAnaliticos
    Left = 48
    Top = 128
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 144
  end
  object sqlGrpSinteticos: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, G.IDGRUPO, PG.IDPESSOA'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE G.TIPO = '#39'S'#39
      ''
      '  AND PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      '')
    ClientDataSet = cdsGrpSinteticos
    Left = 136
    Top = 128
  end
  object cdsBalPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 144
  end
  object cdsDepPerTransf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 464
  end
  object sqlDepPerTransf: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO AS IDGRUPOENT, G.CLASSE AS CODGRUPO,'
      '       BTG.IDGRUPANT AS IDGRUPOSAI, GA.CLASSE AS CODGRUPOANT,'
      '       SUM(NVL(VM.VALOR,0)) AS VALOR'
      ''
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     VLRHISTMOVBEM VM,'
      ''
      '     (SELECT IDBEM, IDGRUPANT'
      '      FROM HISTORICOMOVIMENTACAO'
      '      WHERE (DATAMOVIMENTACAO >= :DATAINI)'
      '        AND (DATAMOVIMENTACAO <= :DATASLD)'
      '        AND (IDTIPOMOVIMENTACAO = 5)'
      '        AND (IDPESSOA = :IDPESSOA)) BTG,'
      ''
      '     (SELECT SCB.IDBEM, SCB.IDGRUPO'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :DATASLD)'
      '              AND (IDPESSOA = :IDPESSOA)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '      GRUPO G, GRUPO GA, BEM B'
      ''
      'WHERE (HM.DATAMOVIMENTACAO >= :DATAINI)'
      '  AND (HM.DATAMOVIMENTACAO <= :DATASLD)'
      
        '  AND ((HM.IDTIPOMOVIMENTACAO = 14) OR (HM.IDTIPOMOVIMENTACAO = ' +
        '18) OR (HM.IDTIPOMOVIMENTACAO = 35))'
      '  AND (HM.IDPESSOA  = :IDPESSOA)'
      '  AND (HM.TIPDEPPRORATA <> 2)'
      '  AND (VM.MOECODIGO = :MOECODIGO)'
      '  AND (VM.IDTAXADEP = :IDTAXADEP)'
      ''
      ''
      ''
      ''
      '  AND (HM.IDBEM = BTG.IDBEM)'
      '  AND (BTG.IDBEM = SB.IDBEM)'
      '  AND (SB.IDGRUPO = G.IDGRUPO)'
      '  AND (SB.IDBEM = B.IDBEM)'
      '  AND (BTG.IDGRUPANT = GA.IDGRUPO)'
      '  AND (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      ''
      'GROUP BY SB.IDGRUPO, G.CLASSE, BTG.IDGRUPANT, GA.CLASSE'
      '')
    ClientDataSet = cdsDepPerTransf
    Left = 520
    Top = 448
  end
  object sqlBalPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       G.TIPO AS S_A,'
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS VALORGCM,'
      '       (0.00) AS DEPLANCCM,'
      '       (0.00) AS DEPR,'
      '       (0.00) AS VALCTB,'
      '       (0.00) AS VALORGCM2,'
      '       (0.00) AS DEPLANCCM2'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      ' ')
    ClientDataSet = cdsBalPatAux
    Left = 224
    Top = 129
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 72
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
      '  AND PG.IDGRUPO  = G.IDGRUPO'
      '')
    ClientDataSet = cdsVerUltFec
    Left = 48
    Top = 56
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 72
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      '')
    ClientDataSet = cdsAux
    Left = 128
    Top = 56
  end
end
