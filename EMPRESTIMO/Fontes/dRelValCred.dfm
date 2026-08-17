inherited dtmRelValCred: TdtmRelValCred
  Left = 449
  Top = 279
  Width = 285
  Height = 203
  Caption = 'dtmRelValCred'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
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
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryValCred: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FLGFORMAPAG,'
      
        '   DECODE(FLGFORMAPAG, '#39'F'#39', '#39'Folha'#39', '#39'Financeiro'#39') AS DESCFORMAP' +
        'AG,'
      '   CON.DATACREDITO,'
      '   CON.IDBENEF, CON.IDPESSOA,'
      '   CON.NOME,'
      '   CON.PORTFORMAPAG,'
      '   CON.CODFORMAPAG,'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.MATRICULA,'
      '   PFO.DESCRICAO AS PORTADOR_FORMA,'
      '   FRP.DESCRICAO AS FORMA,'
      '   BAN.NUMBANCO,'
      '   AGE.NUMAGENCIA,'
      '   CBA.CONTACORRENTE,'
      '   HME.HMEDATAVENCTO, HME.HMEVLRPREVISTO,'
      '   DECODE(HME.FLGENVIO, NULL, '#39'Sim'#39', NULL) AS ENVIADO,'
      '   DECODE(FLGBAIXADO, NULL, '#39'Sim'#39', NULL) AS PAGO'
      'FROM'
      '   HISTMOVEMPTMO     HME,'
      '   VWCONTRATOEP      CON,'
      '   CONTABANCARIA     CBA,'
      '   AGENCIABANCARIA   AGE,'
      '   BANCO             BAN,'
      '   FORMARECPAG       FRP,'
      '   PORTADORFORMA     PFO'
      'WHERE'
      '       ( CON.IDCONTRATOEMPTMO    = 44994 )'
      '   AND ( HME.HMECENTRALIZA       = 1 )'
      '   AND ( HME.HMETIPOMOV          = 0 )'
      '   AND ( CON.IDCBANCARIA         = CBA.IDCBANCARIA(+) )'
      '   AND ( CBA.IDAGENCIA           = AGE.IDPESSOA(+) )'
      '   AND ( AGE.IDBANCO             = BAN.IDPESSOA(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO    = HME.IDCONTRATOEMPTMO )'
      '   AND ( CON.PORTFORMAPAG        = PFO.CODPORTFORMA(+) )'
      '   AND ( CON.CODFORMAPAG         = FRP.CODFORMA(+) )'
      'ORDER BY'
      
        '   FLGFORMAPAG, DATACREDITO, CON.PORTFORMAPAG, CON.CODFORMAPAG, ' +
        'CON.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 208
    Top = 56
    object qryValCredFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      Size = 18
    end
    object qryValCredDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryValCredPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryValCredCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryValCredIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryValCredMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryValCredNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryValCredNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryValCredCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryValCredHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryValCredNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryValCredDESCFORMAPAG: TStringField
      FieldName = 'DESCFORMAPAG'
      Size = 10
    end
    object qryValCredPORTADOR_FORMA: TStringField
      FieldName = 'PORTADOR_FORMA'
      Size = 50
    end
    object qryValCredFORMA: TStringField
      FieldName = 'FORMA'
      Size = 30
    end
    object qryValCredPAGO: TStringField
      FieldName = 'PAGO'
      Size = 3
    end
    object qryValCredHMEDATAVENCTO: TDateTimeField
      FieldName = 'HMEDATAVENCTO'
    end
    object qryValCredENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 3
    end
    object qryValCredIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryValCredIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object pplValCred: TppBDEPipeline
    DataSource = dtsValCred
    CloseDataSource = True
    UserName = 'lValCred'
    Left = 208
    Top = 68
    object pplValCredppField1: TppField
      FieldAlias = 'FLGFORMAPAG'
      FieldName = 'FLGFORMAPAG'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplValCredppField2: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object pplValCredppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PORTFORMAPAG'
      FieldName = 'PORTFORMAPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplValCredppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODFORMAPAG'
      FieldName = 'CODFORMAPAG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplValCredppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplValCredppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
    object pplValCredppField7: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplValCredppField8: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object pplValCredppField9: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 8
    end
    object pplValCredppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplValCredppField11: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object pplValCredppField12: TppField
      FieldAlias = 'DESCFORMAPAG'
      FieldName = 'DESCFORMAPAG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object pplValCredppField13: TppField
      FieldAlias = 'PORTADOR_FORMA'
      FieldName = 'PORTADOR_FORMA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object pplValCredppField14: TppField
      FieldAlias = 'FORMA'
      FieldName = 'FORMA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object pplValCredppField15: TppField
      FieldAlias = 'PAGO'
      FieldName = 'PAGO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 14
    end
    object pplValCredppField16: TppField
      FieldAlias = 'HMEDATAVENCTO'
      FieldName = 'HMEDATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object pplValCredppField17: TppField
      FieldAlias = 'ENVIADO'
      FieldName = 'ENVIADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 16
    end
    object pplValCredppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEF'
      FieldName = 'IDBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplValCredppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
  end
  object dtsValCred: TwwDataSource
    DataSet = qryValCred
    Left = 208
    Top = 80
  end
  object rptValCred: TppReport
    AutoStop = False
    DataPipeline = pplValCred
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EP - Valores a Creditar'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptValCredBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 104
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplValCred'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 45773
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores a Creditar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
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
        mmLeft = 0
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
        mmTop = 18521
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
        mmTop = 18521
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
        mmTop = 18521
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
        mmTop = 18521
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
        mmTop = 22754
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
        mmTop = 22754
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 33867
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 114300
        mmTop = 33867
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 41275
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 33867
        mmWidth = 76200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 127794
        mmTop = 33867
        mmWidth = 69056
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 41275
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 28840
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 105040
        mmTop = 28840
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 28840
        mmWidth = 74083
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 127794
        mmTop = 28840
        mmWidth = 68792
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppContratosDuplicados: TppSubReport
        UserName = 'ContratosDuplicados'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplContratosDuplicados'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplContratosDuplicados
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'EP - Valores a Creditar'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 13229
          PrinterSetup.mmMarginLeft = 6615
          PrinterSetup.mmMarginRight = 6615
          PrinterSetup.mmMarginTop = 13229
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 136
          Top = 80
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplContratosDuplicados'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 79375
              mmTop = 4763
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label1'
              Caption = 'Situação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 93927
              mmTop = 4763
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Vencimento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 129646
              mmTop = 4763
              mmWidth = 15081
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Enviado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 148961
              mmTop = 4763
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Pago'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 161661
              mmTop = 4763
              mmWidth = 6615
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplContratosDuplicados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplContratosDuplicados'
              mmHeight = 3175
              mmLeft = 64029
              mmTop = 0
              mmWidth = 26194
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'FLGSITUACAO'
              DataPipeline = pplContratosDuplicados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContratosDuplicados'
              mmHeight = 3175
              mmLeft = 93927
              mmTop = 0
              mmWidth = 31750
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'HMEDATAVENCTO'
              DataPipeline = pplContratosDuplicados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContratosDuplicados'
              mmHeight = 3175
              mmLeft = 129646
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'ENVIADO'
              DataPipeline = pplContratosDuplicados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContratosDuplicados'
              mmHeight = 3175
              mmLeft = 148961
              mmTop = 0
              mmWidth = 7673
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'PAGO'
              DataPipeline = pplContratosDuplicados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContratosDuplicados'
              mmHeight = 3175
              mmLeft = 161661
              mmTop = 0
              mmWidth = 7673
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppShape1: TppShape
        OnPrint = ppShape1Print
        UserName = 'Shape1'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 8467
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOME'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 48419
        mmTop = 794
        mmWidth = 64823
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MATRICULA'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 31221
        mmTop = 529
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplValCred
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 160602
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NUMAGENCIA'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMBANCO'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 115094
        mmTop = 794
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CONTACORRENTE'
        DataPipeline = pplValCred
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3175
        mmLeft = 133086
        mmTop = 794
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PAGO'
        DataPipeline = pplValCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 794
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'ENVIADO'
        DataPipeline = pplValCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplValCred'
        mmHeight = 3440
        mmLeft = 181769
        mmTop = 794
        mmWidth = 7673
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
        mmWidth = 196770
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
        mmLeft = 2117
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
        mmLeft = 89429
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
        mmLeft = 169334
        mmTop = 1852
        mmWidth = 25400
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'FLGFORMAPAG'
      DataPipeline = pplValCred
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCred'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 6615
          mmWidth = 196770
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'DESCFORMAPAG'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplValCred'
          mmHeight = 4191
          mmLeft = 0
          mmTop = 2381
          mmWidth = 17780
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 7938
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = 15263976
          Pen.Width = 2
          mmHeight = 5821
          mmLeft = 146844
          mmTop = 1323
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 5292
          mmTop = 2381
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCred
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 158486
          mmTop = 2381
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Itens'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 17992
          mmTop = 2381
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Total:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 148696
          mmTop = 2381
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATACREDITO'
      DataPipeline = pplValCred
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCred'
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
          Pen.Style = psClear
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'HMEDATAVENCTO'
          DataPipeline = pplValCred
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 180711
          mmTop = 1852
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
          mmLeft = 156104
          mmTop = 1852
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Forma de Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 2117
          mmWidth = 28046
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label3'
          Caption = 'Conta de Caixa x Forma de Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 45508
          mmTop = 2117
          mmWidth = 51065
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODFORMAPAG'
      DataPipeline = pplValCred
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCred'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'PORTFORMAPAG'
      DataPipeline = pplValCred
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplValCred'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 7408
          mmLeft = 0
          mmTop = 529
          mmWidth = 196770
          BandType = 3
          GroupNo = 3
        end
        object ppDBText14: TppDBText
          UserName = 'DBText101'
          DataField = 'PORTADOR_FORMA'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 45508
          mmTop = 0
          mmWidth = 80433
          BandType = 3
          GroupNo = 3
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 31485
          mmTop = 3969
          mmWidth = 12435
          BandType = 3
          GroupNo = 3
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 115094
          mmTop = 3704
          mmWidth = 43656
          BandType = 3
          GroupNo = 3
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Contrato'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 18521
          mmTop = 4233
          mmWidth = 11642
          BandType = 3
          GroupNo = 3
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Mutuário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 49213
          mmTop = 3969
          mmWidth = 11906
          BandType = 3
          GroupNo = 3
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Valor Crédito'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 162454
          mmTop = 4233
          mmWidth = 17463
          BandType = 3
          GroupNo = 3
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Bco.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 115094
          mmTop = 4233
          mmWidth = 5821
          BandType = 3
          GroupNo = 3
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Conta Corrente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 133086
          mmTop = 4233
          mmWidth = 20108
          BandType = 3
          GroupNo = 3
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Ag.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 122502
          mmTop = 4233
          mmWidth = 4498
          BandType = 3
          GroupNo = 3
        end
        object ppLabel28: TppLabel
          UserName = 'Label201'
          Caption = 'Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 190236
          mmTop = 4233
          mmWidth = 6879
          BandType = 3
          GroupNo = 3
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Dados Bancários'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 265
          mmWidth = 22490
          BandType = 3
          GroupNo = 3
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'FORMA'
          DataPipeline = pplValCred
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 44186
          BandType = 3
          GroupNo = 3
        end
        object ppLabel9: TppLabel
          UserName = 'Label4'
          Caption = 'Envio'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 181769
          mmTop = 4233
          mmWidth = 7673
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 5
          GroupNo = 3
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
          mmLeft = 18785
          mmTop = 1588
          mmWidth = 6350
          BandType = 5
          GroupNo = 3
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5027
          mmLeft = 146844
          mmTop = 1588
          mmWidth = 34396
          BandType = 5
          GroupNo = 3
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Total:   '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 148432
          mmTop = 2381
          mmWidth = 10054
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplValCred
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 158486
          mmTop = 2381
          mmWidth = 21431
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplValCred
          DisplayFormat = '#,#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplValCred'
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object qryContratosDuplicados: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDPESSOA,'
      '   CON.IDBENEF,'
      '   DEP.MATRICULA,'
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39','#39'Ativo'#39','
      '                          '#39'P'#39','#39'Pendente'#39','
      '                          '#39'E'#39','#39'Encerrado'#39','
      '                          '#39'K'#39','#39'Em quitação'#39','
      '                          '#39'Q'#39','#39'Quitado'#39','
      '                          '#39'C'#39','#39'Cancelado'#39') AS FLGSITUACAO,'
      '   MUT.NOME,'
      '   CON.DATACREDITO,'
      '   DECODE(HME.FLGBAIXADO, NULL, '#39'Sim'#39', '#39'Não'#39') AS PAGO,'
      '   DECODE(HME.FLGENVIO, NULL, '#39'Sim'#39', '#39'Não'#39') AS ENVIADO,'
      '   HME.HMEDATAVENCTO,'
      '   ABS(HME.HMEVLRPREVISTO) AS HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO       HME,'
      '   PESSOA              MUT,'
      '   DEPENTIT            DEP,'
      '   CONTRATOEMPTMO      CON,'
      '   TIPOEMPTMO          TEP,'
      '   TIPOCONTREMPTMO     TCE'
      'WHERE'
      '       CON.FLGSITUACAO          NOT IN ('#39'C'#39', '#39'Q'#39')'
      '   AND HME.HMEDATAVENCTO        BETWEEN :pDATAINI AND :pDATAFIM'
      '   AND TEP.IDEMPRESAPROP        = :pIDEMPRESA'
      '   and con.idpessoa = 1289254'
      '   and con.idbenef = 1363681'
      '   AND (HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1)'
      '   AND NVL(HME.FLGESTORNADO, 0) = 0'
      '   AND NVL(HME.FLGABONADO, 0)   = 0'
      '   AND NVL(HME.FLGQUITADO, 0)   = 0'
      '   AND HME.HMETIPOMOV           = 0'
      '   AND CON.IDCONTRATOEMPTMO     = HME.IDCONTRATOEMPTMO'
      '   AND CON.IDBENEF              = MUT.IDPESSOA'
      '   AND CON.IDBENEF              = DEP.IDPESSOA'
      '   AND CON.IDPESSOA             = DEP.IDTITULAR'
      '   AND TCE.IDTIPOCONTREMPTMO    = CON.IDTIPOCONTREMPTMO'
      '   AND TEP.IDTIPOEMPTMO         = TCE.IDTIPOEMPTMO'
      '   AND'
      '      EXISTS ('
      '              SELECT CEP.IDCONTRATOEMPTMO'
      '              FROM   CONTRATOEMPTMO CEP'
      '              WHERE'
      '                    CEP.IDBENEF            = CON.IDBENEF'
      '                AND CEP.IDPESSOA           = CON.IDPESSOA'
      
        '                AND CEP.IDCONTRATOEMPTMO  <> CON.IDCONTRATOEMPTM' +
        'O'
      
        '                AND (CEP.IDCONTRQUITACAO   IS NULL OR CEP.IDCONT' +
        'RQUITACAO <> CON.IDCONTRATOEMPTMO)'
      '                AND CEP.FLGSITUACAO        NOT IN ('#39'C'#39', '#39'Q'#39')'
      '             )'
      'ORDER BY'
      '  MUT.NOME'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 112
    Top = 56
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'pDATAINI'
        ParamType = ptInput
        Value = '01/12/2004'
      end
      item
        DataType = ftDateTime
        Name = 'pDATAFIM'
        ParamType = ptInput
        Value = '31/12/2004'
      end
      item
        DataType = ftInteger
        Name = 'pIDEMPRESA'
        ParamType = ptInput
        Value = '2'
      end>
    object qryContratosDuplicadosDATACREDITO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATACREDITO'
    end
    object qryContratosDuplicadosPAGO: TStringField
      DisplayWidth = 3
      FieldName = 'PAGO'
      Size = 3
    end
    object qryContratosDuplicadosENVIADO: TStringField
      DisplayWidth = 3
      FieldName = 'ENVIADO'
      Size = 3
    end
    object qryContratosDuplicadosFLGSITUACAO: TStringField
      DisplayWidth = 11
      FieldName = 'FLGSITUACAO'
      Size = 11
    end
    object qryContratosDuplicadosHMEDATAVENCTO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'HMEDATAVENCTO'
    end
    object qryContratosDuplicadosHMEVLRPREVISTO: TFloatField
      DisplayWidth = 10
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryContratosDuplicadosIDBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEF'
    end
    object qryContratosDuplicadosIDCONTRATOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosDuplicadosIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryContratosDuplicadosMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratosDuplicadosNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
  end
  object pplContratosDuplicados: TppBDEPipeline
    DataSource = dsContratosDuplicados
    SkipWhenNoRecords = False
    UserName = 'pplContratosDuplicados'
    Left = 112
    Top = 92
    MasterDataPipelineName = 'pplValCred'
    object pplContratosDuplicadosppField1: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object pplContratosDuplicadosppField2: TppField
      FieldAlias = 'PAGO'
      FieldName = 'PAGO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object pplContratosDuplicadosppField3: TppField
      FieldAlias = 'ENVIADO'
      FieldName = 'ENVIADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object pplContratosDuplicadosppField4: TppField
      FieldAlias = 'FLGSITUACAO'
      FieldName = 'FLGSITUACAO'
      FieldLength = 11
      DisplayWidth = 11
      Position = 3
    end
    object pplContratosDuplicadosppField5: TppField
      FieldAlias = 'HMEDATAVENCTO'
      FieldName = 'HMEDATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplContratosDuplicadosppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplContratosDuplicadosppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEF'
      FieldName = 'IDBENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplContratosDuplicadosppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplContratosDuplicadosppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplContratosDuplicadosppField10: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object pplContratosDuplicadosppField11: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
  end
  object dsContratosDuplicados: TwwDataSource
    DataSet = qryContratosDuplicados
    Left = 112
    Top = 120
  end
end
