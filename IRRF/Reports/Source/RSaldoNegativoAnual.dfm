inherited RptSaldoNegativoAnual: TRptSaldoNegativoAnual
  Left = 252
  Top = 219
  Width = 375
  Height = 165
  Caption = 'RptSaldoNegativoAnual'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relação de vidas'
    Params = <
      item
        Caption = 'Ano'
        Controle = tcSpinEdit
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
        SpinEditSettings.Increment = 1
        SpinEditSettings.Value = 2007
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
    Formheight = 270
    FormWidth = 400
    Left = 92
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = Report
    Left = 59
  end
  object Report: TppReport
    AutoStop = False
    DataPipeline = Pipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 139
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'Pipeline'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38894
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 26723
        mmWidth = 285221
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 37042
        mmWidth = 283898
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Relatório de Saldo Negativo Anual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 96573
        mmTop = 3969
        mmWidth = 85725
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 29898
        mmWidth = 69056
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 73025
        mmTop = 29898
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 103717
        mmTop = 29898
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Verdana'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 132557
        mmTop = 29898
        mmWidth = 21431
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = Pipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Pipeline'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 0
        mmWidth = 69056
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = Pipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Pipeline'
        mmHeight = 3175
        mmLeft = 72761
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IDPESSOA'
        DataPipeline = Pipeline
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Pipeline'
        mmHeight = 3175
        mmLeft = 103981
        mmTop = 0
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALOR'
        DataPipeline = Pipeline
        DisplayFormat = '###,###,###,###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'Pipeline'
        mmHeight = 3175
        mmLeft = 132557
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
        AutoSize = False
        Caption = 'Impostos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1323
        mmWidth = 284163
        BandType = 8
      end
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 31750
        mmTop = 1323
        mmWidth = 196586
        BandType = 8
      end
      object ppCalc40: TppSystemVariable
        UserName = 'ppCalc401'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 221
    Top = 8
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Provider'
    Left = 253
    Top = 8
    object ClientDataSetNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object ClientDataSetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object ClientDataSetNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object ClientDataSetVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object Query: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT P.NOME, P.IDPESSOA, P.NUMDOCUMENTO, G.VALOR'
      'FROM ('
      '  SELECT '
      '    L1.IDBENEFIRRF, '
      ' SUM(VLRLANC)*1 AS VALOR'
      '  FROM  '
      '    LANCIRRF L1, '
      ' LANCXINFORME LX1'
      '  WHERE '
      '      L1.IDLANCIRRF = LX1.IDLANCIRRF'
      '  AND L1.DATAPAGAMENTO BETWEEN '#39'01/01/2005'#39' AND '#39'31/12/2006'#39
      '  GROUP BY L1.IDBENEFIRRF'
      '  HAVING SUM(VLRLANC) < 0) G, PESSOA P'
      'WHERE P.IDPESSOA = G.IDBENEFIRRF'
      'ORDER BY G.VALOR DESC')
    ValidateWithMask = True
    Left = 317
    Top = 8
  end
  object Provider: TDataSetProvider
    DataSet = Query
    Constraints = True
    Left = 285
    Top = 8
  end
  object Pipeline: TppBDEPipeline
    DataSource = DataSource
    UserName = 'Pipeline'
    Left = 171
    Top = 8
    object PipelineppField1: TppField
      FieldAlias = 'Nome'
      FieldName = 'Nome'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object PipelineppField2: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object PipelineppField3: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object PipelineppField4: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
end
