inherited frmTrataArq: TfrmTrataArq
  Left = 2
  Top = 93
  Caption = 'Consultas do arquivo financeiro'
  ClientHeight = 357
  ClientWidth = 759
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 759
    Height = 318
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 757
      Height = 103
      Align = alTop
      TabOrder = 0
      object lblArquivoPatro: TLabel
        Left = 14
        Top = 3
        Width = 145
        Height = 13
        Caption = 'Arquivo da Patrocinadora'
      end
      object SpeedButton1: TSpeedButton
        Left = 301
        Top = 18
        Width = 20
        Height = 21
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object lblPatrocinadora: TLabel
        Left = 9
        Top = 49
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object edTxt: TEdit
        Left = 9
        Top = 18
        Width = 288
        Height = 21
        Enabled = False
        TabOrder = 0
        OnChange = edTxtChange
      end
      object BitBtn1: TBitBtn
        Left = 628
        Top = 59
        Width = 112
        Height = 33
        Cancel = True
        Caption = '&Gerar consulta'
        TabOrder = 1
        OnClick = bbtnCalculaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object dblkPatrocinadora: TwwDBLookupCombo
        Left = 9
        Top = 64
        Width = 313
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Nome')
        LookupTable = cdsPatro
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        Style = csDropDownList
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 104
      Width = 757
      Height = 213
      Align = alClient
      Caption = 'Panel1'
      TabOrder = 1
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 755
        Height = 211
        Align = alClient
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 1
          Top = 1
          Width = 753
          Height = 209
          Align = alClient
          DataSource = dstxt
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'NomePlano'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rubrica'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NomeRubrica'
              Width = 290
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Valor'
              Width = 107
              Visible = True
            end>
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 759
    inherited tb97Fundo: TToolbar97
      Left = 536
      DockPos = 536
      inherited sep1: TToolbarSep97
        Left = 85
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 2
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 4
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 87
      end
    end
    object bbtnRel: TBitBtn
      Left = 14
      Top = 2
      Width = 113
      Height = 33
      Cancel = True
      Caption = '&Relatório'
      TabOrder = 1
      OnClick = bbtnRelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65523
    Top = 67
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        ''
        'Cells'
        0))
  end
  object odTxt: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivos de texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Left = 539
    Top = 37
  end
  object SaveDialog1: TSaveDialog
    Title = 'Salvar como'
    Left = 186
    Top = 165
  end
  object bmPatro: TBatchMove
    Destination = tblDbf
    Mode = batCopy
    Source = tblTxt
    Left = 471
    Top = 65522
  end
  object tblTxt: TwwTable
    DatabaseName = 'TEMP'
    TableName = 'tmptxt.dbf'
    TableType = ttASCII
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 501
    Top = 70
  end
  object tblDbf: TwwTable
    TableName = 'tmptxt.dbf'
    TableType = ttDBase
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 389
    Top = 31
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 35
    Top = 174
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 267
    Top = 174
  end
  object cdsDadosArquivo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 187
    Top = 174
  end
  object qryTxt: TwwQuery
    OnCalcFields = qryTxtCalcFields
    DatabaseName = 'c:\projetoscm5\SRH\SRH200401\SAIDA'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDPLANO Plano, PROVENTO Rubrica, '
      '               SUM(CAST(VALORPROVE AS FLOAT)/100) Valor '
      '              FROM  TMPTXT DBF  '
      '              GROUP BY IDPLANO, PROVENTO  '
      '              ORDER BY IDPLANO, PROVENTO')
    ValidateWithMask = True
    Left = 363
    Top = 125
    object qryTxtPlano: TStringField
      FieldName = 'Plano'
      Size = 5
    end
    object qryTxtRubrica: TStringField
      FieldName = 'Rubrica'
      Size = 4
    end
    object qryTxtValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '###,###.##'
    end
    object qryTxtNomePlano: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomePlano'
      Size = 40
      Calculated = True
    end
    object qryTxtNomeRubrica: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeRubrica'
      Size = 60
      Calculated = True
    end
  end
  object SqlParam: TCMSqlParams
    SQL.Strings = (
      
        'SELECT DISTINCT   /*+ INDEX (CLASSERUBRICAS XPKCLASSERUBRICAS) *' +
        '/'
      '       C.FLGACEITAOPCAO,'
      '       C.IDREGRACALCULO,'
      '       C.IDREGRAPRIMPAGTO,C.IDREGRAULTPAGTO,'
      '       C.NUMOPCOES,'
      '       CP.FLGCOBRA,CP.FLGDESCFOLHA,'
      
        '     CP.FLGRECALCULA,CP.FLGRETROATIVO,     CP.IDCONTRIBUICAO,CP.' +
        'IDPESSJUR,CP.IDPESSOA,CP.IDPLANOPREV,'
      '       CP.QTDEPARCELAS,CP.SEQPROPOSTA,'
      '       NVL(CP.VALORBASE1,0) AS VALORBASE1,'
      '       NVL(CP.VALORBASE2,0) AS VALORBASE2,'
      '       NVL(CP.VALORBASE3,0) AS VALORBASE3,'
      '       NVL(CP.ASSOC1OP1,0) AS ASSOC1OP1,'
      '       NVL(CP.ASSOC1OP2,0) AS ASSOC1OP2,'
      '       NVL(CP.ASSOC1OP3,0) AS ASSOC1OP3,'
      '       NVL(CP.ASSOC2OP1,0) AS ASSOC2OP1,'
      '       NVL(CP.ASSOC2OP2,0) AS ASSOC2OP2,'
      '       NVL(CP.ASSOC2OP3,0) AS ASSOC2OP3,'
      '       NVL(CP.ASSOC3OP1,0) AS ASSOC3OP1,'
      '       NVL(CP.ASSOC3OP2,0) AS ASSOC3OP2,'
      '       NVL(CP.ASSOC3OP3,0) AS ASSOC3OP3,'
      '       NVL(CP.VALORASSOCIADO,0) AS VALORASSOCIADO,'
      '       NVL(CP.VALORASSOCIADO,0) AS VALORASSOCIADO1,'
      '       NVL(CP.VALORASSOCIADO2,0) AS VALORASSOCIADO2,'
      '       NVL(CP.VALORASSOCIADO3,0) AS VALORASSOCIADO3,'
      '       EL.DATAADMISSAO,EL.IDSITFUNC,EL.MATRICULA,'
      '       EL.SALTOTAL,EL.TEMPONAOCREDITADO,EL.TEMPOSERVANTERIOR,'
      '       PF.DATAMORTE,PF.DATANASC,PF.SEXO,'
      
        '       PP.DTINICIOINSC,PP.INSCRICAODATA,PP.ULTSALMANUT AS RUBMAN' +
        'TIDO,'
      '       PP.ULTSALMANUTPARC AS RUBPARCIAL, PP.IDADEBASE,'
      
        '       DECODE(CL.FLG13,0,NVL(PP.SALPARTICIPACAO,0),DECODE(NVL(PP' +
        '.SALPARTIC13,0),0,NVL(PP.SALPARTICIPACAO,0),NVL(PP.SALPARTIC13,0' +
        '))) AS VALORPROVENTO,'
      
        '       DECODE(CL.FLG13,0,NVL(PP.SALPARTICIPACAO,0),DECODE(NVL(PP' +
        '.SALPARTIC13,0),0,NVL(PP.SALPARTICIPACAO,0),NVL(PP.SALPARTIC13,0' +
        '))) AS SALARIOINTEGRAL,'
      '       ST.FLGINTERNO,ST.IDSITPART,CL.CHAVE,'
      
        '       CL.VALORCHAVE,        CL.IDPESSOA,       CL.CODPATRO,    ' +
        '   CL.CODPLANO,'
      
        '       CL.MESREFERENCIA, CL.MESREFERENCIA ANOMESREF,  CL.MESCOBR' +
        'ANCA,       CL.DATAREFERENCIA,       CL.VALORRECEBIDO,'
      '       CL.CODPROVDESC,'
      
        '       CL.FLGATRASODEVOL,  CL.IDRUBRICA,       CL.SEQINTERFACE, ' +
        '         CL.ORDEMCALCULO,'
      '       :pDataRef AS DATAREF,'
      
        '       DECODE(TRUNC(PP.DTINICIOINSC) - TRUNC(PP.INSCRICAODATA),0' +
        ',0,1) AS PARTREINSC'
      'FROM   CLASSERUBRICAS   CL,'
      '       CONTRIBPREVPARTP CP,'
      '       PARTPREVPLAN     PP,'
      '       ELEGPATRO        EL,'
      '       PESSOAFISICA     PF,'
      '       RUBRICAXPESS     RP,'
      '       PROVDESC         P,'
      '       CONTPREV         C,'
      '       SITPART          ST'
      'WHERE'
      'CL.CHAVE = CL.CHAVE'
      'AND CL.VALORCHAVE = CL.VALORCHAVE'
      'AND CL.IDPESSOA = CL.IDPESSOA'
      'AND CL.CODPATRO = :pidpessjur'
      'AND CL.CODPLANO = :pIDPLANOPREV'
      'AND CL.MESREFERENCIA = CL.MESREFERENCIA'
      'AND CL.MESCOBRANCA = :pmescob'
      'AND CL.IDCONTRIBUICAO = :pIdContribuicao'
      'AND (CP.IDPESSJUR = CL.CODPATRO)'
      'AND   (CP.IDPLANOPREV = CL.CODPLANO)'
      'AND   (CP.SEQPROPOSTA = :pseqproposta)'
      'AND   (CP.IDPESSOA = CL.IDPESSOA)'
      'AND   (CP.IDCONTRIBUICAO = CL.IDCONTRIBUICAO )'
      'AND   (CP.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'AND   (PP.IDPESSJUR = CP.IDPESSJUR)'
      'AND   (PP.IDPESSOA = CP.IDPESSOA)'
      'AND   (PP.IDPLANOPREV = CP.IDPLANOPREV)'
      'AND   (PP.IDSITPART = ST.IDSITPART)'
      'AND   (PP.SEQPROPOSTA = CP.SEQPROPOSTA)'
      'AND   (EL.IDPESSJUR = PP.IDPESSJUR)'
      'AND   (EL.IDPESSOA  = PP.IDPESSOA)'
      'AND   (PF.IDPESSOA = EL.IDPESSOA)'
      'AND   (CL.IDPESSOA = CP.IDPESSOA)'
      'AND   (CL.CODPATRO  = EL.IDPESSJUR)'
      'AND   (CL.CODPLANO = PP.IDPLANOPREV)'
      'AND   (CL.SEQINTERFACE = CL.SEQINTERFACE)'
      'AND   (RP.IDRUBRICA = CL.IDRUBRICA)'
      'AND   (RP.CODPROVDESC = CL.CODPROVDESC)'
      'AND   (RP.IDPESSOA = EL.IDPESSJUR)'
      'AND   (P.IDPROVENTO = RP.IDRUBRICA)'
      'AND   (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'AND   (C.IDPLANOPREV = PP.IDPLANOPREV)'
      'AND   ((C.IDRUBRICA = RP.IDRUBRICA ) OR'
      '       (C.IDRUBRICAATRASO = RP.IDRUBRICA) OR'
      '       (C.IDRUBRICADEVOLUC  = RP.IDRUBRICA) OR'
      '       (C.IDRUBDECTERC = RP.IDRUBRICA) OR'
      '       (C.IDRUBDECTERCATRA = RP.IDRUBRICA) OR'
      '       (C.IDRUBDECTERCDEVOL = RP.IDRUBRICA) )'
      ' '
      ' ')
    Left = 357
    Top = 173
  end
  object dstxt: TwwDataSource
    AutoEdit = False
    DataSet = qryTxt
    Left = 565
    Top = 117
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 450
    Top = 306
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 459
    Top = 262
  end
  object dsTrataArq: TwwDataSource
    DataSet = qryTxt
    Left = 559
    Top = 248
  end
  object ppTrataArq: TppBDEPipeline
    DataSource = dsTrataArq
    OpenDataSource = False
    UserName = 'TrataArq'
    Left = 563
    Top = 288
  end
  object rpTrataArq: TppReport
    AutoStop = False
    DataPipeline = ppTrataArq
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 17780
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppTrataArq
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 551
    Top = 204
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTrataArq'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44450
      mmPrintPosition = 0
      object lbltitulocriticas: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Arquivo Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 84402
        mmTop = 33073
        mmWidth = 38365
        BandType = 0
      end
      object ppDBImage11: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText143: TppDBText
        UserName = 'ppDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText144: TppDBText
        UserName = 'ppDBText2'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText145: TppDBText
        UserName = 'ppDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText146: TppDBText
        UserName = 'ppDBText4'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText147: TppDBText
        UserName = 'ppDBText5'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText148: TppDBText
        UserName = 'ppDBText6'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 21960
        BandType = 0
      end
      object ppDBText149: TppDBText
        UserName = 'ppDBText7'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel165: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText150: TppDBText
        UserName = 'ppDBText8'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 43392
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText151: TppDBText
        UserName = 'DBText151'
        DataField = 'Rubrica'
        DataPipeline = ppTrataArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTrataArq'
        mmHeight = 3704
        mmLeft = 9260
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText152: TppDBText
        UserName = 'DBText152'
        DataField = 'Valor'
        DataPipeline = ppTrataArq
        DisplayFormat = '###,###.##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTrataArq'
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NomeRubrica'
        DataPipeline = ppTrataArq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTrataArq'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 0
        mmWidth = 102394
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine47: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 9260
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel166: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = '     InterfacePrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 10319
        mmWidth = 155311
        BandType = 8
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 10319
        mmWidth = 166688
        BandType = 8
      end
      object ppSystemVariable24: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 10319
        mmWidth = 26194
        BandType = 8
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'Valor'
        DataPipeline = ppTrataArq
        DisplayFormat = '###,###.##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTrataArq'
        mmHeight = 3969
        mmLeft = 161396
        mmTop = 1588
        mmWidth = 29104
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 147638
        mmTop = 1588
        mmWidth = 7673
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'Plano'
      DataPipeline = ppTrataArq
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTrataArq'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 9525
          mmTop = 8467
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 182298
          mmTop = 8467
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 9525
          mmTop = 794
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NomePlano'
          DataPipeline = ppTrataArq
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTrataArq'
          mmHeight = 4498
          mmLeft = 21960
          mmTop = 794
          mmWidth = 82815
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 133086
          mmTop = 1323
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'Valor'
          DataPipeline = ppTrataArq
          DisplayFormat = '###,###.##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTrataArq'
          mmHeight = 3969
          mmLeft = 160867
          mmTop = 1323
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'ppLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 460
    Top = 217
  end
end
