inherited dtmRelFalecimentoSemQuitacao: TdtmRelFalecimentoSemQuitacao
  Left = 647
  Top = 253
  Width = 528
  Height = 316
  Caption = 'dRelRetencaoIOF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 56
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
  inherited dsExemplo: TwwDataSource
    Left = 0
    Top = 84
  end
  inherited qryExemplo: TwwQuery
    Left = 8
    Top = 136
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplFalecimentoSemQuitacao: TppBDEPipeline
    DataSource = dtsFalecimentoSemQuitacao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
    object pplFalecimentoSemQuitacaoppField1: TppField
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplFalecimentoSemQuitacaoppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplFalecimentoSemQuitacaoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplFalecimentoSemQuitacaoppField4: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplFalecimentoSemQuitacaoppField5: TppField
      FieldAlias = 'VLRCONTRATO'
      FieldName = 'VLRCONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplFalecimentoSemQuitacaoppField6: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplFalecimentoSemQuitacaoppField7: TppField
      FieldAlias = 'DATAMORTE'
      FieldName = 'DATAMORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object situacaocontrato: TppField
      FieldAlias = 'SITUAÇÃO DO CONTRATO'
      FieldName = 'SITUAÇÃO DO CONTRATO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object datadeconcessao: TppField
      FieldAlias = 'Data de Concessão'
      FieldName = 'Data de Concessão'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object PLANOORIGEM: TppField
      FieldAlias = 'PLANOORIGEM'
      FieldName = 'PLANOORIGEM'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 9
    end
    object SALDODEVEDOR: TppField
      FieldAlias = 'SALDO_DEVEDOR'
      FieldName = 'SALDO_DEVEDOR'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 10
    end
    object SALDOINAD: TppField
      FieldAlias = 'SALDO_INAD'
      FieldName = 'SALDO_INAD'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 11
    end
    object QUANTPRESTABERTA: TppField
      FieldAlias = 'QUANT_PREST_ABERTA'
      FieldName = 'QUANT_PREST_ABERTA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object POSSUIQUITACAO: TppField
      FieldAlias = 'POSSUI_QUITACAO'
      FieldName = 'POSSUI_QUITACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object VLRQUITACAO: TppField
      FieldAlias = 'VLR_QUITACAO'
      FieldName = 'VLR_QUITACAO'
      FieldLength = 10
      DataType = dtNotKnown
      DisplayWidth = 10
      Position = 14
    end
    object VENCQUITACAO: TppField
      FieldAlias = 'VENC_QUITACAO'
      FieldName = 'VENC_QUITACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
  end
  object dtsFalecimentoSemQuitacao: TwwDataSource
    DataSet = qryFalecimentoSemQuitacao
    Left = 192
    Top = 100
  end
  object qryFalecimentoSemQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CON.IDCONTRATOEMPTMO,'
      '  DEP.MATRICULA,'
      '  MUT.NOME, '
      '  ppc.nome AS PLANOORIGEM,'
      '  TCE.TCEDESCRICAO, '
      '  CON.VLRCONTRATO, '
      '  con.dataassinatura AS "Data de Concessão", '
      '  CON.DATACREDITO,'
      '  PFI.DATAMORTE, '
      '  DECODE(CON.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39','
      '                          '#39'C'#39', '#39'Cancelado'#39','
      '                          '#39'E'#39', '#39'Encerrado'#39',      '
      '                          '#39'Q'#39', '#39'Quitado'#39','
      '                          '#39'R'#39', '#39'Refinanciado'#39','
      '                          '#39'S'#39', '#39'Suspenso'#39',  '
      '                          '#39'P'#39', '#39'Pendente de Liberação'#39','
      
        '                          '#39'K'#39', '#39'Pendente de Quitação'#39') AS "SITUA' +
        'ÇÃO DO CONTRATO",'
      
        '  NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(con.idcontratoemptmo, pf' +
        'i.datamorte),0) AS SALDO_DEVEDOR,'
      
        '  NVL(CM.PCK_EMPRESTIMO.FN_SALDOINADIMPLENTE(con.idcontratoemptm' +
        'o, pfi.datamorte - 1),0) AS SALDO_INAD,'
      '  (SELECT COUNT(hp.idhistmovemptmo)'
      '   FROM hmeprestacao hp'
      '   WHERE hp.idcontratoemptmo = con.idcontratoemptmo'
      
        '   AND   (hp.flgquitabonoestorno = 0 OR hp.dataquitabonoestorno ' +
        '> pfi.datamorte)'
      
        '   AND   (hp.vlrefetivo IS NULL OR hp.dataefetiva > pfi.datamort' +
        'e)'
      '   AND   hp.iditememptmo = 13'
      '   AND   hp.vlrprevisto > 0'
      '   AND   hp.dataprevista < pfi.datamorte'
      
        '   AND   (hp.idtiposuspemptmo IS NULL OR 1 = (SELECT ts.flgemabe' +
        'rto FROM tiposuspemptmo ts'
      
        '                                              WHERE ts.idtiposus' +
        'pemptmo = hp.idtiposuspemptmo))) AS QUANT_PREST_ABERTA,'
      '  NVL2(hq.idhistmovemptmo,'#39'Sim'#39','#39'Não'#39') AS POSSUI_QUITACAO,'
      '  hq.vlrprevisto AS VLR_QUITACAO,'
      '  hq.datavencto AS VENC_QUITACAO  ,'
      ' NVL(e.dataregistro,doc.trgdtinclusao) as "Data Registro Morte" '
      'FROM CONTRATOEMPTMO  CON'
      
        '     JOIN TIPOCONTREMPTMO TCE ON CON.IDTIPOCONTREMPTMO = TCE.IDT' +
        'IPOCONTREMPTMO'
      '     JOIN TIPOEMPTMO TEP ON TCE.IDTIPOEMPTMO = TEP.IDTIPOEMPTMO'
      
        '     JOIN planprevcontabil ppc ON ppc.idplanoprev = con.idplanoo' +
        'rigem'
      '     JOIN PESSOA MUT ON CON.IDBENEF = MUT.IDPESSOA'
      '     JOIN PESSOAFISICA PFI ON CON.IDBENEF = PFI.IDPESSOA'
      '     JOIN DEPENTIT DEP ON  CON.IDBENEF = DEP.IDPESSOA '
      '                       AND CON.IDPESSOA = DEP.IDTITULAR'
      
        '     LEFT JOIN hmequitacao hq ON hq.idcontratoemptmo = con.idcon' +
        'tratoemptmo'
      '                              AND hq.flgestornado = 0'
      '                              AND hq.iditememptmo = 17'
      '                              AND hq.vlrefetivo IS NULL'
      
        'LEFT JOIN eventosprev e ON e.idpessoa=CON.IDBENEF  and e.idevent' +
        'ogerador = 4 and e.idplanoprev=CON.IDPLANOPREV'
      
        'LEFT JOIN docpessoa doc on doc.idpessoa=CON.IDBENEF and doc.iddo' +
        'cumento = 44 '
      'WHERE '
      '      TEP.IDEMPRESAPROP            = 1'
      '  AND PFI.DATAMORTE                IS NOT NULL '
      '  AND CON.FLGSITUACAO              NOT IN ('#39'C'#39','#39'Q'#39') '
      
        '  AND CON.IDPATRO                  IN (994886, 91008, 1, 1117723' +
        ') '
      '  AND CON.IDPLANOPREV              IN (74, 110, 66, 79, 19, 2) '
      'AND 1 = 2'
      'ORDER BY '
      '  MUT.NOME, CON.IDCONTRATOEMPTMO ')
    ValidateWithMask = True
    Left = 152
    Top = 152
    object qryFalecimentoSemQuitacaoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryFalecimentoSemQuitacaoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryFalecimentoSemQuitacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFalecimentoSemQuitacaoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryFalecimentoSemQuitacaoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryFalecimentoSemQuitacaoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryFalecimentoSemQuitacaoDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryFalecimentoSemQuitacaoSITUAODOCONTRATO: TStringField
      FieldName = 'SITUAÇÃO DO CONTRATO'
    end
    object qryFalecimentoSemQuitacaoDatadeConcesso: TDateTimeField
      FieldName = 'Data de Concessão'
    end
    object qryFalecimentoSemQuitacaoPLANOORIGEM: TStringField
      FieldName = 'PLANOORIGEM'
      Size = 50
    end
    object qryFalecimentoSemQuitacaoSALDO_DEVEDOR: TFloatField
      FieldName = 'SALDO_DEVEDOR'
    end
    object qryFalecimentoSemQuitacaoSALDO_INAD: TFloatField
      FieldName = 'SALDO_INAD'
    end
    object qryFalecimentoSemQuitacaoQUANT_PREST_ABERTA: TFloatField
      FieldName = 'QUANT_PREST_ABERTA'
    end
    object qryFalecimentoSemQuitacaoPOSSUI_QUITACAO: TStringField
      FieldName = 'POSSUI_QUITACAO'
      Size = 3
    end
    object qryFalecimentoSemQuitacaoVLR_QUITACAO: TFloatField
      FieldName = 'VLR_QUITACAO'
    end
    object qryFalecimentoSemQuitacaoVENC_QUITACAO: TDateTimeField
      FieldName = 'VENC_QUITACAO'
    end
    object qryFalecimentoSemQuitacaoDataRegistroMorte: TDateTimeField
      FieldName = 'Data Registro Morte'
    end
  end
  object rptFalecimentoSemQuitacao: TppReport
    AutoStop = False
    DataPipeline = pplFalecimentoSemQuitacao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Retenção de IOF'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
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
    mmColumnWidth = 270669
    DataPipelineName = 'pplFalecimentoSemQuitacao'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 48154
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15263976
        ParentWidth = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 19315
        mmWidth = 183622
        BandType = 0
      end
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'Mutuários Falecidos com Contratos não Quitados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 11113
        mmTop = 10319
        mmWidth = 161396
        BandType = 0
      end
      object pplbNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lbNomeEmpresa'
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
        mmLeft = 11113
        mmTop = 3440
        mmWidth = 161396
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 529
        mmTop = 24871
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 19050
        mmTop = 24871
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 33867
        mmTop = 24871
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Tipo de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 73025
        mmTop = 24871
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 110861
        mmTop = 24871
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 110861
        mmTop = 21696
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Falecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 139171
        mmTop = 24871
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 139171
        mmTop = 21696
        mmWidth = 8996
        BandType = 0
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
        mmLeft = 2910
        mmTop = 31485
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
        mmLeft = 96309
        mmTop = 31485
        mmWidth = 23813
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
        mmLeft = 30163
        mmTop = 31485
        mmWidth = 64558
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
        mmLeft = 119856
        mmTop = 31485
        mmWidth = 63765
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
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
        mmLeft = 2910
        mmTop = 36248
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
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
        mmLeft = 107421
        mmTop = 36248
        mmWidth = 12700
        BandType = 0
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
        mmLeft = 27781
        mmTop = 36248
        mmWidth = 66940
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
        mmLeft = 119856
        mmTop = 36248
        mmWidth = 63765
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
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
        mmTop = 43656
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        mmTop = 43656
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Situação do'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 155046
        mmTop = 21696
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 155046
        mmTop = 24871
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 124884
        mmTop = 21696
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2921
        mmLeft = 124884
        mmTop = 24871
        mmWidth = 8551
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = ppShape1Print
        UserName = 'rptContrato'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 33867
        mmTop = 265
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAMORTE'
        DataPipeline = pplFalecimentoSemQuitacao
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 139700
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'Data de Concessão'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 109802
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 71967
        mmTop = 265
        mmWidth = 37306
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'SITUAÇÃO DO CONTRATO'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 154517
        mmTop = 265
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATACREDITO'
        DataPipeline = pplFalecimentoSemQuitacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimentoSemQuitacao'
        mmHeight = 2910
        mmLeft = 124619
        mmTop = 265
        mmWidth = 14023
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 183622
        BandType = 8
      end
      object pplbNomeSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lbNomeSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 66675
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
        mmLeft = 69586
        mmTop = 1588
        mmWidth = 44450
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144992
        mmTop = 1588
        mmWidth = 38100
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 10054
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 7
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 4763
        mmLeft = 7144
        mmTop = 1323
        mmWidth = 26458
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label101'
        Caption = 'Contrato(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 17463
        mmTop = 2117
        mmWidth = 13494
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'IDCONTRATOEMPTMO'
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 2910
        mmLeft = 8467
        mmTop = 2117
        mmWidth = 7673
        BandType = 7
      end
    end
  end
end
