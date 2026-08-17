inherited RptBenefPorPessoa: TRptBenefPorPessoa
  Left = 243
  Top = 191
  Width = 300
  Height = 269
  Caption = 'RptBenefPorPessoa'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdFunc'
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
        Name = 'ListaIdFunc'
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
    Report = rpBenefPorPessoa
    ConnectionType = cntBDE
  end
  object rpBenefPorPessoa: TppReport
    AutoStop = False
    DataPipeline = ppBenefPorPessoa
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
    Left = 221
    Version = '5.5'
    mmColumnWidth = 197300
    object rpBenefPorPessoaHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object rpBenefPorPessoaLblTITULO: TppLabel
        UserName = 'rpBenefPorPessoaLblTITULO'
        Caption = 'Relatório de Benefícios por Pessoa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 68792
        mmTop = 9790
        mmWidth = 59796
        BandType = 0
      end
      object rpBenefPorPessoaLbl1: TppLabel
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
      object rpBenefPorPessoaLbl2: TppLabel
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
      object rpBenefPorPessoaDBTxt1: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppBenefPorPessoa
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
      object rpBenefPorPessoaCalc1: TppSystemVariable
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
      object rpBenefPorPessoaCalc2: TppSystemVariable
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
      object rpBenefPorPessoaLbl3: TppLabel
        UserName = 'rpBenefPorPessoaLbl3'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 16933
        mmWidth = 21960
        BandType = 0
      end
      object rpBenefPorPessoaLbl4: TppLabel
        UserName = 'rpBenefPorPessoaLbl4'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 16933
        mmWidth = 87842
        BandType = 0
      end
      object rpBenefPorPessoaLbl5: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Cargo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 123031
        mmTop = 16933
        mmWidth = 66146
        BandType = 0
      end
    end
    object rpBenefPorPessoaDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpBenefPorPessoaDBTxt5: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt5'
        DataField = 'BENEFICIO'
        DataPipeline = ppBenefPorPessoa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 1058
        mmWidth = 105304
        BandType = 4
      end
      object rpBenefPorPessoaDBTxt6: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt6'
        DataField = 'ANOMESINICIO'
        DataPipeline = ppBenefPorPessoa
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
      object rpBenefPorPessoaDBTxt7: TppDBText
        UserName = 'rpBenefPorPessoaDBTxt7'
        DataField = 'VALOR'
        DataPipeline = ppBenefPorPessoa
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
    end
    object rpBenefPorPessoaFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object rpBenefPorPessoaSmryBnd: TppSummaryBand
      AfterPrint = rpBenefPorPessoaSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
    end
    object rpBenefPorPessoaGrp2: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppBenefPorPessoa
      NewPage = True
      UserName = 'rpBenefPorPessoaGrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object rpBenefPorPessoaLine2: TppLine
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
        object rpBenefPorPessoaLbl11: TppLabel
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
        object rpBenefPorPessoaDBCalc3: TppDBCalc
          UserName = 'rpBenefPorPessoaDBCalc3'
          DataField = 'VALOR'
          DataPipeline = ppBenefPorPessoa
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorPessoaGrp2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 162190
          mmTop = 3440
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorPessoaLbl10: TppLabel
          UserName = 'rpBenefPorPessoaLbl10'
          AutoSize = False
          Caption = 'Total de Pessoas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 16669
          mmTop = 3440
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorPessoaDBCalc2: TppDBCalc
          UserName = 'rpBenefPorPessoaDBCalc2'
          DataField = 'QTDE_FUNC'
          DataPipeline = ppBenefPorPessoa
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorPessoaGrp2
          Transparent = True
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 3440
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpBenefPorPessoaGrp1: TppGroup
      BreakName = 'EMPREGADO'
      DataPipeline = ppBenefPorPessoa
      KeepTogether = True
      UserName = 'rpBenefPorPessoaGrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpBenefPorPessoaGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13229
        mmPrintPosition = 0
        object rpBenefPorPessoaShape1: TppShape
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
        object rpBenefPorPessoaDBTxt3: TppDBText
          UserName = 'rpBenefPorPessoaDBTxt3'
          DataField = 'EMPREGADO'
          DataPipeline = ppBenefPorPessoa
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
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorPessoaDBTxt4: TppDBText
          UserName = 'rpBenefPorPessoaDBTxt4'
          DataField = 'CARGO'
          DataPipeline = ppBenefPorPessoa
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
        object rpBenefPorPessoaDBTxt2: TppDBText
          UserName = 'rpBenefPorPessoaDBTxt2'
          DataField = 'MATRICULA'
          DataPipeline = ppBenefPorPessoa
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
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorPessoaLbl6: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Tipo de Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7144
          mmTop = 8996
          mmWidth = 105304
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorPessoaLbl7: TppLabel
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
          mmTop = 8996
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPorPessoaLbl8: TppLabel
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
          mmTop = 8996
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBenefPorPessoaGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpBenefPorPessoaLbl9: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Total da Pessoa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 126736
          mmTop = 1323
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorPessoaLine1: TppLine
          UserName = 'rpBenefPorPessoaLine1'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 7144
          mmTop = 0
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPorPessoaDBCalc1: TppDBCalc
          UserName = 'rpBenefPorPessoaDBCalc1'
          DataField = 'VALOR'
          DataPipeline = ppBenefPorPessoa
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpBenefPorPessoaGrp1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 162190
          mmTop = 1323
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppBenefPorPessoa: TppBDEPipeline
    DataSource = dsBenefPorPessoa
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 221
    Top = 48
  end
  object dsBenefPorPessoa: TwwDataSource
    DataSet = CdsBenefPorPessoa
    Left = 221
    Top = 96
  end
  object sqlBenefPorPessoa: TCMSqlParams
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
      '  0 AS QTDE_FUNC'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsBenefPorPessoa
    Left = 219
    Top = 190
  end
  object CdsBenefPorPessoa: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsBenefPorPessoaIndex1'
        Fields = 'EMPRESA;EMPREGADO;BENEFICIO'
      end>
    IndexName = 'CdsBenefPorPessoaIndex1'
    Params = <>
    StoreDefs = True
    AfterOpen = CdsBenefPorPessoaAfterOpen
    AfterScroll = CdsBenefPorPessoaAfterScroll
    Left = 219
    Top = 144
  end
end
