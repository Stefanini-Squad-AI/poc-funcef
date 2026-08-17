inherited RptFatura: TRptFatura
  Left = 355
  Top = 89
  Width = 374
  Height = 368
  Caption = 'RptFatura'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 8
    Top = 176
    Width = 353
    Height = 33
    Caption = 'Panel1'
    TabOrder = 0
  end
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Fatura e Cálculo de Comissão'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Ano/Mês de Cobrança'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT MESCOBRANCA '
          'FROM HSTCONTRIBASS'
          'ORDER BY MESCOBRANCA')
        LookupSettings.Chave = 'MESCOBRANCA'
        LookupSettings.Display = 'MESCOBRANCA'
        LookupSettings.Descricao = 'Ano / Mês'
        LookupSettings.Tamanho = '7'
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
        Name = 'Mês de Referência'
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
        Caption = 'Tipo'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Valores Calculados'
          'Valores Recebidos')
        RadioGroupSettings.Values.Strings = (
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 70
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
        Name = 'rdgenvrec'
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
    Formheight = 200
    FormWidth = 380
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = RpFatura
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'MESREF'
      FieldName = 'MESREF'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object PpRptCMppField3: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object PpRptCMppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCIOF'
      FieldName = 'PERCIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpRptCMppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCPROLABORE'
      FieldName = 'PERCPROLABORE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object PpRptCMppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALEXCLUIDO'
      FieldName = 'TOTALEXCLUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object PpRptCMppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOREXCLUIDO'
      FieldName = 'VALOREXCLUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object PpRptCMppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALINCLUIDO'
      FieldName = 'TOTALINCLUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpRptCMppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORINCLUIDO'
      FieldName = 'VALORINCLUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpRptCMppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VIDASANTERIOR'
      FieldName = 'VIDASANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRptCMppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALAANTERIOR'
      FieldName = 'TOTALAANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpRptCMppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VIDASATUAL'
      FieldName = 'VIDASATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object PpRptCMppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALATUAL'
      FieldName = 'TOTALATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 120
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 57
    Top = 120
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  '#39#39' AS PATROCINADORA,'
      '  '#39#39' AS MESREF,'
      '  '#39#39' AS MESCOBRANCA,'
      '  '#39#39' AS PRODUTO,'
      '   0 AS PERCIOF,'
      '   0 AS PERCPROLABORE,'
      '   0 AS TOTALEXCLUIDO,'
      '   0 AS VALOREXCLUIDO,'
      '   0 AS TOTALINCLUIDO,'
      '   0 AS VALORINCLUIDO,'
      '   0 AS VIDASANTERIOR,'
      '   0 AS TOTALANTERIOR,'
      '   0 AS VIDASATUAL,'
      '   0 AS TOTALATUAL'
      ''
      'FROM DUAL')
    ValidateWithMask = True
    Left = 11
    Top = 120
    object QryRptCMPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object QryRptCMMESREF: TStringField
      FieldName = 'MESREF'
      Size = 7
    end
    object QryRptCMMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object QryRptCMPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 40
    end
    object QryRptCMPERCIOF: TFloatField
      FieldName = 'PERCIOF'
    end
    object QryRptCMPERCPROLABORE: TFloatField
      FieldName = 'PERCPROLABORE'
    end
    object QryRptCMTOTALEXCLUIDO: TFloatField
      FieldName = 'TOTALEXCLUIDO'
    end
    object QryRptCMVALOREXCLUIDO: TFloatField
      FieldName = 'VALOREXCLUIDO'
    end
    object QryRptCMTOTALINCLUIDO: TFloatField
      FieldName = 'TOTALINCLUIDO'
    end
    object QryRptCMVALORINCLUIDO: TFloatField
      FieldName = 'VALORINCLUIDO'
    end
    object QryRptCMVIDASANTERIOR: TFloatField
      FieldName = 'VIDASANTERIOR'
    end
    object QryRptCMTOTALAANTERIOR: TFloatField
      FieldName = 'TOTALAANTERIOR'
    end
    object QryRptCMVIDASATUAL: TFloatField
      FieldName = 'VIDASATUAL'
    end
    object QryRptCMTOTALATUAL: TFloatField
      FieldName = 'TOTALATUAL'
    end
  end
  object AQryFundacao: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 305
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 313
    Top = 65
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 241
    Top = 66
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 18
    Top = 66
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 96
    Top = 66
  end
  object CdsFundacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 171
    Top = 67
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 217
    Top = 120
  end
  object RpFatura: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 8890
    PrinterSetup.mmMarginRight = 8890
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 312
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppDBImage10: TppDBImage
        UserName = 'DBImage10'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText110: TppDBText
        UserName = 'DBText110'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText111: TppDBText
        UserName = 'DBText111'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText112: TppDBText
        UserName = 'DBText112'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText113: TppDBText
        UserName = 'DBText113'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText114: TppDBText
        UserName = 'DBText114'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 91546
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText115: TppDBText
        UserName = 'DBText115'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText116: TppDBText
        UserName = 'DBText116'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText117: TppDBText
        UserName = 'DBText117'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 279347
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 55563
      mmPrintPosition = 0
      object rpdivergerecebimentoDBText10: TppDBText
        UserName = 'rpdivergerecebimentoDBText10'
        DataField = 'PATROCINADORA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 10848
        mmWidth = 50536
        BandType = 4
      end
      object DBTextPAnt: TppDBText
        UserName = 'DBTextPAnt'
        DataField = 'TOTALAANTERIOR'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppDBVAnt: TppDBText
        UserName = 'rpdivergerecebimentoDBText101'
        DataField = 'VIDASANTERIOR'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBTextVInc: TppDBText
        UserName = 'DBTextVInc'
        OnGetText = ppDBTextVIncGetText
        DataField = 'TOTALINCLUIDO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBTextPInc: TppDBText
        UserName = 'DBTextPInc'
        OnGetText = ppDBTextPIncGetText
        DataField = 'VALORINCLUIDO'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppDBTextVExc: TppDBText
        UserName = 'DBTextVExc'
        OnGetText = ppDBTextVExcGetText
        DataField = 'TOTALEXCLUIDO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBTextPEsc: TppDBText
        UserName = 'DBTextPEsc'
        OnGetText = ppDBTextPEscGetText
        DataField = 'VALOREXCLUIDO'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppDBTextVAtual: TppDBText
        UserName = 'DBTextVAtual'
        DataField = 'VIDASATUAL'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBTextPAtual: TppDBText
        UserName = 'DBTextPAtual'
        DataField = 'TOTALATUAL'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 176477
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 21167
        mmWidth = 239713
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 23548
        mmWidth = 134409
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 38629
        mmWidth = 134144
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 32808
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Prêmio Total Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67204
        mmTop = 26723
        mmWidth = 31221
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 27252
        mmWidth = 9790
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Prêmio Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 26988
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Pró-Labore'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 102129
        mmTop = 27252
        mmWidth = 19579
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line102'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 24342
        mmWidth = 134409
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 64823
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line11'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 38100
        mmWidth = 134144
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'ppLine20'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 53181
        mmWidth = 279347
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 5821
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Saldo do Mês Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67204
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 103717
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Inclusões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Exclusões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Saldo do Mês Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 176742
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 91546
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 55033
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 38100
        mmLeft = 0
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 128059
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 164571
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 239713
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 200819
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Total Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 5821
        mmWidth = 35190
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 239448
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 99748
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15081
        mmLeft = 134144
        mmTop = 23813
        mmWidth = 265
        BandType = 4
      end
      object ppVarIOF: TppVariable
        UserName = 'VarIOF'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 34131
        mmTop = 32544
        mmWidth = 29633
        BandType = 4
      end
      object ppVarPTotal: TppVariable
        UserName = 'VarPTotal'
        AutoSize = False
        CalcOrder = 1
        CalcComponent = ppGroup2
        CalcType = veGroupStart
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetComponent = ppGroup2
        ResetType = veGroupStart
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 32544
        mmWidth = 31221
        BandType = 4
      end
      object ppVarProLabore: TppVariable
        UserName = 'VarProLabore'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 102129
        mmTop = 32808
        mmWidth = 29898
        BandType = 4
      end
      object ppDBCalcIOF: TppDBCalc
        UserName = 'DBCalcIOF'
        DataField = 'PERCIOF'
        DataPipeline = PpRptCM
        DisplayFormat = '###%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcMaximum
        mmHeight = 3175
        mmLeft = 47625
        mmTop = 27252
        mmWidth = 9260
        BandType = 4
      end
      object ppDBCalcProLabore: TppDBCalc
        UserName = 'DBCalcProLabore'
        DataField = 'PERCPROLABORE'
        DataPipeline = PpRptCM
        DisplayFormat = '###%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcMaximum
        mmHeight = 3175
        mmLeft = 121973
        mmTop = 27252
        mmWidth = 9260
        BandType = 4
      end
      object ppVarTotLiquido: TppVariable
        UserName = 'VarIOF1'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 32544
        mmWidth = 30163
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'VarPaPagar1'
        AutoSize = False
        CalcOrder = 4
        CalcComponent = PpRptCM
        CalcType = veDataPipelineTraversal
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 10848
        mmWidth = 35190
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 103188
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
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
        mmLeft = 27517
        mmTop = 1323
        mmWidth = 213519
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242623
        mmTop = 1323
        mmWidth = 30692
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Pen.Style = psInsideFrame
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 279347
        BandType = 8
      end
    end
    object rpdivergerecebimentoSummaryBand1: TppSummaryBand
      NewPage = True
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppVarTotalLiquido: TppVariable
        UserName = 'ppVarTotalLiquido'
        AutoSize = False
        CalcOrder = 0
        CalcComponent = ppGroup2
        CalcType = veGroupStart
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 26458
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel14: TppLabel
        UserName = 'Label13'
        Caption = 'Total Prêmio Líquido (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 95250
        mmTop = 21696
        mmWidth = 34660
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Total Prêmio Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 9790
        mmTop = 22225
        mmWidth = 31750
        BandType = 7
      end
      object ppVarTotalBruto: TppVariable
        UserName = 'VarTotalBruto'
        AutoSize = False
        CalcOrder = 1
        CalcComponent = ppGroup2
        CalcType = veGroupStart
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 26988
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Total Valor IOF (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 54504
        mmTop = 22225
        mmWidth = 27252
        BandType = 7
      end
      object ppVarTotalIOF: TppVariable
        UserName = 'VarTotalIOF'
        AutoSize = False
        CalcOrder = 2
        CalcComponent = ppGroup2
        CalcType = veGroupStart
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 48154
        mmTop = 26988
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Total Valor Pro-Labore (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 154252
        mmTop = 21431
        mmWidth = 36777
        BandType = 7
      end
      object ppVarTotalProLabore: TppVariable
        UserName = 'VarTotalProLabore'
        AutoSize = False
        CalcOrder = 3
        CalcComponent = ppGroup2
        CalcType = veGroupStart
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 157427
        mmTop = 26194
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'Label14'
        Caption = 'TOTAL GERAL DA FATURA'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        mmHeight = 4763
        mmLeft = 7144
        mmTop = 14023
        mmWidth = 50800
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 1058
        mmWidth = 279347
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'MESREF'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpdivergerecebimentoDBText14: TppDBText
          UserName = 'rpdivergerecebimentoDBText14'
          DataField = 'PRODUTO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 2381
          mmTop = 5821
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpdivergerecebimentoLabel6: TppLabel
          UserName = 'rpdivergerecebimentoLabel6'
          Caption = 'Ano/Mês de Ref.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178859
          mmTop = 1058
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object rpdivergerecebimentoLabel13: TppLabel
          UserName = 'rpdivergerecebimentoLabel13'
          Caption = 'Ano/Mês de Cobrança: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 179123
          mmTop = 6085
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object rpdivergerecebimentoDBText6: TppDBText
          UserName = 'rpdivergerecebimentoDBText6'
          Color = 15658734
          DataField = 'MESREF'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          mmHeight = 4233
          mmLeft = 218546
          mmTop = 1058
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object rpdivergerecebimentoDBText13: TppDBText
          UserName = 'rpdivergerecebimentoDBText13'
          DataField = 'MESCOBRANCA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 218546
          mmTop = 6085
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpLabelTitulo: TppLabel
          UserName = 'rpLabelTitulo'
          Caption = 'FATURA MENSAL'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 2381
          mmTop = 265
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRptCM
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D
        566172494F46314F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F75726365069170726F63656475726520566172494F4631
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A2056616C7565203A3D5070527074434D5B27544F54414C415455
        414C275D2D285070527074434D5B27544F54414C415455414C275D2A0D0A2020
        5070527074434D5B2750455243494F46275D2F313030293B0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D650607566172494F4631094576656E744E616D
        6506064F6E43616C63074576656E74494402210001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65060C566172494F464F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        067870726F63656475726520566172494F464F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C756520
        3A3D205070527074434D5B27544F54414C415455414C275D2A5070527074434D
        5B2750455243494F46275D2F3130303B0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D650606566172494F46094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060F56617250546F74616C4F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506627072
        6F6365647572652056617250546F74616C4F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A
        3D205070527074434D5B27544F54414C415455414C275D3B0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060956617250546F74616C094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65061256617250726F4C61626F
        72654F6E43616C630B50726F6772616D54797065070B747450726F6365647572
        6506536F7572636506B770726F6365647572652056617250726F4C61626F7265
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A2056616C7565203A3D285070527074434D5B27544F54414C4154
        55414C275D2D285070527074434D5B27544F54414C415455414C275D2A0D0A20
        205070527074434D5B2750455243494F46275D2F3130302929202A2050705270
        74434D5B275045524350524F4C41424F5245275D2F3130303B0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060C56617250726F4C61626F7265094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650611566172506150
        61676172314F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F75726365066670726F63656475726520566172506150616761
        72314F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A0D0A202056616C7565203A3D5070527074434D5B27544F54414C
        415455414C275D3B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060B5661725061506167617231094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506177070566172546F74616C4C69717569646F4F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        636506AA70726F636564757265207070566172546F74616C4C69717569646F4F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A62656769
        6E0D0A0D0A202056616C7565203A3D2056616C7565202B0D0A20205070527074
        434D5B27544F54414C415455414C275D2D285070527074434D5B27544F54414C
        415455414C275D2A0D0A20205070527074434D5B2750455243494F46275D2F31
        3030293B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506117070
        566172546F74616C4C69717569646F094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D650611566172546F74616C494F464F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365068970
        726F63656475726520566172546F74616C494F464F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A2020200D0A20
        56616C7565203A3D2056616C7565202B205070527074434D5B27544F54414C41
        5455414C275D2A5070527074434D5B2750455243494F46275D2F3130303B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B566172546F74616C
        494F46094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        566172546F74616C427275746F4F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365067070726F6365647572652056
        6172546F74616C427275746F4F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2056616C
        7565202B205070527074434D5B27544F54414C415455414C275D3B0D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060D566172546F74616C427275
        746F094576656E744E616D6506064F6E43616C63074576656E74494402210001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061756
        6172546F74616C50726F4C61626F72654F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506CA70726F6365647572
        6520566172546F74616C50726F4C61626F72654F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C7565
        203A3D2056616C7565202B20285070527074434D5B27544F54414C415455414C
        275D2D285070527074434D5B27544F54414C415455414C275D2A0D0A20205070
        527074434D5B2750455243494F46275D2F3130302929202A205070527074434D
        5B275045524350524F4C41424F5245275D2F3130303B0D0A0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D650611566172546F74616C50726F4C6162
        6F7265094576656E744E616D6506064F6E43616C63074576656E744944022100
        00}
    end
  end
  object qryRelFat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     PJ.NOME AS PATRO,'
      '     COUNT(*) AS TOTALREG,'
      '     NVL(MESANT.QTDMESANT, 0) AS QTDMESANT,'
      '     NVL(MESANT.TOTALMESANT, 0) AS TOTALMESANT,'
      '     HT.MESCOBRANCA,'
      '     SUM(HT.VALORESPERADO) AS TOTAL_BRUTO,'
      
        '     (SUM(HT.VALORESPERADO) - ((PD.PERCIOF * SUM(HT.VALORESPERAD' +
        'O))/100)) AS TOTLIQUIDO,'
      '     (PD.PERCIOF * SUM(HT.VALORESPERADO))/100 AS TOTIOF,'
      
        '     (PD.PERCPROLABORE * SUM(HT.VALORESPERADO))/100 AS TOTPROLAB' +
        'ORE,'
      '     PD.NOME AS PRODUTO'
      'FROM PARTASS PT,'
      '     PESSOA PE,'
      '     PESSOA PJ,'
      '     PESSOA BN,'
      '     PESSOAFISICA PF,'
      '     PARTPREVPLAN PV,'
      '     ELEGPATRO EL,'
      '     HSTCONTRIBASS HT,'
      '     BENEFASS BF,'
      '     CONTASS CT,'
      '     SITPLANOASS SP,'
      '     PLANPREV PR,'
      '     SITPART ST,'
      '     PRODASS PD,'
      '     PLANASS PL,'
      '     (SELECT'
      
        '        HT.IDPESSJUR, COUNT(*) AS QTDMESANT, SUM(HT.VALORESPERAD' +
        'O) AS TOTALMESANT'
      '      FROM PARTASS PT,'
      '      PESSOA PE,'
      '      PESSOA PJ,'
      '      PESSOA BN,'
      '      PESSOAFISICA PF,'
      '      PARTPREVPLAN PV,'
      '      ELEGPATRO EL,'
      '      HSTCONTRIBASS HT,'
      '      BENEFASS BF,'
      '      CONTASS CT,'
      '      SITPLANOASS SP,'
      '      PLANPREV PR,'
      '      SITPART ST,'
      '      PRODASS PD,'
      '      PLANASS PL'
      '   WHERE'
      '      HT.MESCOBRANCA =  :MesAnt  AND'
      '      PT.IDPESSOA = PV.IDPESSOA AND'
      '      PT.IDPESSJUR = PV.IDPESSJUR AND'
      '      PT.IDPESSOA = EL.IDPESSOA AND'
      '      PT.IDPESSJUR = EL.IDPESSJUR AND'
      '      PT.IDPESSOA = PE.IDPESSOA AND'
      '      PT.IDPESSOA = PF.IDPESSOA AND'
      '      BF.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '      BF.IDPESSJUR = PV.IDPESSJUR AND'
      '      BF.IDTITULAR = PV.IDPESSOA AND'
      '      BF.FLGATIVO  = CT.FLGATIVO AND'
      '      BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '      BF.IDPESSJUR = CT.IDPESSJUR     AND'
      '      BF.IDPLANASS = PT.IDPLANASS AND'
      '      PT.IDPESSJUR = PV.IDPESSJUR AND'
      '      PT.IDPESSJUR = PJ.IDPESSOA AND'
      '      PT.IDPESSOA = BF.IDTITULAR AND'
      '      PT.IDPESSOA = CT.IDTITULAR AND'
      '      PT.IDSITPART = SP.IDSITPLANOASS AND'
      '      PT.IDPLANOPREV = PR.IDPLANOPREV AND'
      '      PT.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '      PT.IDPESSJUR = PV.IDPESSJUR AND'
      '      HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '      HT.IDPESSJUR = PV.IDPESSJUR AND'
      '      HT.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '      HT.IDPESSJUR = PV.IDPESSJUR  AND'
      '      HT.IDTITULAR = PV.IDPESSOA  AND'
      '      HT.IDPLANASS =  PT.IDPLANASS  AND'
      '      PV.IDPESSOA = PT.IDPESSOA AND'
      '      PV.IDPESSOA = PF.IDPESSOA AND'
      '      PV.IDPESSOA = BF.IDTITULAR AND'
      '      PV.IDPESSJUR = PJ.IDPESSOA AND'
      '      PV.IDSITPART = ST.IDSITPART AND'
      '      PV.IDPLANOPREV = PR.IDPLANOPREV AND'
      '      BF.FLGATIVO  = CT.FLGATIVO AND'
      '      BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '      BF.IDPESSJUR = CT.IDPESSJUR     AND'
      '      BF.IDDEPENDENTE = BN.IDPESSOA AND'
      '      BF.IDTITULAR = CT.IDTITULAR AND'
      '      HT.IDTITULAR = PT.IDPESSOA AND'
      '      HT.IDPLANASS = PL.IDPLANASS AND'
      '      PD.IDPRODASS = PL.IDPRODASS AND'
      '      CT.FLGATIVO = BF.FLGATIVO AND'
      '      BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '      BF.IDPESSJUR = CT.IDPESSJUR     AND'
      '      PT.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '      PT.IDPESSJUR = PV.IDPESSJUR      AND'
      '      PV.IDPESSOA = PT.IDPESSOA     AND'
      '      HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '      HT.IDPESSJUR = PV.IDPESSJUR  AND'
      '      HT.IDPLANASS =  PT.IDPLANASS AND'
      '      HT.IDTITULAR = PV.IDPESSOA AND'
      '      HT.VALORESPERADO > 0'
      '    GROUP BY HT.IDPESSJUR'
      '  ) MESANT'
      ''
      'WHERE'
      '     HT.MESCOBRANCA =  :MesCorr AND'
      '     PT.IDPESSOA = PV.IDPESSOA AND'
      '     PT.IDPESSJUR = PV.IDPESSJUR AND'
      '     PT.IDPESSOA = EL.IDPESSOA AND'
      ''
      '     PT.IDPESSJUR = EL.IDPESSJUR AND'
      ''
      '     PT.IDPESSOA = PE.IDPESSOA AND'
      '     PT.IDPESSOA = PF.IDPESSOA AND'
      ''
      '     BF.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '     BF.IDPESSJUR = PV.IDPESSJUR AND'
      '     BF.IDTITULAR = PV.IDPESSOA AND'
      '     BF.FLGATIVO  = CT.FLGATIVO AND'
      '     BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '     BF.IDPESSJUR = CT.IDPESSJUR     AND'
      ''
      '     BF.IDPLANASS = PT.IDPLANASS AND'
      ''
      '     PT.IDPESSJUR = PV.IDPESSJUR AND'
      ''
      '     PT.IDPESSJUR = PJ.IDPESSOA AND'
      '     PT.IDPESSOA = BF.IDTITULAR AND'
      '     PT.IDPESSOA = CT.IDTITULAR AND'
      '     PT.IDSITPART = SP.IDSITPLANOASS AND'
      ''
      '     PT.IDPLANOPREV = PR.IDPLANOPREV AND'
      ''
      '     PT.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '     PT.IDPESSJUR = PV.IDPESSJUR AND'
      '     HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '     HT.IDPESSJUR = PV.IDPESSJUR AND'
      ''
      '     HT.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '     HT.IDPESSJUR = PV.IDPESSJUR  AND'
      '     HT.IDTITULAR = PV.IDPESSOA  AND'
      '     HT.IDPLANASS =  PT.IDPLANASS  AND'
      ''
      '     PV.IDPESSOA = PT.IDPESSOA AND'
      ''
      '    PV.IDPESSOA = PF.IDPESSOA AND'
      '    PV.IDPESSOA = BF.IDTITULAR AND'
      '    PV.IDPESSJUR = PJ.IDPESSOA AND'
      '    PV.IDSITPART = ST.IDSITPART AND'
      '    PV.IDPLANOPREV = PR.IDPLANOPREV AND'
      ''
      '    BF.FLGATIVO  = CT.FLGATIVO AND'
      '    BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '    BF.IDPESSJUR = CT.IDPESSJUR     AND'
      ''
      '    BF.IDDEPENDENTE = BN.IDPESSOA AND'
      '    BF.IDTITULAR = CT.IDTITULAR AND'
      ''
      '    HT.IDTITULAR = PT.IDPESSOA AND'
      '    HT.IDPLANASS = PL.IDPLANASS AND'
      '    PD.IDPRODASS = PL.IDPRODASS AND'
      ''
      '    CT.FLGATIVO = BF.FLGATIVO AND'
      '    BF.IDPLANOPREV = CT.IDPLANOPREV AND'
      '    BF.IDPESSJUR = CT.IDPESSJUR     AND'
      ''
      '    PT.IDPLANOPREV = PV.IDPLANOPREV  AND'
      '    PT.IDPESSJUR = PV.IDPESSJUR      AND'
      '    PV.IDPESSOA = PT.IDPESSOA     AND'
      '    HT.IDPLANOPREV = PV.IDPLANOPREV AND'
      '    HT.IDPESSJUR = PV.IDPESSJUR  AND'
      '    HT.IDPLANASS =  PT.IDPLANASS AND'
      '    HT.IDTITULAR = PV.IDPESSOA AND'
      '    HT.VALORESPERADO > 0 AND'
      ''
      '    HT.IDPESSJUR = MESANT.IDPESSJUR(+)'
      ''
      
        'GROUP BY HT.MESCOBRANCA, PJ.NOME, PD.PERCIOF, PD.PERCPROLABORE, ' +
        'MESANT.QTDMESANT, MESANT.TOTALMESANT, PD.NOME'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'MesAnt'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MesCorr'
        ParamType = ptInput
      end>
  end
  object DsRelFat: TwwDataSource
    DataSet = qryRelFat
    Left = 88
    Top = 224
  end
  object ppPipeRelFat: TppBDEPipeline
    DataSource = DsRelFat
    UserName = 'PipeRelFat'
    Left = 152
    Top = 224
  end
  object ppRrelFat: TppReport
    AutoStop = False
    DataPipeline = ppPipeRelFat
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    Left = 216
    Top = 224
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage101'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 26988
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 91546
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText1101'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 54769
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'rpdivergerecebimentoDBText102'
        DataField = 'PATRO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 10848
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBTextPAnt1'
        DataField = 'TOTALMESANT'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67469
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'QTDMESANT'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBTextVAtual1'
        DataField = 'TOTALREG'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 10848
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBTextPAtual1'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 176477
        mmTop = 10848
        mmWidth = 23813
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 21167
        mmWidth = 239713
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line103'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 23548
        mmWidth = 134409
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 38629
        mmWidth = 134144
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 32808
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Prêmio Total Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67204
        mmTop = 26723
        mmWidth = 31221
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 37306
        mmTop = 27252
        mmWidth = 9790
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Prêmio Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 26988
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Pró-Labore'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 102129
        mmTop = 27252
        mmWidth = 19579
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Pen.Style = psInsideFrame
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 24342
        mmWidth = 134409
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 64823
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 38100
        mmWidth = 134144
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'ppLine201'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 53181
        mmWidth = 284300
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 5821
        mmWidth = 27781
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = 'Saldo do Mês Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 67204
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92339
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 103716
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'Inclusões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'Exclusões'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 5821
        mmWidth = 23813
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'Saldo do Mês Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 2381
        mmWidth = 35190
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 165100
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Prêmio Mensal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 176742
        mmTop = 5821
        mmWidth = 23548
        BandType = 4
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 91546
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 55033
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 128059
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 164571
        mmTop = 794
        mmWidth = 265
        BandType = 4
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 239713
        BandType = 4
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 200819
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = 'Total Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 202407
        mmTop = 5821
        mmWidth = 35190
        BandType = 4
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13494
        mmLeft = 99748
        mmTop = 24606
        mmWidth = 265
        BandType = 4
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 15081
        mmLeft = 134144
        mmTop = 23813
        mmWidth = 265
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalcIOF1'
        DataField = 'PERCIOF'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '###%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcMaximum
        mmHeight = 3175
        mmLeft = 47625
        mmTop = 27252
        mmWidth = 13758
        BandType = 4
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalcProLabore1'
        DataField = 'PERCPROLABORE'
        DataPipeline = PpRptCM
        DisplayFormat = '###%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcMaximum
        mmHeight = 3175
        mmLeft = 121973
        mmTop = 27252
        mmWidth = 9260
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 'Vidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 5821
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 208492
        mmTop = 11113
        mmWidth = 23813
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 239448
        mmTop = 1058
        mmWidth = 265
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText8'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 7144
        mmTop = 32544
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TOTIOF'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 39952
        mmTop = 32544
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'TOTLIQUIDO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 72231
        mmTop = 32544
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'TOTPROLABORE'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 106627
        mmTop = 32544
        mmWidth = 17198
        BandType = 4
      end
      object ppVariable2: TppVariable
        UserName = 'Variable1'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 92339
        mmTop = 10583
        mmWidth = 11113
        BandType = 4
      end
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        AutoSize = False
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 103716
        mmTop = 10583
        mmWidth = 23813
        BandType = 4
      end
      object ppVariable4: TppVariable
        UserName = 'Variable4'
        AutoSize = False
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 128852
        mmTop = 10583
        mmWidth = 11113
        BandType = 4
      end
      object ppVariable5: TppVariable
        UserName = 'Variable5'
        AutoSize = False
        CalcOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 10583
        mmWidth = 23813
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel51: TppLabel
        UserName = 'LabelSistema1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 103188
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmLeft = 27517
        mmTop = 1323
        mmWidth = 213519
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242623
        mmTop = 1323
        mmWidth = 30692
        BandType = 8
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Pen.Style = psInsideFrame
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = 'Total Valor Pro-Labore (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 154516
        mmTop = 22225
        mmWidth = 39952
        BandType = 7
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = 'Total Prêmio Líquido (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 22225
        mmWidth = 37305
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = 'Total Valor IOF (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 55298
        mmTop = 22225
        mmWidth = 28047
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = 'Total Prêmio Bruto (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 8731
        mmTop = 22225
        mmWidth = 34130
        BandType = 7
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = 'TOTAL GERAL DA FATURA'
        Color = clMenu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        mmHeight = 4763
        mmLeft = 7144
        mmTop = 14023
        mmWidth = 50800
        BandType = 7
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 1058
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'TOTAL_BRUTO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 8730
        mmTop = 26459
        mmWidth = 34130
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'TOTIOF'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 55298
        mmTop = 26459
        mmWidth = 28047
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'TOTLIQUIDO'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 26459
        mmWidth = 37305
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'TOTPROLABORE'
        DataPipeline = ppPipeRelFat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 154516
        mmTop = 26459
        mmWidth = 39952
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppPipeRelFat
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppLabel43: TppLabel
          UserName = 'rpLabelTitulo1'
          Caption = 'FATURA MENSAL'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 2381
          mmTop = 265
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'PRODUTO'
          DataPipeline = ppPipeRelFat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 2381
          mmTop = 5821
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          Caption = 'Ano/Mês de Cobrança: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 179123
          mmTop = 6085
          mmWidth = 39423
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          Caption = 'Ano/Mês de Ref.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178859
          mmTop = 1058
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'MESCOBRANCA'
          DataPipeline = ppPipeRelFat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 218546
          mmTop = 6085
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          Color = 15658734
          DataField = 'MESCOBRANCA'
          DataPipeline = ppPipeRelFat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          mmHeight = 4233
          mmLeft = 218546
          mmTop = 1058
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506DD70726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A0D0A20206966205069706552656C4661745B27544F54
        414C524547275D203E205069706552656C4661745B275154444D4553414E5427
        5D207468656E0D0A2020202056616C7565203A3D205069706552656C4661745B
        27544F54414C524547275D202D205069706552656C4661745B275154444D4553
        414E54275D0D0A2020656C73650D0A2020202056616C7565203A3D20303B2020
        0D0A202020200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661
        726961626C6531094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060F5661726961626C65334F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F7572636506E270726F6365647572652056
        61726961626C65334F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A20206966205069706552656C4661745B2754
        4F54414C524547275D203E205069706552656C4661745B275154444D4553414E
        54275D207468656E0D0A2020202056616C7565203A3D205069706552656C4661
        745B27544F54414C5F425255544F275D202D205069706552656C4661745B2754
        4F54414C4D4553414E54275D0D0A2020656C73650D0A2020202056616C756520
        3A3D20303B20200D0A202020200D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506095661726961626C6533094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060F5661726961626C65344F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506DC7072
        6F636564757265205661726961626C65344F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A2020696620506970655265
        6C4661745B27544F54414C524547275D203C205069706552656C4661745B2751
        54444D4553414E54275D207468656E0D0A2020202056616C7565203A3D205069
        706552656C4661745B275154444D4553414E54275D202D205069706552656C46
        61745B27544F54414C524547275D200D0A2020656C73650D0A2020202056616C
        7565203A3D20303B20200D0A202020200D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D6506095661726961626C6534094576656E744E616D6506064F
        6E43616C63074576656E74494402210001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65060F5661726961626C65354F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        E270726F636564757265205661726961626C65354F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202069662050
        69706552656C4661745B27544F54414C524547275D203C205069706552656C46
        61745B275154444D4553414E54275D207468656E0D0A2020202056616C756520
        3A3D205069706552656C4661745B27544F54414C4D4553414E54275D202D2050
        69706552656C4661745B27544F54414C5F425255544F275D0D0A2020656C7365
        0D0A2020202056616C7565203A3D20303B20200D0A202020200D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D6506095661726961626C653509457665
        6E744E616D6506064F6E43616C63074576656E74494402210000}
    end
  end
end
