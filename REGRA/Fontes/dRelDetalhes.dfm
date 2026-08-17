inherited dtmRelDetalhes: TdtmRelDetalhes
  Left = 257
  Top = 56
  Width = 216
  Height = 443
  Caption = 'dtmRelDetalhes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 93
  end
  inherited dsExemplo: TwwDataSource
    Left = 65
  end
  inherited rpExemplo: TppReport
    Left = 145
  end
  object QryVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      C.IDCAMPO, C.DESCRICAODOCAMPO, C.NOMEDOCAMPO, C.ENTIDADE, ' +
        'A.IDREGRA'
      'FROM'
      '    ALGREGRA A, CMPBD C'
      'WHERE'
      
        '     ((A.IDCAMPO = C.IDCAMPO OR A.IDCAMPO2 = C.IDCAMPO) AND (C.C' +
        'AMPODOBANCO = 0)) AND'
      '     (A.IDREGRA = :ID)'
      'GROUP BY'
      
        #9'C.IDCAMPO, C.DESCRICAODOCAMPO, C.NOMEDOCAMPO, C.ENTIDADE, A.IDR' +
        'EGRA'
      'ORDER BY'
      '      C.DESCRICAODOCAMPO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryVariavelIDCAMPO: TStringField
      DisplayLabel = 'Identificador do Campo'
      FieldName = 'IDCAMPO'
      Origin = 'CMPBD.IDCAMPO'
      Size = 12
    end
    object QryVariavelDESCRICAODOCAMPO: TStringField
      DisplayLabel = 'Descrição do Campo'
      FieldName = 'DESCRICAODOCAMPO'
      Origin = 'CMPBD.DESCRICAODOCAMPO'
      Size = 60
    end
    object QryVariavelNOMEDOCAMPO: TStringField
      DisplayLabel = 'Nome do Campo'
      FieldName = 'NOMEDOCAMPO'
      Origin = 'CMPBD.NOMEDOCAMPO'
      Visible = False
      Size = 30
    end
    object QryVariavelENTIDADE: TStringField
      DisplayLabel = 'Tabela (Entidade)'
      FieldName = 'ENTIDADE'
      Origin = 'CMPBD.ENTIDADE'
      Visible = False
      Size = 30
    end
    object QryVariavelIDREGRA: TFloatField
      DisplayLabel = 'Número da Regra'
      FieldName = 'IDREGRA'
      Origin = 'ALGREGRA.IDREGRA'
      Visible = False
    end
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      R.IDREGRA, R.NOMEREGRA, A.IDALGORITMODAREG, A.DESCRICAOALG' +
        'ORIT,'
      '      T.DESCREGRA, T.IDGRUPOREGRA, r.DESCRICAOREGRA'
      'FROM'
      '    REGRA R, ALGREGRA A, TIPOREGRA T'
      'WHERE'
      '     (R.IDREGRA = A.IDREGRA) AND'
      '     (R.IDTIPOREGRA = T.IDTIPOREGRA) AND'
      '     (R.IDREGRA = :ID)'
      'ORDER BY'
      '      A.IDALGORITMODAREG')
    ValidateWithMask = True
    Left = 34
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryIDALGORITMODAREG: TFloatField
      DisplayLabel = 'Nº do passo'
      DisplayWidth = 10
      FieldName = 'IDALGORITMODAREG'
      Origin = 'ALGREGRA.IDALGORITMODAREG'
    end
    object QryDESCRICAOALGORIT: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 120
      FieldName = 'DESCRICAOALGORIT'
      Origin = 'ALGREGRA.DESCRICAOALGORIT'
      Size = 120
    end
    object QryIDREGRA: TFloatField
      DisplayLabel = 'Número da Regra'
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
      Visible = False
    end
    object QryNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Visible = False
      Size = 60
    end
    object QryDESCREGRA: TStringField
      FieldName = 'DESCREGRA'
      Origin = 'TIPOREGRA.DESCREGRA'
      Visible = False
      Size = 60
    end
    object QryIDGRUPOREGRA: TFloatField
      FieldName = 'IDGRUPOREGRA'
      Origin = 'TIPOREGRA.IDGRUPOREGRA'
    end
    object QryDESCRICAOREGRA: TMemoField
      FieldName = 'DESCRICAOREGRA'
      Origin = 'BASEDADOS.REGRA.DESCRICAOREGRA'
      BlobType = ftMemo
      Size = 1
    end
  end
  object QryCampo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      DISTINCT C.IDCAMPO, C.DESCRICAODOCAMPO, C.NOMEDOCAMPO, C.E' +
        'NTIDADE, A.IDREGRA'
      'FROM'
      '    ALGREGRA A, CMPBD C'
      'WHERE'
      
        '     ((A.IDCAMPO = C.IDCAMPO OR A.IDCAMPO2 = C.IDCAMPO) AND (C.C' +
        'AMPODOBANCO > 0)) and'
      '     (A.IDREGRA = :ID)'
      'ORDER BY'
      '      C.DESCRICAODOCAMPO')
    ValidateWithMask = True
    Left = 34
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryCampoIDCAMPO: TStringField
      DisplayLabel = 'Identificador do Campo'
      FieldName = 'IDCAMPO'
      Origin = 'CMPBD.IDCAMPO'
      Size = 12
    end
    object QryCampoDESCRICAODOCAMPO: TStringField
      DisplayLabel = 'Descrição do Campo'
      FieldName = 'DESCRICAODOCAMPO'
      Origin = 'CMPBD.DESCRICAODOCAMPO'
      Size = 60
    end
    object QryCampoNOMEDOCAMPO: TStringField
      DisplayLabel = 'Nome do Campo'
      FieldName = 'NOMEDOCAMPO'
      Origin = 'CMPBD.NOMEDOCAMPO'
      Size = 30
    end
    object QryCampoENTIDADE: TStringField
      DisplayLabel = 'Tabela (Entidade)'
      FieldName = 'ENTIDADE'
      Origin = 'CMPBD.ENTIDADE'
      Size = 30
    end
    object QryCampoIDREGRA: TFloatField
      DisplayLabel = 'Número da Regra'
      FieldName = 'IDREGRA'
      Origin = 'ALGREGRA.IDREGRA'
      Visible = False
    end
  end
  object QryFormula: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      DISTINCT F.IDFORMULA, F.DESCRICAOFORMULA, F.EXPRESSAOREAL,' +
        ' A.IDREGRA, GRP.DESCGRUPOFORMULA'
      'FROM'
      '    (SELECT IDREGRA, FORMULA1, TIPOCAMPO2 FROM ALGREGRA WHERE'
      
        '    (TIPOCAMPO2 = 4) AND (IDREGRA = :ID)) A, FORMULA F, GRPFORMU' +
        'LA GRP'
      'WHERE'
      
        '     (A.FORMULA1 = F.IDFORMULA) AND (F.CODGRUPOFORMULA = GRP.COD' +
        'GRUPOFORMULA)'
      'ORDER BY'
      '      GRP.DESCGRUPOFORMULA, F.DESCRICAOFORMULA')
    ValidateWithMask = True
    Left = 34
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryFormulaIDFORMULA: TFloatField
      DisplayLabel = 'Identificador da Formula'
      FieldName = 'IDFORMULA'
      Origin = 'FORMULA.IDFORMULA'
    end
    object QryFormulaDESCRICAOFORMULA: TStringField
      DisplayLabel = 'Descrição da Fórmula'
      FieldName = 'DESCRICAOFORMULA'
      Origin = 'FORMULA.DESCRICAOFORMULA'
      Size = 60
    end
    object QryFormulaEXPRESSAOREAL: TStringField
      DisplayLabel = 'Expressão Real'
      FieldName = 'EXPRESSAOREAL'
      Origin = 'FORMULA.EXPRESSAOREAL'
      Size = 255
    end
    object QryFormulaIDREGRA: TFloatField
      DisplayLabel = 'Número da Regra'
      FieldName = 'IDREGRA'
      Origin = 'ALGREGRA.IDREGRA'
      Visible = False
    end
    object QryFormulaDESCGRUPOFORMULA: TStringField
      DisplayLabel = 'Grupo das fórmulas'
      FieldName = 'DESCGRUPOFORMULA'
      Size = 40
    end
  end
  object QryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      R.IDREGRA, R.NOMEREGRA'
      'FROM'
      
        '    REGRA R, (SELECT IDCAMPO2, TIPOALGORITMO, IDREGRA FROM ALGRE' +
        'GRA WHERE TIPOALGORITMO = 14) A'
      'WHERE'
      '     (A.IDCAMPO2 = TO_CHAR(R.IDREGRA)) AND (A.IDREGRA = :ID)'
      'ORDER BY'
      '      R.NOMEREGRA'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryRegraIDREGRA: TFloatField
      DisplayLabel = 'Número da Regra'
      FieldName = 'IDREGRA'
    end
    object QryRegraNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      FieldName = 'NOMEREGRA'
      Size = 60
    end
  end
  object QryPai: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      A.IDREGRA, R.NOMEREGRA, A.IDCAMPO2'
      'FROM'
      
        '    '#9'(SELECT IDREGRA, IDCAMPO2, TIPOALGORITMO FROM ALGREGRA WHER' +
        'E (TIPOALGORITMO = 14)) A,'
      #9'REGRA R'
      'WHERE'
      '      '#9'(R.IDREGRA = A.IDREGRA) AND (A.IDCAMPO2 = :ID)'
      'GROUP BY'
      #9'A.IDREGRA, R.NOMEREGRA, A.IDCAMPO2'
      'ORDER BY'
      #9'A.IDREGRA')
    ValidateWithMask = True
    Left = 34
    Top = 267
    ParamData = <
      item
        DataType = ftString
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryPaiIDREGRA: TFloatField
      DisplayLabel = 'Número da Regra'
      FieldName = 'IDREGRA'
      Origin = 'ALGREGRA.IDREGRA'
    end
    object QryPaiNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
  end
  object QryCamposChave: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        #9'DISTINCT TABCMP.NOMEDOCAMPO, TABCMP.ENTIDADE, TABCMP.DESCRICAOD' +
        'OCAMPO'
      'FROM'
      #9'CMPBD TABCMP,'
      #9'(SELECT C.IDCAMPO, C.ENTIDADE FROM ALGREGRA A, CMPBD C WHERE'
      
        '        ((A.IDCAMPO = C.IDCAMPO OR A.IDCAMPO2 = C.IDCAMPO) AND (' +
        'C.CAMPODOBANCO > 0)) and'
      '        (A.IDREGRA = :ID) GROUP BY C.IDCAMPO, C.ENTIDADE) CAMPOS'
      'WHERE'
      #9'(TABCMP.ENTIDADE = CAMPOS.ENTIDADE) AND (TABCMP.CHAVE = 1) AND'
      #9'(TABCMP.CAMPODOBANCO > 0)'
      'ORDER BY'
      #9'TABCMP.ENTIDADE, TABCMP.NOMEDOCAMPO'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 315
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object QryCamposChaveNOMEDOCAMPO: TStringField
      DisplayLabel = 'Nome do Campo'
      FieldName = 'NOMEDOCAMPO'
      Size = 30
    end
    object QryCamposChaveENTIDADE: TStringField
      DisplayLabel = 'Tabela (Entidade)'
      FieldName = 'ENTIDADE'
      Size = 30
    end
    object QryCamposChaveDESCRICAODOCAMPO: TStringField
      DisplayLabel = 'Descrição do Campo'
      FieldName = 'DESCRICAODOCAMPO'
      Size = 60
    end
  end
  object dsCamposChave: TwwDataSource
    DataSet = QryCamposChave
    Left = 65
    Top = 315
  end
  object dsPai: TwwDataSource
    DataSet = QryPai
    Left = 65
    Top = 267
  end
  object dsFormula: TwwDataSource
    DataSet = QryFormula
    Left = 65
    Top = 168
  end
  object dsCampo: TwwDataSource
    DataSet = QryCampo
    Left = 65
    Top = 368
  end
  object dsRegra: TwwDataSource
    DataSet = QryRegra
    Left = 65
    Top = 216
  end
  object ds: TwwDataSource
    DataSet = Qry
    Left = 65
    Top = 120
  end
  object dsVariavel: TwwDataSource
    DataSet = QryVariavel
    Left = 65
    Top = 61
  end
  object bdePipVariavel: TppBDEPipeline
    DataSource = dsVariavel
    UserName = 'bdePipVariavel'
    Left = 93
    Top = 61
  end
  object bdePipFormula: TppBDEPipeline
    DataSource = dsFormula
    UserName = 'bdePipFormula'
    Left = 93
    Top = 168
  end
  object bdePipRegra: TppBDEPipeline
    DataSource = dsRegra
    UserName = 'bdePipRegra'
    Left = 93
    Top = 216
  end
  object bdePipCampo: TppBDEPipeline
    DataSource = dsCampo
    UserName = 'bdePipCampo'
    Left = 93
    Top = 368
  end
  object bdePipPrincipal: TppBDEPipeline
    DataSource = ds
    UserName = 'bdePipPrincipal'
    Left = 93
    Top = 120
  end
  object bdePipRegrasPai: TppBDEPipeline
    DataSource = dsPai
    UserName = 'bdePipRegrasPai'
    Left = 93
    Top = 267
  end
  object bdePipCamposChave: TppBDEPipeline
    DataSource = dsCamposChave
    UserName = 'bdePipCamposChave'
    Left = 93
    Top = 315
  end
  object pprDetalhe: TppReport
    AutoStop = False
    DataPipeline = bdePipPrincipal
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'pprDetalhe'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 145
    Top = 120
    Version = '5.5'
    mmColumnWidth = 197300
    object ppTitleBand5: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Detalhes da Regra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 81227
        mmTop = 7144
        mmWidth = 37042
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 12965
        mmWidth = 197300
        BandType = 1
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 0
        mmWidth = 28046
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Descrição da Regra '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 12965
        mmWidth = 26458
        BandType = 1
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'DESCRICAOREGRA'
        DataPipeline = bdePipPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        TextAlignment = taFullJustified
        Transparent = True
        mmHeight = 8467
        mmLeft = 125413
        mmTop = 16933
        mmWidth = 71967
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 125413
        mmTop = 16404
        mmWidth = 71967
        BandType = 1
      end
    end
    object ppReport1HeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppReport1Label2: TppLabel
        UserName = 'ppReport1Label2'
        Caption = 'Número da Regra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 1588
        mmWidth = 23019
        BandType = 0
      end
      object ppReport1Label3: TppLabel
        UserName = 'ppReport1Label3'
        Caption = 'Nome '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 5292
        mmWidth = 8467
        BandType = 0
      end
      object ppReport1DBText1: TppDBText
        UserName = 'ppReport1DBText1'
        AutoSize = True
        DataField = 'IDREGRA'
        DataPipeline = bdePipPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 29898
        mmTop = 1588
        mmWidth = 4498
        BandType = 0
      end
      object ppReport1DBText2: TppDBText
        UserName = 'ppReport1DBText2'
        AutoSize = True
        DataField = 'NOMEREGRA'
        DataPipeline = bdePipPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 5292
        mmWidth = 63236
        BandType = 0
      end
      object ppReport1Label1: TppLabel
        UserName = 'ppReport1Label1'
        Caption = 'Tipo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 9260
        mmWidth = 6615
        BandType = 0
      end
      object ppReport1DBText7: TppDBText
        UserName = 'ppReport1DBText7'
        AutoSize = True
        DataField = 'DESCREGRA'
        DataPipeline = bdePipPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 9260
        mmWidth = 39952
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 13229
        mmWidth = 197300
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppReport1DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppReport1DBText3: TppDBText
        UserName = 'ppReport1DBText3'
        AutoSize = True
        DataField = 'IDALGORITMODAREG'
        DataPipeline = bdePipPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppReport1DBText4: TppDBText
        UserName = 'ppReport1DBText4'
        AutoSize = True
        DataField = 'DESCRICAOALGORIT'
        DataPipeline = bdePipPrincipal
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 15875
        mmTop = 0
        mmWidth = 156369
        BandType = 4
      end
    end
    object ppReport1FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
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
        mmTop = 2646
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 6615
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppReport1SummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 56356
      mmPrintPosition = 0
      object ppSubCampo: TppSubReport
        UserName = 'ppSubCampo'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppReport1ChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = bdePipCampo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'pprDetalhe'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object ppReport1ChildReport1Label1: TppLabel
              UserName = 'ppReport1ChildReport1Label1'
              Caption = 'Campos da Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5292
              mmLeft = 529
              mmTop = 794
              mmWidth = 36248
              BandType = 1
            end
            object ppReport1ChildReport1Label5: TppLabel
              UserName = 'ppReport1ChildReport1Label5'
              Caption = 'Tabela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 529
              mmTop = 6615
              mmWidth = 11642
              BandType = 1
            end
            object ppReport1ChildReport1Label3: TppLabel
              UserName = 'ppReport1ChildReport1Label3'
              Caption = 'Descrição '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 23813
              mmTop = 6615
              mmWidth = 17463
              BandType = 1
            end
            object ppReport1ChildReport1Label4: TppLabel
              UserName = 'ppReport1ChildReport1Label4'
              Caption = 'Campo do Banco'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 85725
              mmTop = 6615
              mmWidth = 29369
              BandType = 1
            end
            object ppReport1ChildReport1Line2: TppLine
              UserName = 'ppReport1ChildReport1Line2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 11377
              mmWidth = 197380
              BandType = 1
            end
          end
          object ppReport1ChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppReport1ChildReport1DBText1: TppDBText
              UserName = 'ppReport1ChildReport1DBText1'
              AutoSize = True
              DataField = 'DESCRICAODOCAMPO'
              DataPipeline = bdePipCampo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 23813
              mmTop = 0
              mmWidth = 35454
              BandType = 4
            end
            object ppReport1ChildReport1DBText3: TppDBText
              UserName = 'ppReport1ChildReport1DBText3'
              AutoSize = True
              DataField = 'NOMEDOCAMPO'
              DataPipeline = bdePipCampo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 85725
              mmTop = 0
              mmWidth = 26194
              BandType = 4
            end
          end
          object ppReport1ChildReport1Group1: TppGroup
            BreakName = 'ENTIDADE'
            DataPipeline = bdePipCampo
            UserName = 'Report1ChildReport1Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppReport1ChildReport1GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppReport1ChildReport1DBText4: TppDBText
                UserName = 'ppReport1ChildReport1DBText4'
                AutoSize = True
                DataField = 'ENTIDADE'
                DataPipeline = bdePipCampo
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 265
                mmTop = 0
                mmWidth = 16140
                BandType = 3
                GroupNo = 0
              end
            end
            object ppReport1ChildReport1GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 265
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubFormula: TppSubReport
        UserName = 'ppSubFormula'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubCampo
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 6615
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppReport1ChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = bdePipFormula
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'pprDetalhe'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object ppReport1ChildReport2Line1: TppLine
              UserName = 'ppReport1ChildReport2Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 6350
              mmWidth = 197380
              BandType = 1
            end
            object ppReport1Label6: TppLabel
              UserName = 'ppReport1Label6'
              Caption = 'Fórmulas da Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5292
              mmLeft = 1323
              mmTop = 529
              mmWidth = 38365
              BandType = 1
            end
          end
          object ppReport1DetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppReport1DBText6: TppDBText
              UserName = 'ppReport1DBText6'
              AutoSize = True
              DataField = 'IDFORMULA'
              DataPipeline = bdePipFormula
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3175
              mmLeft = 17992
              mmTop = 1058
              mmWidth = 16404
              BandType = 4
            end
            object ppReport1ChildReport2DBText2: TppDBText
              UserName = 'ppReport1ChildReport2DBText2'
              AutoSize = True
              DataField = 'DESCRICAOFORMULA'
              DataPipeline = bdePipFormula
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 53711
              mmTop = 1058
              mmWidth = 30427
              BandType = 4
            end
            object ppReport1Label7: TppLabel
              UserName = 'ppReport1Label7'
              Caption = 'Número :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 529
              mmWidth = 15610
              BandType = 4
            end
            object ppReport1Label8: TppLabel
              UserName = 'ppReport1Label8'
              Caption = 'Descrição :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 33867
              mmTop = 529
              mmWidth = 19050
              BandType = 4
            end
            object ppReport1ChildReport2Label4: TppLabel
              UserName = 'ppReport1ChildReport2Label4'
              Caption = 'Expressão :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 33867
              mmTop = 6085
              mmWidth = 19579
              BandType = 4
            end
            object ppDBMemo1: TppDBMemo
              UserName = 'DBMemo1'
              CharWrap = False
              DataField = 'EXPRESSAOREAL'
              DataPipeline = bdePipFormula
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 7673
              mmLeft = 53711
              mmTop = 6085
              mmWidth = 142611
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
          end
          object ppReport1ChildReport2Group1: TppGroup
            BreakName = 'DESCGRUPOFORMULA'
            DataPipeline = bdePipFormula
            UserName = 'Report1ChildReport2Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppReport1ChildReport2GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppReport1ChildReport2DBText1: TppDBText
                UserName = 'ppReport1ChildReport2DBText1'
                AutoSize = True
                DataField = 'DESCGRUPOFORMULA'
                DataPipeline = bdePipFormula
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 32808
                mmTop = 0
                mmWidth = 36777
                BandType = 3
                GroupNo = 0
              end
              object ppReport1ChildReport2Label1: TppLabel
                UserName = 'ppReport1ChildReport2Label1'
                Caption = 'Grupo da Fórmula :'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 1323
                mmTop = 0
                mmWidth = 30163
                BandType = 3
                GroupNo = 0
              end
            end
            object ppReport1ChildReport2GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubRegra: TppSubReport
        UserName = 'ppSubRegra'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubFormula
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 12965
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppReport1ChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = bdePipRegra
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'pprDetalhe'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object ppReport1Label13: TppLabel
              UserName = 'ppReport1Label13'
              Caption = 'Regras chamadas pela Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5292
              mmLeft = 1058
              mmTop = 529
              mmWidth = 59267
              BandType = 1
            end
            object ppReport1Label14: TppLabel
              UserName = 'ppReport1Label14'
              Caption = 'Identificador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1058
              mmTop = 6350
              mmWidth = 21431
              BandType = 1
            end
            object ppReport1Label15: TppLabel
              UserName = 'ppReport1Label15'
              Caption = 'Descrição '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 23283
              mmTop = 6350
              mmWidth = 17992
              BandType = 1
            end
            object ppReport1ChildReport3Line1: TppLine
              UserName = 'ppReport1ChildReport3Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 1588
              mmTop = 11113
              mmWidth = 196057
              BandType = 1
            end
          end
          object ppReport1DetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppReport1DBText9: TppDBText
              UserName = 'ppReport1DBText9'
              AutoSize = True
              DataField = 'NOMEREGRA'
              DataPipeline = bdePipRegra
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 23283
              mmTop = 0
              mmWidth = 18256
              BandType = 4
            end
            object ppReport1DBText10: TppDBText
              UserName = 'ppReport1DBText10'
              AutoSize = True
              DataField = 'IDREGRA'
              DataPipeline = bdePipRegra
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
          end
        end
      end
      object ppSubVariavel: TppSubReport
        UserName = 'ppSubVariavel'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubRegra
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 20108
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppReport1ChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = bdePipVariavel
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'pprDetalhe'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
          Left = 396
          Top = 272
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 11642
            mmPrintPosition = 0
            object ppReport1ChildReport4Label4: TppLabel
              UserName = 'ppReport1ChildReport4Label4'
              Caption = 'Variáveis utilizadas pela Regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5292
              mmLeft = 1058
              mmTop = 0
              mmWidth = 62177
              BandType = 1
            end
            object ppReport1ChildReport4Label5: TppLabel
              UserName = 'ppReport1ChildReport4Label5'
              Caption = 'Identificador'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 5821
              mmWidth = 21431
              BandType = 1
            end
            object ppReport1ChildReport4Line1: TppLine
              UserName = 'ppReport1ChildReport4Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 265
              mmTop = 10583
              mmWidth = 196057
              BandType = 1
            end
            object ppReport1ChildReport4Label6: TppLabel
              UserName = 'ppReport1ChildReport4Label6'
              Caption = 'Descrição '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 34396
              mmTop = 5821
              mmWidth = 17992
              BandType = 1
            end
          end
          object ppReport1ChildReport4DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppReport1ChildReport4DBText3: TppDBText
              UserName = 'ppReport1ChildReport4DBText3'
              AutoSize = True
              DataField = 'IDCAMPO'
              DataPipeline = bdePipVariavel
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3175
              mmLeft = 794
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppReport1ChildReport4DBText4: TppDBText
              UserName = 'ppReport1ChildReport4DBText4'
              AutoSize = True
              DataField = 'DESCRICAODOCAMPO'
              DataPipeline = bdePipVariavel
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3175
              mmLeft = 33867
              mmTop = 0
              mmWidth = 31221
              BandType = 4
            end
          end
        end
      end
      object ppSubRegrasPai: TppSubReport
        UserName = 'ppSubRegrasPai'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubVariavel
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 28046
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppReport1ChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = bdePipRegrasPai
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'pprDetalhe'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
          Left = 396
          Top = 272
          Version = '5.5'
          mmColumnWidth = 0
          object ppReport1HeaderBand3: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 15610
            mmPrintPosition = 0
            object ppReport1Label19: TppLabel
              UserName = 'ppReport1Label19'
              Caption = 'Regras que chamam esta regra'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5027
              mmLeft = 794
              mmTop = 4233
              mmWidth = 62706
              BandType = 0
            end
            object ppReport1Label20: TppLabel
              UserName = 'ppReport1Label20'
              Caption = 'Identificador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 9790
              mmWidth = 21167
              BandType = 0
            end
            object ppReport1Label21: TppLabel
              UserName = 'ppReport1Label21'
              Caption = 'Descrição '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 26194
              mmTop = 9790
              mmWidth = 17463
              BandType = 0
            end
            object ppReport1ChildReport5Line1: TppLine
              UserName = 'ppReport1ChildReport5Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 794
              mmTop = 14552
              mmWidth = 196057
              BandType = 0
            end
          end
          object ppReport1DetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppReport1DBText13: TppDBText
              UserName = 'ppReport1DBText13'
              AutoSize = True
              DataField = 'IDREGRA'
              DataPipeline = bdePipRegrasPai
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 794
              mmTop = 0
              mmWidth = 10583
              BandType = 4
            end
            object ppReport1DBText14: TppDBText
              UserName = 'ppReport1DBText14'
              AutoSize = True
              DataField = 'NOMEREGRA'
              DataPipeline = bdePipRegrasPai
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 25665
              mmTop = 0
              mmWidth = 15081
              BandType = 4
            end
          end
        end
      end
      object ppSubCampoChave: TppSubReport
        UserName = 'ppSubCampoChave'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = ppSubRegrasPai
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 34925
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppReport1ChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = bdePipCamposChave
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'pprDetalhe'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\ProjetosComDPL\Regra\rELAT1.RTM'
          Left = 396
          Top = 272
          Version = '5.5'
          mmColumnWidth = 0
          object ppReport1HeaderBand5: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 16140
            mmPrintPosition = 0
            object ppReport1Label4: TppLabel
              UserName = 'ppReport1Label4'
              Caption = 'Campos Chave'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5027
              mmLeft = 794
              mmTop = 4233
              mmWidth = 30956
              BandType = 0
            end
            object ppReport1Label5: TppLabel
              UserName = 'ppReport1Label5'
              Caption = 'Nome do Campo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 33073
              mmTop = 10583
              mmWidth = 28046
              BandType = 0
            end
            object ppReport1Line1: TppLine
              UserName = 'ppReport1Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 794
              mmTop = 15081
              mmWidth = 196057
              BandType = 0
            end
            object ppReport1ChildReport6Label1: TppLabel
              UserName = 'ppReport1ChildReport6Label1'
              Caption = 'Descrição do Campo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 69850
              mmTop = 10583
              mmWidth = 34660
              BandType = 0
            end
            object ppReport1ChildReport6Label2: TppLabel
              UserName = 'ppReport1ChildReport6Label2'
              Caption = 'Tabela (Entidade)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 794
              mmTop = 10583
              mmWidth = 29633
              BandType = 0
            end
          end
          object ppReport1DetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppReport1DBText8: TppDBText
              UserName = 'ppReport1DBText8'
              AutoSize = True
              DataField = 'NOMEDOCAMPO'
              DataPipeline = bdePipCamposChave
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 33073
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppReport1ChildReport6DBText1: TppDBText
              UserName = 'ppReport1ChildReport6DBText1'
              AutoSize = True
              DataField = 'DESCRICAODOCAMPO'
              DataPipeline = bdePipCamposChave
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3440
              mmLeft = 69850
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
          end
          object ppReport1ChildReport6Group1: TppGroup
            BreakName = 'ENTIDADE'
            DataPipeline = bdePipCamposChave
            UserName = 'Report1ChildReport6Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object ppReport1ChildReport6GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object ppReport1DBText11: TppDBText
                UserName = 'ppReport1DBText11'
                AutoSize = True
                DataField = 'ENTIDADE'
                DataPipeline = bdePipCamposChave
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3969
                mmLeft = 794
                mmTop = 2910
                mmWidth = 16140
                BandType = 3
                GroupNo = 0
              end
            end
            object ppReport1ChildReport6GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object pprDetalheGroup1: TppGroup
      BreakName = 'IDREGRA'
      DataPipeline = bdePipPrincipal
      UserName = 'rDetalheGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object pprDetalheGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object pprDetalheLabel1: TppLabel
          UserName = 'pprDetalheLabel1'
          Caption = 'Passo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 265
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object pprDetalheLabel2: TppLabel
          UserName = 'pprDetalheLabel2'
          Caption = 'Descrição do Algoritmo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 15875
          mmTop = 265
          mmWidth = 39952
          BandType = 3
          GroupNo = 0
        end
        object pprDetalheLine1: TppLine
          UserName = 'pprDetalheLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object pprDetalheGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
  end
  object QryPermissao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDGRUPOREGRA, IDUSUARIO, FLGINSERIR, FLGALTERAR,'
      '  FLGEXCLUIR, FLGPROCURAR'
      'FROM'
      '  GRUPOREGRAUSUARIO'
      'WHERE'
      '  (IDGRUPOREGRA = :GRUPO OR IDTIPOREGRA  = :TIPO ) AND'
      '  (IDUSUARIO = :USUARIO)'
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 147
    Top = 215
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'USUARIO'
        ParamType = ptUnknown
      end>
  end
end
