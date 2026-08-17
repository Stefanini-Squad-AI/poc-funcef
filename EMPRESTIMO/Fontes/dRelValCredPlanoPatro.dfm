inherited dtmRelValCredPlanoPatro: TdtmRelValCredPlanoPatro
  Left = 433
  Top = 256
  Width = 270
  Height = 164
  Caption = 'dtmRelValCredPlanoPatro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 40
    object pplExemploppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
  inherited dsExemplo: TwwDataSource
    Left = 56
    Top = 60
  end
  inherited qryExemplo: TwwQuery
    Left = 56
    Top = 88
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryValCredPlanoPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   PLA.NOME AS PLANO,'
      '   PAT.NOME AS PATRO,'
      '   PLA.NOME || '#39' - '#39' || PAT.NOME AS PLANO_PATRO,'
      '   CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,'
      '   TCE.TCEDESCRICAO,'
      '   CON.FLGFORMAPAG,'
      
        '   DECODE(CON.FLGFORMAPAG, '#39'F'#39', '#39'Folha'#39', '#39'C'#39', '#39'Banco'#39', '#39' '#39') AS D' +
        'ESCFORMAPAG,'
      '   CON.DATACREDITO, CON.PORTFORMAPAG, CON.CODFORMAPAG,'
      '   BAN.NUMBANCO, AGE.NUMAGENCIA, CBA.CONTACORRENTE,'
      '   PFO.DESCRICAO AS PORTADOR_FORMA,'
      '   FRP.DESCRICAO AS FORMA,'
      '   DECODE(HME.FLGBAIXADO, NULL, '#39'Sim'#39', NULL) AS PAGO,'
      ''
      
        '   DECODE(HME.HMETIPOMOV, 0, DECODE(NVL(INS.FLGINTERNET, 0), 1, ' +
        #39'Auto-Atendimento'#39', '#39'Emprestimo'#39'), '#39'Emprestimo'#39') AS ORIGEM,'
      ''
      
        '   DECODE(HME.HMETIPOMOV, 0, '#39'Concessoes'#39', '#39'Devolucoes'#39') AS EVEN' +
        'TO,'
      ''
      '   ('
      
        '   DECODE(HME.HMETIPOMOV, 0, DECODE(NVL(INS.FLGINTERNET, 0), 1, ' +
        #39'Auto-Atendimento'#39', '#39'Emprestimo'#39'), '#39'Emprestimo'#39')'
      '   || '#39' - '#39' ||'
      '   DECODE(HME.HMETIPOMOV, 0, '#39'Concessoes'#39', '#39'Devolucoes'#39')'
      '   ) AS ORIGEM_EVENTO,'
      ''
      '   HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO,'
      ''
      '   ITE.ITEDESCRICAO, USU.NOMEUSUARIO,'
      '   PI.NOME AS NOMEPERFIL'
      'FROM'
      '   HISTMOVEMPTMO       HME,'
      '   ITEMEMPTMO          ITE,'
      '   CONTABANCARIA       CBA,'
      '   AGENCIABANCARIA     AGE,'
      '   BANCO               BAN,'
      '   FORMARECPAG         FRP,'
      '   PESSOA              PAT,'
      '   PESSOA              MUT,'
      '   DEPENTIT            DEP,'
      '   TIPOCONTREMPTMO     TCE,'
      '   TIPOEMPTMO          TEP,'
      '   PLANPREVXCONTABIL   PXC,'
      '   PLANPREVCONTABIL    PLA,'
      ''
      '   CONTRATOEMPTMO      CON,'
      '   INSCRICAOEMPTMO     INS,'
      ''
      '   PORTADORFORMA       PFO,'
      
        '   (SELECT TO_CHAR(IDUSUARIO) AS IDUSUARIO, NOMEUSUARIO FROM USU' +
        'ARIOSISTEMA) USU,'
      '   PERFILINVEST PI'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP        = 1'
      ''
      '   and 1 = 2'
      ''
      
        '   AND HME.HMEDATAVENCTO        BETWEEN TO_DATE('#39'13/01/2006'#39','#39'DD' +
        '/MM/YYYY'#39') AND TO_DATE('#39'13/01/2006'#39','#39'DD/MM/YYYY'#39')'
      ''
      '   AND HME.HMERECPAG            = '#39'P'#39
      '   AND CON.FLGSITUACAO         <> '#39'C'#39
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGABONADO, 0)   = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      '   AND HME.HMEFORMACOBRANCA     IN ('#39'C'#39')'
      ''
      '   AND CON.IDCBANCARIA          = CBA.IDCBANCARIA(+)'
      '   AND CBA.IDAGENCIA            = AGE.IDPESSOA(+)'
      '   AND AGE.IDBANCO              = BAN.IDPESSOA(+)'
      '   AND CON.PORTFORMAPAG         = PFO.CODPORTFORMA(+)'
      '   AND CON.CODFORMAPAG          = FRP.CODFORMA(+)'
      '   AND CON.IDPATRO              = PAT.IDPESSOA'
      '   AND CON.IDPLANOORIGEM        = PXC.IDPLANPREVC'
      '   AND PXC.IDPLANOPREV          = PLA.IDPLANOPREV'
      ''
      '   AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO'
      '   AND CON.IDINSCRICAOEMPTMO    = INS.IDINSCRICAOEMPTMO'
      '   AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO'
      ''
      '   AND ( SUBSTR(HME.TRGUSERINCLUSAO, 3, 18) = USU.IDUSUARIO(+) )'
      ''
      '   AND CON.IDBENEF              = MUT.IDPESSOA'
      '   AND CON.IDBENEF              = DEP.IDPESSOA'
      '   AND CON.IDPESSOA             = DEP.IDTITULAR'
      '   AND CON.IDTIPOCONTREMPTMO    = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO         = TEP.IDTIPOEMPTMO'
      '   AND CON.IDPERFILINVEST       = PI.IDPERFILINVEST(+)'
      ''
      'ORDER BY'
      '   CON.FLGFORMAPAG, CON.DATACREDITO, PLA.NOME, PAT.NOME,'
      
        '   DECODE(HME.HMETIPOMOV, 0, DECODE(NVL(INS.FLGINTERNET, 0), 1, ' +
        #39'Auto-Atendimento'#39', '#39'Emprestimo'#39'), '#39'Emprestimo'#39'),'
      '   DECODE(HME.HMETIPOMOV, 0, '#39'Concessoes'#39', '#39'Devolucoes'#39'),'
      '   MUT.NOME')
    ValidateWithMask = True
    Left = 168
    Top = 80
    object qryValCredPlanoPatroPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryValCredPlanoPatroPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryValCredPlanoPatroPLANO_PATRO: TStringField
      FieldName = 'PLANO_PATRO'
      Size = 113
    end
    object qryValCredPlanoPatroIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryValCredPlanoPatroMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryValCredPlanoPatroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryValCredPlanoPatroTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryValCredPlanoPatroFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryValCredPlanoPatroDESCFORMAPAG: TStringField
      FieldName = 'DESCFORMAPAG'
      Size = 5
    end
    object qryValCredPlanoPatroDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryValCredPlanoPatroPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryValCredPlanoPatroCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryValCredPlanoPatroNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryValCredPlanoPatroNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryValCredPlanoPatroCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryValCredPlanoPatroPORTADOR_FORMA: TStringField
      FieldName = 'PORTADOR_FORMA'
      Size = 50
    end
    object qryValCredPlanoPatroFORMA: TStringField
      FieldName = 'FORMA'
      Size = 30
    end
    object qryValCredPlanoPatroPAGO: TStringField
      FieldName = 'PAGO'
      Size = 3
    end
    object qryValCredPlanoPatroORIGEM: TStringField
      FieldName = 'ORIGEM'
      Size = 16
    end
    object qryValCredPlanoPatroEVENTO: TStringField
      FieldName = 'EVENTO'
      Size = 10
    end
    object qryValCredPlanoPatroORIGEM_EVENTO: TStringField
      FieldName = 'ORIGEM_EVENTO'
      Size = 29
    end
    object qryValCredPlanoPatroHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryValCredPlanoPatroHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryValCredPlanoPatroITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryValCredPlanoPatroNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object qryValCredPlanoPatroNOMEPERFIL: TStringField
      FieldName = 'NOMEPERFIL'
      Size = 60
    end
  end
  object pplValCredPlanoPatro: TppBDEPipeline
    DataSource = dtsValCredPlanoPatro
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lValCredPlanoPatro'
    Left = 136
    Top = 36
    object pplValCredPlanoPatroppField1: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplValCredPlanoPatroppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplValCredPlanoPatroppField3: TppField
      FieldAlias = 'PLANO_PATRO'
      FieldName = 'PLANO_PATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 2
    end
    object pplValCredPlanoPatroppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplValCredPlanoPatroppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object pplValCredPlanoPatroppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplValCredPlanoPatroppField7: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplValCredPlanoPatroppField8: TppField
      FieldAlias = 'FLGFORMAPAG'
      FieldName = 'FLGFORMAPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object pplValCredPlanoPatroppField9: TppField
      FieldAlias = 'DESCFORMAPAG'
      FieldName = 'DESCFORMAPAG'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object pplValCredPlanoPatroppField10: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplValCredPlanoPatroppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PORTFORMAPAG'
      FieldName = 'PORTFORMAPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplValCredPlanoPatroppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODFORMAPAG'
      FieldName = 'CODFORMAPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplValCredPlanoPatroppField13: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object pplValCredPlanoPatroppField14: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object pplValCredPlanoPatroppField15: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 14
    end
    object pplValCredPlanoPatroppField16: TppField
      FieldAlias = 'PORTADOR_FORMA'
      FieldName = 'PORTADOR_FORMA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
    object pplValCredPlanoPatroppField17: TppField
      FieldAlias = 'FORMA'
      FieldName = 'FORMA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object pplValCredPlanoPatroppField18: TppField
      FieldAlias = 'PAGO'
      FieldName = 'PAGO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 17
    end
    object pplValCredPlanoPatroppField19: TppField
      FieldAlias = 'ORIGEM'
      FieldName = 'ORIGEM'
      FieldLength = 16
      DisplayWidth = 16
      Position = 18
    end
    object pplValCredPlanoPatroppField20: TppField
      FieldAlias = 'EVENTO'
      FieldName = 'EVENTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object pplValCredPlanoPatroppField21: TppField
      FieldAlias = 'ORIGEM_EVENTO'
      FieldName = 'ORIGEM_EVENTO'
      FieldLength = 29
      DisplayWidth = 29
      Position = 20
    end
    object pplValCredPlanoPatroppField22: TppField
      FieldAlias = 'HMEDATAVENCTO'
      FieldName = 'HMEDATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object pplValCredPlanoPatroppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplValCredPlanoPatroppField24: TppField
      FieldAlias = 'ITEDESCRICAO'
      FieldName = 'ITEDESCRICAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 23
    end
    object pplValCredPlanoPatroppField25: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object pplValCredPlanoPatroppField26: TppField
      FieldAlias = 'NOMEPERFIL'
      FieldName = 'NOMEPERFIL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 25
    end
  end
  object dtsValCredPlanoPatro: TwwDataSource
    DataSet = qryValCredPlanoPatro
    Left = 168
    Top = 48
  end
  object rptValCredPlanoPatro: TppReport
    AutoStop = False
    DataPipeline = pplValCredPlanoPatro
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EP - Valores a Creditar'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplValCredPlanoPatro'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores a Creditar - por Plano e Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 43392
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1588
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Período de Datas:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 19579
        mmWidth = 25665
        BandType = 0
      end
      object rptValCred_lblDataIni: TppLabel
        UserName = 'rptValCred_lblDataIni'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 19579
        mmWidth = 13758
        BandType = 0
      end
      object rptValCred_lblDataFim: TppLabel
        UserName = 'rptValCred_DataIni1'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 49477
        mmTop = 19579
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label9'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43921
        mmTop = 19579
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Forma de Crédito:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 23813
        mmWidth = 26194
        BandType = 0
      end
      object rptValCred_lblFormaCred: TppLabel
        UserName = 'rptValCred_DataIni2'
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 29104
        mmTop = 23813
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape1: TppShape
        OnPrint = ppShape1Print
        UserName = 'Shape1'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 283770
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 283770
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2498
        mmLeft = 144727
        mmTop = 794
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2381
        mmLeft = 0
        mmTop = 794
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOME'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2498
        mmLeft = 30427
        mmTop = 794
        mmWidth = 43392
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MATRICULA'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2381
        mmLeft = 18785
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplValCredPlanoPatro
        DisplayFormat = '###,##0.00 '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2381
        mmLeft = 196586
        mmTop = 794
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NUMAGENCIA'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2498
        mmLeft = 175684
        mmTop = 794
        mmWidth = 8467
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMBANCO'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2498
        mmLeft = 169069
        mmTop = 794
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CONTACORRENTE'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2498
        mmLeft = 184680
        mmTop = 794
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'PAGO'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2582
        mmLeft = 214578
        mmTop = 794
        mmWidth = 6011
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2498
        mmLeft = 74877
        mmTop = 794
        mmWidth = 69056
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'NOMEUSUARIO'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2582
        mmLeft = 221721
        mmTop = 794
        mmWidth = 15960
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'NOMEPERFIL'
        DataPipeline = pplValCredPlanoPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplValCredPlanoPatro'
        mmHeight = 2582
        mmLeft = 243682
        mmTop = 794
        mmWidth = 13801
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 529
        mmWidth = 283770
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 23019
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 1852
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 257440
        mmTop = 1852
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'HMEDATAVENCTO'
      DataPipeline = pplValCredPlanoPatro
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'HMEDATAVENCTO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 3175
          mmLeft = 268023
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Data do Crédito:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 243153
          mmTop = 1323
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppShape8: TppShape
          UserName = 'Shape8'
          Brush.Color = 15263976
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 9260
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 13758
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplValCredPlanoPatro
          DisplayFormat = '#,#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 3175
          mmLeft = 4233
          mmTop = 2910
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Itens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23283
          mmTop = 2910
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          Brush.Color = 15263976
          mmHeight = 5027
          mmLeft = 179388
          mmTop = 2117
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Total:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 180975
          mmTop = 2910
          mmWidth = 10583
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCredPlanoPatro
          DisplayFormat = '###,##0.00 '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2498
          mmLeft = 192352
          mmTop = 3175
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'HMEDATAVENCTO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2582
          mmLeft = 216430
          mmTop = 2910
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PLANO'
      DataPipeline = pplValCredPlanoPatro
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'PLANO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2910
          mmLeft = 529
          mmTop = 2117
          mmWidth = 75671
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplValCredPlanoPatro
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          ReprintOnOverFlow = True
          mmHeight = 9790
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 2
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 198173
          mmTop = 5292
          mmWidth = 43656
          BandType = 3
          GroupNo = 2
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Valor Crédito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 247650
          mmTop = 5821
          mmWidth = 15346
          BandType = 3
          GroupNo = 2
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Bco.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 198173
          mmTop = 5821
          mmWidth = 5292
          BandType = 3
          GroupNo = 2
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Conta Corrente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 216165
          mmTop = 5821
          mmWidth = 17992
          BandType = 3
          GroupNo = 2
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Ag.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 205582
          mmTop = 5821
          mmWidth = 3704
          BandType = 3
          GroupNo = 2
        end
        object ppLabel28: TppLabel
          UserName = 'Label201'
          Caption = 'Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 270140
          mmTop = 5821
          mmWidth = 6085
          BandType = 3
          GroupNo = 2
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Dados Bancários'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 210873
          mmTop = 1852
          mmWidth = 20108
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Mutuário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 42333
          mmTop = 5821
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 24342
          mmTop = 5821
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 12171
          mmTop = 5821
          mmWidth = 10319
          BandType = 3
          GroupNo = 2
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'PLANO_PATRO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2910
          mmLeft = 3175
          mmTop = 1323
          mmWidth = 75671
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Item de Empréstimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 156104
          mmTop = 5821
          mmWidth = 23548
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape7'
          Brush.Color = 15263976
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8202
          mmLeft = 0
          mmTop = 265
          mmWidth = 283770
          BandType = 5
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 13758
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 2
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = 15263976
          mmHeight = 5027
          mmLeft = 179388
          mmTop = 1588
          mmWidth = 34396
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplValCredPlanoPatro
          DisplayFormat = '#,#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 3175
          mmLeft = 4233
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Itens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 23283
          mmTop = 2381
          mmWidth = 6350
          BandType = 5
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Total:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 180711
          mmTop = 2381
          mmWidth = 10583
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCredPlanoPatro
          DisplayFormat = '###,##0.00 '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2498
          mmLeft = 192088
          mmTop = 2646
          mmWidth = 20638
          BandType = 5
          GroupNo = 2
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'PLANO_PATRO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 3387
          mmLeft = 156104
          mmTop = 2381
          mmWidth = 20659
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLANO_PATRO'
      DataPipeline = pplValCredPlanoPatro
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText15: TppDBText
          UserName = 'DBText101'
          DataField = 'PLANO_PATRO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 3969
          mmLeft = 529
          mmTop = 3175
          mmWidth = 75671
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'ORIGEM'
      DataPipeline = pplValCredPlanoPatro
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'ORIGEM'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2879
          mmLeft = 529
          mmTop = 2117
          mmWidth = 9864
          BandType = 3
          GroupNo = 4
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'EVENTO'
      DataPipeline = pplValCredPlanoPatro
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'EVENTO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2921
          mmLeft = 529
          mmTop = 2117
          mmWidth = 10075
          BandType = 3
          GroupNo = 5
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'ORIGEM_EVENTO'
      DataPipeline = pplValCredPlanoPatro
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCredPlanoPatro'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand7BeforePrint
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          ReprintOnOverFlow = True
          mmHeight = 9790
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 3
          GroupNo = 6
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 3704
          mmLeft = 168011
          mmTop = 5821
          mmWidth = 26458
          BandType = 3
          GroupNo = 6
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 18785
          mmTop = 6350
          mmWidth = 10848
          BandType = 3
          GroupNo = 6
        end
        object ppLabel11: TppLabel
          UserName = 'Label3'
          Caption = 'Mutuário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 30427
          mmTop = 6350
          mmWidth = 10583
          BandType = 3
          GroupNo = 6
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Bco.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 169069
          mmTop = 6350
          mmWidth = 5821
          BandType = 3
          GroupNo = 6
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Ag.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 175684
          mmTop = 6350
          mmWidth = 5027
          BandType = 3
          GroupNo = 6
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Dados Bancários'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 171450
          mmTop = 2646
          mmWidth = 20108
          BandType = 3
          GroupNo = 6
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Conta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 184415
          mmTop = 6350
          mmWidth = 6900
          BandType = 3
          GroupNo = 6
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Valor Crédito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 196586
          mmTop = 6350
          mmWidth = 16669
          BandType = 3
          GroupNo = 6
        end
        object ppLabel9: TppLabel
          UserName = 'Label2'
          Caption = 'Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 7144
          mmTop = 6350
          mmWidth = 10319
          BandType = 3
          GroupNo = 6
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 213784
          mmTop = 6350
          mmWidth = 7408
          BandType = 3
          GroupNo = 6
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'ORIGEM_EVENTO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2921
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 21421
          BandType = 3
          GroupNo = 6
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Tipo de Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 74877
          mmTop = 6350
          mmWidth = 19844
          BandType = 3
          GroupNo = 6
        end
        object ppLabel30: TppLabel
          UserName = 'Label202'
          Caption = 'Item de Empréstimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 144727
          mmTop = 6350
          mmWidth = 22490
          BandType = 3
          GroupNo = 6
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Usuário Sistema'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 221721
          mmTop = 6350
          mmWidth = 20638
          BandType = 3
          GroupNo = 6
        end
        object ppLabel34: TppLabel
          UserName = 'Label4'
          Caption = 'Perfil de Investimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 243417
          mmTop = 6085
          mmWidth = 26988
          BandType = 3
          GroupNo = 6
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand7BeforePrint
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppShape10: TppShape
          UserName = 'Shape10'
          Brush.Color = 15263976
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8202
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 6
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 13758
          mmLeft = 0
          mmTop = 0
          mmWidth = 283770
          BandType = 5
          GroupNo = 6
        end
        object ppShape9: TppShape
          UserName = 'Shape9'
          Brush.Color = 15263976
          mmHeight = 5027
          mmLeft = 179917
          mmTop = 1588
          mmWidth = 33867
          BandType = 5
          GroupNo = 6
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          AutoSize = False
          Caption = 'Total:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 181505
          mmTop = 2381
          mmWidth = 10583
          BandType = 5
          GroupNo = 6
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCredPlanoPatro
          DisplayFormat = '###,##0.00 '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 2498
          mmLeft = 192617
          mmTop = 2646
          mmWidth = 20373
          BandType = 5
          GroupNo = 6
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          AutoSize = True
          DataField = 'ORIGEM_EVENTO'
          DataPipeline = pplValCredPlanoPatro
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCredPlanoPatro'
          mmHeight = 3387
          mmLeft = 152929
          mmTop = 2381
          mmWidth = 24723
          BandType = 5
          GroupNo = 6
        end
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
end
