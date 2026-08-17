inherited RptPosiFornxRespon: TRptPosiFornxRespon
  Left = 251
  Top = 209
  Height = 149
  Caption = 'RptPosiFornxRespon'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Posição de Fornecedor por Centro de Responsabilidade'
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
        Caption = 'Fornecedor'
        Controle = tcProcuraFC
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
    Formheight = 180
    FormWidth = 500
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptPosiFornxRespon
    LabelEmpresa = ppLabel5
    LabelSistema = ppLabel16
  end
  object PpPosiFornxRespon: TppBDEPipeline
    DataSource = DsPosiFornxRespon
    SkipWhenNoRecords = False
    UserName = 'PpPosiFornxRespon'
    Left = 131
    Top = 50
    object PpPosiFornxResponppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object PpPosiFornxResponppField2: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object PpPosiFornxResponppField3: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object PpPosiFornxResponppField4: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object PpPosiFornxResponppField5: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object PpPosiFornxResponppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object PpPosiFornxResponppField7: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object PpPosiFornxResponppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object PpPosiFornxResponppField9: TppField
      FieldAlias = 'NOMECENTRESPON'
      FieldName = 'NOMECENTRESPON'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object PpPosiFornxResponppField10: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object PpPosiFornxResponppField11: TppField
      FieldAlias = 'TIPOMOV'
      FieldName = 'TIPOMOV'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
  end
  object DsPosiFornxRespon: TwwDataSource
    DataSet = CdsPosiFornxRespon
    Left = 81
    Top = 50
  end
  object RptPosiFornxRespon: TppReport
    AutoStop = False
    DataPipeline = PpPosiFornxRespon
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 182
    Top = 50
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Posição de fornecedores por Centro de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 42598
        mmTop = 7938
        mmWidth = 116946
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
        mmLeft = 84402
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object LblPosiForn: TppLabel
        UserName = 'LblPosiForn'
        Caption = 'Período do movimento: 01/06/1999 a 01/07/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 61913
        mmTop = 13494
        mmWidth = 78581
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'DATALANCTO'
        DataPipeline = PpPosiFornxRespon
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150548
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpPosiFornxRespon
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 115623
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'DATAVENCTO'
        DataPipeline = PpPosiFornxRespon
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpPosiFornxRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpPosiFornxRespon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpPosiFornxRespon
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1058
        mmWidth = 23019
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
        mmLeft = 87842
        mmTop = 1058
        mmWidth = 21167
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
        mmLeft = 170657
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'ppLine10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 2910
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentHeight = True
        Position = lpRight
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 194469
        mmTop = 0
        mmWidth = 2910
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPOMOV'
      DataPipeline = PpPosiFornxRespon
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLabel8: TppLabel
          UserName = 'ppLabel8'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 529
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'ppLine6'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 4763
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object LblTipoMov: TppLabel
          UserName = 'LblTipoMov'
          Caption = 'Documentos em aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 5821
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
        object DbTTipoMov: TppDBText
          UserName = 'DbTTipoMov'
          DataField = 'TIPOMOV'
          DataPipeline = PpPosiFornxRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'ppLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'ppLabel6'
          Caption = 'Cent. Respon.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 43127
          mmTop = 529
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'ppLine4'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'ppLine5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5027
          mmLeft = 197115
          mmTop = 0
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'ppLabel10'
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 79375
          mmTop = 529
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'ppLabel11'
          Caption = 'Cplto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 106627
          mmTop = 529
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
          Caption = 'Data Prog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 529
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'ppLabel13'
          Caption = 'Data Venc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 529
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object LblDataLancto: TppLabel
          UserName = 'LblDataLancto'
          Caption = 'Data Lancto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 150548
          mmTop = 529
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'ppLabel15'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 189177
          mmTop = 529
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object LblTotAberto: TppLabel
          UserName = 'LblTotAberto'
          Caption = 'Total de Documentos em aberto no Período:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 64294
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpPosiFornxRespon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176742
          mmTop = 0
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptPosiFornxResponGroup1: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = PpPosiFornxRespon
      UserName = 'RptPosiFornxResponGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptPosiFornxResponGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppDBText14: TppDBText
          UserName = 'ppDBText14'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpPosiFornxRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object RptPosiFornxResponLine1: TppLine
          UserName = 'RptPosiFornxResponLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 1058
          mmTop = 0
          mmWidth = 197115
          BandType = 3
          GroupNo = 1
        end
      end
      object RptPosiFornxResponGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppLabel20: TppLabel
          UserName = 'ppLabel20'
          Caption = 'Sub Total Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpPosiFornxRespon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptPosiFornxResponGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176742
          mmTop = 0
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = PpPosiFornxRespon
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          AutoSize = True
          DataField = 'NOMECENTRESPON'
          DataPipeline = PpPosiFornxRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 43127
          mmTop = 0
          mmWidth = 28046
          BandType = 3
          GroupNo = 1
        end
        object ppDBText9: TppDBText
          UserName = 'ppDBText9'
          AutoSize = True
          DataField = 'CODCENTRORESPON'
          DataPipeline = PpPosiFornxRespon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 106892
          mmTop = 0
          mmWidth = 30163
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'ppDBCalc4'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpPosiFornxRespon
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176742
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'ppLabel18'
          Caption = 'Sub Total Centro de Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 43127
          mmTop = 529
          mmWidth = 56356
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object SqlPosiFornxRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT /*+ RULE */ '
      
        '  NODOCUMENTO, COMPLDOCUMENTO, DATAVENCTO, DATAPROGRAMADA, DATAL' +
        'ANCTO,'
      
        '  IDPESSOA, RAZAOSOCIAL, VALOR,  NOMECENTRESPON, CODCENTRORESPON' +
        ', TIPOMOV'
      'FROM'
      '('
      'SELECT'
      
        '  NODOCUMENTO, COMPLDOCUMENTO, DATAVENCTO, DATAPROGRAMADA, DATAL' +
        'ANCTO,'
      
        '  IDPESSOA, RAZAOSOCIAL, VALOR,  NOMECENTRESPON, CODCENTRORESPON' +
        ', TIPOMOV'
      'FROM'
      '   (SELECT'
      
        '    DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, DOC.DATAVENCTO, DOC.DAT' +
        'APROGRAMADA,'
      
        '    LAN.DATALANCTO, P.IDPESSOA, P.RAZAOSOCIAL, RD.VALOR, CR.NOME' +
        ' AS NOMECENTRESPON,'
      '    RD.CODCENTRORESPON, ('#39'A'#39') AS TIPOMOV'
      '   FROM'
      '    DOCUMENTO DOC,'
      '    LANCTODOCUM LAN,'
      '    RATEIODOCUM RD,'
      '    CENTRESPON CR,'
      '    PESSOA P'
      '   WHERE'
      '    (DOC.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'10'#39','#39'14'#39','#39'15'#39'))       AND'
      '    (DOC.RECPAG = '#39'P'#39')                               AND'
      '    (DOC.STATUS <> '#39'2'#39' OR DOC.STATUS IS NULL)        AND'
      '    (DOC.IDPESSOA = :PIDPESSOA)                      AND'
      '    (DOC.DATAVENCTO >= :PDATAINI)                    AND'
      '    (DOC.IDFORCLI = P.IDPESSOA)                      AND'
      '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)            AND'
      '    (LAN.OPERACAO     = DOC.OPERACAO)                AND'
      '    (LAN.estorno is null)                            AND'
      '    (RD.CODDOCUMENTO  = DOC.CODDOCUMENTO)            AND'
      '    (RD.CODCENTRORESPON = CR.CODCENTRORESPON)        AND'
      '    (RD.IDPESSOA  = CR.IDPESSOA))'
      '    UNION ALL'
      '    (SELECT'
      
        '     Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAPR' +
        'OGRAMADA,'
      
        '     Q1.DATALANCTO, Q1.IDPESSOA, Q1.RAZAOSOCIAL,((Q1.VALOR * Q2.' +
        'LACVALOR)/ Q2.VALOR) AS VALOR,'
      '     Q2.NOMECENTRESPON, Q2.CODCENTRORESPON, ('#39'A'#39') AS TIPOMOV'
      '     FROM'
      '     (SELECT'
      
        '       LAN.VALOR, DOC.NUMFATURA, DOC.DATAVENCTO, LAN.DATALANCTO,' +
        ' DOC.DATAPROGRAMADA,'
      
        '       DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, P.RAZAOSOCIAL, P.IDP' +
        'ESSOA'
      '      FROM'
      '       DOCUMENTO DOC, LANCTODOCUM LAN, PESSOA P'
      '      WHERE'
      '       (DOC.OPERACAO = '#39'3'#39')                             AND'
      '       (DOC.RECPAG   = '#39'P'#39')                             AND'
      '       (DOC.STATUS <> '#39'2'#39' OR DOC.STATUS IS NULL)        AND'
      '       (DOC.IDPESSOA = :PIDPESSOA)                      AND'
      '       (DOC.DATAVENCTO >= :PDATAINI)                    AND'
      '       (LAN.estorno is null)                            AND'
      '       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)            AND'
      '       (LAN.OPERACAO  = DOC.OPERACAO)                   AND'
      '       (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '     (SELECT'
      
        '       DOC.NUMFATURA, RD.VALOR AS LACVALOR, LAN.VALOR, RD.CODCEN' +
        'TRORESPON,'
      '       CR.NOME AS NOMECENTRESPON'
      '      FROM'
      
        '       DOCUMENTO DOC, LANCTODOCUM LAN, RATEIODOCUM RD, CENTRESPO' +
        'N CR'
      '      WHERE'
      '       (LAN.OPERACAO = '#39'1'#39')                      AND'
      '       (DOC.RECPAG = '#39'P'#39')                        AND'
      '       (DOC.IDPESSOA = :PIDPESSOA)               AND'
      '       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '       (LAN.OPERACAO     = DOC.OPERACAO)         AND'
      '       (LAN.estorno is null)                     AND'
      '       (RD.CODDOCUMENTO  = DOC.CODDOCUMENTO)     AND'
      '       (RD.CODCENTRORESPON = CR.CODCENTRORESPON) AND'
      '       (RD.IDPESSOA  = CR.IDPESSOA)) Q2'
      '      WHERE Q1.NUMFATURA = Q2.NUMFATURA)'
      'UNION ALL'
      'SELECT'
      
        '  NODOCUMENTO, COMPLDOCUMENTO, DATAVENCTO, DATAPROGRAMADA, DATAL' +
        'ANCTO,'
      
        '  IDPESSOA, RAZAOSOCIAL, VALOR,  NOMECENTRESPON, CODCENTRORESPON' +
        ', TIPOMOV'
      'FROM'
      '   (SELECT'
      
        '    DOC.NODOCUMENTO,  DOC.COMPLDOCUMENTO, DOC.DATAVENCTO, DOC.DA' +
        'TAPROGRAMADA,'
      '    LAN.DATALANCTO, P.IDPESSOA, P.RAZAOSOCIAL, RD.VALOR,'
      
        '    CR.NOME AS NOMECENTRESPON, RD.CODCENTRORESPON, ('#39'B'#39') AS TIPO' +
        'MOV'
      '   FROM'
      '    DOCUMENTO DOC,'
      '    LANCTODOCUM LAN,'
      '    RATEIODOCUM RD,'
      '    CENTRESPON CR,'
      '    RECBTOPAGTO RP,'
      '    PESSOA P'
      '   WHERE'
      '    (DOC.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'10'#39','#39'14'#39','#39'15'#39'))       AND'
      '    (DOC.RECPAG = '#39'P'#39')                               AND'
      '    (DOC.IDPESSOA = :PIDPESSOA)                      AND'
      '    (LAN.DATALANCTO BETWEEN :PDATAINI AND :PDATAFIM) AND'
      '    (LAN.estorno is null)                            AND'
      '    (DOC.IDFORCLI = P.IDPESSOA)                      AND'
      '    (RP.CODDOCUMENTO = LAN.CODDOCUMENTO)             AND'
      '    (RP.NUMLANCTO = LAN.NUMLANCTO)                   AND'
      '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)            AND'
      '    (RD.CODDOCUMENTO  = DOC.CODDOCUMENTO)            AND'
      '    (RD.CODCENTRORESPON = CR.CODCENTRORESPON)        AND'
      '    (RD.IDPESSOA  = CR.IDPESSOA))'
      '    UNION ALL'
      '    (SELECT'
      
        '     Q1.NODOCUMENTO, Q1.COMPLDOCUMENTO, Q1.DATAVENCTO, Q1.DATAPR' +
        'OGRAMADA,'
      
        '     Q1.DATALANCTO, Q1.IDPESSOA, Q1.RAZAOSOCIAL,((Q1.VALOR * Q2.' +
        'LACVALOR)/ Q2.VALOR) AS VALOR,'
      '     Q2.NOMECENTRESPON, Q2.CODCENTRORESPON, ('#39'B'#39') AS TIPOMOV'
      '     FROM'
      '     (SELECT'
      
        '       LAN.VALOR, DOC.NUMFATURA, DOC.DATAVENCTO, LAN.DATALANCTO,' +
        ' DOC.DATAPROGRAMADA,'
      
        '       DOC.NODOCUMENTO, DOC.COMPLDOCUMENTO, P.RAZAOSOCIAL, P.IDP' +
        'ESSOA'
      '      FROM'
      '       DOCUMENTO DOC, LANCTODOCUM LAN, RECBTOPAGTO RP, PESSOA P'
      '      WHERE'
      '       (DOC.OPERACAO = '#39'3'#39')                             AND'
      '       (DOC.RECPAG   = '#39'P'#39')                             AND'
      '       (DOC.IDPESSOA = :PIDPESSOA)                      AND'
      '       (LAN.DATALANCTO BETWEEN :PDATAINI AND :PDATAFIM) AND'
      '       (LAN.NUMLANCTO = RP.NUMLANCTO)                   AND'
      '       (LAN.CODDOCUMENTO = RP.CODDOCUMENTO)             AND'
      '       (LAN.estorno is null)                            AND'
      '       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)            AND'
      '       (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '     (SELECT'
      
        '       DOC.NUMFATURA, RD.VALOR AS LACVALOR, LAN.VALOR, RD.CODCEN' +
        'TRORESPON,'
      '       CR.NOME AS NOMECENTRESPON'
      '      FROM'
      
        '       DOCUMENTO DOC, LANCTODOCUM LAN, RATEIODOCUM RD, CENTRESPO' +
        'N CR'
      '      WHERE'
      '       (LAN.OPERACAO = '#39'1'#39')                      AND'
      '       (DOC.RECPAG = '#39'P'#39')                        AND'
      '       (DOC.IDPESSOA = :PIDPESSOA)               AND'
      '       (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '       (LAN.estorno is null)                     AND'
      '       (RD.CODDOCUMENTO  = DOC.CODDOCUMENTO)     AND'
      '       (RD.CODCENTRORESPON = CR.CODCENTRORESPON) AND'
      '       (RD.IDPESSOA  = CR.IDPESSOA)) Q2'
      '      WHERE Q1.NUMFATURA = Q2.NUMFATURA))'
      'ORDER BY'
      '           TIPOMOV,'
      '            RAZAOSOCIAL, IDPESSOA,'
      '            NOMECENTRESPON, CODCENTRORESPON,'
      '            NODOCUMENTO, COMPLDOCUMENTO'
      ' '
      ' '
      ' '
      '')
    ClientDataSet = CdsPosiFornxRespon
    Left = 48
    Top = 48
  end
  object CdsPosiFornxRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 8
    Top = 48
  end
end
