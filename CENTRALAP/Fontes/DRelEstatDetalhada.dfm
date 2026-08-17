inherited dtmRelEstatDetalhada: TdtmRelEstatDetalhada
  Left = 236
  Top = 187
  Width = 440
  Height = 308
  Caption = 'dtmRelEstatDetalhada'
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
  object qryRelaEstat: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryRelaEstatCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT COUNT (AT.IDATEND) AS CONTATEND,'
      '   CID.NOME AS TOPICO,'
      '   '#39'                            '#39'    AS PERCENT,'
      
        '   SUM((DATA - DATAINICIO) * 86400)                        AS TO' +
        'TAL_EM_SEGUNDOS, '
      
        '   SUM((DATA - DATAINICIO) * 86400)/COUNT(AT.IDATEND)      AS ME' +
        'DIA_EM_SEGUNDOS,'
      
        '   SUM((DATA - DATAINICIO) * 86400 / 60)                   AS TO' +
        'TAL_EM_MINUTOS,'
      
        '   SUM((DATA - DATAINICIO) * 86400 / 60)/COUNT(AT.IDATEND) AS ME' +
        'DIA_EM_MINUTOS'
      'FROM'
      '   ATEND AT ,'
      '   TIPOATEND TP ,'
      '   ASSUNTO ASS,'
      '   GRUPOASSUNTO  GA,'
      '   ASSUNTOXATEND AST,'
      '   PARTPREVPLAN PP,'
      '   SITPART SP,'
      '   ELEGPATRO EL,'
      '   LOCALATENDXCPU LA,'
      '   ENDPESS EP,'
      '   CIDADES CID    '
      'WHERE  '
      ''
      
        'AT.DATA >= TO_DATE('#39'01/01/2002 00:00:01'#39', '#39'DD/MM/YYYY HH24:MI:SS' +
        #39') AND AT.DATA <= TO_DATE('#39'30/09/2002 23:59:59'#39','#39'DD/MM/YYYY HH24' +
        ':MI:SS'#39') '
      ''
      'AND      EP.IDCIDADES = CID.IDCIDADES '
      'AND      EP.IDPESSOA = AT.IDTITULAR '
      'AND      EL.IDPESSOA = AT.IDTITULAR  '
      'AND      AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU '
      'AND      AT.IDTIPOATEND = TP.IDTIPOATEND '
      'AND      ASS.IDASSUNTO = AST.IDASSUNTO '
      'AND      AST.IDATEND = AT.IDATEND '
      'AND      PP.IDPESSOA(+) = AT.IDTITULAR '
      
        'AND    ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP' +
        '1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPES' +
        'SOA AND PPP1.FLGDESATIVADO IN (0,NULL))) OR PP.FLGDESATIVADO IN ' +
        '(0,NULL)) '
      'AND      PP.IDPESSJUR(+) = AT.IDPESSJUR '
      'AND      PP.IDSITPART = SP.IDSITPART(+) '
      'AND      GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO    '
      ''
      ''
      ''
      'GROUP BY CID.NOME '
      'ORDER BY CONTATEND DESC')
    UpdateObject = UpdRelaEstat
    ValidateWithMask = True
    Left = 152
    Top = 80
    object qryRelaEstatCONTATEND: TFloatField
      FieldName = 'CONTATEND'
    end
    object qryRelaEstatTOPICO: TStringField
      FieldName = 'TOPICO'
      Size = 50
    end
    object qryRelaEstatPERCENT: TStringField
      FieldName = 'PERCENT'
      FixedChar = True
      Size = 50
    end
    object qryRelaEstatTOTAL_EM_SEGUNDOS: TFloatField
      FieldName = 'TOTAL_EM_SEGUNDOS'
    end
    object qryRelaEstatMEDIA_EM_SEGUNDOS: TFloatField
      FieldName = 'MEDIA_EM_SEGUNDOS'
    end
    object qryRelaEstatTOTAL_EM_MINUTOS: TFloatField
      FieldName = 'TOTAL_EM_MINUTOS'
    end
    object qryRelaEstatMEDIA_EM_MINUTOS: TFloatField
      FieldName = 'MEDIA_EM_MINUTOS'
    end
    object qryRelaEstatTotalFormatado: TStringField
      FieldKind = fkCalculated
      FieldName = 'TotalFormatado'
      Size = 15
      Calculated = True
    end
    object qryRelaEstatMediaFormatada: TStringField
      FieldKind = fkCalculated
      FieldName = 'MediaFormatada'
      Size = 15
      Calculated = True
    end
  end
  object pprRelaEstat: TppReport
    AutoStop = False
    DataPipeline = ppRelaEstat
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 184
    Top = 152
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 58473
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Relatório Estatístico de Atendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197380
        BandType = 0
      end
      object ppLabelTopico: TppLabel
        UserName = 'LabelTopico'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 54240
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Perc. do Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 125677
        mmTop = 54240
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 104775
        mmTop = 54240
        mmWidth = 19578
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 794
        mmTop = 24342
        mmWidth = 196586
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 1058
        mmTop = 53181
        mmWidth = 196586
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 23283
        mmLeft = 6350
        mmTop = 28310
        mmWidth = 92869
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 23283
        mmLeft = 98690
        mmTop = 28310
        mmWidth = 92869
        BandType = 0
      end
      object cidade: TppLabel
        UserName = 'Situacao1'
        Caption = 'Cidade: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 46831
        mmWidth = 17727
        BandType = 0
      end
      object Situacao: TppLabel
        UserName = 'Situacao'
        Caption = 'Situação na Fundação: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 43392
        mmWidth = 36248
        BandType = 0
      end
      object Plano: TppLabel
        UserName = 'Plano'
        Caption = 'Plano: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 39952
        mmWidth = 15875
        BandType = 0
      end
      object Local: TppLabel
        UserName = 'Local'
        Caption = 'Local de Atendimento: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 36513
        mmWidth = 35190
        BandType = 0
      end
      object Forma: TppLabel
        UserName = 'Filial1'
        Caption = 'Forma de Atendimento: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 33073
        mmWidth = 36513
        BandType = 0
      end
      object Status: TppLabel
        UserName = 'Status'
        Caption = 'Status: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 29633
        mmWidth = 16933
        BandType = 0
      end
      object Grupo: TppLabel
        UserName = 'Grupo'
        Caption = 'Grupo de Assunto: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 46831
        mmWidth = 31221
        BandType = 0
      end
      object Assunto: TppLabel
        UserName = 'Assunto'
        Caption = 'Assunto: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 43392
        mmWidth = 19050
        BandType = 0
      end
      object Atendente: TppLabel
        UserName = 'Atendente'
        Caption = 'Atendente: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 39952
        mmWidth = 21431
        BandType = 0
      end
      object Filial: TppLabel
        UserName = 'Filial'
        Caption = 'Filial: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 36513
        mmWidth = 14552
        BandType = 0
      end
      object Patrocinadora: TppLabel
        UserName = 'Patrocinadora'
        Caption = 'Patrocinadora: Todas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 33073
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'FILTROS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 6615
        mmTop = 25135
        mmWidth = 11906
        BandType = 0
      end
      object Periodo: TppLabel
        UserName = 'Patrocinadora1'
        Caption = 'Período: Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 29633
        mmWidth = 18521
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = ppDBPipeFun
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 17727
        mmLeft = 12700
        mmTop = 794
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppDBPipeFun
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 42333
        mmTop = 4498
        mmWidth = 45508
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppDBPipeFun
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 11642
        mmWidth = 96309
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Tempo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 54240
        mmWidth = 21166
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tempo Médio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 151077
        mmTop = 54240
        mmWidth = 22754
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TOPICO'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 265
        mmWidth = 93134
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CONTATEND'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 104775
        mmTop = 265
        mmWidth = 19578
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PERCENT'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object ppdbTempoMedio: TppDBText
        UserName = 'dbTempoMedio'
        DataField = 'MEDIA_EM_SEGUNDOS'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 0
        mmWidth = 22753
        BandType = 4
      end
      object ppdbTempoTotal: TppDBText
        UserName = 'dbTempoTotal'
        DataField = 'TOTAL_EM_SEGUNDOS'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 265
        mmWidth = 21166
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel6: TppLabel
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
        mmLeft = 794
        mmTop = 529
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CONTATEND'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 105040
        mmTop = 528
        mmWidth = 19578
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total Geral: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 82815
        mmTop = 529
        mmWidth = 19050
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 103717
        mmTop = 0
        mmWidth = 93398
        BandType = 7
      end
      object pplblTotalTempoMedio: TppLabel
        OnPrint = pplblTotalTempoMedioPrint
        UserName = 'Label6'
        AutoSize = False
        Caption = 'pplblTotalTempoMedio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151077
        mmTop = 528
        mmWidth = 22753
        BandType = 7
      end
      object pplblTotalTempoTotal: TppLabel
        OnPrint = pplblTotalTempoTotalPrint
        UserName = 'Label9'
        AutoSize = False
        Caption = 'pplblTotalTempoTotal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175419
        mmTop = 528
        mmWidth = 21167
        BandType = 7
      end
    end
  end
  object ppRelaEstat: TppBDEPipeline
    DataSource = DsRelaEstat
    UserName = 'RelaEstat'
    Left = 256
    Top = 160
  end
  object DsRelaEstat: TwwDataSource
    DataSet = qryRelaEstat
    Left = 312
    Top = 104
  end
  object UpdRelaEstat: TUpdateSQL
    Left = 248
    Top = 80
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from dual where 1=2')
    ValidateWithMask = True
    Left = 336
    Top = 56
  end
  object qryFun: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
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
    Left = 44
    Top = 139
    object qryFunNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryFunRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = 'BASEDADOS.PESSOA.RAZAOSOCIAL'
      Size = 60
    end
    object qryFunLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'BASEDADOS.ENDPESS.LOGRADOURO'
      Size = 60
    end
    object qryFunNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'BASEDADOS.ENDPESS.NUMERO'
      Size = 8
    end
    object qryFunCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'BASEDADOS.ENDPESS.COMPLEMENTO'
    end
    object qryFunBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BASEDADOS.ENDPESS.BAIRRO'
    end
    object qryFunCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'BASEDADOS.CIDADES.NOME'
      Size = 50
    end
    object qryFunCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'BASEDADOS.CIDADES.CODESTADO'
      FixedChar = True
      Size = 3
    end
    object qryFunCEP: TStringField
      FieldName = 'CEP'
      Origin = 'BASEDADOS.ENDPESS.CEP'
      Size = 8
    end
    object qryFunIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      Origin = 'BASEDADOS.IMAGENS.IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object DSfun: TwwDataSource
    DataSet = qryFun
    Left = 44
    Top = 75
  end
  object ppDBPipeFun: TppDBPipeline
    DataSource = DSfun
    UserName = 'DBPipeFun'
    Left = 80
    Top = 89
    object ppDBPipeFunppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppDBPipeFunppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppDBPipeFunppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDBPipeFunppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppDBPipeFunppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPipeFunppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipeFunppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeFunppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppDBPipeFunppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppDBPipeFunppField10: TppField
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
