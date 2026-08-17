inherited rptCAFAcrescValorBem: TrptCAFAcrescValorBem
  Left = 352
  Top = 197
  Height = 222
  Caption = 'Acréscimos de Valor por Bem'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Acréscimos de Valor por Bem'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Movimentado até'
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
          'Imóveis'
          'Ambos')
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
    Formheight = 167
    Left = 24
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpAcrescValorBem
    LabelEmpresa = LBLEMPRESA
    LabelSistema = LBLSISTEMA
    Left = 88
  end
  object cdsParamCaf: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 80
  end
  object sqlParamCaf: TCMSqlParams
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA,SISTEMAS'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)'
      '')
    ClientDataSet = cdsParamCaf
    Left = 32
    Top = 64
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
      '  AND (PG.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (PG.DATAULTFEC IS NOT NULL)'
      '  AND (PG.IDGRUPO  = G.IDGRUPO)'
      ' ')
    ClientDataSet = cdsVerUltFec
    Left = 112
    Top = 64
  end
  object sqlAcrescValorBem: TCMSqlParams
    SQL.Strings = (
      'SELECT CLASSE, NOME,'
      '       (0) AS PLACA,'
      
        '       ('#39'                                                       ' +
        '                                                                ' +
        '                                                                ' +
        '                '#39') AS DESBEM,'
      '       (0) AS IDREAVALACRESC,'
      '       DATAULTDEP AS DATAMOVIMENTACAO,'
      
        '       ('#39'                                                       ' +
        '     '#39') AS OBS,'
      '       (0.00) AS VALORG,'
      '       (0.00) AS DEPLANC'
      'FROM GRUPO'
      'WHERE IDGRUPO = -2'
      ''
      ' ')
    ClientDataSet = cdsAcrescValorBem
    Left = 232
    Top = 62
  end
  object cdsAcrescValorBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 48
  end
  object dsAcrescValorBem: TwwDataSource
    DataSet = cdsAcrescValorBem
    Left = 232
    Top = 34
  end
  object ppAcrescValorBem: TppBDEPipeline
    DataSource = dsAcrescValorBem
    UserName = 'AcrescValorBem'
    Left = 232
    Top = 21
  end
  object rpAcrescValorBem: TppReport
    AutoStop = False
    DataPipeline = ppAcrescValorBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 16510
    PrinterSetup.mmMarginRight = 16510
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 232
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29898
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        AutoSize = False
        Caption = 'Acréscimos de Valor por Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 51594
        mmTop = 9260
        mmWidth = 73819
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
        mmTop = 2117
        mmWidth = 28310
        BandType = 0
      end
      object rpBalPatGrpLabel4: TppLabel
        UserName = 'rpBalPatGrpLabel4'
        AutoSize = False
        Caption = 'Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 25929
        mmWidth = 20902
        BandType = 0
      end
      object rpBalPatGrpLabel6: TppLabel
        UserName = 'rpBalPatGrpLabel6'
        AutoSize = False
        Caption = 'Depreciação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 25929
        mmWidth = 20108
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
        mmLeft = 126471
        mmTop = 16404
        mmWidth = 28840
        BandType = 0
      end
      object rpLabelDataMov: TppLabel
        UserName = 'rpLabelDataMov'
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
        mmLeft = 156104
        mmTop = 16404
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoGrupo: TppLabel
        UserName = 'lblTipoGrupo'
        Caption = 'Imobilizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76729
        mmTop = 16404
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 25929
        mmWidth = 6085
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 29898
        mmWidth = 177059
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpBalPatGrpDBText4: TppDBText
        UserName = 'rpBalPatGrpDBText4'
        DataField = 'VALORG'
        DataPipeline = ppAcrescValorBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127529
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object rpBalPatGrpDBText5: TppDBText
        UserName = 'rpBalPatGrpDBText5'
        DataField = 'DEPLANC'
        DataPipeline = ppAcrescValorBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 151871
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppAcrescValorBem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'OBS'
        DataPipeline = ppAcrescValorBem
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 18256
        mmTop = 0
        mmWidth = 108479
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
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
        mmLeft = 68792
        mmTop = 2646
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
        mmLeft = 150548
        mmTop = 2646
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
        mmWidth = 50006
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 8996
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'SUMVALORG0'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 192088
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        DataField = 'SUMDEPLANC0'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 215107
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        DataField = 'VALCTB0'
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 239713
        mmTop = 1323
        mmWidth = 24077
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VALORG'
        DataPipeline = ppAcrescValorBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 127529
        mmTop = 0
        mmWidth = 23548
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'DEPLANC'
        DataPipeline = ppAcrescValorBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 151607
        mmTop = 0
        mmWidth = 24077
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 177059
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppAcrescValorBem
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText4: TppDBText
          UserName = 'ppDBText4'
          DataField = 'CLASSE'
          DataPipeline = ppAcrescValorBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23019
          mmTop = 0
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'ppDBText2'
          DataField = 'NOME'
          DataPipeline = ppAcrescValorBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 0
          mmWidth = 125413
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 3704
          mmWidth = 177059
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel19: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Soma Grupo Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 177059
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALORG'
          DataPipeline = ppAcrescValorBem
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127529
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'DEPLANC'
          DataPipeline = ppAcrescValorBem
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 151607
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLACA'
      DataPipeline = ppAcrescValorBem
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object rpBalPatGrpDBText1: TppDBText
          UserName = 'rpBalPatGrpDBText1'
          DataField = 'PLACA'
          DataPipeline = ppAcrescValorBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 8731
          mmTop = 0
          mmWidth = 22225
          BandType = 3
          GroupNo = 1
        end
        object rpBalPatGrpDBText2: TppDBText
          UserName = 'rpBalPatGrpDBText2'
          DataField = 'DESBEM'
          DataPipeline = ppAcrescValorBem
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 31485
          mmTop = 0
          mmWidth = 143934
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 3704
          mmWidth = 177059
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Placa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Soma Bem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 0
          mmWidth = 17463
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALORG'
          DataPipeline = ppAcrescValorBem
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 127529
          mmTop = 0
          mmWidth = 23548
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'DEPLANC'
          DataPipeline = ppAcrescValorBem
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 151607
          mmTop = 0
          mmWidth = 24077
          BandType = 5
          GroupNo = 1
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 177059
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object cdsAcrescValorBem0: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 128
  end
  object sqlAcrescValorBem0: TCMSqlParams
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, B.PLACA, B.DESBEM,'
      '       SCA.IDREAVALACRESC, HMA.DATAMOVIMENTACAO, HMA.OBS,'
      '       (SCA.VALACRESACUM - SCA.BXVALACRESACUM +'
      '        SCA.VALCMACRESACUM - SCA.BXVALCMACRESACUM) AS VALORG,'
      '       (SCA.VALDEPACRESACUM - SCA.BXVALDEPACRESACUM +'
      
        '        SCA.VALCMDEPACRESACUM - SCA.BXVALCMDEPACRESACUM) AS DEPL' +
        'ANC'
      ''
      'FROM BEM B, GRUPO G,'
      ''
      
        '     (SELECT HM2.IDBEM, HM2.IDREAVALACRESC, HM2.DATAMOVIMENTACAO' +
        ', AV2.OBS'
      '      FROM HISTORICOMOVIMENTACAO HM2,'
      '           ACRESCVALOR AV2'
      '      WHERE HM2.IDTIPOMOVIMENTACAO = 09'
      '        AND HM2.IDPESSOA = :IDPESSOA'
      '        AND HM2.IDMOVIMENTACAO = AV2.IDMOVIMENTACAO'
      '      ORDER BY HM2.IDBEM, HM2.IDREAVALACRESC) HMA,'
      ''
      '     (SELECT SB.IDGRUPO, HM.IDBEM, HM.IDREAVALACRESC,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              49,NVL(HM.VALOFI,0' +
        '),0)) AS VALACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              50,NVL(HM.VALOFI,0' +
        '),0)) AS VALCMACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              51,NVL(HM.VALOFI,0' +
        '),0)) AS VALDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              52,NVL(HM.VALOFI,0' +
        '),0)) AS VALCMDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALCMACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALCMDEPACRESACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           SALDOCONTABBEM SB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) MAX'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 09 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 49 OR HM.IDTIPOMOVIMENTACAO = 34 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 50 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 35 OR HM.IDTIPOMOVIMENTACAO = 51 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 36 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 52 OR HM.IDTIPOMOVIMENTACAO = 37 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 38 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 39 OR HM.IDTIPOMOVIMENTACAO = 40)'
      ''
      '        AND HM.DATAMOVIMENTACAO <= :DATASLD'
      '        AND HM.IDPESSOA = :IDPESSOA'
      '        AND SB.IDPESSOA = :IDPESSOA'
      '        AND HM.IDBEM = SB.IDBEM'
      '        AND SB.IDBEM = MAX.IDBEM'
      '        AND SB.DATASLDBEM = MAX.DATA'
      '      GROUP BY SB.IDGRUPO, HM.IDBEM, HM.IDREAVALACRESC) SCA'
      ''
      'WHERE B.CONTROLE = '#39'T'#39
      ''
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      '  AND SCA.IDGRUPO = G.IDGRUPO'
      '  AND SCA.IDBEM = B.IDBEM'
      '  AND SCA.IDBEM = HMA.IDBEM'
      '  AND SCA.IDREAVALACRESC = HMA.IDREAVALACRESC'
      ''
      'ORDER BY G.CLASSE, B.PLACA, SCA.IDREAVALACRESC'
      '')
    ClientDataSet = cdsAcrescValorBem0
    Left = 224
    Top = 112
  end
  object qryAcrescValorBem0: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, B.PLACA, B.DESBEM,'
      '       SCA.IDREAVALACRESC, HMA.DATAMOVIMENTACAO, HMA.OBS,'
      '       (SCA.VALACRESACUM - SCA.BXVALACRESACUM +'
      '        SCA.VALCMACRESACUM - SCA.BXVALCMACRESACUM) AS VALORG,'
      '       (SCA.VALDEPACRESACUM - SCA.BXVALDEPACRESACUM +'
      
        '        SCA.VALCMDEPACRESACUM - SCA.BXVALCMDEPACRESACUM) AS DEPL' +
        'ANC'
      ''
      'FROM BEM B, GRUPO G,'
      ''
      
        '     (SELECT HM2.IDBEM, HM2.IDREAVALACRESC, HM2.DATAMOVIMENTACAO' +
        ', AV2.OBS'
      '      FROM HISTORICOMOVIMENTACAO HM2,'
      '           ACRESCVALOR AV2'
      '      WHERE HM2.IDTIPOMOVIMENTACAO = 09'
      '        AND HM2.IDPESSOA = :IDPESSOA'
      '        AND HM2.IDMOVIMENTACAO = AV2.IDMOVIMENTACAO'
      '      ORDER BY HM2.IDBEM, HM2.IDREAVALACRESC) HMA,'
      ''
      '     (SELECT SB.IDGRUPO, HM.IDBEM, HM.IDREAVALACRESC,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              49,NVL(HM.VALOFI,0' +
        '),0)) AS VALACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              50,NVL(HM.VALOFI,0' +
        '),0)) AS VALCMACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              51,NVL(HM.VALOFI,0' +
        '),0)) AS VALDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,0' +
        '),'
      
        '                                              52,NVL(HM.VALOFI,0' +
        '),0)) AS VALCMDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALCMACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALDEPACRESACUM,'
      
        '             SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,0' +
        '),0)) AS BXVALCMDEPACRESACUM'
      '      FROM HISTORICOMOVIMENTACAO HM,'
      '           SALDOCONTABBEM SB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE DATASLDBEM <= :DATASLD'
      '              AND IDPESSOA = :IDPESSOA'
      '            GROUP BY IDBEM) MAX'
      
        '      WHERE (HM.IDTIPOMOVIMENTACAO = 09 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 49 OR HM.IDTIPOMOVIMENTACAO = 34 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 50 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 35 OR HM.IDTIPOMOVIMENTACAO = 51 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 36 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 52 OR HM.IDTIPOMOVIMENTACAO = 37 OR'
      
        '             HM.IDTIPOMOVIMENTACAO = 38 OR HM.IDTIPOMOVIMENTACAO' +
        ' = 39 OR HM.IDTIPOMOVIMENTACAO = 40)'
      ''
      '        AND HM.DATAMOVIMENTACAO <= :DATASLD'
      '        AND HM.IDPESSOA = :IDPESSOA'
      '        AND SB.IDPESSOA = :IDPESSOA'
      '        AND HM.IDBEM = SB.IDBEM'
      '        AND SB.IDBEM = MAX.IDBEM'
      '        AND SB.DATASLDBEM = MAX.DATA'
      '      GROUP BY SB.IDGRUPO, HM.IDBEM, HM.IDREAVALACRESC) SCA'
      ''
      'WHERE B.CONTROLE = '#39'T'#39
      ''
      ''
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      '  AND SCA.IDGRUPO = G.IDGRUPO'
      '  AND SCA.IDBEM = B.IDBEM'
      '  AND SCA.IDBEM = HMA.IDBEM'
      '  AND SCA.IDREAVALACRESC = HMA.IDREAVALACRESC'
      ''
      'ORDER BY G.CLASSE, B.PLACA, SCA.IDREAVALACRESC'
      ' ')
    ValidateWithMask = True
    Left = 72
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
