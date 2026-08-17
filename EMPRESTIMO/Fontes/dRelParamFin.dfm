inherited dtmRelParamFin: TdtmRelParamFin
  Left = 322
  Top = 106
  Width = 388
  Height = 214
  Caption = 'dRelParamFin'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplExemploppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
  end
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Line1: TppLine [2]
        Pen.Style = psClear
        Pen.Width = 0
        Style = lsDouble
        Weight = 0
        mmTop = 0
      end
    end
    inherited FooterBand1: TppFooterBand
      inherited LblSistema: TppLabel [0]
      end
      inherited Calc2: TppSystemVariable [1]
      end
      inherited Calc1: TppSystemVariable [2]
      end
      inherited Line2: TppLine [3]
        Pen.Style = psClear
        Pen.Width = 0
        Weight = 0
        mmHeight = 0
        mmTop = 0
      end
    end
  end
  object pplParamFin: TppBDEPipeline
    DataSource = dtsParamFin
    CloseDataSource = True
    UserName = 'ParamFin'
    Left = 257
    Top = 81
  end
  object dtsParamFin: TwwDataSource
    AutoEdit = False
    DataSet = cdsParamFin
    Left = 183
    Top = 82
  end
  object qryParamFin: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ITC.ITCEVENTO,'
      '   TC.TCEDESCRICAO AS DESCR_CONTRATO,'
      '   PI.IDITEMEMPTMO, ITE.ITEDESCRICAO AS DESCR_ITEM,'
      '   PI.IDTIPOCONTREMPTMO,'
      '   PI.IDPATRO,PAT.NOMEPATRO,'
      '   PI.IDPLANOPREV, PLP.NOME AS NOMEPLANO,'
      '   PI.RECPAG,'
      '   ITC.CONTABAIXA,'
      '   ITC.IDPROVENTON AS RUBRICAN,'
      '   ITC.IDPROVENTOD AS RUBRICAD,'
      '   ITC.IDPROVENTOA AS RUBRICAA,'
      '   ITC.IDREGRACALC,'
      '   PI.CCCREDFINAN AS CRED_APROPRIACAO,'
      '   PI.CCDEBFINAN  AS DEB_APROPRIACAO,'
      '   PI.CCCREDFOLHA AS CRED_PATRO,'
      '   PI.CCDEBFOLHA  AS DEB_PATRO,'
      '   PI.TIPORECDESFINAN,'
      '   PI.TIPORECDESFOLHA,'
      '   PI.UNIDNEGOC,UD.NOME'
      'FROM'
      '   PARAMINTEGRAEP PI, ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE,'
      '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE, UNIDNEGOCIO UD,'
      ''
      '   ('
      '   SELECT'
      '      (PA.IDPESSOA) AS IDPATRO, (PE.NOME) AS NOMEPATRO'
      '   FROM'
      '      PESSOA PE, PATRO PA'
      '   WHERE'
      '      PA.IDPESSOA = PE.IDPESSOA(+)'
      '   ) PAT,'
      ''
      '   PLANPREV PLP'
      ''
      'WHERE'
      '   ( PI.IDPESSOA           = 1 ) AND'
      '   ( PI.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) AND'
      '   ( PI.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) AND'
      '   ( ITC.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) AND'
      '   ( ITC.IDITEMEMPTMO      = ITE.IDITEMEMPTMO ) AND'
      '   ( TC.IDTIPOEMPTMO       = TE.IDTIPOEMPTMO ) AND'
      '   ( PI.IDPATRO            = PAT.IDPATRO(+) ) AND'
      '   ( PI.IDPLANOPREV        = PLP.IDPLANOPREV(+) ) AND'
      '   ( PI.UNIDNEGOC          = UD.UNIDNEGOC(+) ) AND'
      
        '   ( ((:pTIPOCONTREMPTMO IS NOT NULL) AND (:pTIPOCONTREMPTMO IS ' +
        'NOT NULL) AND'
      '      (PI.IDTIPOCONTREMPTMO = :pTIPOCONTREMPTMO))'
      '         OR'
      
        '     ((:pTIPOEMPTMO IS NOT NULL) AND (:pTIPOCONTREMPTMO IS NULL)' +
        ' AND (PI.IDTIPOEMPTMO = :pTIPOEMPTMO))'
      '         OR'
      
        '     ((:pTIPOEMPTMO IS NULL) AND (:pTIPOCONTREMPTMO IS NULL) ) )' +
        ' AND'
      ''
      
        '   ( ((:pITEMEMPTMO IS NOT NULL) AND (PI.IDITEMEMPTMO = :pITEMEM' +
        'PTMO)) OR'
      '      (:pITEMEMPTMO IS NULL) )'
      ''
      'ORDER BY'
      
        '   ITC.IDTIPOCONTREMPTMO, ITC.ITCEVENTO, PI.IDITEMEMPTMO, PI.IDP' +
        'LANOPREV, PI.IDPATRO')
    ValidateWithMask = True
    Left = 106
    Top = 82
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pTIPOCONTREMPTMO'
        ParamType = ptInput
        Value = '21'
      end
      item
        DataType = ftInteger
        Name = 'pTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pTIPOEMPTMO'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'pTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pITEMEMPTMO'
        ParamType = ptInput
        Value = '10'
      end
      item
        DataType = ftInteger
        Name = 'pITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'pITEMEMPTMO'
        ParamType = ptInput
      end>
    object qryParamFinITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCEVENTO'
    end
    object qryParamFinDESCR_CONTRATO: TStringField
      FieldName = 'DESCR_CONTRATO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryParamFinDESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryParamFinIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDTIPOCONTREMPTMO'
    end
    object qryParamFinIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPATRO'
    end
    object qryParamFinIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPLANOPREV'
    end
    object qryParamFinRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryParamFinCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object qryParamFinRUBRICAN: TFloatField
      FieldName = 'RUBRICAN'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTON'
    end
    object qryParamFinRUBRICAD: TFloatField
      FieldName = 'RUBRICAD'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOD'
    end
    object qryParamFinRUBRICAA: TFloatField
      FieldName = 'RUBRICAA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOA'
    end
    object qryParamFinIDREGRACALC: TFloatField
      FieldName = 'IDREGRACALC'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDREGRACALC'
    end
    object qryParamFinCRED_APROPRIACAO: TStringField
      FieldName = 'CRED_APROPRIACAO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFINAN'
      FixedChar = True
      Size = 18
    end
    object qryParamFinDEB_APROPRIACAO: TStringField
      FieldName = 'DEB_APROPRIACAO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFINAN'
      FixedChar = True
      Size = 18
    end
    object qryParamFinCRED_PATRO: TStringField
      FieldName = 'CRED_PATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFOLHA'
      FixedChar = True
      Size = 18
    end
    object qryParamFinDEB_PATRO: TStringField
      FieldName = 'DEB_PATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFOLHA'
      FixedChar = True
      Size = 18
    end
    object qryParamFinTIPORECDESFINAN: TStringField
      FieldName = 'TIPORECDESFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFINAN'
      FixedChar = True
      Size = 15
    end
    object qryParamFinTIPORECDESFOLHA: TStringField
      FieldName = 'TIPORECDESFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFOLHA'
      FixedChar = True
      Size = 15
    end
    object qryParamFinUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.UNIDNEGOC'
    end
    object qryParamFinNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryParamFinNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryParamFinNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryParamFinIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
  end
  object rptParamFin: TppReport
    AutoStop = False
    DataPipeline = pplParamFin
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Parametros Financeiros'
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
    Template.FileName = 'C:\ProjetosCM5\Emprestimo\Relatórios\Parametrização 2.rtm'
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptParamFinBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 328
    Top = 81
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplParamFin'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20108
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 15610
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'EP - Parametrização Financeira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 110596
        mmTop = 8731
        mmWidth = 62971
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'CBS Previdência'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 122767
        mmTop = 1588
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 31221
        mmTop = 16140
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label8'
        Caption = 'Integração com Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 200819
        mmTop = 16140
        mmWidth = 35190
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label9'
        Caption = 'Regra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 262467
        mmTop = 16140
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Tipo Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 174890
        mmTop = 16140
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label12'
        Caption = 'Rubricas         '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 243682
        mmTop = 16140
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label20'
        Caption = 'Tipo de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 16140
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label3'
        Caption = 'Integração Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 143669
        mmTop = 16140
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Plano / Patrocinadora / Atividade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 63765
        mmTop = 16140
        mmWidth = 77788
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object rptParamFinShapeDet: TppShape
        OnPrint = rptParamFinShapeDetPrint
        UserName = 'rptParamFinShapeDet'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 12435
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCR_ITEM'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 9790
        mmLeft = 30956
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
      object ppDBCCApropDebito: TppDBText
        UserName = 'DBCCApropDebito'
        DataField = 'DEB_APROPRIACAO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBCCApropCredito: TppDBText
        UserName = 'DBCCApropCredito'
        DataField = 'CRED_APROPRIACAO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 3440
        mmWidth = 15610
        BandType = 4
      end
      object ppDBCCPatroDeb: TppDBText
        UserName = 'DBCCPatroDeb'
        DataField = 'DEB_PATRO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBCCPatroCred: TppDBText
        UserName = 'DBCCPatroCred'
        DataField = 'CRED_PATRO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 3440
        mmWidth = 17198
        BandType = 4
      end
      object ppDBCCBaixa: TppDBText
        UserName = 'DBCCBaixa'
        DataField = 'CONTABAIXA'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 6879
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'IDREGRACALC'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 2910
        mmLeft = 262996
        mmTop = 0
        mmWidth = 6615
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'RECPAG'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 174890
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'RUBRICAN'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 253207
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'RUBRICAA'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 253207
        mmTop = 3440
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'RUBRICAD'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 253207
        mmTop = 6879
        mmWidth = 8996
        BandType = 4
      end
      object ppDBTPDesRecFinan: TppDBText
        UserName = 'DBTPDesRecFinan'
        DataField = 'TIPORECDESFINAN'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 179123
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBTPDesRecFolha: TppDBText
        UserName = 'DBTPDesRecFolha'
        DataField = 'TIPORECDESFOLHA'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 6879
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NOME'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 2910
        mmLeft = 81227
        mmTop = 6879
        mmWidth = 60590
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'NOMEPATRO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 2910
        mmLeft = 81227
        mmTop = 0
        mmWidth = 60590
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'NOMEPLANO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 2910
        mmLeft = 81227
        mmTop = 3440
        mmWidth = 60590
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 143669
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 143669
        mmTop = 3440
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label6'
        Caption = 'Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 143669
        mmTop = 6879
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label4'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 200819
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label5'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 200819
        mmTop = 3440
        mmWidth = 8731
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label7'
        Caption = 'Tp Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 200819
        mmTop = 6879
        mmWidth = 18256
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label13'
        Caption = 'Atraso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 243682
        mmTop = 3440
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label17'
        Caption = 'Devol.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 243682
        mmTop = 6879
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label10'
        Caption = 'Normal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 243682
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label18'
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 63765
        mmTop = 3440
        mmWidth = 6615
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label19'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 63765
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = 'Ativ / Proj'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 63765
        mmTop = 6879
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCR_CONTRATO'
        DataPipeline = pplParamFin
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'pplParamFin'
        mmHeight = 9790
        mmLeft = 265
        mmTop = 0
        mmWidth = 28839
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 116946
        mmTop = 3175
        mmWidth = 50536
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 233892
        mmTop = 3175
        mmWidth = 35719
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 3175
        mmWidth = 74348
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
    end
  end
  object dtpParamFin: TDataSetProvider
    DataSet = qryParamFin
    Constraints = True
    Left = 110
    Top = 144
  end
  object cdsParamFin: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpParamFin'
    Left = 184
    Top = 144
    object cdsParamFinITCEVENTO: TFloatField
      FieldName = 'ITCEVENTO'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.ITCEVENTO'
    end
    object cdsParamFinDESCR_CONTRATO: TStringField
      FieldName = 'DESCR_CONTRATO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object cdsParamFinDESCR_ITEM: TStringField
      FieldName = 'DESCR_ITEM'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object cdsParamFinIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDTIPOCONTREMPTMO'
    end
    object cdsParamFinIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPATRO'
    end
    object cdsParamFinIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.IDPLANOPREV'
    end
    object cdsParamFinRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.RECPAG'
      FixedChar = True
      Size = 1
    end
    object cdsParamFinCONTABAIXA: TStringField
      FieldName = 'CONTABAIXA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.CONTABAIXA'
      FixedChar = True
      Size = 18
    end
    object cdsParamFinRUBRICAN: TFloatField
      FieldName = 'RUBRICAN'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTON'
    end
    object cdsParamFinRUBRICAD: TFloatField
      FieldName = 'RUBRICAD'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOD'
    end
    object cdsParamFinRUBRICAA: TFloatField
      FieldName = 'RUBRICAA'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDPROVENTOA'
    end
    object cdsParamFinIDREGRACALC: TFloatField
      FieldName = 'IDREGRACALC'
      Origin = 'BASEDADOS.ITEMXTIPOCONTR.IDREGRACALC'
    end
    object cdsParamFinCRED_APROPRIACAO: TStringField
      FieldName = 'CRED_APROPRIACAO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFINAN'
      FixedChar = True
      Size = 18
    end
    object cdsParamFinDEB_APROPRIACAO: TStringField
      FieldName = 'DEB_APROPRIACAO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFINAN'
      FixedChar = True
      Size = 18
    end
    object cdsParamFinCRED_PATRO: TStringField
      FieldName = 'CRED_PATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCCREDFOLHA'
      FixedChar = True
      Size = 18
    end
    object cdsParamFinDEB_PATRO: TStringField
      FieldName = 'DEB_PATRO'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.CCDEBFOLHA'
      FixedChar = True
      Size = 18
    end
    object cdsParamFinTIPORECDESFINAN: TStringField
      FieldName = 'TIPORECDESFINAN'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFINAN'
      FixedChar = True
      Size = 15
    end
    object cdsParamFinTIPORECDESFOLHA: TStringField
      FieldName = 'TIPORECDESFOLHA'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.TIPORECDESFOLHA'
      FixedChar = True
      Size = 15
    end
    object cdsParamFinUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PARAMINTEGRAEP.UNIDNEGOC'
    end
    object cdsParamFinNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.UNIDNEGOCIO.NOME'
      Size = 25
    end
    object cdsParamFinNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object cdsParamFinNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object cdsParamFinIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
  end
  object adoqryParamFin: TADOQuery
    Parameters = <>
    Left = 28
    Top = 144
  end
end
