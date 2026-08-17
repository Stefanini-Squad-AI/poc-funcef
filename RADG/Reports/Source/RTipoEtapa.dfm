inherited rptTipoEtapa: TrptTipoEtapa
  Left = 318
  Top = 215
  Width = 368
  Height = 260
  Caption = 'Tipo de Etapa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Tipo de Etapa'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Tipo de Etapa'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '            IDTIPOETAPA,'
          '            NOME'
          'FROM'
          '           RADTIPOETAPA'
          'ORDER BY NOME'
          '    ')
        LookupSettings.Chave = 'IDTIPOETAPA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Tipo de Etapa'
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
    Report = RptTipoEtapa
    LabelEmpresa = LblEmpresa
    LabelSistema = lblSistema
    Left = 88
    Top = 12
  end
  object sqlTipoEtapa: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '      IDTIPOETAPA,'
      '      NOME,'
      '      DECODE(FLGAUTOMATICA,'#39'S'#39','#39' X '#39','#39#39') AS AUTOMATICO,'
      '      DECODE(FLGAUTORIZACAO,'#39'S'#39','#39' X '#39','#39#39') AS AUTORIZA,'
      '      DESCRICAO'
      ' FROM'
      '      RADTIPOETAPA'
      ' WHERE  ( IDTIPOETAPA = :IDTIPOETAPA)'
      ' ORDER BY NOME')
    ClientDataSet = cdsTipoEtapa
    Left = 32
    Top = 80
  end
  object cdsTipoEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 109
    Top = 78
  end
  object sqlEtapa: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOETAPA,'
      '               NOME'
      'FROM'
      '           RADTIPOETAPA'
      'WHERE (IDTIPOETAPA= :IDTIPOETAPA)')
    ClientDataSet = cdsEtapa
    Left = 200
    Top = 160
  end
  object cdsEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 285
    Top = 158
  end
  object bdeTipoEtapa: TppBDEPipeline
    DataSource = dsTipoEtapa
    UserName = 'bdeTipoEtapa'
    Left = 253
    Top = 76
  end
  object dsTipoEtapa: TwwDataSource
    DataSet = cdsTipoEtapa
    Left = 181
    Top = 77
  end
  object RptTipoEtapa: TppReport
    AutoStop = False
    DataPipeline = bdeTipoEtapa
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 309
    Top = 74
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Tipo de Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 84667
        mmTop = 8731
        mmWidth = 27781
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22225
        mmWidth = 197300
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
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Tipo de Etapa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 17992
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 97631
        mmTop = 17992
        mmWidth = 14288
        BandType = 0
      end
      object RptTipoEtapaLabel1: TppLabel
        UserName = 'RptTipoEtapaLabel1'
        Caption = 'Autom.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 17992
        mmWidth = 11377
        BandType = 0
      end
      object RptTipoEtapaLabel2: TppLabel
        UserName = 'RptTipoEtapaLabel2'
        Caption = 'Autorz..'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 181505
        mmTop = 17992
        mmWidth = 11377
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object RptTipoEtapaDBText1: TppDBText
        UserName = 'RptTipoEtapaDBText1'
        DataField = 'NOME'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object RptTipoEtapaDBMemo1: TppDBMemo
        UserName = 'RptTipoEtapaDBMemo1'
        CharWrap = True
        DataField = 'DESCRICAO'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 17727
        mmLeft = 97102
        mmTop = 0
        mmWidth = 70379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object RptTipoEtapaDBText2: TppDBText
        UserName = 'RptTipoEtapaDBText2'
        DataField = 'AUTOMATICO'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object RptTipoEtapaDBText3: TppDBText
        UserName = 'RptTipoEtapaDBText3'
        DataField = 'AUTORIZA'
        DataPipeline = bdeTipoEtapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 180975
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
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
        mmLeft = 265
        mmTop = 529
        mmWidth = 23813
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 68263
        mmTop = 529
        mmWidth = 61119
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
  end
end
