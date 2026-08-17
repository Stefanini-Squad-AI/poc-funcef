inherited RptFluxoRealAnal: TRptFluxoRealAnal
  Left = 519
  Top = 191
  Width = 405
  Height = 157
  Caption = 'RptFluxoRealAnal'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Fluxo de Caixa Realizado Analitico'
    DataBaseName = 'BaseDados'
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
      end>
    Formheight = 150
    FormWidth = 350
    Left = 336
  end
  inherited DevRptCM: TExtraOptions
    Left = 136
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpFluxoRealAnal
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 232
  end
  object rpFluxoRealAnal: TppReport
    AutoStop = False
    DataPipeline = pplFluxoRealAnal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 336
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplFluxoRealAnal'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Suporte ao Fluxo Realizado no Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 59002
        mmTop = 10848
        mmWidth = 79111
        BandType = 0
      end
      object pplblEmpresa: TppLabel
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
        mmLeft = 84667
        mmTop = 3704
        mmWidth = 28046
        BandType = 0
      end
      object rpFluxoReaAnaLine1: TppLine
        UserName = 'rpFluxoReaAnaLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 25135
        mmWidth = 197300
        BandType = 0
      end
      object rpFluxoReaAnaLine3: TppLine
        UserName = 'rpFluxoReaAnaLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object rpFluxoReaAnaLabel3: TppLabel
        UserName = 'rpFluxoReaAnaLabel3'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 20902
        mmWidth = 6085
        BandType = 0
      end
      object rpFluxoReaAnaLabel4: TppLabel
        UserName = 'rpFluxoReaAnaLabel4'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 20902
        mmWidth = 12965
        BandType = 0
      end
      object rpFluxoReaAnaLabel5: TppLabel
        UserName = 'rpFluxoReaAnaLabel5'
        Caption = 'Código Lanc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 20902
        mmWidth = 18785
        BandType = 0
      end
      object rpFluxoReaAnaLabel6: TppLabel
        UserName = 'rpFluxoReaAnaLabel6'
        Caption = 'Atividade/Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 20902
        mmWidth = 24871
        BandType = 0
      end
      object rpFluxoReaAnaLabel7: TppLabel
        UserName = 'rpFluxoReaAnaLabel7'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 188913
        mmTop = 20902
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpFluxoReaAnaDBText5: TppDBText
        UserName = 'rpFluxoReaAnaDBText5'
        AutoSize = True
        DataField = 'DATALANCFINAN'
        DataPipeline = pplFluxoRealAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoRealAnal'
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
      object rpFluxoReaAnaDBText6: TppDBText
        UserName = 'rpFluxoReaAnaDBText6'
        DataField = 'HISTORICO'
        DataPipeline = pplFluxoRealAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoRealAnal'
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 265
        mmWidth = 82021
        BandType = 4
      end
      object rpFluxoReaAnaDBText7: TppDBText
        UserName = 'rpFluxoReaAnaDBText7'
        DataField = 'DESCUN'
        DataPipeline = pplFluxoRealAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFluxoRealAnal'
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 265
        mmWidth = 43392
        BandType = 4
      end
      object rpFluxoReaAnaDBText8: TppDBText
        UserName = 'rpFluxoReaAnaDBText8'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplFluxoRealAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoRealAnal'
        mmHeight = 3440
        mmLeft = 186532
        mmTop = 265
        mmWidth = 9260
        BandType = 4
      end
      object rpFluxoReaAnaDBText9: TppDBText
        UserName = 'rpFluxoReaAnaDBText9'
        DataField = 'DOCUMENTO'
        DataPipeline = pplFluxoRealAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoRealAnal'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197300
        BandType = 8
      end
      object pplblSistema: TppLabel
        UserName = 'lblSistema'
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
        mmTop = 5292
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 5292
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 5292
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpFluxoReaAnaSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object rpFluxoReaAnaLabel10: TppLabel
        UserName = 'rpFluxoReaAnaLabel10'
        Caption = 'Total do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 138907
        mmTop = 1058
        mmWidth = 29104
        BandType = 7
      end
      object rpFluxoReaAnaDBCalc3: TppDBCalc
        UserName = 'rpFluxoReaAnaDBCalc3'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = pplFluxoRealAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFluxoRealAnal'
        mmHeight = 4233
        mmLeft = 170392
        mmTop = 794
        mmWidth = 25400
        BandType = 7
      end
    end
    object rpFluxoReaAnaGroup1: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = pplFluxoRealAnal
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpFluxoReaAnaGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFluxoRealAnal'
      object rpFluxoReaAnaGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpFluxoReaAnaLabel1: TppLabel
          UserName = 'rpFluxoReaAnaLabel1'
          Caption = 'Centro de Responsabilidade: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7673
          mmTop = 794
          mmWidth = 49477
          BandType = 3
          GroupNo = 0
        end
        object rpFluxoReaAnaDBText1: TppDBText
          UserName = 'rpFluxoReaAnaDBText1'
          AutoSize = True
          DataField = 'CODCENTRORESPON'
          DataPipeline = pplFluxoRealAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoRealAnal'
          mmHeight = 4233
          mmLeft = 59531
          mmTop = 794
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object rpFluxoReaAnaDBText2: TppDBText
          UserName = 'rpFluxoReaAnaDBText2'
          AutoSize = True
          DataField = 'DESCCR'
          DataPipeline = pplFluxoRealAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoRealAnal'
          mmHeight = 4233
          mmLeft = 88371
          mmTop = 794
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFluxoReaAnaGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpFluxoReaAnaDBCalc2: TppDBCalc
          UserName = 'rpFluxoReaAnaDBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pplFluxoRealAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpFluxoReaAnaGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFluxoRealAnal'
          mmHeight = 4233
          mmLeft = 170392
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object rpFluxoReaAnaLabel9: TppLabel
          UserName = 'rpFluxoReaAnaLabel9'
          Caption = 'Total do Centro de Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 104775
          mmTop = 1323
          mmWidth = 63236
          BandType = 5
          GroupNo = 0
        end
        object rpFluxoReaAnaLine7: TppLine
          UserName = 'rpFluxoReaAnaLine7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object rpFluxoReaAnaLine6: TppLine
          UserName = 'rpFluxoReaAnaLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpFluxoReaAnaGroup2: TppGroup
      BreakName = 'CODTIPRECDES'
      DataPipeline = pplFluxoRealAnal
      OutlineSettings.CreateNode = True
      UserName = 'rpFluxoReaAnaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplFluxoRealAnal'
      object rpFluxoReaAnaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpFluxoReaAnaLine4: TppLine
          UserName = 'rpFluxoReaAnaLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 7144
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaLabel2: TppLabel
          UserName = 'rpFluxoReaAnaLabel2'
          Caption = 'Tipo de Recebimento/Desembolso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6085
          mmTop = 2381
          mmWidth = 51065
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaDBText3: TppDBText
          UserName = 'rpFluxoReaAnaDBText3'
          AutoSize = True
          DataField = 'CODTIPRECDES'
          DataPipeline = pplFluxoRealAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoRealAnal'
          mmHeight = 3440
          mmLeft = 59531
          mmTop = 2117
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaDBText4: TppDBText
          UserName = 'rpFluxoReaAnaDBText4'
          AutoSize = True
          DataField = 'DESCTD'
          DataPipeline = pplFluxoRealAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplFluxoRealAnal'
          mmHeight = 3440
          mmLeft = 88371
          mmTop = 2381
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object rpFluxoReaAnaLine2: TppLine
          UserName = 'rpFluxoReaAnaLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpFluxoReaAnaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpFluxoReaAnaLabel8: TppLabel
          UserName = 'rpFluxoReaAnaLabel8'
          Caption = 'Total do Tipo de Recebimento/Desembolso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 1852
          mmWidth = 63500
          BandType = 5
          GroupNo = 1
        end
        object rpFluxoReaAnaDBCalc1: TppDBCalc
          UserName = 'rpFluxoReaAnaDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = pplFluxoRealAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpFluxoReaAnaGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplFluxoRealAnal'
          mmHeight = 3440
          mmLeft = 175684
          mmTop = 1852
          mmWidth = 20108
          BandType = 5
          GroupNo = 1
        end
        object rpFluxoReaAnaLine5: TppLine
          UserName = 'rpFluxoReaAnaLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object pplFluxoRealAnal: TppBDEPipeline
    DataSource = dsFluxoRealAnal
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lFluxoRealAnal'
    Left = 232
    Top = 64
  end
  object dsFluxoRealAnal: TwwDataSource
    DataSet = cdsFluxoRealAnal
    Left = 136
    Top = 64
  end
  object spFluxoRealAnal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.UNIDNEGOC,'
      '   R.CODTIPRECDES,'
      '   R.RECPAG,'
      '   CR.CODEXTERNO AS CODCENTRORESPON,'
      '   M.DATALANCFINAN,'
      '   R.VALOR AS VALTOT,'
      '   DECODE(R.RECPAG,'#39'R'#39',R.VALOR,-R.VALOR) AS VALOR,'
      '   M.HISTORICO AS HISTORICO,'
      '   '#39#39' AS RAZAOSOCIAL,'
      '   M.CODLANCFINANC AS DOCUMENTO,'
      '   C.DESCRICAO AS DESCCONTA,'
      '   CR.NOME AS DESCCR,'
      '   TD.DESCRICAO AS DESCTD,'
      '   UN.NOME AS DESCUN,'
      '   M.CODLANCFINANC'
      'FROM'
      '   RATEIOFINANC R, MOVIMFINANC M, PORTADORCONTA C,'
      '   CENTRESPON CR, TIPORECEBDESEMB TD, UNIDNEGOCIO UN'
      'WHERE'
      '   (M.DATALANCFINAN >= TO_DATE (:DataInicial,'#39'DD/MM/YYYY'#39')) AND'
      '   (M.DATALANCFINAN <= TO_DATE (:DataFinal,'#39'DD/MM/YYYY'#39')) AND'
      '   ((C.FLGGRAVAFLUXO = '#39'S'#39') OR (C.FLGGRAVAFLUXO IS NULL)) AND'
      '   (M.IDPESSOA = :IDPessoa) AND'
      '   (M.CODLANCFINANC = R.CODLANCFINANC) AND'
      '   (M.CODPORTADOR = C.CODPORTADOR) AND'
      '   (R.CODCENTRORESPON = CR.CODCENTRORESPON) AND'
      '   (R.IDPESSOA = CR.IDPESSOA) AND'
      '   (R.CODTIPRECDES = TD.CODTIPRECDES) AND'
      '   (R.RECPAG       = TD.RECPAG) AND'
      '   (R.IDPESSOA     = TD.IDPESSOA) AND'
      '   (R.UNIDNEGOC    = UN.UNIDNEGOC) AND'
      '   (R.IDPESSOA     = UN.IDPESSOA)'
      'ORDER BY'
      
        '   R.CODCENTRORESPON, R.RECPAG, R.CODTIPRECDES, M.DATALANCFINAN,' +
        ' M.CODLANCFINANC'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsFluxoRealAnal
    Left = 40
    Top = 8
  end
  object cdsFluxoRealAnal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 40
    Top = 64
  end
end
