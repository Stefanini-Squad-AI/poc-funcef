inherited RptBeneficiarios: TRptBeneficiarios
  Left = 243
  Top = 160
  Width = 374
  Height = 194
  Caption = 'RptBeneficiarios'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Beneficiários'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Ano/Mês de Referência'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT MESREFERENCIA '
          'FROM CTRLINTERFACE'
          'WHERE TIPO='#39'A'#39
          'ORDER BY MESREFERENCIA')
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
        MostraComboCompara = False
        Required = False
        Name = 'MesRef'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
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
    Report = rpBenef
    Left = 85
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'RptCMppField1'
      FieldName = 'RptCMppField1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
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
      'SELECT 1 FROM DUAL')
    ValidateWithMask = True
    Left = 11
    Top = 120
    object QryRptCMDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 60
    end
    object QryRptCMTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object QryRptCMRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 60
    end
    object QryRptCMGRAU_DEPEN: TStringField
      FieldName = 'GRAU_DEPEN'
      Size = 15
    end
    object QryRptCMPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object QryRptCMPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 40
    end
    object QryRptCMPLANO: TStringField
      FieldName = 'PLANO'
      Size = 40
    end
    object QryRptCMMES: TStringField
      FieldName = 'MES'
      Size = 7
    end
    object QryRptCMINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object QryRptCMSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 9
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
      FieldLength = 0
      DisplayWidth = 0
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
      '     ( P.IDIMAGEM = I.IDIMAGEM)')
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
  object rpBenef: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PassSetting = psTwoPass
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
    CachePages = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ShowCancelDialog = False
    Left = 313
    Top = 12
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 43656
      mmPrintPosition = 0
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
        Caption = 'Listagem Alfabética de Beneficiários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 58473
        mmTop = 30427
        mmWidth = 74348
        BandType = 0
      end
      object ppDBImage17: TppDBImage
        UserName = 'DBImage17'
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
      object ppDBText165: TppDBText
        UserName = 'DBText165'
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
      object ppDBText166: TppDBText
        UserName = 'DBText166'
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
      object ppDBText167: TppDBText
        UserName = 'DBText167'
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
      object ppDBText168: TppDBText
        UserName = 'DBText168'
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
      object ppLabel98: TppLabel
        UserName = 'Label98'
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
      object ppDBText169: TppDBText
        UserName = 'DBText169'
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
      object ppDBText170: TppDBText
        UserName = 'DBText170'
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
        mmWidth = 27517
        BandType = 0
      end
      object ppDBText171: TppDBText
        UserName = 'DBText171'
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
      object ppDBText172: TppDBText
        UserName = 'DBText172'
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
        mmLeft = 92340
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 1852
        mmTop = 27517
        mmWidth = 190500
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MES'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 110861
        mmTop = 37571
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'ANO / MÊS DE REFERÊNCIA '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 58738
        mmTop = 37571
        mmWidth = 49742
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText36: TppDBText
        UserName = 'ppDBText36'
        DataField = 'DEPENDENTE'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 28046
        mmTop = 529
        mmWidth = 73819
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'ppDBText40'
        AutoSize = True
        DataField = 'GRAU_DEPEN'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 102659
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
        AutoSize = False
        Caption = 'Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2646
        mmWidth = 198173
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
        mmLeft = 265
        mmTop = 2646
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
        mmLeft = 163248
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object rpRelBenSaudeLabel6: TppLabel
        UserName = 'rpRelBenSaudeLabel6'
        AutoSize = False
        Caption = 'Quantidade Total de Titulares ........... =>  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 69850
        BandType = 7
      end
      object rpRelBenSaudeLabel7: TppLabel
        UserName = 'rpRelBenSaudeLabel7'
        AutoSize = False
        Caption = 'Quantidade de Total de Dependentes =>  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 7144
        mmWidth = 70115
        BandType = 7
      end
      object rpRelBenSaudeCalc3: TppVariable
        UserName = 'rpRelBenSaudeCalc3'
        CalcOrder = 0
        CalcComponent = PpRptCM
        CalcType = veDataPipelineTraversal
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 72761
        mmTop = 1852
        mmWidth = 32279
        BandType = 7
      end
      object rpRelBenSaudeCalc4: TppVariable
        UserName = 'rpRelBenSaudeCalc4'
        CalcOrder = 1
        CalcType = veColumnEnd
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ResetType = veReportStart
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 73290
        mmTop = 7408
        mmWidth = 32279
        BandType = 7
      end
    end
    object rpRelBenSaudeGroup2: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'rpRelBenSaudeGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelBenSaudeGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object rpRelBenSaudeLabel2: TppLabel
          UserName = 'rpRelBenSaudeLabel2'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object rpRelBenSaudeDBText1: TppDBText
          UserName = 'rpRelBenSaudeDBText1'
          DataField = 'PATROCINADORA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 4233
          mmLeft = 27252
          mmTop = 1852
          mmWidth = 141288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel91: TppLabel
          UserName = 'ppLabel91'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 6085
          mmTop = 7673
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel92: TppLabel
          UserName = 'ppLabel92'
          Caption = 'Nome do Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 24606
          mmTop = 7673
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object rpRelBenSaudeLabel3: TppLabel
          UserName = 'rpRelBenSaudeLabel3'
          Caption = 'Situação do Titular '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 134409
          mmTop = 7938
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRelBenSaudeGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object rpRelBenSaudeLabel4: TppLabel
          UserName = 'rpRelBenSaudeLabel4'
          AutoSize = False
          Caption = 'Quantidade de Titulares ...... => '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 2646
          mmWidth = 53181
          BandType = 5
          GroupNo = 0
        end
        object rpRelBenSaudeLabel5: TppLabel
          UserName = 'rpRelBenSaudeLabel5'
          AutoSize = False
          Caption = 'Quantidade de Dependentes =>  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 8202
          mmWidth = 53181
          BandType = 5
          GroupNo = 0
        end
        object rpRelBenSaudeCalc1: TppVariable
          UserName = 'rpRelBenSaudeCalc1'
          CalcOrder = 0
          CalcComponent = PpRptCM
          CalcType = veDataPipelineTraversal
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetType = vePageStart
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 55033
          mmTop = 2646
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object rpRelBenSaudeCalc2: TppVariable
          UserName = 'rpRelBenSaudeCalc2'
          CalcOrder = 1
          CalcType = veColumnEnd
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetType = vePageStart
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 55033
          mmTop = 8202
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'RESPONSAVEL'
      DataPipeline = PpRptCM
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppDBText43: TppDBText
          UserName = 'ppDBText43'
          DataField = 'INSCRICAO'
          DataPipeline = PpRptCM
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 0
          mmWidth = 21167
          BandType = 3
          GroupNo = 2
        end
        object ppDBText49: TppDBText
          UserName = 'ppDBText49'
          AutoSize = True
          DataField = 'RESPONSAVEL'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 24606
          mmTop = 0
          mmWidth = 20902
          BandType = 3
          GroupNo = 2
        end
        object rpRelBenSaudeLabel1: TppLabel
          UserName = 'rpRelBenSaudeLabel1'
          Caption = 'Parentesco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 5821
          mmWidth = 14023
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsItalic, fsUnderline]
          Transparent = True
          mmHeight = 3175
          mmLeft = 28310
          mmTop = 6085
          mmWidth = 16404
          BandType = 3
          GroupNo = 2
        end
        object rpRelBenSaudeDBText2: TppDBText
          UserName = 'rpRelBenSaudeDBText2'
          AutoSize = True
          DataField = 'SITUACAO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 134938
          mmTop = 529
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650618
        727052656C42656E536175646543616C63314F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F75726365066170726F636564
        75726520727052656C42656E536175646543616C63314F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20205661
        6C7565203A3D2056616C7565202B20313B0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D650612727052656C42656E536175646543616C6331094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650618727052656C42
        656E536175646543616C63324F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F75726365066170726F636564757265207270
        52656C42656E536175646543616C63324F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D
        2056616C7565202B20313B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D650612727052656C42656E536175646543616C6332094576656E744E616D
        6506064F6E43616C63074576656E74494402210001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D650618727052656C42656E53617564
        6543616C63334F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365066170726F63656475726520727052656C42656E
        536175646543616C63334F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2056616C7565
        202B20313B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65061272
        7052656C42656E536175646543616C6333094576656E744E616D6506064F6E43
        616C63074576656E74494402210001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D650618727052656C42656E536175646543616C6334
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365066170726F63656475726520727052656C42656E536175646543
        616C63344F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D2056616C7565202B20313B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650612727052656C4265
        6E536175646543616C6334094576656E744E616D6506064F6E43616C63074576
        656E74494402210000}
    end
  end
end
