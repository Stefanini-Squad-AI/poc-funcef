inherited RptBenefPorTipo: TRptBenefPorTipo
  Left = 250
  Top = 215
  Width = 289
  Height = 271
  Caption = 'RptBenefPorTipo'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdRubrica'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaIdRubrica'
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
        Caption = 'MesRef'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MesRef'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBenefPorTipo
    ConnectionType = cntBDE
  end
  object rpBenefPorTipo: TppReport
    AutoStop = False
    DataPipeline = ppBenefPorTipo
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 215
    Version = '5.5'
    mmColumnWidth = 197300
    object rpBenefPorTipoHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object rpBenefPorTipoLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLblTITULO'
        Caption = 'Relatório de Benefícios por Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 9790
        mmWidth = 55033
        BandType = 0
      end
      object rpBenefPorTipoLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpBenefPorTipoLbl3: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 10319
        mmWidth = 14817
        BandType = 0
      end
      object rpBenefPorTipoDBTxt1: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppBenefPorTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89959
        mmTop = 2381
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefPorTipoCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 7938
        BandType = 0
      end
      object rpBenefPorTipoCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpBenefPorTipoDBTxt6: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt6'
        DataField = 'ANOMESINICIO'
        DataPipeline = ppBenefPorTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 125413
        mmTop = 1058
        mmWidth = 29369
        BandType = 4
      end
      object rpBenefPorTipoDBTxt7: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt7'
        DataField = 'VALOR'
        DataPipeline = ppBenefPorTipo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 1058
        mmWidth = 23813
        BandType = 4
      end
      object rpBenefPorTipoDBTxt2: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt2'
        DataField = 'MATRICULA'
        DataPipeline = ppBenefPorTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 1058
        mmWidth = 21960
        BandType = 4
      end
      object rpBenefPorTipoDBTxt3: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt3'
        DataField = 'EMPREGADO'
        DataPipeline = ppBenefPorTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 1058
        mmWidth = 87842
        BandType = 4
      end
    end
    object rpBenefPorTipoFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object rpBenefPorTipoSmryBndSmryBnd: TppSummaryBand
      AfterPrint = rpBenefPorTipoSmryBndSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
    object rpBenefPorTipoGrp1: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppBenefPorTipo
      NewPage = True
      UserName = 'rpBenefPorPessoaGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'rpBenefPorPessoaLine2'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 7144
          mmTop = 529
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorTipoLbl12: TppLabel
          UserName = 'rpBenefPorPessoaLbl11'
          AutoSize = False
          Caption = 'Custo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 126736
          mmTop = 3440
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorTipoDBCalc3: TppDBCalc
          UserName = 'rpBenefPorPessoaDBCalc3'
          DataField = 'VALOR'
          DataPipeline = ppBenefPorTipo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorTipoGrp1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 162190
          mmTop = 3440
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorTipoLbl11: TppLabel
          UserName = 'rpBenefPorPessoaLbl10'
          AutoSize = False
          Caption = 'Total de Tipos:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 7144
          mmTop = 3440
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorTipoDBCalc2: TppDBCalc
          UserName = 'rpBenefPorPessoaDBCalc2'
          DataField = 'QTDE_TIPOS'
          DataPipeline = ppBenefPorTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorTipoGrp1
          Transparent = True
          mmHeight = 3704
          mmLeft = 32544
          mmTop = 3440
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorTipoLbl6: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Benefícios:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 63500
          mmTop = 3440
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'BENEFICIO'
          DataPipeline = ppBenefPorTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorTipoGrp1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 94721
          mmTop = 3440
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpBenefPorTipoGrp2: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = ppBenefPorTipo
      KeepTogether = True
      UserName = 'rpBenefPorPessoaGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'rpBenefPorPessoaShape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 5821
          mmLeft = 7144
          mmTop = 0
          mmWidth = 183886
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorTipoDBTxt4: TppDBText
          UserName = 'rpBenefPorPessoaDBTxt4'
          DataField = 'CARGO'
          DataPipeline = ppBenefPorTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 123031
          mmTop = 1058
          mmWidth = 66146
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorTipoLbl8: TppLabel
          UserName = 'rpBenefPorPessoaLbl7'
          AutoSize = False
          Caption = 'Data de Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 125413
          mmTop = 7673
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorTipoLbl9: TppLabel
          UserName = 'rpBenefPorPessoaLbl8'
          AutoSize = False
          Caption = 'Valor Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 167217
          mmTop = 7673
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorTipoDBTxt5: TppDBText
          UserName = 'rpBenefPorPessoaDBTxt5'
          DataField = 'BENEFICIO'
          DataPipeline = ppBenefPorTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 1058
          mmWidth = 105304
          BandType = 3
          GroupNo = 1
        end
        object rpBenefPorTipoLbl4: TppLabel
          UserName = 'rpBenefPorPessoaLbl3'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 7673
          mmWidth = 21960
          BandType = 3
          GroupNo = 1
        end
        object rpBenefPorTipoLbl5: TppLabel
          UserName = 'rpBenefPorPessoaLbl4'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 32808
          mmTop = 7673
          mmWidth = 87842
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpBenefPorTipoLbl10: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Custo do Benefício:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 123825
          mmTop = 1323
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'rpBenefPorPessoaLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 7144
          mmTop = 0
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorTipoDBCalc1: TppDBCalc
          UserName = 'rpBenefPorPessoaDBCalc1'
          DataField = 'VALOR'
          DataPipeline = ppBenefPorTipo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorTipoGrp2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 162190
          mmTop = 1323
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Número de Beneficiários:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 13494
          mmTop = 1323
          mmWidth = 38100
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'EMPREGADO'
          DataPipeline = ppBenefPorTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorTipoGrp2
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 53181
          mmTop = 1323
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppBenefPorTipo: TppBDEPipeline
    DataSource = dsBenefPorTipo
    SkipWhenNoRecords = False
    UserName = 'BenefPorTipo'
    Left = 215
    Top = 48
  end
  object dsBenefPorTipo: TwwDataSource
    DataSet = CdsBenefPorTipo
    Left = 215
    Top = 96
  end
  object sqlBenefPorTipo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  '#39'1234567890123456789012345678901234567890'#39' AS CARGO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS BENEFICIO,'
      '  '#39'2000/10'#39' AS ANOMESINICIO,'
      '  0 AS VALOR,'
      '  0 AS QTDE_TIPOS'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsBenefPorTipo
    Left = 215
    Top = 190
  end
  object CdsBenefPorTipo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsBenefPorTipoIndex1'
        Fields = 'EMPRESA;BENEFICIO;EMPREGADO'
      end>
    IndexName = 'CdsBenefPorTipoIndex1'
    Params = <>
    StoreDefs = True
    AfterOpen = CdsBenefPorTipoAfterOpen
    AfterScroll = CdsBenefPorTipoAfterScroll
    Left = 215
    Top = 144
  end
end
