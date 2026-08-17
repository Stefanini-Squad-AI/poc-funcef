inherited RPTConfCotas: TRPTConfCotas
  Left = 292
  Top = 202
  Width = 392
  Height = 151
  Caption = 'Conferência de Cotas'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conferência de Cotas'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Execício'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT'
          '   PEREXERCICIO'
          'FROM'
          '   PERIODO'
          'WHERE'
          '   (IDPESSOA = 1)'
          'ORDER BY  PEREXERCICIO'
          '')
        LookupSettings.Chave = 'PEREXERCICIO'
        LookupSettings.Display = 'PEREXERCICIO'
        LookupSettings.Descricao = 'Execício'
        LookupSettings.Tamanho = '15'
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
        Name = 'Execício'
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
        Caption = 'Período'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT  '
          '   PERNUMERO, '
          '   PERNOME,'
          '   PEREXERCICIO '
          'FROM '
          '   PERIODO '
          'ORDER BY '
          '   PEREXERCICIO,'
          '   PERNUMERO'
          '')
        LookupSettings.Chave = 'PERNUMERO'
        LookupSettings.Display = 'PEREXERCNOME'
        LookupSettings.Descricao = 'Período'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Período'
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
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Valores do Período'
          'Acumulador Até o Período')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 2
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
        Name = 'Valores'
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
        Caption = 'Imprime a Atividade/Projeto Sintética'
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
    OnParamControlExit = CmpRptCMParamControlExit
    OnParamControlEnter = CmpRptCMParamControlEnter
    Formheight = 250
    FormWidth = 500
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptConfCotas
    LabelEmpresa = ppLabel42
    LabelSistema = ppLabel55
  end
  object dsConfCotas: TwwDataSource
    DataSet = cdsConfCotas
    Left = 280
    Top = 8
  end
  object pplConfCotas: TppBDEPipeline
    DataSource = dsConfCotas
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lConfCotas'
    Left = 149
    Top = 64
    object pplConfCotasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERC'
      FieldName = 'PERC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplConfCotasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplConfCotasppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 25
      DisplayWidth = 25
      Position = 2
    end
    object pplConfCotasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCOTA'
      FieldName = 'VALORCOTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConfCotasppField5: TppField
      FieldAlias = 'UNECODIGO'
      FieldName = 'UNECODIGO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
  end
  object rptConfCotas: TppReport
    AutoStop = False
    DataPipeline = pplConfCotas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 221
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object pplblTituloConfCotas: TppLabel
        UserName = 'pplblTituloConfCotas'
        Caption = 'Conferência de Cotas por Atividade/Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 54769
        mmTop = 8731
        mmWidth = 87842
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'ppLine22'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'ppLabel42'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84402
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'ppLabel45'
        Caption = 'Percentual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 21960
        mmWidth = 14023
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'ppLine23'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object pplblTituloConfCotas2: TppLabel
        UserName = 'pplblTituloConfCotas2'
        Caption = 'pplblTituloConfSubConta2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 14552
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'ppLabel51'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 20902
        mmTop = 21960
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'ppLabel52'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 21960
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'ppLabel53'
        Caption = 'Ativ./Proj.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      BeforePrint = ppDetailBand6BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        AutoSize = True
        DataField = 'VALORCOTA'
        DataPipeline = pplConfCotas
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 529
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        DataField = 'PERC'
        DataPipeline = pplConfCotas
        DisplayFormat = '#,0.0000%;-#,0.0000%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 145257
        mmTop = 529
        mmWidth = 18521
        BandType = 4
      end
      object dbtxtAP: TppDBText
        UserName = 'dbtxtAP'
        DataField = 'UNECODIGO'
        DataPipeline = pplConfCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'ppDBText68'
        DataField = 'NOME'
        DataPipeline = pplConfCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 529
        mmWidth = 90223
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLabel55: TppLabel
        UserName = 'ppLabel55'
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
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
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
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object cdsConfCotas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 8
  end
  object sqlConfCotas: TCMSqlParams
    SQL.Strings = (
      'SELECT (0) AS PERC, UNIDNEGOC, UNECODIGO, '
      'NOME, (0) AS VALORCOTA            '
      
        'FROM UNIDNEGOCIO                                                ' +
        ' '
      'WHERE IDPESSOA =1 '
      '')
    ClientDataSet = cdsConfCotas
    Left = 336
    Top = 8
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 72
  end
  object sqlAux: TCMSqlParams
    ClientDataSet = cdsAux
    Left = 72
    Top = 72
  end
end
