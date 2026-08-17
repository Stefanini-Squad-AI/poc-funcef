inherited dtmRelCustoFinanceiro: TdtmRelCustoFinanceiro
  Left = 132
  Top = 249
  Width = 602
  Height = 222
  Caption = 'dtmRelCustoFinanceiro'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Código:'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   CODTIPIMOVEL, DESCTIPOIMOVEL'
          'FROM '
          '   TIPOIMOVEL')
        LookupSettings.Chave = 'CodTipImovel'
        LookupSettings.Display = 'DesctipoImovel'
        LookupSettings.Descricao = 'Código Imóvel'
        LookupSettings.Tamanho = '25'
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
        Name = 'Código:'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
  end
  object qryCustoFinanceiro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPIMOVEL, DESCTIPOIMOVEL'
      'FROM'
      '   TIPOIMOVEL'
      'WHERE'
      '   ( ( :CODTIPIMOVEL IS NULL ) OR'
      '   ( CODTIPIMOVEL = :CODTIPIMOVEL ) )')
    ValidateWithMask = True
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    object qryCustoFinanceiroCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object qryCustoFinanceiroDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object dspCustoFinanceiro: TDataSetProvider
    DataSet = qryCustoFinanceiro
    Constraints = True
    Left = 144
    Top = 64
  end
  object cdsCustoFinanceiro: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODTIPIMOVEL'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspCustoFinanceiro'
    Left = 248
    Top = 64
    object cdsCustoFinanceiroCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.CODTIPIMOVEL'
      Size = 5
    end
    object cdsCustoFinanceiroDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Origin = 'BASEDADOS.TIPOIMOVEL.DESCTIPOIMOVEL'
      Size = 25
    end
  end
  object pplCustoFinanceiro: TppBDEPipeline
    DataSource = dsCustoFinanceiro
    UserName = 'lCustoFinanceiro'
    Left = 472
    Top = 64
    object pplCustoFinanceiroppField1: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplCustoFinanceiroppField2: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 25
      DisplayWidth = 25
      Position = 1
    end
  end
  object dsCustoFinanceiro: TwwDataSource
    DataSet = cdsCustoFinanceiro
    Left = 360
    Top = 64
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = pplCustoFinanceiro
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCTIPOIMOVEL'
        DataPipeline = pplCustoFinanceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 71173
        mmTop = 3175
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CODTIPIMOVEL'
        DataPipeline = pplCustoFinanceiro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 4763
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
