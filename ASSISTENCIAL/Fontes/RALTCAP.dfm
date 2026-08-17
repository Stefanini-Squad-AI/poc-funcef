inherited RptAltCap: TRptAltCap
  Left = 323
  Top = 101
  Width = 374
  Height = 208
  Caption = 'RptAltCap'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Alteração de Capital'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Ano/Mês de Cobrança'
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
    Report = RpAltCap
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PpRptCMppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'MESREF'
      FieldName = 'MESREF'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'PRODUTO'
      FieldName = 'PRODUTO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'OPCAOAIDENT'
      FieldName = 'OPCAOAIDENT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'PLANOANTERIOR'
      FieldName = 'PLANOANTERIOR'
      FieldLength = 40
      DisplayWidth = 40
      Position = 7
    end
    object PpRptCMppField9: TppField
      FieldAlias = 'TIPOSEG'
      FieldName = 'TIPOSEG'
      FieldLength = 7
      DisplayWidth = 7
      Position = 8
    end
    object PpRptCMppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPITALIP'
      FieldName = 'CAPITALIP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpRptCMppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPITALMN'
      FieldName = 'CAPITALMN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRptCMppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CAPITALMA'
      FieldName = 'CAPITALMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpRptCMppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXA'
      FieldName = 'PREMIOFXA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object PpRptCMppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXB'
      FieldName = 'PREMIOFXB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object PpRptCMppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXC'
      FieldName = 'PREMIOFXC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object PpRptCMppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREMIOFXD'
      FieldName = 'PREMIOFXD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
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
      '            PS.NOME AS PARTICIPANTE,'
      '            PJ.NOME AS PATROCINADORA, '
      '            EL.MATRICULA,'
      '            HT.MES AS MESREF,'
      '            PD.NOME AS PRODUTO, '
      '            PL.NOME AS PLANO,'
      '            PL.OPCAOAIDENT,'
      '            PA.NOME AS PLANOANTERIOR,'
      '            CP.TIPOSEG, '
      '            CP.CAPITALIP,'
      '            CP.CAPITALMN,'
      '            CP.CAPITALMA,'
      '            CP.PREMIOFXA,'
      '            CP.PREMIOFXB,'
      '            CP.PREMIOFXC,'
      '            CP.PREMIOFXD'
      '      '
      'FROM '
      '   PESSOA PS,'
      '   PESSOA PJ,'
      '   ELEGPATRO EL,'
      '   PARTASS PT,'
      '   HSTCONTRIBASS HT,'
      '   HSTCONTRIBASS HA,'
      '   PLANASS PL,'
      '   PLANASS PA,'
      '   PRODASS PD,'
      '   SITPLANOASS ST,'
      '   CAPSEGASS CP'
      ''
      'WHERE  '
      '   (PS.IDPESSOA  = PT.IDPESSOA) AND'
      '   (PS.IDPESSOA  = HT. IDTITULAR) AND'
      '   (EL.IDPESSOA  = PT.IDPESSOA) AND'
      '   (PJ.IDPESSOA  = PT.IDPESSJUR) AND'
      '   (PJ.IDPESSOA  = HT.IDPESSJUR) AND'
      '   (HT.IDPLANASS = PL.IDPLANASS) AND'
      '   (HT.MES = '#39'2002/02'#39') AND '
      ''
      '   (PT.IDPLANASS = HT.IDPLANASS ) AND'
      '   (PT.IDPESSOA  = HT.IDTITULAR) AND '
      '   (PL.IDPRODASS=PD.IDPRODASS) AND'
      '   (PT.IDSITPART=ST.IDSITPLANOASS) AND'
      ''
      '  (PS.IDPESSOA=HA.IDTITULAR) AND '
      '  (HA.IDPLANASS=PA.IDPLANASS) AND'
      '  (HA.IDPLANASS<>HT.IDPLANASS) AND  '
      '  (HA.MES = '#39'2002/01'#39') AND '
      '       -- colocar o ano/mes anterior'
      '   '
      '   (ST.FLGINTERNO NOT IN ('#39'CA'#39','#39'CI'#39')) AND'
      '   (HT.IDPLANASS=CP.IDPLANASS) AND    '
      '   (CP.TIPOSEG = '#39'TITULAR'#39') AND'
      '   (CP.FLGVIGENCIA='#39'1'#39') '
      ''
      ' ORDER BY PATROCINADORA, PARTICIPANTE         ')
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
  object RpAltCap: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    Left = 307
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41010
      mmPrintPosition = 0
      object Titulo: TppLabel
        UserName = 'Titulo'
        Caption = 'ALTERAÇÃO DE CAPITAL'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 2381
        mmTop = 33073
        mmWidth = 52917
        BandType = 0
      end
      object rpdivergerecebimentoDBText6: TppDBText
        UserName = 'rpdivergerecebimentoDBText6'
        DataField = 'MESREF'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 177007
        mmTop = 33602
        mmWidth = 18256
        BandType = 0
      end
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
        mmWidth = 51594
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
        mmLeft = 147373
        mmTop = 33602
        mmWidth = 28840
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
        mmHeight = 5292
        mmLeft = 56621
        mmTop = 33073
        mmWidth = 77788
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 39952
        mmWidth = 279347
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 529
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PLANO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 4498
        mmWidth = 100542
        BandType = 4
      end
      object ppVarCapMN: TppVariable
        UserName = 'ppVarCapMN'
        AutoSize = False
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 104511
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppVarCapMA: TppVariable
        UserName = 'ppVarCapMA'
        AutoSize = False
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 127265
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppVarCapIP: TppVariable
        UserName = 'ppVarCapIP'
        AutoSize = False
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 150019
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppVarPremioFxA: TppVariable
        UserName = 'ppVarPremioFxA'
        AutoSize = False
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 174890
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppVarPremioFxB: TppVariable
        UserName = 'ppVarPremioFxB'
        AutoSize = False
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 197909
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppVarPremioFxC: TppVariable
        UserName = 'ppVarPremioFxC'
        AutoSize = False
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 220928
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppVarPremioFxD: TppVariable
        UserName = 'ppVarPremioFxD'
        AutoSize = False
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 243682
        mmTop = 4498
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        Color = clSilver
        DataField = 'PARTICIPANTE'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 529
        mmWidth = 22225
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
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
        mmHeight = 15610
        mmPrintPosition = 0
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
          mmLeft = 2117
          mmTop = 1058
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
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
          mmLeft = 2117
          mmTop = 5821
          mmWidth = 100806
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 11906
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 22225
          mmTop = 11906
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Plano Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 70115
          mmTop = 11906
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Capital (Segurados) '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 117211
          mmTop = 7673
          mmWidth = 42333
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'CAP. MN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 104511
          mmTop = 12171
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'CAP. MA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 11906
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'CAP. IP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 150019
          mmTop = 11906
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Faixa (Prêmios)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 201084
          mmTop = 7673
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Até 39 Anos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 175419
          mmTop = 11906
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'De 40 a 49 anos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 198173
          mmTop = 11906
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'De 50 a 59 anos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 220928
          mmTop = 11906
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Acima 60 anos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 243682
          mmTop = 11906
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 103981
          mmTop = 10054
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 240242
          mmTop = 9790
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 103981
          mmTop = 10054
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 266171
          mmTop = 9790
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 175155
          mmTop = 9790
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 174890
          mmTop = 9790
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 160073
          mmTop = 9525
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 172773
          mmTop = 9790
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'Total da Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3440
          mmTop = 4763
          mmWidth = 34925
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalcTotPatro: TppDBCalc
          UserName = 'DBCalcTotPatro'
          DataField = 'PARTICIPANTE'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 38894
          mmTop = 4763
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        70705661724361704D4E4F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365066470726F6365647572652070705661
        724361704D4E4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D5070527074434D5B2743
        41504954414C4D4E275D3B200D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060A70705661724361704D4E094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65061070705661724361704D414F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365066470
        726F6365647572652070705661724361704D414F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C7565
        203A3D5070527074434D5B274341504954414C4D41275D3B200D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060A70705661724361704D41094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650610707056617243
        617049504F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F75726365066470726F6365647572652070705661724361704950
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A202056616C7565203A3D5070527074434D5B274341504954414C
        4950275D3B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A
        70705661724361704950094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061470705661725072656D696F4678414F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F75726365066870726F
        6365647572652070705661725072656D696F4678414F6E43616C632876617220
        56616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C
        7565203A3D5070527074434D5B275052454D494F465841275D3B200D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060E70705661725072656D696F
        467841094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650614
        70705661725072656D696F4678424F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F75726365066870726F63656475726520
        70705661725072656D696F4678424F6E43616C63287661722056616C75653A20
        56617269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D5070
        527074434D5B275052454D494F465842275D3B200D0A0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65060E70705661725072656D696F46784209457665
        6E744E616D6506064F6E43616C63074576656E74494402210001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D65061470705661725072
        656D696F4678434F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F75726365066870726F6365647572652070705661725072
        656D696F4678434F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A202056616C7565203A3D5070527074434D5B27
        5052454D494F465843275D3B200D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060E70705661725072656D696F467843094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65061470705661725072656D696F467844
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365066870726F6365647572652070705661725072656D696F467844
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A202056616C7565203A3D205070527074434D5B275052454D494F
        465844275D3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E
        70705661725072656D696F467844094576656E744E616D6506064F6E43616C63
        074576656E74494402210000}
    end
  end
end
