inherited RptCAFSelBxBens: TRptCAFSelBxBens
  Left = 259
  Top = 178
  Width = 298
  Height = 148
  Caption = 'RptCAFSelBxBens'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Seleção de Bens para Baixa'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Data da Seleção'
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
        Caption = 'Termo'
        Controle = tcMontaSelect
        TipodeDado = tdInteger
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
        MontaSelect = MSTermo
        Width = 0
      end
      item
        Caption = 'Responsável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME')
        LookupSettings.Chave = 'IDRESPONSAVEL'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Responsável'
        LookupSettings.Tamanho = '50'
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
        Caption = ' Termos '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Não Executados'
          'Executados'
          'Ambos')
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
        Caption = ' Valor '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Residual'
          'Aquisição')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
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
        Caption = ' Ordenado por '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Placa'
          'Descrição'
          'Aquisição'
          'Residual')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 4
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 280
    FormWidth = 480
    Left = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpSelBxBens
    LabelEmpresa = ppLabel2
    LabelSistema = ppLabel14
    Left = 80
  end
  object sqlSelBxBens: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.SBXTERMO, SB.IDSELBAIXA,'
      '       SB.SBXPROCESSO,'
      '       SB.SBXDATA,'
      '       PR.NOME AS NOMERESP, PD.NOME AS NOMEDEST,'
      '       B.PLACA,'
      '       B.IDBEM, SBB.IDPESSOA,'
      '       B.DESBEM AS DESCBEM,'
      '       SCB.VALORG AS VALAQUIS,'
      '       SCB.SALDOCONTAB AS VALCTB,'
      '       SB.SBXFLGEXECUTADO,'
      '       SB.SBXDTAEXECUTADO'
      'FROM SELBAIXA SB,'
      '     SELBAIXABENS SBB,'
      '     BEM B,'
      '     PESSOA PR,'
      '     PESSOA PD,'
      
        '     (SELECT SCB1.IDBEM, SCB1.IDPESSOA, SCB1.DATASLDBEM, SCB1.MO' +
        'ECODIGO, SCD1.IDSLDCTBBEMXDEP,'
      '             SCB1.VALORG,'
      
        '             (SCB1.VALORG  + SCB1.REAVVALORG  + SCB1.ULTREAVVALO' +
        'RG +'
      
        '              SCB1.CMBEM   + SCB1.REAVCMBEM   + SCB1.ULTREAVCMBE' +
        'M -'
      
        '              SCD1.DEPLANC - SCD1.REAVDEPLANC - SCD1.ULTREAVDEPL' +
        'ANC -'
      
        '              SCD1.CMDEP   - SCD1.REAVCMDEP   - SCD1.ULTREAVCMDE' +
        'P) AS SALDOCONTAB'
      '      FROM SALDOCONTABBEM SCB1,'
      '           SLDCTBBEMXDEP  SCD1,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE SCB1.MOECODIGO = :MOECODIGO'
      '        AND SCD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND SCB1.IDPESSOA = :IDPESSOA'
      '        AND SCB1.DATASLDBEM = DTAMAX.DATA'
      '        AND SCB1.IDBEM = DTAMAX.IDBEM'
      '        AND SCB1.IDBEM = SCD1.IDBEM'
      '        AND SCB1.IDPESSOA = SCD1.IDPESSOA'
      '        AND SCB1.MOECODIGO = SCD1.MOECODIGO'
      '        AND SCB1.DATASLDBEM = SCD1.DATASLDBEM) SCB'
      'WHERE SB.IDPESSOA = :IDPESSOA'
      ''
      ''
      ''
      '  AND SB.SBTIPOMOV = 0'
      '  AND SB.IDSELBAIXA = SBB.IDSELBAIXA'
      '  AND SB.IDPESSOA = SBB.IDPESSOA'
      '  AND SBB.IDBEM = B.IDBEM'
      '  AND SBB.IDPESSOA = B.IDPESSOA'
      '  AND SBB.IDBEM = SCB.IDBEM'
      '  AND SBB.IDPESSOA = SCB.IDPESSOA'
      '  AND SB.IDRESPONSAVEL = PR.IDPESSOA(+)'
      '  AND SB.IDDESTINOBAIXA = PD.IDPESSOA(+)'
      ''
      'ORDER BY SB.SBXTERMO, B.PLACA'
      '')
    ClientDataSet = cdsSelBxBens
    Left = 208
    Top = 62
  end
  object cdsSelBxBens: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 49
  end
  object dsSelBxBens: TwwDataSource
    DataSet = cdsSelBxBens
    Left = 211
    Top = 36
  end
  object ppSelBxBens: TppBDEPipeline
    DataSource = dsSelBxBens
    UserName = 'SelBxBens'
    Left = 211
    Top = 23
  end
  object rpSelBxBens: TppReport
    AutoStop = False
    DataPipeline = ppSelBxBens
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 211
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Termo de Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 77788
        mmTop = 8467
        mmWidth = 41804
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object rpSelBxBensDBCalc1: TppDBCalc
        UserName = 'rpSelBxBensDBCalc1'
        DataField = 'SBXTERMO'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = rpSelBxBensGroup1
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        OnGroupBreak = rpSelBxBensDBCalc1GroupBreak
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object rpSelBxBensDBText7: TppDBText
        UserName = 'rpSelBxBensDBText7'
        DataField = 'PLACA'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpSelBxBensDBText9: TppDBText
        UserName = 'rpSelBxBensDBText9'
        DataField = 'VALAQUIS'
        DataPipeline = ppSelBxBens
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object rpSelBxBensDBMemo1: TppDBMemo
        UserName = 'rpSelBxBensDBMemo1'
        CharWrap = True
        DataField = 'DESCBEM'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 8731
        mmLeft = 38365
        mmTop = 0
        mmWidth = 128323
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
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
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 70908
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 794
        mmWidth = 52917
        BandType = 8
      end
    end
    object rpSelBxBensGroup1: TppGroup
      BreakName = 'SBXTERMO'
      DataPipeline = ppSelBxBens
      NewPage = True
      ResetPageNo = True
      UserName = 'rpSelBxBensGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpSelBxBensGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22754
        mmPrintPosition = 0
        object rpSelBxBensLabel1: TppLabel
          UserName = 'rpSelBxBensLabel1'
          Caption = 'Termo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel2: TppLabel
          UserName = 'rpSelBxBensLabel2'
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 3969
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel3: TppLabel
          UserName = 'rpSelBxBensLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7938
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel4: TppLabel
          UserName = 'rpSelBxBensLabel4'
          Caption = 'Destinatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 11906
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel6: TppLabel
          UserName = 'rpSelBxBensLabel6'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 17463
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel5: TppLabel
          UserName = 'rpSelBxBensLabel5'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 17463
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel7: TppLabel
          UserName = 'rpSelBxBensLabel7'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38365
          mmTop = 17463
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel8: TppLabel
          UserName = 'rpSelBxBensLabel8'
          Caption = 'Valor Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 173302
          mmTop = 17463
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLine1: TppLine
          UserName = 'rpSelBxBensLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 16669
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLine2: TppLine
          UserName = 'rpSelBxBensLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 22225
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText1: TppDBText
          UserName = 'rpSelBxBensDBText1'
          AutoSize = True
          DataField = 'SBXTERMO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 23283
          mmTop = 0
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText2: TppDBText
          UserName = 'rpSelBxBensDBText2'
          DataField = 'SBXPROCESSO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 3969
          mmWidth = 110596
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText3: TppDBText
          UserName = 'rpSelBxBensDBText3'
          DataField = 'NOMERESP'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 7938
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel9: TppLabel
          UserName = 'rpSelBxBensLabel9'
          Caption = 'Selecionado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 0
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel10: TppLabel
          UserName = 'rpSelBxBensLabel10'
          Caption = 'Executado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 3969
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText4: TppDBText
          UserName = 'rpSelBxBensDBText4'
          DataField = 'NOMEDEST'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 11906
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText5: TppDBText
          UserName = 'rpSelBxBensDBText5'
          AutoSize = True
          DataField = 'SBXDATA'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 162719
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText6: TppDBText
          UserName = 'rpSelBxBensDBText6'
          AutoSize = True
          DataField = 'SBXDTAEXECUTADO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 162719
          mmTop = 3969
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSelBxBensGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpSelBxBensLabel11: TppLabel
          UserName = 'rpSelBxBensLabel11'
          Caption = 'SOMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 529
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensDBCalc2: TppDBCalc
          UserName = 'rpSelBxBensDBCalc2'
          DataField = 'VALAQUIS'
          DataPipeline = ppSelBxBens
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpSelBxBensGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 168275
          mmTop = 529
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensLine3: TppLine
          UserName = 'rpSelBxBensLine3'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensLine4: TppLine
          UserName = 'rpSelBxBensLine4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object MSTermo: TMontaSelect
    Tag = 1
    Template.IdConsulta = 0
    Caption = 'Selecione o Termo'
    Colunas.Strings = (
      'SELBAIXA.SBXTERMO'
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.SBXDATA'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'D'
      'C')
    Descricao.Strings = (
      'Termo de Baixa'
      'Processo'
      'Data da Seleção'
      'Responsável')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SELBAIXA'
      'PESSOA')
    CamposChave.Strings = (
      'SELBAIXA.SBXPROCESSO'
      'SELBAIXA.IDSELBAIXA'
      'SELBAIXA.IDPESSOA')
    Filtro.Strings = (
      'SELBAIXA.IDRESPONSAVEL=PESSOA.IDPESSOA(+)'
      'SELBAIXA.SBTIPOMOV=0')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '80'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 16
    Top = 64
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 72
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
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 80
    Top = 56
  end
end
