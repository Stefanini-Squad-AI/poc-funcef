inherited frmParamIncBenef: TfrmParamIncBenef
  Left = 215
  Top = 72
  Caption = 'Relatório - Inclusão de Segurados e Beneficiários'
  ClientHeight = 186
  ClientWidth = 359
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 359
    Height = 147
    object Label2: TLabel
      Left = 17
      Top = 11
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label1: TLabel
      Left = 16
      Top = 83
      Width = 69
      Height = 13
      Caption = 'Participante'
    end
    object dblcpatro: TCMDBLookupCombo
      Left = 16
      Top = 31
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Patrocinadora'#9'F')
      LookupTable = qrypatro
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblcpatroChange
      OnExit = dblcpatroExit
    end
    object dblcparticip: TCMDBLookupCombo
      Left = 16
      Top = 103
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Participante'#9'F')
      LookupTable = qryParticip
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 147
    Width = 359
    inherited tb97Fundo: TToolbar97
      Left = 189
      DockPos = 190
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 22
      DockPos = 23
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 495
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME  '
      'FROM PESSOA P, PATRO PT'
      'WHERE (P.IDPESSOA=PT.IDPESSOA) '
      'ORDER BY P.NOME ')
    ValidateWithMask = True
    Left = 289
    Top = 13
    object qrypatroNOME: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qrypatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object qryParticip: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  P.IDPESSOA, P.NOME  '
      'FROM PESSOA P,  PARTASS PS'
      'WHERE (PS.IDPESSOA=P.IDPESSOA ) AND'
      '              (P.IDPESSOA=P.IDPESSOA) AND'
      '              (PS.IDPESSOA=PS.IDPESSOA)'
      'ORDER BY P.NOME ')
    ValidateWithMask = True
    Left = 289
    Top = 69
    object qryParticipNOME: TStringField
      DisplayLabel = 'Participante'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryParticipIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
      Visible = False
    end
  end
  object rpincbenef: TppReport
    AutoStop = False
    DataPipeline = ppincbenef
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
    ModalPreview = False
    Left = 235
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppDBImage19: TppDBImage
        UserName = 'DBImage17'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = RptBeneficiarios.ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText187: TppDBText
        UserName = 'DBText165'
        DataField = 'NOME'
        DataPipeline = RptBeneficiarios.ppFundacao
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
      object ppDBText188: TppDBText
        UserName = 'DBText166'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = RptBeneficiarios.ppFundacao
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
      object ppDBText189: TppDBText
        UserName = 'DBText167'
        DataField = 'LOGRADOURO'
        DataPipeline = RptBeneficiarios.ppFundacao
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
      object ppDBText190: TppDBText
        UserName = 'DBText168'
        DataField = 'BAIRRO'
        DataPipeline = RptBeneficiarios.ppFundacao
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
      object ppLabel113: TppLabel
        UserName = 'Label98'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText191: TppDBText
        UserName = 'DBText169'
        DataField = 'CEP'
        DataPipeline = RptBeneficiarios.ppFundacao
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
      object ppDBText192: TppDBText
        UserName = 'DBText170'
        DataField = 'CIDADE'
        DataPipeline = RptBeneficiarios.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText193: TppDBText
        UserName = 'DBText171'
        DataField = 'NUMERO'
        DataPipeline = RptBeneficiarios.ppFundacao
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
      object ppDBText194: TppDBText
        UserName = 'DBText172'
        DataField = 'CODESTADO'
        DataPipeline = RptBeneficiarios.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 91811
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 265
        mmTop = 26723
        mmWidth = 197380
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 34131
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel100: TppLabel
        UserName = 'ppLabel87'
        Caption = 'SEGURADOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 6879
        mmTop = 28310
        mmWidth = 27252
        BandType = 0
      end
    end
    object ppDetailBand21: TppDetailBand
      AfterPrint = ppDetailBand21AfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText195: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppincbenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 3440
        mmTop = 265
        mmWidth = 19050
        BandType = 4
      end
      object ppDBTextTitular: TppDBText
        UserName = 'DBTextTitular'
        DataField = 'TITULAR'
        DataPipeline = ppincbenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 24077
        mmTop = 265
        mmWidth = 60061
        BandType = 4
      end
      object ppDBText197: TppDBText
        UserName = 'DBText197'
        DataField = 'SITUACAO'
        DataPipeline = ppincbenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 85461
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText196: TppDBText
        UserName = 'DBText196'
        DataField = 'PLANO'
        DataPipeline = ppincbenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 105569
        mmTop = 265
        mmWidth = 65352
        BandType = 4
      end
      object ppDBText199: TppDBText
        UserName = 'DBText199'
        DataField = 'DATAINSCRICAO'
        DataPipeline = ppincbenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 171980
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabelNomeSistema: TppLabel
        UserName = 'ppLabel90'
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
        mmTop = 8731
        mmWidth = 198173
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc39'
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
        mmTop = 8731
        mmWidth = 197644
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 171450
        mmTop = 9525
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      BeforePrint = ppSummaryBand5BeforePrint
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object ppLabelTotalT: TppLabel
        UserName = 'rpRelBenSaudeLabel6'
        Caption = 'Quantidade Total de Titulares: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 10848
        mmWidth = 51594
        BandType = 7
      end
      object ppLabel116: TppLabel
        UserName = 'rpRelBenSaudeLabel7'
        Caption = 'Quantidade de Total de Dependentes: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 18256
        mmWidth = 64294
        BandType = 7
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppincbenef
      NewPage = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLabel120: TppLabel
          UserName = 'rpRelBenSaudeLabel2'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppDBText198: TppDBText
          UserName = 'rpRelBenSaudeDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppincbenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 35719
          mmTop = 1323
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'ppLabel91'
          Caption = 'Matricula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3440
          mmLeft = 3704
          mmTop = 7408
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel122: TppLabel
          UserName = 'ppLabel92'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3440
          mmLeft = 25665
          mmTop = 7408
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'Label112'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3440
          mmLeft = 85725
          mmTop = 7408
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3440
          mmLeft = 106098
          mmTop = 7408
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = 'Data de Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3440
          mmLeft = 171186
          mmTop = 7408
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppLabelTotal: TppLabel
          UserName = 'LabelTotal'
          Caption = 'Total da Patrocinadora => '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3969
          mmTop = 4233
          mmWidth = 44186
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppincbenef: TppBDEPipeline
    DataSource = dsincbenef
    UserName = 'RelIncBenef'
    Left = 237
    Top = 23
    object ppincbenefppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppincbenefppField2: TppField
      FieldAlias = 'TITULAR'
      FieldName = 'TITULAR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppincbenefppField3: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppincbenefppField4: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppincbenefppField5: TppField
      FieldAlias = 'DATAENTRADA'
      FieldName = 'DATAENTRADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppincbenefppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
    object ppincbenefppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppincbenefppField8: TppField
      FieldAlias = 'DATAINSCRICAO'
      FieldName = 'DATAINSCRICAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppincbenefppField9: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 9
      DisplayWidth = 9
      Position = 8
    end
  end
  object dsincbenef: TwwDataSource
    DataSet = qryincbenef
    Left = 237
    Top = 37
  end
  object qryincbenef: TwwQuery
    AutoRefresh = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA,'
      'UPPER(PT.NOME) AS TITULAR,'
      'RTRIM(PJ.NOME) AS PATROCINADORA,'
      'PL.NOME AS PLANO,'
      'BF.DATAENTRADA,'
      ''
      'EL.MATRICULA AS MATRICULA,'
      'PP.INSCRICAONUMERO AS INSCRICAO,'
      'PS.DATAENTRADA AS DATAINSCRICAO,'
      'DECODE(ST.FLGINTERNO,'#39'AS'#39','#39'ASSISTIDO'#39','
      '                     '#39'CA'#39','#39'CANCELADO'#39','
      '                     '#39'MA'#39','#39'MANTIDO'#39','
      '                     '#39'AT'#39','#39'ATIVO'#39') AS SITUACAO'
      ''
      ''
      'FROM'
      ' PESSOA PT,'
      ' PESSOA PJ,'
      ' PESSOAFISICA PF,'
      ' PARTPREVPLAN PP,'
      ' ELEGPATRO EL,'
      ' SITPART ST,'
      ' DEPENTIT DP,'
      ' PARTASS PS,'
      ' BENEFASS BF,'
      ' PLANASS PL'
      ''
      'WHERE'
      '  (PT.IDPESSOA=PF.IDPESSOA) AND'
      '  (PT.IDPESSOA=PT.IDPESSOA) AND'
      '  (PT.IDPESSOA=PP.IDPESSOA) AND'
      ''
      '  (PT.IDPESSOA=EL.IDPESSOA) AND'
      '  (PT.IDPESSOA=BF.IDTITULAR) AND'
      '  (PT.IDPESSOA=PS.IDPESSOA) AND'
      '  (PT.IDPESSOA=DP.IDTITULAR) AND'
      ''
      '  (PJ.IDPESSOA=PP.IDPESSJUR) AND'
      '  (PJ.IDPESSOA=PJ.IDPESSOA) AND'
      '  (PJ.IDPESSOA=EL.IDPESSJUR) AND'
      '  (PJ.IDPESSOA=PS.IDPESSJUR) AND'
      '  (PJ.IDPESSOA=BF.IDPESSJUR) AND'
      ''
      '  (PP.IDPESSJUR=PS.IDPESSJUR)AND'
      '  (PP.IDPESSOA=PP.IDPESSOA) AND'
      '  (PP.IDSITPART=ST.IDSITPART) AND'
      '  (PP.IDPLANOPREV=PS.IDPLANOPREV) AND'
      ''
      '  (EL.IDPESSJUR=PS.IDPESSJUR) AND'
      ''
      '  (PS.IDPESSOA=BF.IDTITULAR) AND'
      ''
      ''
      '  (BF.IDPLANASS=PS.IDPLANASS) AND'
      '  (BF.DTCANCELAMENTO IS NULL) AND'
      '  (BF.IDPLANASS=PL.IDPLANASS)'
      ''
      '--teste'
      'and(rownum<50)'
      ''
      ' ORDER BY PATROCINADORA, TITULAR'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 238
    Top = 50
    object qryincbenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryincbenefTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryincbenefPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryincbenefPLANO: TStringField
      FieldName = 'PLANO'
      Size = 40
    end
    object qryincbenefDATAENTRADA: TDateTimeField
      FieldName = 'DATAENTRADA'
    end
    object qryincbenefMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryincbenefINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryincbenefDATAINSCRICAO: TDateTimeField
      FieldName = 'DATAINSCRICAO'
    end
    object qryincbenefSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 9
    end
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 113
    Top = 7
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = 2) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 112
    Top = 22
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 113
    Top = 37
  end
end
