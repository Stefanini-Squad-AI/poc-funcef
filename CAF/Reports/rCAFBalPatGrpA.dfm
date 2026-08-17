inherited RptCAFBalPatGrpA: TRptCAFBalPatGrpA
  Left = 250
  Top = 154
  Width = 373
  Height = 260
  Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object sqlBalPatGrpA: TCMSqlParams [0]
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS DEPMES,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS REAVVALORG,'
      '       (0.00) AS REAVCMBEM,'
      '       (0.00) AS REAVDEPLANC,'
      '       (0.00) AS REAVDEPMES,'
      '       (0.00) AS REAVCMDEP,'
      '       (0.00) AS VALCTB'
      'FROM GRUPO'
      'WHERE IDGRUPO IS NULL'
      'ORDER BY CLASSE'
      '')
    ClientDataSet = cdsBalPatGrpA
    Left = 216
    Top = 66
  end
  object cdsBalPatGrpA: TCMClientDataSet [1]
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 52
  end
  object dsBalPatGrpA: TwwDataSource [2]
    DataSet = cdsBalPatGrpA
    Left = 216
    Top = 38
  end
  object ppBalPatGrpA: TppBDEPipeline [3]
    DataSource = dsBalPatGrpA
    UserName = 'ppBalPatGrpA'
    Left = 216
    Top = 24
  end
  object rpBalPatGrpA: TppReport [4]
    AutoStop = False
    DataPipeline = ppBalPatGrpA
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 216
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 70379
        mmTop = 8731
        mmWidth = 123031
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32544
        mmWidth = 264107
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
        mmLeft = 117740
        mmTop = 1588
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
        mmTop = 24342
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
        mmLeft = 25400
        mmTop = 24342
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
        mmLeft = 93398
        mmTop = 24342
        mmWidth = 5821
        BandType = 0
      end
      object rpBalPatGrpLabel4: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        AutoSize = False
        Caption = 'Custo Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 24342
        mmWidth = 20902
        BandType = 0
      end
      object rpBalPatGrpLabel5: TppLabel
        UserName = 'rpBalPatGrpLabel5'
        AutoSize = False
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143669
        mmTop = 24342
        mmWidth = 19579
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
        Transparent = True
        mmHeight = 3175
        mmLeft = 164571
        mmTop = 24342
        mmWidth = 25135
        BandType = 0
      end
      object rpBalPatGrpLabel7: TppLabel
        UserName = 'rpBalPatGrpLabel7'
        AutoSize = False
        Caption = 'C.M.Deprec.Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 213519
        mmTop = 24342
        mmWidth = 23813
        BandType = 0
      end
      object rpBalPatGrpLabel8: TppLabel
        UserName = 'rpBalPatGrpLabel8'
        AutoSize = False
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 243153
        mmTop = 24342
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
        mmLeft = 211403
        mmTop = 9525
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 241565
        mmTop = 9525
        mmWidth = 21960
        BandType = 0
      end
      object rpBalPatGrpLabel11: TppLabel
        UserName = 'rpBalPatGrpLabel11'
        AutoSize = False
        Caption = 'Deprec.Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 191559
        mmTop = 24342
        mmWidth = 19579
        BandType = 0
      end
      object rpBalPatGrpLabel12: TppLabel
        UserName = 'rpBalPatGrpLabel12'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120386
        mmTop = 15875
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        AutoSize = False
        Caption = 'Quant'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 102394
        mmTop = 24342
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Reavaliações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 119327
        mmTop = 28310
        mmWidth = 17463
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object rpBalPatGrpDBText1: TppDBText
        UserName = 'rpBalPatGrpDBText1'
        DataField = 'CLASSE'
        DataPipeline = ppBalPatGrpA
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object rpBalPatGrpDBText2: TppDBText
        UserName = 'rpBalPatGrpDBText2'
        DataField = 'DESCGRUPO'
        DataPipeline = ppBalPatGrpA
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 529
        mmWidth = 66675
        BandType = 4
      end
      object rpBalPatGrpDBText4: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111390
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText5: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        BlankWhenZero = True
        DataField = 'CMBEM'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137848
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText6: TppDBText
        UserName = 'rpBalPatGrpDBText6'
        BlankWhenZero = True
        DataField = 'DEPLANC'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText7: TppDBText
        UserName = 'rpBalPatGrpDBText7'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'CMDEP'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object rpBalPatGrpDBText8: TppDBText
        UserName = 'rpBalPatGrpDBText8'
        BlankWhenZero = True
        DataField = 'VALCTB'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 237067
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object rpBalPatGrpDBText3: TppDBText
        UserName = 'rpBalPatGrpDBText3'
        DataField = 'S_A'
        DataPipeline = ppBalPatGrpA
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92075
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
      object rpBalPatGrpDBText9: TppDBText
        UserName = 'rpBalPatGrpDBText9'
        BlankWhenZero = True
        DataField = 'DEPMES'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 190765
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText1'
        DataField = 'QUANT'
        DataPipeline = ppBalPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100542
        mmTop = 529
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'REAVVALORG'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 111390
        mmTop = 4233
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'REAVCMBEM'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 137848
        mmTop = 4233
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'REAVDEPLANC'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 4233
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'REAVDEPMES'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 190765
        mmTop = 4233
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        Color = clSilver
        DataField = 'REAVCMBEM'
        DataPipeline = ppBalPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 4233
        mmWidth = 25400
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 264107
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
        mmLeft = 112448
        mmTop = 2910
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
        mmLeft = 237596
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object LBLSISTEMA: TppLabel
        UserName = 'LBLSISTEMA'
        AutoSize = False
        Caption = 'Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 2910
        mmWidth = 109802
        BandType = 8
      end
    end
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Balancete Patrimonial por Grupo Contábil - Analítico'
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
        Caption = ' Bens '
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
        Caption = 'Exibe Bens Baixados'
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
        Caption = 'Exibe os Grupos sem Valor'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 265
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpBalPatGrpA
    LabelEmpresa = LBLEMPRESA
    LabelSistema = LBLSISTEMA
  end
  object cdsDepPerTransf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 573
    Top = 372
  end
  object cdsBalPatAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 24
  end
  object cdsGrpAnaliticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 160
  end
  object cdsGrpSinteticos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 159
  end
  object sqlGrpAnaliticos: TCMSqlParams
    SQL.Strings = (
      'SELECT SB.IDGRUPO, SB.IDPESSOA, SUM(SB.QUANT) AS QUANT,'
      '       SUM(SB.VALORG0)         AS VALORG0,'
      '       SUM(SB.CMBEM0)          AS CMBEM0,'
      '       SUM(SB.DEPLANC0)        AS DEPLANC0,'
      '       SUM(SB.DEPLANCATU0)     AS DEPLANCATU0,'
      '       SUM(SB.CMDEP0)          AS CMDEP0,'
      '       SUM(SB.REAVVALORG0)     AS REAVVALORG0,'
      '       SUM(SB.REAVCMBEM0)      AS REAVCMBEM0,'
      '       SUM(SB.REAVDEPLANC0)    AS REAVDEPLANC0,'
      '       SUM(SB.REAVDEPLANCATU0) AS REAVDEPLANCATU0,'
      '       SUM(SB.REAVCMDEP0)      AS REAVCMDEP0,'
      '       SUM(SB.VALORG0 + SB.CMBEM0 -'
      '           SB.DEPLANC0 - SB.CMDEP0 +'
      '           SB.REAVVALORG0 + SB.REAVCMBEM0 -'
      '           SB.REAVDEPLANC0 - SB.REAVCMDEP0) AS VALCTB0'
      ''
      
        'FROM (SELECT /*+ RULE */ SB1.IDGRUPO, SB1.IDPESSOA, COUNT(*) AS ' +
        'QUANT,'
      
        '             ROUND(SUM(NVL(SB1.VALORG,0)) ,2) AS VALORG0, ROUND(' +
        'SUM(NVL(SB1.CMBEM,0)) ,2) AS CMBEM0,'
      
        '             ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) AS DEPLANC0, ROUN' +
        'D(SUM(NVL(SD1.CMDEP,0)) ,2) AS CMDEP0,'
      '             (0) AS DEPLANCATU0,'
      
        '             ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVA' +
        'LORG,0)) ,2) AS REAVVALORG0,'
      
        '             ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMB' +
        'EM,0)) ,2) AS REAVCMBEM0,'
      
        '             ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVD' +
        'EPLANC,0)) ,2) AS REAVDEPLANC0,'
      
        '             ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMD' +
        'EP,0)) ,2) AS REAVCMDEP0,'
      '             (0) AS REAVDEPLANCATU0'
      '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND MOECODIGO = :MOECODIGO'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM, IDPESSOA) MAX1,'
      '           BEM B1, GRUPO G1'
      '      WHERE B1.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      '        AND SB1.MOECODIGO = :MOECODIGO'
      '        AND SB1.IDPESSOA = :IDPESSOA'
      '        AND SD1.IDSLDCTBBEMXDEP = :IDTAXADEP'
      '        AND B1.IDPESSOA = :IDPESSOA'
      '        AND SB1.IDBEM = MAX1.IDBEM'
      '        AND SB1.IDPESSOA = MAX1.IDPESSOA'
      '        AND SB1.DATASLDBEM = MAX1.DATA'
      '        AND SB1.IDBEM = SD1.IDBEM'
      '        AND SB1.IDPESSOA = SD1.IDPESSOA'
      '        AND SB1.DATASLDBEM = SD1.DATASLDBEM'
      '        AND SB1.MOECODIGO = SD1.MOECODIGO'
      '        AND SB1.IDBEM = B1.IDBEM'
      '        AND SB1.IDPESSOA = B1.IDPESSOA'
      '        AND SB1.IDGRUPO = G1.IDGRUPO'
      '      GROUP BY SB1.IDGRUPO, SB1.IDPESSOA UNION'
      ''
      
        '      SELECT /*+ RULE */ SB2.IDGRUPO, SB2.IDPESSOA, (0) AS QUANT' +
        ','
      '             (0) AS VALORG0,'
      '             (0) AS CMBEM0,'
      '             (0) AS DEPLANC0,'
      '             (0) AS CMDEP0,'
      
        '             ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,14,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     17,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     43,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     35,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     51,NVL(VM2.' +
        'VALOR,0),0)),2) AS DEPLANCATU0,'
      '             (0) AS REAVVALORG0,'
      '             (0) AS REAVCMBEM0,'
      '             (0) AS REAVDEPLANC0,'
      '             (0) AS REAVCMDEP0,'
      
        '             ROUND(SUM(DECODE(HM2.IDTIPOMOVIMENTACAO,18,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     33,NVL(VM2.' +
        'VALOR,0),'
      
        '                                                     47,NVL(VM2.' +
        'VALOR,0),0)),2) AS REAVDEPLANCATU0'
      '      FROM HISTORICOMOVIMENTACAO HM2,'
      '           VLRHISTMOVBEM VM2,'
      '           GRUPO G2,'
      '           SALDOCONTABBEM SB2,'
      '           BEM B2'
      '      WHERE B2.DATAINICIODEP <= :DATASLD'
      ''
      ''
      ''
      ''
      
        '        AND HM2.DATAMOVIMENTACAO >= :DATAINI AND HM2.DATAMOVIMEN' +
        'TACAO <= :DATASLD'
      
        '        AND SB2.DATASLDBEM >= :DATAINI AND SB2.DATASLDBEM <= :DA' +
        'TASLD'
      '        AND SB2.MOECODIGO = :MOECODIGO'
      '        AND SB2.IDPESSOA = :IDPESSOA'
      '        AND HM2.IDPESSOA = :IDPESSOA'
      '        AND B2.IDPESSOA = :IDPESSOA'
      '        AND VM2.MOECODIGO = :MOECODIGO'
      '        AND VM2.IDTAXADEP = :IDTAXADEP'
      '        AND HM2.IDBEM = SB2.IDBEM'
      '        AND HM2.IDPESSOA = SB2.IDPESSOA'
      '        AND HM2.DATAMOVIMENTACAO = SB2.DATASLDBEM'
      '        AND SB2.IDBEM = B2.IDBEM'
      '        AND SB2.IDPESSOA = B2.IDPESSOA'
      '        AND G2.IDGRUPO = SB2.IDGRUPO'
      '        AND HM2.IDPESSOA = B2.IDPESSOA'
      '        AND HM2.IDBEM = B2.IDBEM'
      '        AND HM2.IDMOVIMENTACAO = VM2.IDMOVIMENTACAO(+)'
      '      GROUP BY SB2.IDGRUPO, SB2.IDPESSOA) SB'
      ''
      'GROUP BY SB.IDGRUPO, SB.IDPESSOA'
      'ORDER BY SB.IDGRUPO, SB.IDPESSOA'
      '')
    ClientDataSet = cdsGrpAnaliticos
    Left = 32
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
      ' ')
    ClientDataSet = cdsGrpSinteticos
    Left = 120
    Top = 143
  end
  object sqlDepPerTransfR: TCMSqlParams
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
      '  AND (HM.IDTIPOMOVIMENTACAO = 18)'
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
      ' ')
    ClientDataSet = cdsDepPerTransf
    Left = 573
    Top = 357
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
        '35))'
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
      ''
      ''
      '')
    ClientDataSet = cdsDepPerTransf
    Left = 574
    Top = 344
  end
  object sqlBalPatAux: TCMSqlParams
    SQL.Strings = (
      'SELECT G.IDGRUPO,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       G.TIPO AS S_A,'
      '       (0) AS QUANT,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS CMBEM,'
      '       (0.00) AS DEPLANC,'
      '       (0.00) AS DEPMES,'
      '       (0.00) AS CMDEP,'
      '       (0.00) AS REAVVALORG,'
      '       (0.00) AS REAVCMBEM,'
      '       (0.00) AS REAVDEPLANC,'
      '       (0.00) AS REAVDEPMES,'
      '       (0.00) AS REAVCMDEP,'
      '       (0.00) AS VALCTB'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE PG.IDPESSOA = :IDPESSOA'
      '  AND PG.IDGRUPO = G.IDGRUPO'
      'ORDER BY G.CLASSE'
      ''
      '')
    ClientDataSet = cdsBalPatAux
    Left = 304
    Top = 8
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
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
        'IARIO'
      'FROM   PARAMETROSCAFMANUT C,'
      '       PARAMIMOVEL I,'
      '       PARAMCONTAB PC'
      'WHERE C.IDPESSOA = :PIDPESSOA'
      '  AND C.IDPESSOA = I.IDPESSOA(+)'
      '  AND C.IDPESSOA = PC.IDPESSOA(+)')
    ClientDataSet = cdsParamCaf
    Left = 24
    Top = 64
  end
  object cdsVerUltFec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
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
      '  AND PG.IDGRUPO  = G.IDGRUPO')
    ClientDataSet = cdsVerUltFec
    Left = 120
    Top = 64
  end
end
