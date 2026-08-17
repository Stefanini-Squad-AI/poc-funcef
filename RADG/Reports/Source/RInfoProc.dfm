inherited rptInfoProc: TrptInfoProc
  Left = 318
  Top = 215
  Width = 368
  Height = 260
  Caption = 'Informação do Tipo de Processo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Informação do Tipo de Processo'
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
    Report = RptInfoProc
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
    Left = 88
    Top = 12
  end
  object sqlInfoProc: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '       TP.IDTIPOPROCESSO,'
      '       TP.NOME AS NOMEPROC,'
      '       GG.NOME AS GRPGESTOR,'
      '       GC.NOME AS GRPCON,'
      '       TP.DESCRICAO, EXP.FLGINICIAL,'
      '       TP.NUMDIASPREVISTO,'
      '       TE.NOME AS NOMEETAPA,'
      '       EXP.IDTIPOETAPA,'
      '       EXP.NUMDIASPREVISTO AS NUMDIAPREVETAPA,'
      '       DECODE(EXP.FLGINICIAL,'#39'S'#39','#39' X '#39','#39#39') AS INICIAL,'
      '       DECODE(EXP.FLGFINAL,'#39'S'#39','#39' X '#39','#39#39') AS FINAL,'
      '       M.NOMEMODULO,'
      '       A.NOMEGRUPOAUT'
      ' FROM'
      '       RADTIPOPROCESSO TP,'
      '       RADTIPOETAPAXPROC EXP,'
      '       RADETAPAXGRPRESP EXA,'
      '       RADGRUPOAUTORIZA A,'
      '       RADGRPRESPON GG,'
      '       RADGRPRESPON GC,'
      '       RADTIPOETAPA TE,'
      '       MODULO M'
      ' WHERE (TP.IDGRPGESTOR    = GG.IDGRPRESPON(+))'
      '   AND (TP.IDTIPOPROCESSO = :IDTIPOPROCESSO)'
      '   AND (TP.IDGRPCONSULTA    = GC.IDGRPRESPON(+))'
      '   AND (EXP.IDTIPOPROCESSO  = TP.IDTIPOPROCESSO)'
      '   AND (EXP.IDTIPOETAPA     = TE.IDTIPOETAPA)'
      '   AND (EXP.IDMODULO        = M.IDMODULO)'
      '   AND (EXA.IDTIPOPROCESSO  = TP.IDTIPOPROCESSO)'
      '   AND (EXA.IDTIPOETAPA     = TE.IDTIPOETAPA)'
      '   AND (EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA)'
      ' ORDER BY NOMEPROC, FLGINICIAL DESC'
      '')
    ClientDataSet = cdsInfoProc
    Left = 32
    Top = 80
  end
  object cdsInfoProc: TCMClientDataSet
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
  object RptInfoProc: TppReport
    AutoStop = False
    DataPipeline = bdeInfoProc
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
    Top = 66
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Informação dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 115359
        mmTop = 8731
        mmWidth = 54240
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
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
      object LbProc3: TppLabel
        UserName = 'LbProc3'
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
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20108
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptInfoProcDBText5: TppDBText
        UserName = 'RptInfoProcDBText5'
        DataField = 'NOMEGRUPOAUT'
        DataPipeline = bdeInfoProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19315
        mmTop = 0
        mmWidth = 47625
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
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
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
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
    object ppGroup2: TppGroup
      BreakName = 'IDTIPOPROCESSO'
      DataPipeline = bdeInfoProc
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 33073
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'ppLabel12'
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
        object ppDBText5: TppDBText
          UserName = 'ppDBText5'
          DataField = 'NOMEPROC'
          DataPipeline = bdeInfoProc
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
        object ppDBMemo1: TppDBMemo
          UserName = 'ppDBMemo1'
          CharWrap = True
          DataField = 'DESCRICAO'
          DataPipeline = bdeInfoProc
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
        object ppLabel13: TppLabel
          UserName = 'ppLabel13'
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
        object ppDBText6: TppDBText
          UserName = 'ppDBText6'
          DataField = 'NUMDIASPREVISTO'
          DataPipeline = bdeInfoProc
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
        object ppDBText7: TppDBText
          UserName = 'ppDBText7'
          DataField = 'GRPCON'
          DataPipeline = bdeInfoProc
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
        object ppDBText9: TppDBText
          UserName = 'ppDBText9'
          DataField = 'GRPCON'
          DataPipeline = bdeInfoProc
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
        object ppLabel14: TppLabel
          UserName = 'ppLabel14'
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
        object ppLabel15: TppLabel
          UserName = 'ppLabel15'
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
        object ppLabel17: TppLabel
          UserName = 'ppLabel17'
          Caption = 'Etapas do Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 22754
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Etapa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 28310
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'ppLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 26988
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'ppLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 32808
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel1: TppLabel
          UserName = 'RptInfoProcLabel1'
          Caption = 'Sistema de Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 28310
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel2: TppLabel
          UserName = 'RptInfoProcLabel2'
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 28310
          mmWidth = 8202
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel3: TppLabel
          UserName = 'RptInfoProcLabel3'
          Caption = 'Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 28310
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel4: TppLabel
          UserName = 'RptInfoProcLabel4'
          Caption = 'Nº de Dias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 201348
          mmTop = 28310
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object RptInfoProcLabel5: TppLabel
          UserName = 'RptInfoProcLabel5'
          Caption = 'Grupo de Autorização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 28310
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDTIPOETAPA'
      DataPipeline = bdeInfoProc
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText2: TppDBText
          UserName = 'ppDBText2'
          DataField = 'NOMEETAPA'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 265
          mmTop = 0
          mmWidth = 95250
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText1: TppDBText
          UserName = 'RptInfoProcDBText1'
          DataField = 'NOMEMODULO'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 0
          mmWidth = 79375
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText2: TppDBText
          UserName = 'RptInfoProcDBText2'
          DataField = 'INICIAL'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 178594
          mmTop = 0
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText3: TppDBText
          UserName = 'RptInfoProcDBText3'
          DataField = 'FINAL'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 190765
          mmTop = 0
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object RptInfoProcDBText4: TppDBText
          UserName = 'RptInfoProcDBText4'
          DataField = 'NUMDIAPREVETAPA'
          DataPipeline = bdeInfoProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 200819
          mmTop = 0
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsInfoProc: TwwDataSource
    DataSet = cdsInfoProc
    Left = 173
    Top = 77
  end
  object bdeInfoProc: TppBDEPipeline
    DataSource = dsInfoProc
    UserName = 'bdeInfoProc'
    Left = 229
    Top = 76
  end
end
