inherited RptDCalcContr: TRptDCalcContr
  Left = 316
  Top = 192
  Width = 374
  Height = 194
  Caption = 'RptDCalcContr'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Demonstrativo de Cálculo de Contribuições'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Mês de Cobrança'
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
        Name = 'Mês de Cobrança'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end
      item
        Caption = 'Mês de Referência'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT MESREFERENCIA '
          'FROM CTRLINTERFACE'
          'WHERE TIPO='#39'A'#39
          'ORDER BY MESREFERENCIA'
          '')
        LookupSettings.Chave = 'MESREFERENCIA'
        LookupSettings.Display = 'MESREFERENCIA'
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
        Name = 'Mês de Referência'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        Width = 0
      end>
    Formheight = 200
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = rpDCalcContr
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'SITDEPENDENTE'
      FieldName = 'SITDEPENDENTE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'RESPONSAVEL'
      FieldName = 'RESPONSAVEL'
      FieldLength = 149
      DisplayWidth = 149
      Position = 1
    end
    object PpRptCMppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALARIO'
      FieldName = 'SALARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 58
      DisplayWidth = 58
      Position = 3
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'GRAU_DEPEN'
      FieldName = 'GRAU_DEPEN'
      FieldLength = 27
      DisplayWidth = 27
      Position = 4
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 103
      DisplayWidth = 103
      Position = 5
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 6
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 17
      DisplayWidth = 17
      Position = 7
    end
    object PpRptCMppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpRptCMppField10: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object PpRptCMppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDEPENDENTE'
      FieldName = 'IDDEPENDENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRptCMppField12: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 11
    end
    object PpRptCMppField13: TppField
      FieldAlias = 'TITULAR'
      FieldName = 'TITULAR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 12
    end
    object PpRptCMppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object PpRptCMppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPATRO'
      FieldName = 'VLRPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object PpRptCMppField16: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 15
    end
    object PpRptCMppField17: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 16
    end
    object PpRptCMppField18: TppField
      FieldAlias = 'CODIGORUBRICA'
      FieldName = 'CODIGORUBRICA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 17
    end
    object PpRptCMppField19: TppField
      FieldAlias = 'FLGINTERNO'
      FieldName = 'FLGINTERNO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 18
    end
    object PpRptCMppField20: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object PpRptCMppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'TIT'
      FieldName = 'TIT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
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
    ValidateWithMask = True
    Left = 16
    Top = 120
    object QryRptCMSITDEPENDENTE: TStringField
      FieldName = 'SITDEPENDENTE'
      Size = 50
    end
    object QryRptCMRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 149
    end
    object QryRptCMDATANASC: TStringField
      FieldName = 'DATANASC'
      Size = 58
    end
    object QryRptCMGRAU_DEPEN: TStringField
      FieldName = 'GRAU_DEPEN'
      Size = 27
    end
    object QryRptCMPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object QryRptCMPLANO: TStringField
      FieldName = 'PLANO'
      Size = 40
    end
    object QryRptCMPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 40
    end
    object QryRptCMINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object QryRptCMDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 60
    end
    object QryRptCMIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
    end
    object QryRptCMMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object QryRptCMTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object QryRptCMVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryRptCMVLRPATRO: TFloatField
      FieldName = 'VLRPATRO'
    end
    object QryRptCMMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object QryRptCMMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object QryRptCMCODIGORUBRICA: TStringField
      FieldName = 'CODIGORUBRICA'
      Size = 15
    end
    object QryRptCMFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object QryRptCMSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object QryRptCMTIT: TFloatField
      FieldName = 'TIT'
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
    Left = 305
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
    Left = 209
    Top = 120
  end
  object rpDCalcContr: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
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
    Left = 314
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Demonstrativo do Cálculo de Contribuições Assistenciais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 43921
        mmTop = 33602
        mmWidth = 116681
        BandType = 0
      end
      object rpRelaCalcContribAssLabel4: TppLabel
        UserName = 'rpRelaCalcContribAssLabel4'
        Caption = 'MÊS DE COBRANÇA: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 58208
        mmTop = 39688
        mmWidth = 37306
        BandType = 0
      end
      object rpRelaCalcContribAssDBText8: TppDBText
        UserName = 'rpRelaCalcContribAssDBText8'
        DataField = 'MESCOBRANCA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 39688
        mmWidth = 29104
        BandType = 0
      end
      object ppDBImage14: TppDBImage
        UserName = 'DBImage14'
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
      object ppDBText142: TppDBText
        UserName = 'DBText142'
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
      object ppDBText143: TppDBText
        UserName = 'DBText143'
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
      object ppDBText144: TppDBText
        UserName = 'DBText144'
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
      object ppDBText145: TppDBText
        UserName = 'DBText145'
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
      object ppLabel19: TppLabel
        UserName = 'Label19'
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
      object ppDBText146: TppDBText
        UserName = 'DBText1301'
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
      object ppDBText147: TppDBText
        UserName = 'DBText147'
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
        mmWidth = 26458
        BandType = 0
      end
      object ppDBText148: TppDBText
        UserName = 'DBText148'
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
      object ppDBText149: TppDBText
        UserName = 'DBText149'
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
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 1588
        mmTop = 28046
        mmWidth = 192882
        BandType = 0
      end
    end
    object bndDetalheCalcContrib: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object dbValor: TppDBText
        OnPrint = dbValorPrint
        UserName = 'dbValor'
        DataField = 'VALOR'
        DataPipeline = PpRptCM
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 179917
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object rpRelaCalcContribAssDBText2: TppDBText
        UserName = 'rpRelaCalcContribAssDBText2'
        DataField = 'DEPENDENTE'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2646
        mmLeft = 17198
        mmTop = 0
        mmWidth = 73819
        BandType = 4
      end
      object dbValorPatro: TppDBText
        OnPrint = dbValorPatroPrint
        UserName = 'dbValorPatro'
        DataField = 'VLRPATRO'
        DataPipeline = PpRptCM
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 160338
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object rpRelaCalcContribAssDBText15: TppDBText
        UserName = 'rpRelaCalcContribAssDBText15'
        DataField = 'IDDEPENDENTE'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpRelaCalcContribAssDBText11: TppDBText
        UserName = 'rpRelaCalcContribAssDBText11'
        AutoSize = True
        DataField = 'DATANASC'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2381
        mmLeft = 92340
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object rpRelaCalcContribAssDBText14: TppDBText
        UserName = 'rpRelaCalcContribAssDBText14'
        AutoSize = True
        DataField = 'GRAU_DEPEN'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2381
        mmLeft = 118534
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
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
        mmLeft = 0
        mmTop = 1323
        mmWidth = 198173
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197644
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
        mmLeft = 164571
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRelaCalcContribAssSummaryBand: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object rpRelaCalcContribAssGroup4: TppGroup
      BreakName = 'PRODUTO'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'rpRelaCalcContribAssGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object HeaderGrupoPRODUTO: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpRelaCalcContribAssDBText7: TppDBText
          UserName = 'rpRelaCalcContribAssDBText7'
          AutoSize = True
          DataField = 'PRODUTO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 87842
          mmTop = 1058
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object rpRelaCalcContribAssLabel5: TppLabel
          UserName = 'rpRelaCalcContribAssLabel5'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7408
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object rpRelaCalcContribAssLabel6: TppLabel
          UserName = 'rpRelaCalcContribAssLabel6'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16404
          mmTop = 7408
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'ppLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 11113
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpRelaCalcContribAssLabel1: TppLabel
          UserName = 'rpRelaCalcContribAssLabel1'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155046
          mmTop = 8467
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRelaCalcContribAssGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object rpRelaCalcContribAssLabel12: TppLabel
          UserName = 'rpRelaCalcContribAssLabel12'
          Caption = 'Plano: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 5556
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object rpRelaCalcContribAssDBText10: TppDBText
          UserName = 'rpRelaCalcContribAssDBText10'
          DataField = 'PRODUTO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 4233
          mmLeft = 12435
          mmTop = 5556
          mmWidth = 50800
          BandType = 5
          GroupNo = 1
        end
        object rpRelaCalcContribAssLabel13: TppLabel
          UserName = 'rpRelaCalcContribAssLabel13'
          Caption = 'Valor dos Descontos : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 138642
          mmTop = 5556
          mmWidth = 37042
          BandType = 5
          GroupNo = 1
        end
        object rpRelaCalcContribAssDBCalc2: TppDBCalc
          UserName = 'rpRelaCalcContribAssDBCalc2'
          DataField = 'VALOR'
          DataPipeline = PpRptCM
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = rpRelaCalcContribAssGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 176213
          mmTop = 5556
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object rpRelaCalcContribAssLabel2: TppLabel
          UserName = 'rpRelaCalcContribAssLabel2'
          Caption = 'Qtd de Descontos Participante : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 65881
          mmTop = 5556
          mmWidth = 53711
          BandType = 5
          GroupNo = 2
        end
        object dbValorDescontoPatro: TppDBCalc
          UserName = 'dbValorDescontoPatro'
          DataField = 'VLRPATRO'
          DataPipeline = PpRptCM
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = rpRelaCalcContribAssGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 176213
          mmTop = 10319
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object lbQtdTitularCalc: TppLabel
          OnPrint = lbQtdTitularCalcPrint
          UserName = 'lbQtdTitularCalc'
          AutoSize = False
          Caption = 'lbQtdTitularCalc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 120121
          mmTop = 5556
          mmWidth = 10583
          BandType = 5
          GroupNo = 1
        end
        object lbQtdDescontoPatro: TppLabel
          OnPrint = lbQtdDescontoPatroPrint
          UserName = 'lbQtdDescontoPatro'
          AutoSize = False
          Caption = 'lbQtdDescontoPatro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 120121
          mmTop = 10319
          mmWidth = 10583
          BandType = 5
          GroupNo = 1
        end
        object lblQtdDescontoPatro: TppLabel
          UserName = 'lblQtdDescontoPatro'
          Caption = 'Qtd de Descontos Patro : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 77258
          mmTop = 10319
          mmWidth = 42333
          BandType = 5
          GroupNo = 1
        end
        object lblValorDescontoPatro: TppLabel
          UserName = 'lblValorDescontoPatro'
          Caption = 'Valor dos Descontos : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 138642
          mmTop = 10319
          mmWidth = 37042
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpRelaCalcContribAssGroup3: TppGroup
      BreakName = 'INSCRICAO'
      DataPipeline = PpRptCM
      UserName = 'rpRelaCalcContribAssGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelaCalcContribAssGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object rpRelaCalcContribAssDBText1: TppDBText
          UserName = 'rpRelaCalcContribAssDBText1'
          DataField = 'INSCRICAO'
          DataPipeline = PpRptCM
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 15875
          BandType = 3
          GroupNo = 2
        end
        object rpRelaCalcContribAssDBText3: TppDBText
          UserName = 'rpRelaCalcContribAssDBText3'
          DataField = 'MATRICULA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 155575
          mmTop = 0
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object rpRelaCalcContribAssDBText9: TppDBText
          UserName = 'rpRelaCalcContribAssDBText9'
          DataField = 'SITUACAO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 2910
          mmLeft = 66146
          mmTop = 4498
          mmWidth = 53975
          BandType = 3
          GroupNo = 2
        end
        object rpRelaCalcContribAssLabel9: TppLabel
          UserName = 'rpRelaCalcContribAssLabel9'
          AutoSize = False
          Caption = 'Situação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 55033
          mmTop = 4498
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object rpRelaCalcContribAssLabel3: TppLabel
          UserName = 'rpRelaCalcContribAssLabel3'
          AutoSize = False
          Caption = 'Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 121444
          mmTop = 4233
          mmWidth = 7673
          BandType = 3
          GroupNo = 2
        end
        object rpRelaCalcContribAssDBText5: TppDBText
          UserName = 'rpRelaCalcContribAssDBText5'
          DataField = 'PLANO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 129646
          mmTop = 4233
          mmWidth = 63500
          BandType = 3
          GroupNo = 2
        end
        object rpRelaCalcContribAssDBText6: TppDBText
          UserName = 'rpRelaCalcContribAssDBText6'
          DataField = 'PATROCINADORA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 2910
          mmLeft = 529
          mmTop = 4498
          mmWidth = 53446
          BandType = 3
          GroupNo = 3
        end
        object rpRelaCalcContribAssDBText4: TppDBText
          UserName = 'rpRelaCalcContribAssDBText4'
          DataField = 'RESPONSAVEL'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 17198
          mmTop = 0
          mmWidth = 137054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Valorl Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 152665
          mmTop = 9790
          mmWidth = 24077
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Valorl Particip.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsItalic]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 178330
          mmTop = 10054
          mmWidth = 18256
          BandType = 3
          GroupNo = 1
        end
      end
      object rpRelaCalcContribAssGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpRelaCalcContribAssDBCalc4: TppDBCalc
          UserName = 'rpRelaCalcContribAssDBCalc4'
          DataField = 'VALOR'
          DataPipeline = PpRptCM
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ParentDataPipeline = False
          ResetGroup = rpRelaCalcContribAssGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 179917
          mmTop = 1588
          mmWidth = 16933
          BandType = 5
          GroupNo = 3
        end
        object rpRelaCalcContribAssLine3: TppLine
          UserName = 'rpRelaCalcContribAssLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object LineSomaPatro: TppLine
          UserName = 'LineSomaPatro'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 165629
          mmTop = 529
          mmWidth = 15081
          BandType = 5
          GroupNo = 2
        end
        object dbSomaValorPatro: TppDBCalc
          UserName = 'dbSomaValorPatro'
          DataField = 'VLRPATRO'
          DataPipeline = PpRptCM
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ParentDataPipeline = False
          ResetGroup = rpRelaCalcContribAssGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 160338
          mmTop = 1588
          mmWidth = 17000
          BandType = 5
          GroupNo = 2
        end
        object rpRelaCalcContribAssLine5: TppLine
          UserName = 'rpRelaCalcContribAssLine5'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 181769
          mmTop = 529
          mmWidth = 15081
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
end
