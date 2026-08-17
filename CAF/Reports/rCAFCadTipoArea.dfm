inherited RptCAFCadTipoArea: TRptCAFCadTipoArea
  Left = 301
  Top = 143
  Width = 289
  Height = 145
  Caption = 'Cadastro de Tipos de 햞ea'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Tipos de 햞ea'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Tipos de 햞ea'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDTIPOAREA, DESCTIPOAREA'
          'FROM TIPOAREA'
          'ORDER BY DESCTIPOAREA')
        LookupSettings.Chave = 'IDTIPOAREA'
        LookupSettings.Display = 'DESCTIPOAREA'
        LookupSettings.Descricao = 'Tipo de 햞ea'
        LookupSettings.Tamanho = '50'
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
    Formheight = 96
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    DataBaseName = 'Basedados'
    Report = rpCadTipArea
    LabelEmpresa = ppLabel98
    LabelSistema = ppLabel102
  end
  object sqlCadTipArea: TCMSqlParams
    SQL.Strings = (
      'SELECT DESCTIPOAREA'
      'FROM TIPOAREA'
      ''
      'ORDER BY DESCTIPOAREA'
      '')
    ClientDataSet = cdsCadTipArea
    Left = 224
    Top = 65
  end
  object cdsCadTipArea: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 50
  end
  object dsCadTipArea: TwwDataSource
    DataSet = cdsCadTipArea
    Left = 224
    Top = 36
  end
  object ppCadTipArea: TppBDEPipeline
    DataSource = dsCadTipArea
    UserName = 'CadTipArea'
    Left = 224
    Top = 22
  end
  object rpCadTipArea: TppReport
    AutoStop = False
    DataPipeline = ppCadTipArea
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
    Left = 224
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Cadastro de Tipos de 햞eas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 71438
        mmTop = 8996
        mmWidth = 56356
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'ppLine27'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'ppLabel100'
        Caption = 'Descri豫o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 19844
        mmWidth = 14288
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24077
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppDBText58: TppDBText
        UserName = 'ppDBText58'
        DataField = 'DESCTIPOAREA'
        DataPipeline = ppCadTipArea
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 794
        mmWidth = 191559
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel102: TppLabel
        UserName = 'ppLabel102'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 35983
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 71438
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
end
