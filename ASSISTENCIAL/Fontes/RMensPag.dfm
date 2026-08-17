inherited RptMensPag: TRptMensPag
  Left = 323
  Top = 200
  Width = 374
  Height = 194
  Caption = 'RptMensPag'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Mensalidades Assistenciais Pagas no Mês'
    DataBaseName = 'BaseDados'
    Params = <
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
        LookupSettings.Chave = 'MesReferencia'
        LookupSettings.Display = 'MesReferencia'
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
    Report = rpMensPag
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'RUBRICA'
      FieldName = 'RUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'VALORCMD'
      FieldName = 'VALORCMD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'VALORREC'
      FieldName = 'VALORREC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'FILIAL'
      FieldName = 'FILIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField9: TppField
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpRptCMppField10: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
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
    Left = 11
    Top = 120
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
  object rpMensPag: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 304
    Top = 7
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38629
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Mensalidades Assistenciais Pagas no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 101865
        mmTop = 28310
        mmWidth = 84931
        BandType = 0
      end
      object rpRelaMensPagMesLabel1: TppLabel
        UserName = 'rpRelaMensPagMesLabel1'
        Caption = 'PARTICIPANTES - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 34131
        mmWidth = 30692
        BandType = 0
      end
      object rpRelaMensPagMesDBText8: TppDBText
        UserName = 'rpRelaMensPagMesDBText8'
        DataField = 'REFERENCIA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148696
        mmTop = 34131
        mmWidth = 37042
        BandType = 0
      end
      object ppDBImage5: TppDBImage
        UserName = 'DBImage5'
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
      object ppDBText70: TppDBText
        UserName = 'DBText70'
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
      object ppDBText71: TppDBText
        UserName = 'DBText71'
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
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
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
      object ppDBText73: TppDBText
        UserName = 'DBText73'
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
      object ppDBText74: TppDBText
        UserName = 'DBText74'
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
        mmLeft = 92869
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
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
      object ppDBText76: TppDBText
        UserName = 'DBText76'
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
        mmLeft = 64823
        mmTop = 17463
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
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
      object ppDBText77: TppDBText
        UserName = 'DBText77'
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
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpRelaMensPagMesDBText1: TppDBText
        UserName = 'rpRelaMensPagMesDBText1'
        DataField = 'INSCRICAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object rpRelaMensPagMesDBText2: TppDBText
        UserName = 'rpRelaMensPagMesDBText2'
        DataField = 'MATRICULA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21431
        mmTop = 794
        mmWidth = 20638
        BandType = 4
      end
      object rpRelaMensPagMesDBText3: TppDBText
        UserName = 'rpRelaMensPagMesDBText3'
        DataField = 'NOME'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 45773
        mmTop = 529
        mmWidth = 95250
        BandType = 4
      end
      object rpRelaMensPagMesDBText4: TppDBText
        UserName = 'rpRelaMensPagMesDBText4'
        DataField = 'RUBRICA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 529
        mmWidth = 11113
        BandType = 4
      end
      object rpRelaMensPagMesDBText5: TppDBText
        UserName = 'rpRelaMensPagMesDBText5'
        DataField = 'VALORCMD'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 175155
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object rpRelaMensPagMesDBText6: TppDBText
        UserName = 'rpRelaMensPagMesDBText6'
        DataField = 'VALORREC'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 214048
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
      object rpRelaMensPagMesDBText7: TppDBText
        UserName = 'rpRelaMensPagMesDBText7'
        DataField = 'DIFERENCA'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 251355
        mmTop = 529
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
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
        mmLeft = 2117
        mmTop = 2910
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 94986
        mmTop = 3175
        mmWidth = 102659
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 243153
        mmTop = 3175
        mmWidth = 23813
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17992
        mmPrintPosition = 0
        object rpRelaMensPagMesLabel4: TppLabel
          UserName = 'rpRelaMensPagMesLabel4'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 13229
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel6: TppLabel
          UserName = 'rpRelaMensPagMesLabel6'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 21960
          mmTop = 13229
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel5: TppLabel
          UserName = 'rpRelaMensPagMesLabel5'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 46302
          mmTop = 13229
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel7: TppLabel
          UserName = 'rpRelaMensPagMesLabel7'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 146579
          mmTop = 13229
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel8: TppLabel
          UserName = 'rpRelaMensPagMesLabel8'
          Caption = 'Valor Comandado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 164571
          mmTop = 13229
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel9: TppLabel
          UserName = 'rpRelaMensPagMesLabel9'
          Caption = 'Valor Descontado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 203994
          mmTop = 13229
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel10: TppLabel
          UserName = 'rpRelaMensPagMesLabel10'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 253736
          mmTop = 13229
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLine1: TppLine
          UserName = 'rpRelaMensPagMesLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 12171
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel2: TppLabel
          UserName = 'rpRelaMensPagMesLabel2'
          Caption = 'FILIAL:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 6085
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesDBText9: TppDBText
          UserName = 'rpRelaMensPagMesDBText9'
          DataField = 'FILIAL'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 10583
          mmTop = 6085
          mmWidth = 126736
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesLabel3: TppLabel
          UserName = 'rpRelaMensPagMesLabel3'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1058
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpRelaMensPagMesDBText10: TppDBText
          UserName = 'rpRelaMensPagMesDBText10'
          DataField = 'PATROCINADORA'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 24342
          mmTop = 1323
          mmWidth = 112977
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rpRelaMensPagMesLabel11: TppLabel
          UserName = 'rpRelaMensPagMesLabel11'
          Caption = 'Total da Rubrica:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 133879
          mmTop = 1323
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object rpRelaMensPagMesDBCalc1: TppDBCalc
          UserName = 'rpRelaMensPagMesDBCalc1'
          DataField = 'VALORCMD'
          DataPipeline = PpRptCM
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 173832
          mmTop = 1323
          mmWidth = 17727
          BandType = 5
          GroupNo = 0
        end
        object rpRelaMensPagMesDBCalc2: TppDBCalc
          UserName = 'rpRelaMensPagMesDBCalc2'
          DataField = 'VALORREC'
          DataPipeline = PpRptCM
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 211667
          mmTop = 1852
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object rpRelaMensPagMesDBCalc3: TppDBCalc
          UserName = 'rpRelaMensPagMesDBCalc3'
          DataField = 'DIFERENCA'
          DataPipeline = PpRptCM
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 250825
          mmTop = 1852
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpRelaMensPagMesGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = PpRptCM
      UserName = 'rpRelaMensPagMesGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelaMensPagMesGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelaMensPagMesGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
