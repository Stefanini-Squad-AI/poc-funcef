inherited RptListaInscritos: TRptListaInscritos
  Left = 466
  Top = 199
  Width = 336
  Height = 308
  Caption = 'RptListaInscritos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpListaInscritos
    ConnectionType = cntBDE
  end
  object rpListaInscritos: TppReport
    AutoStop = False
    DataPipeline = ppTurmaInscr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Advertências e Suspensões'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTurmaInscr'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 56356
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 5292
        mmLeft = 1000
        mmTop = 49742
        mmWidth = 196000
        BandType = 0
      end
      object lblFundacao: TppLabel
        UserName = 'lblFundacao'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 25400
        mmTop = 6350
        mmWidth = 170000
        BandType = 0
      end
      object lblEnd1: TppLabel
        UserName = 'lblEnd1'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 11906
        mmWidth = 170000
        BandType = 0
      end
      object lblEnd2: TppLabel
        UserName = 'lblEnd2'
        AutoSize = False
        Caption = 
          'Brasília  DF  CEP 70.712-900 - (061)3329-1700 - www.funcef.com.b' +
          'r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 15875
        mmWidth = 170000
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Curso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 3970
        mmTop = 26723
        mmWidth = 10202
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Turma:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 3970
        mmTop = 31750
        mmWidth = 10499
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Carga Horária:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 36777
        mmWidth = 21960
        BandType = 0
      end
      object lblCarga: TppLabel
        UserName = 'lblCarga'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146844
        mmTop = 36777
        mmWidth = 10054
        BandType = 0
      end
      object lblTurma: TppLabel
        UserName = 'lblTurma'
        AutoSize = False
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 20108
        mmTop = 31750
        mmWidth = 93663
        BandType = 0
      end
      object lblCurso: TppLabel
        UserName = 'lblCurso'
        AutoSize = False
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 20108
        mmTop = 26723
        mmWidth = 93927
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clBackground
        mmHeight = 529
        mmLeft = 1000
        mmTop = 42069
        mmWidth = 196000
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lblEmpresa1'
        AutoSize = False
        Caption = 'Relatório de Inscritos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 1000
        mmTop = 43127
        mmWidth = 196000
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clBackground
        mmHeight = 529
        mmLeft = 1000
        mmTop = 48154
        mmWidth = 196000
        BandType = 0
      end
      object lblNome: TppLabel
        UserName = 'lblNome'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 18785
        mmTop = 50536
        mmWidth = 7938
        BandType = 0
      end
      object lblMatr: TppLabel
        UserName = 'lblMatr'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2381
        mmTop = 50536
        mmWidth = 14288
        BandType = 0
      end
      object lblCCusto: TppLabel
        UserName = 'lblCCusto'
        Caption = 'Lotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 108744
        mmTop = 50536
        mmWidth = 10837
        BandType = 0
      end
      object rpRelPensAlimDBImage1: TppDBImage
        UserName = 'rpRelPensAlimDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 21431
        mmLeft = 3704
        mmTop = 2381
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Data Início:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 123296
        mmTop = 26723
        mmWidth = 17145
        BandType = 0
      end
      object lblDtIni: TppLabel
        UserName = 'lblTurma1'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146844
        mmTop = 26723
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Data Fim:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 123296
        mmTop = 31750
        mmWidth = 14478
        BandType = 0
      end
      object lblDtFim: TppLabel
        UserName = 'lblCarga1'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146844
        mmTop = 31750
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Hora Início:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 166952
        mmTop = 26723
        mmWidth = 17484
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Hora Fim:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 166952
        mmTop = 31750
        mmWidth = 14817
        BandType = 0
      end
      object lblHrIni: TppLabel
        UserName = 'lblHrIni'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 185209
        mmTop = 26723
        mmWidth = 10054
        BandType = 0
      end
      object lblHrFim: TppLabel
        UserName = 'lblHrFim'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 31750
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 3969
        mmTop = 36777
        mmWidth = 14478
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblTurma2'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 36777
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'lblCCusto1'
        Caption = 'Assinatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 159279
        mmTop = 50536
        mmWidth = 16669
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpListaInscritosDBNome: TppDBText
        UserName = 'rpListaInscritosDBNome'
        DataField = 'NOME'
        DataPipeline = ppTurmaInscr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppTurmaInscr'
        mmHeight = 3175
        mmLeft = 18785
        mmTop = 529
        mmWidth = 87842
        BandType = 4
      end
      object rpListaInscritosDBMatric: TppDBText
        UserName = 'rpListaInscritosDBMatric'
        DataField = 'MATRICULA'
        DataPipeline = ppTurmaInscr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppTurmaInscr'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object rpListaInscritosDBUnd: TppDBText
        UserName = 'rpListaInscritosDBUnd'
        DataField = 'UNIDADE'
        DataPipeline = ppTurmaInscr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppTurmaInscr'
        mmHeight = 3175
        mmLeft = 108744
        mmTop = 529
        mmWidth = 47625
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = '____________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 159279
        mmTop = 529
        mmWidth = 35560
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ProvisaoFeriasrpLabel1: TppLabel
        UserName = 'ProvisaoFeriasrpLabel1'
        AutoSize = False
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164307
        mmTop = 794
        mmWidth = 19844
        BandType = 8
      end
      object lblNumPag: TppSystemVariable
        UserName = 'lblNumPag'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 184944
        mmTop = 794
        mmWidth = 11642
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 794
        mmWidth = 14023
        BandType = 8
      end
      object lblDtEmissao: TppSystemVariable
        UserName = 'lblDtEmissao'
        AutoSize = False
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 16404
        mmTop = 794
        mmWidth = 23548
        BandType = 8
      end
    end
  end
  object ppTurmaInscr: TppBDEPipeline
    DataSource = dsTurmaInscr
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'TurmaInscr'
    Left = 232
    Top = 56
    object ppAdvSuspensaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAdvSuspensaoppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAdvSuspensaoppField3: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAdvSuspensaoppField4: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAdvSuspensaoppField5: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object dsTurmaInscr: TwwDataSource
    DataSet = cdsTurmaInscr
    Left = 235
    Top = 112
  end
  object cdsTurmaInscr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsTurmaInscrAfterOpen
    AfterScroll = cdsTurmaInscrAfterScroll
    Left = 235
    Top = 160
    object cdsTurmaInscrNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsTurmaInscrMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object cdsTurmaInscrIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsTurmaInscrCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object cdsTurmaInscrUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 30
    end
  end
  object sqlTurmaInscr: TCMSqlParams
    SQL.Strings = (
      'select p.nome, f.matricula,'
      '       p.idpessoa,'
      '       c.titulo as Cargo,'
      '       ct.nome as Unidade,'
      '       decode(a.tipo, '#39'S'#39', '#39'Suspensão'#39', '#39'Advertência'#39') as Tipo,'
      '       a.dataato, a.dataadvsusp, a.quantdias, a.motivo'
      
        '  from advertsusp a, funcionario f, pessoa p, cargo c, sitfunc s' +
        ', centcust ct'
      ' where p.idpessoa = f.idpessoa'
      '   and a.idpessoa = f.idpessoa'
      '   and f.idsitfunc = s.idsitfunc'
      '   and ct.codcentrocusto = f.codcentrocusto'
      
        '   and decode(f.idfuncao, null, f.idcargo, f.idfuncao) = c.idcar' +
        'go(+)'
      '   order by p.nome, a.dataato')
    ClientDataSet = cdsTurmaInscr
    Left = 235
    Top = 206
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 30
    Top = 71
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'BLOCO1'
      FieldName = 'BLOCO1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'BLOCO2'
      FieldName = 'BLOCO2'
      FieldLength = 8
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 30
    Top = 119
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '       P.RAZAOSOCIAL,'
      '       I.IMAGEM,'
      '       E.NOME AS BLOCO1,'
      
        '       C.NOME || '#39' '#39' || C.CODESTADO || '#39' CEP '#39' || E.CEP || '#39' - (' +
        #39' ||'
      
        '       TRIM(T.DDD) || '#39')'#39' || T.NUMERO || '#39' - '#39' || P.HOMEPAGE AS ' +
        'BLOCO2'
      '  FROM PESSOA     P,'
      '       ENDPESS    E,'
      '       IMAGENS    I,'
      '       CIDADES    C,'
      '       TELENDPESS T'
      ' WHERE (P.IDPESSOA = 1)'
      '   AND (E.IDPESSOA(+) = P.IDPESSOA)'
      '   AND (E.IDCIDADES = C.IDCIDADES(+))'
      '   AND (I.IDIMAGEM(+) = P.IDIMAGEM)'
      '   AND (E.IDENDERECO = T.IDENDERECO(+))'
      '   AND (T.TIPO = '#39'C'#39')')
    ValidateWithMask = True
    Left = 30
    Top = 167
    object qryFundacaoBLOCO1: TStringField
      FieldName = 'BLOCO1'
      Size = 40
    end
    object qryFundacaoBLOCO2: TMemoField
      FieldName = 'BLOCO2'
      BlobType = ftMemo
      Size = 350
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
end
