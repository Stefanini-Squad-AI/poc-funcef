inherited RptDiverg: TRptDiverg
  Left = 323
  Top = 101
  Width = 374
  Height = 293
  Caption = 'RptDiverg'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório Mensal de Divergências  de Contribuições'
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
          'ORDER BY MESREFERENCIA')
        LookupSettings.Chave = 'MESREFERENCIA'
        LookupSettings.Display = 'MESREFERENCIA'
        LookupSettings.Descricao = 'Ano / Mês '
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
    Report = RpDiverg
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object PpRptCMppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'PARTICIP'
      FieldName = 'PARTICIP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'PLANOASSIS'
      FieldName = 'PLANOASSIS'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'REGIONAL'
      FieldName = 'REGIONAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object PpRptCMppField9: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object PpRptCMppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpRptCMppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRptCMppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpRptCMppField13: TppField
      FieldAlias = 'SITRECEBIMENTO'
      FieldName = 'SITRECEBIMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object PpRptCMppField14: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 17
      DisplayWidth = 17
      Position = 13
    end
    object PpRptCMppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object PpRptCMppField16: TppField
      FieldAlias = 'MESCOBRANCA_1'
      FieldName = 'MESCOBRANCA_1'
      FieldLength = 7
      DisplayWidth = 7
      Position = 15
    end
    object PpRptCMppField17: TppField
      FieldAlias = 'MES_1'
      FieldName = 'MES_1'
      FieldLength = 7
      DisplayWidth = 7
      Position = 16
    end
    object PpRptCMppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object PpRptCMppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object PpRptCMppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANASS'
      FieldName = 'IDPLANASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object PpRptCMppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object PpRptCMppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object PpRptCMppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDEPENDENTE'
      FieldName = 'IDDEPENDENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object PpRptCMppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTASS'
      FieldName = 'IDCONTASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
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
      'SELECT H.MES               ,'
      '       H.MESCOBRANCA       ,'
      '       P.IDPESSOA MATRICULA, '
      '       P.NOME      PARTICIP, '
      '       PJ.NOME        PATRO, '
      '       PA.NOME   PLANOASSIS,'
      '       PR.NOME     REGIONAL,'
      '       PD.NOME   DEPENDENTE,'
      '       C.NOME  CONTRIBUICAO,'
      '       H.VALORESPERADO     ,'
      '       H.VALORRECEBIDO     ,'
      '       H.VALORRECEBIDO - H.VALORESPERADO AS DIFERENCA,'
      '       H.SITRECEBIMENTO,'
      '       DECODE(H.SITRECEBIMENTO,1,'#39'NAO ESPERADOR'#39','
      '                               3,'#39'DIVERGENTE/ATRASO'#39','
      '                               4,'#39'TRATADO'#39') AS SITUACAO,'
      '      H.SEQPROPOSTA,'
      '      H.MESCOBRANCA,'
      '      H.MES,'
      '      H.IDTITULAR,'
      '      H.IDPLANOPREV,'
      '      H.IDPLANASS,'
      '      H.IDPESSJUR,'
      '      H.IDMOTIVO,'
      '      H.IDDEPENDENTE,'
      '      H.IDCONTASS'
      'FROM  HSTCONTRIBASS     H,'
      '      PESSOA            P,        '
      '      PESSOA           PJ,        '
      '      PESSOA           PR,        '
      '      PESSOA           PD,        '
      '      PLANASS          PA,        '
      '      ELEGPATRO        EP,        '
      '      CONTRIBUICAO      C'
      'WHERE (H.MES = '#39'2001/12'#39')      '
      'AND   (H.SITRECEBIMENTO IN (1,3,4))'
      'AND   (H.IDTITULAR = P.IDPESSOA)  '
      'AND   (H.IDPESSJUR = PJ.IDPESSOA) '
      'AND   (H.IDPLANASS = PA.IDPLANASS)  '
      'AND   (H.IDTITULAR = EP.IDPESSOA ) '
      'AND   (H.IDPESSJUR = EP.IDPESSJUR)  '
      'AND   (EP.IDESTAB  = PR.IDPESSOA)  '
      'AND   (H.IDDEPENDENTE   = PD.IDPESSOA)  '
      'AND   (H.IDCONTASS      = C.IDCONTRIBUICAO)  '
      'ORDER BY  PJ.NOME ,        '
      '          PR.NOME , '
      '          P.NOME  '
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 11
    Top = 120
    object QryRptCMMES: TStringField
      FieldName = 'MES'
      Size = 7
    end
    object QryRptCMMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object QryRptCMMATRICULA: TFloatField
      FieldName = 'MATRICULA'
    end
    object QryRptCMPARTICIP: TStringField
      FieldName = 'PARTICIP'
      Size = 60
    end
    object QryRptCMPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object QryRptCMPLANOASSIS: TStringField
      FieldName = 'PLANOASSIS'
      Size = 40
    end
    object QryRptCMREGIONAL: TStringField
      FieldName = 'REGIONAL'
      Size = 60
    end
    object QryRptCMDEPENDENTE: TStringField
      FieldName = 'DEPENDENTE'
      Size = 60
    end
    object QryRptCMCONTRIBUICAO: TStringField
      FieldName = 'CONTRIBUICAO'
      Size = 60
    end
    object QryRptCMVALORESPERADO: TFloatField
      FieldName = 'VALORESPERADO'
    end
    object QryRptCMVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object QryRptCMDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
    object QryRptCMSITRECEBIMENTO: TStringField
      FieldName = 'SITRECEBIMENTO'
      FixedChar = True
      Size = 1
    end
    object QryRptCMSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 17
    end
    object QryRptCMSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object QryRptCMMESCOBRANCA_1: TStringField
      FieldName = 'MESCOBRANCA_1'
      Size = 7
    end
    object QryRptCMMES_1: TStringField
      FieldName = 'MES_1'
      Size = 7
    end
    object QryRptCMIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object QryRptCMIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryRptCMIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
    end
    object QryRptCMIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object QryRptCMIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object QryRptCMIDDEPENDENTE: TFloatField
      FieldName = 'IDDEPENDENTE'
    end
    object QryRptCMIDCONTASS: TFloatField
      FieldName = 'IDCONTASS'
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
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = 2) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES)  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM)'
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
  object RpDiverg: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 8890
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 0
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
      mmHeight = 38365
      mmPrintPosition = 0
      object Titulo: TppLabel
        UserName = 'Titulo'
        Caption = 'Relatório Mensal de Divergências'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 49213
        mmTop = 30427
        mmWidth = 67733
        BandType = 0
      end
      object rpdivergerecebimentoLine7: TppLine
        UserName = 'rpdivergerecebimentoLine7'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 7408
        mmTop = 37835
        mmWidth = 266701
        BandType = 0
      end
      object rpdivergerecebimentoLabel13: TppLabel
        UserName = 'rpdivergerecebimentoLabel13'
        Caption = 'Mês Ref : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 221192
        mmTop = 32808
        mmWidth = 16404
        BandType = 0
      end
      object rpdivergerecebimentoDBText6: TppDBText
        UserName = 'rpdivergerecebimentoDBText6'
        DataField = 'MES'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 238655
        mmTop = 32808
        mmWidth = 12965
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
        mmWidth = 24606
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
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object rpdivergerecebimentoDBText9: TppDBText
        UserName = 'rpdivergerecebimentoDBText9'
        DataField = 'CONTRIBUICAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 80433
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object rpdivergerecebimentoDBText10: TppDBText
        UserName = 'rpdivergerecebimentoDBText10'
        DataField = 'DEPENDENTE'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 103717
        mmTop = 0
        mmWidth = 47890
        BandType = 4
      end
      object rpdivergerecebimentoDBText13: TppDBText
        UserName = 'rpdivergerecebimentoDBText13'
        DataField = 'MESCOBRANCA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7408
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object rpdivergerecebimentoDBText14: TppDBText
        OnPrint = rpdivergerecebimentoDBText14Print
        UserName = 'rpdivergerecebimentoDBText14'
        DataField = 'PLANOASSIS'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 28310
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
      object rpdivergerecebimentoDBText15: TppDBText
        UserName = 'rpdivergerecebimentoDBText15'
        DataField = 'VALORESPERADO'
        DataPipeline = PpRptCM
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 152400
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object rpdivergerecebimentoDBText16: TppDBText
        UserName = 'rpdivergerecebimentoDBText16'
        DataField = 'VALORRECEBIDO'
        DataPipeline = PpRptCM
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpdivergerecebimentoSubReport1: TppSubReport
        UserName = 'rpdivergerecebimentoSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5292
        mmWidth = 281887
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpdivergerecebimentoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = PpRptCM
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 8890
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210079
          PrinterSetup.mmPaperWidth = 297127
          PrinterSetup.PaperSize = 0
          Template.SaveTo = stDatabase
          Version = '5.5'
          mmColumnWidth = 0
          object rpdivergerecebimentoChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpdivergerecebimentoChildReport1Label1: TppLabel
              UserName = 'rpdivergerecebimentoChildReport1Label1'
              Caption = 'Alteradores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 120386
              mmTop = 794
              mmWidth = 17463
              BandType = 1
            end
          end
          object rpdivergerecebimentoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object rpdivergerecebimentoChildReport1DBText1: TppDBText
              UserName = 'rpdivergerecebimentoChildReport1DBText1'
              AutoSize = True
              DataField = 'DESCRICAO'
              DataPipeline = ppAlterador
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 122767
              mmTop = 794
              mmWidth = 15610
              BandType = 4
            end
            object rpdivergerecebimentoChildReport1DBText2: TppDBText
              UserName = 'rpdivergerecebimentoChildReport1DBText2'
              AutoSize = True
              DataField = 'VALORALTERADOR'
              DataPipeline = ppAlterador
              DisplayFormat = 'R$#,0.00;(R$#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 150019
              mmTop = 794
              mmWidth = 26458
              BandType = 4
            end
          end
          object rpdivergerecebimentoChildReport1SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object rpdivergerecebimentoChildReport1Label2: TppLabel
              UserName = 'rpdivergerecebimentoChildReport1Label2'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 131234
              mmTop = 529
              mmWidth = 7144
              BandType = 7
            end
            object totalAlterador: TppDBCalc
              UserName = 'totalAlterador'
              DataField = 'VALORALTERADOR'
              DataPipeline = ppAlterador
              DisplayFormat = 'R$#,0.00;(R$#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 157692
              mmTop = 529
              mmWidth = 19050
              BandType = 7
            end
          end
        end
      end
      object rpdivergerecebimentoDBText17: TppDBText
        UserName = 'rpdivergerecebimentoDBText17'
        AutoSize = True
        DataField = 'SITUACAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 224367
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object rpdivergerecebimentoDBText18: TppDBText
        UserName = 'rpdivergerecebimentoDBText18'
        AutoSize = True
        DataField = 'DIFERENCA'
        DataPipeline = PpRptCM
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
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
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 281887
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
    end
    object rpdivergerecebimentoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object rpdivergerecebimentoShape1: TppShape
        UserName = 'rpdivergerecebimentoShape1'
        Shape = stRoundRect
        StretchWithParent = True
        mmHeight = 10848
        mmLeft = 7144
        mmTop = 2381
        mmWidth = 266701
        BandType = 7
      end
      object rpdivergerecebimentoLabel1: TppLabel
        UserName = 'rpdivergerecebimentoLabel1'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 9260
        mmWidth = 15610
        BandType = 7
      end
      object rpdivergerecebimentoDBCalc7: TppDBCalc
        UserName = 'rpdivergerecebimentoDBCalc7'
        DataField = 'VALORESPERADO'
        DataPipeline = PpRptCM
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 9260
        mmWidth = 29369
        BandType = 7
      end
      object rpdivergerecebimentoDBCalc8: TppDBCalc
        UserName = 'rpdivergerecebimentoDBCalc8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = PpRptCM
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 177800
        mmTop = 9260
        mmWidth = 17463
        BandType = 7
      end
      object rpdivergerecebimentoLabel17: TppLabel
        UserName = 'rpdivergerecebimentoLabel17'
        Caption = 'Esperado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 2381
        mmWidth = 13758
        BandType = 7
      end
      object rpdivergerecebimentoLabel18: TppLabel
        UserName = 'rpdivergerecebimentoLabel18'
        Caption = 'Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 2646
        mmWidth = 13494
        BandType = 7
      end
      object rpdivergerecebimentoDBCalc12: TppDBCalc
        UserName = 'rpdivergerecebimentoDBCalc12'
        DataField = 'DIFERENCA'
        DataPipeline = PpRptCM
        DisplayFormat = 'R$#,0.00;(R$#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 196057
        mmTop = 9260
        mmWidth = 19050
        BandType = 7
      end
      object rpdivergerecebimentoLabel19: TppLabel
        UserName = 'rpdivergerecebimentoLabel19'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 201348
        mmTop = 2646
        mmWidth = 13758
        BandType = 7
      end
      object Alteradores: TppLabel
        UserName = 'Alteradores'
        Caption = 'Alteradores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 224367
        mmTop = 2646
        mmWidth = 17463
        BandType = 7
      end
      object totalt: TppLabel
        UserName = 'totalt'
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 240242
        mmTop = 9260
        mmWidth = 1588
        BandType = 7
      end
    end
    object rpdivergerecebimentoGroup1: TppGroup
      BreakName = 'CONTRIBUICAO'
      NewPage = True
      UserName = 'rpdivergerecebimentoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpdivergerecebimentoLabel2: TppLabel
          UserName = 'rpdivergerecebimentoLabel2'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 0
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object rpdivergerecebimentoDBText8: TppDBText
          UserName = 'rpdivergerecebimentoDBText8'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 33073
          mmTop = 0
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
      end
      object rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpdivergerecebimentoLabel16: TppLabel
          UserName = 'rpdivergerecebimentoLabel16'
          Caption = 'Total Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 128323
          mmTop = 1058
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoDBCalc5: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc5'
          DataField = 'VALORESPERADO'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 155311
          mmTop = 794
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoDBCalc6: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc6'
          BlankWhenZero = True
          DataField = 'VALORRECEBIDO'
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 794
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoLine4: TppLine
          UserName = 'rpdivergerecebimentoLine4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 7408
          mmTop = 0
          mmWidth = 266701
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoLine6: TppLine
          UserName = 'rpdivergerecebimentoLine6'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 7144
          mmTop = 4763
          mmWidth = 266701
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoDBCalc11: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc11'
          DataField = 'DIFERENCA'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 196057
          mmTop = 794
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpdivergerecebimentoGroup2: TppGroup
      BreakName = 'REGIONAL'
      NewPage = True
      UserName = 'rpdivergerecebimentoGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpdivergerecebimentoGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpdivergerecebimentoLabel3: TppLabel
          UserName = 'rpdivergerecebimentoLabel3'
          Caption = 'Regional  : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 0
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpdivergerecebimentoDBText7: TppDBText
          UserName = 'rpdivergerecebimentoDBText7'
          AutoSize = True
          DataField = 'REGIONAL'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 32808
          mmTop = 0
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
      end
      object rpdivergerecebimentoGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpdivergerecebimentoLabel15: TppLabel
          UserName = 'rpdivergerecebimentoLabel15'
          Caption = 'Total Regional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 133879
          mmTop = 1058
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
        object rpdivergerecebimentoDBCalc3: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc3'
          DataField = 'VALORESPERADO'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 155311
          mmTop = 1058
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object rpdivergerecebimentoDBCalc4: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc4'
          BlankWhenZero = True
          DataField = 'VALORRECEBIDO'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 1058
          mmWidth = 17992
          BandType = 5
          GroupNo = 1
        end
        object rpdivergerecebimentoLine3: TppLine
          UserName = 'rpdivergerecebimentoLine3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 7144
          mmTop = 0
          mmWidth = 266701
          BandType = 5
          GroupNo = 1
        end
        object rpdivergerecebimentoDBCalc10: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc10'
          DataField = 'DIFERENCA'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 196057
          mmTop = 1058
          mmWidth = 19050
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpdivergerecebimentoGroup3: TppGroup
      BreakName = 'PARTICIP'
      UserName = 'rpdivergerecebimentoGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpdivergerecebimentoGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object rpdivergerecebimentoDBText11: TppDBText
          UserName = 'rpdivergerecebimentoDBText11'
          AutoSize = True
          DataField = 'PARTICIP'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 32808
          mmTop = 0
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel5: TppLabel
          UserName = 'rpdivergerecebimentoLabel5'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 0
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel6: TppLabel
          UserName = 'rpdivergerecebimentoLabel6'
          Caption = 'Mês Cob.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 7408
          mmTop = 6085
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel7: TppLabel
          UserName = 'rpdivergerecebimentoLabel7'
          Caption = 'Plano Assistencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 6085
          mmWidth = 26723
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel8: TppLabel
          UserName = 'rpdivergerecebimentoLabel8'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 80433
          mmTop = 6085
          mmWidth = 18521
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel9: TppLabel
          UserName = 'rpdivergerecebimentoLabel9'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 103717
          mmTop = 6085
          mmWidth = 17198
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel10: TppLabel
          UserName = 'rpdivergerecebimentoLabel10'
          Caption = 'Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 162984
          mmTop = 6085
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel11: TppLabel
          UserName = 'rpdivergerecebimentoLabel11'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 181769
          mmTop = 6085
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel12: TppLabel
          UserName = 'rpdivergerecebimentoLabel12'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 201348
          mmTop = 6085
          mmWidth = 13758
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLine1: TppLine
          UserName = 'rpdivergerecebimentoLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 7408
          mmTop = 5556
          mmWidth = 266701
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLine2: TppLine
          UserName = 'rpdivergerecebimentoLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 7408
          mmTop = 10054
          mmWidth = 266701
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel21: TppLabel
          UserName = 'rpdivergerecebimentoLabel21'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 224367
          mmTop = 5821
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
      end
      object rpdivergerecebimentoGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpdivergerecebimentoDBCalc1: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc1'
          DataField = 'VALORESPERADO'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 155311
          mmTop = 2381
          mmWidth = 21431
          BandType = 5
          GroupNo = 2
        end
        object rpdivergerecebimentoDBCalc2: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc2'
          BlankWhenZero = True
          DataField = 'VALORRECEBIDO'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 177271
          mmTop = 2381
          mmWidth = 17992
          BandType = 5
          GroupNo = 2
        end
        object rpdivergerecebimentoLabel14: TppLabel
          UserName = 'rpdivergerecebimentoLabel14'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 147109
          mmTop = 2381
          mmWidth = 7144
          BandType = 5
          GroupNo = 2
        end
        object rpdivergerecebimentoLine5: TppLine
          UserName = 'rpdivergerecebimentoLine5'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 7144
          mmTop = 0
          mmWidth = 266701
          BandType = 5
          GroupNo = 2
        end
        object rpdivergerecebimentoDBCalc9: TppDBCalc
          UserName = 'rpdivergerecebimentoDBCalc9'
          DataField = 'DIFERENCA'
          DataPipeline = PpRptCM
          DisplayFormat = 'R$#,0.00;(R$#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 196321
          mmTop = 2381
          mmWidth = 19050
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object QryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 19
    Top = 184
  end
  object DspAlterador: TDataSetProvider
    DataSet = QryAlterador
    Constraints = True
    Left = 81
    Top = 184
  end
  object CdsAlterador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAlterador'
    Left = 144
    Top = 184
  end
  object DsAlterador: TwwDataSource
    DataSet = CdsAlterador
    Left = 205
    Top = 184
  end
  object AQryAlterador: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 273
    Top = 184
  end
  object ppAlterador: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao1'
    Left = 321
    Top = 185
    object ppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppField10: TppField
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
end
