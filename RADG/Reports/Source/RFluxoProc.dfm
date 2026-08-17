inherited rptFluxoProc: TrptFluxoProc
  Left = 318
  Top = 215
  Width = 368
  Height = 260
  Caption = 'Fluxo dos Processos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Fluxo dos Processos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Tipo de Processo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDTIPOPROCESSO, NOME '
          'FROM RADTIPOPROCESSO ORDER BY NOME')
        LookupSettings.Chave = 'IDTIPOPROCESSO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Processo'
        LookupSettings.Tamanho = '10'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 100
    Left = 152
    Top = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 16
    Top = 12
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptFluxoProc
    LabelEmpresa = LblEmpresa
    LabelSistema = lblsistema
    Left = 88
    Top = 12
  end
  object sqlFluxoProc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      TP.IDTIPOPROCESSO,'
      '      TP.NOME AS NOMEPROC,'
      '      GG.NOME AS GRPGESTOR,'
      '      GC.NOME AS GRPCON,'
      '      TP.DESCRICAO,'
      '      TP.NUMDIASPREVISTO,'
      '      TE.NOME AS NOMEETAPA,'
      '      EF.IDTIPOETAPA, EXP.FLGINICIAL,'
      '      TE.NOME AS ETAPAPRED,'
      '      AN.NOME AS ANDAMENTO'
      'FROM'
      '      RADTIPOPROCESSO TP,'
      '      RADFLUXO FL,'
      '      RADTIPOETAPAXPROC EXP,'
      '      RADGRPRESPON GG,'
      '      RADGRPRESPON GC,'
      '      RADTIPOETAPA EF,'
      '      RADTIPOETAPA TE,'
      '      RADTIPOETAPA EA,'
      '      RADANDAMENTO AN'
      'WHERE'
      '      (TP.IDGRPGESTOR  = GG.IDGRPRESPON(+))'
      '  AND (TP.IDGRPCONSULTA = GC.IDGRPRESPON(+))'
      '  AND (TP.IDTIPOPROCESSO = FL.IDTIPOPROCESSO)'
      '  AND (EXP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )'
      '  AND (EXP.IDTIPOETAPA = TE.IDTIPOETAPA)'
      '  AND (EXP.IDTIPOETAPA = EF.IDTIPOETAPA)'
      '  AND (FL.IDTIPOETAPA = EF.IDTIPOETAPA)'
      '  AND (FL.IDTIPOETAPA = EA.IDTIPOETAPA)'
      '  AND (FL.IDANDAMENTO = AN.IDANDAMENTO)'
      'ORDER BY NOMEPROC, FLGINICIAL DESC'
      ' '
      ''
      '')
    ClientDataSet = cdsFluxoProc
    Left = 32
    Top = 80
  end
  object cdsFluxoProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 78
  end
  object sqlProcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOPROCESSO, NOME'
      'FROM RADTIPOPROCESSO '
      'WHERE (IDTIPOPROCESSO = :IDTIPOPROCESSO)')
    ClientDataSet = cdsProcesso
    Left = 200
    Top = 160
  end
  object cdsProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 158
  end
  object RptFluxoProc: TppReport
    AutoStop = False
    DataPipeline = bdeFluxoProc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 309
    Top = 74
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Fluxo dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 120650
        mmTop = 8731
        mmWidth = 42863
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127794
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Tipo Processo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 15081
        mmWidth = 22754
        BandType = 0
      end
      object LbProc2: TppLabel
        UserName = 'LbProc2'
        Caption = 'TODOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 15081
        mmWidth = 9525
        BandType = 0
      end
      object RptFluxoProcLine1: TppLine
        UserName = 'RptFluxoProcLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20108
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'NOMEETAPA'
        DataPipeline = bdeFluxoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object RptFluxoProcDBText4: TppDBText
        UserName = 'RptFluxoProcDBText4'
        DataField = 'ANDAMENTO'
        DataPipeline = bdeFluxoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 265
        mmWidth = 47625
        BandType = 4
      end
      object RptFluxoProcDBText5: TppDBText
        UserName = 'RptFluxoProcDBText5'
        DataField = 'ETAPAPRED'
        DataPipeline = bdeFluxoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146579
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object lblsistema: TppLabel
        UserName = 'lblsistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 529
        mmWidth = 23813
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
        mmLeft = 115623
        mmTop = 529
        mmWidth = 53181
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
        mmLeft = 242359
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDTIPOPROCESSO'
      DataPipeline = bdeFluxoProc
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 33073
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'ppLabel18'
          Caption = 'Processo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 265
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          DataField = 'NOMEPROC'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 16669
          mmTop = 265
          mmWidth = 93398
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo2: TppDBMemo
          UserName = 'ppDBMemo2'
          CharWrap = True
          DataField = 'DESCRICAO'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 17727
          mmLeft = 265
          mmTop = 4498
          mmWidth = 126207
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object RptFluxoProcLabel1: TppLabel
          UserName = 'RptFluxoProcLabel1'
          Caption = 'Nº de Dias :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 265
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcDBText1: TppDBText
          UserName = 'RptFluxoProcDBText1'
          DataField = 'NUMDIASPREVISTO'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 127265
          mmTop = 265
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcDBText2: TppDBText
          UserName = 'RptFluxoProcDBText2'
          DataField = 'GRPCON'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 168275
          mmTop = 529
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcDBText3: TppDBText
          UserName = 'RptFluxoProcDBText3'
          DataField = 'GRPCON'
          DataPipeline = bdeFluxoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 168275
          mmTop = 6879
          mmWidth = 47625
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel2: TppLabel
          UserName = 'RptFluxoProcLabel2'
          Caption = 'Grupo de Gestores :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 137319
          mmTop = 529
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel3: TppLabel
          UserName = 'RptFluxoProcLabel3'
          Caption = 'Grupo para Consulta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 135467
          mmTop = 6879
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel4: TppLabel
          UserName = 'RptFluxoProcLabel4'
          Caption = 'Fluxo do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 22754
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel5: TppLabel
          UserName = 'RptFluxoProcLabel5'
          Caption = 'Etapa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 28046
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLine2: TppLine
          UserName = 'RptFluxoProcLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 26988
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLine3: TppLine
          UserName = 'RptFluxoProcLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 32808
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel6: TppLabel
          UserName = 'RptFluxoProcLabel6'
          Caption = 'Andamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97631
          mmTop = 28575
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object RptFluxoProcLabel7: TppLabel
          UserName = 'RptFluxoProcLabel7'
          Caption = 'Predecessora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 146579
          mmTop = 28575
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptFluxoProcGroup1: TppGroup
      BreakName = 'IDTIPOETAPA'
      DataPipeline = bdeFluxoProc
      UserName = 'RptFluxoProcGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptFluxoProcGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptFluxoProcGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsFluxoProc: TwwDataSource
    DataSet = cdsFluxoProc
    Left = 181
    Top = 77
  end
  object bdeFluxoProc: TppBDEPipeline
    DataSource = dsFluxoProc
    UserName = 'bdeFluxoProc'
    Left = 237
    Top = 76
  end
end
