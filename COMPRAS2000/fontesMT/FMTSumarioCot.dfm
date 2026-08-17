inherited frmMTSumarioCot: TfrmMTSumarioCot
  Left = 15
  Top = 59
  HelpContext = 1130012
  Caption = 'Sumário de Cotação'
  ClientHeight = 440
  ClientWidth = 753
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 753
    Height = 339
    object Splitter1: TSplitter
      Left = 293
      Top = 61
      Width = 7
      Height = 277
      Cursor = crHSplit
    end
    object plnTitulo: TPanel
      Left = 1
      Top = 1
      Width = 751
      Height = 60
      Align = alTop
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label3: TLabel
        Left = 416
        Top = 41
        Width = 229
        Height = 13
        Caption = 'Selecionado pelo sistema e pelo usuário'
        Transparent = True
      end
      object Label2: TLabel
        Left = 416
        Top = 23
        Width = 144
        Height = 13
        Caption = 'Selecionado pelo usuário'
        Transparent = True
      end
      object Label1: TLabel
        Left = 416
        Top = 4
        Width = 145
        Height = 13
        Caption = 'Selecionado pelo sistema'
        Transparent = True
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 100
        Height = 16
        Caption = 'Processo Nº : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LbProc: TLabel
        Left = 104
        Top = 8
        Width = 50
        Height = 16
        Caption = 'LbProc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object BtnSelProc: TSpeedButton
        Left = 667
        Top = 5
        Width = 73
        Height = 49
        Anchors = [akRight, akBottom]
        Caption = '&Processo'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
          777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
          77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
          77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
          077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
          FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
          F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
          7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
          777777787FFF8777777777770000777777777777888877777777}
        Layout = blGlyphTop
        NumGlyphs = 2
        OnClick = BtnSelProcClick
      end
      object lbStatus: TLabel
        Left = 8
        Top = 32
        Width = 54
        Height = 20
        Caption = 'Status'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel1: TPanel
        Left = 393
        Top = 3
        Width = 19
        Height = 17
        BevelInner = bvRaised
        Caption = 'S'
        Color = 8454143
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 393
        Top = 21
        Width = 19
        Height = 17
        BevelInner = bvRaised
        Caption = 'U'
        Color = 12042751
        TabOrder = 1
      end
      object Panel3: TPanel
        Left = 393
        Top = 39
        Width = 19
        Height = 17
        BevelInner = bvRaised
        Caption = 'C'
        Color = 8454016
        TabOrder = 2
      end
    end
    object grdArt: TwwDBGrid
      Left = 1
      Top = 61
      Width = 292
      Height = 277
      Selected.Strings = (
        'DESCRICAO'#9'30'#9'Artigo'#9'F'
        'QTDEPEDIDA'#9'10'#9'Quatidade~Pedida'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      Color = clWhite
      DataSource = dsList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      IndicatorColor = icBlack
    end
    object GrdCotacao: TwwDBGrid
      Left = 300
      Top = 61
      Width = 452
      Height = 277
      Hint = 'Duplo Click para selecionar fornecedor'
      Selected.Strings = (
        'RAZAOSOCIAL'#9'30'#9'Fornecedor'#9'F'
        'PROPOSTA'#9'10'#9'Proposta Nº'#9'F'
        'PRECOAVALORPRES'#9'10'#9'Preço a Valor~Presente'#9'F'
        'STATUS'#9'1'#9'Status'#9'F'
        'PRECO'#9'10'#9'Preço'#9'F'
        'QTDEFORNECIDA'#9'10'#9'Quantidade~Fornecida'#9'F'
        'PRECOTOTAL'#9'10'#9'Valor Total'#9'F'
        'MOESIGLA'#9'10'#9'Moeda'#9'F'
        'CODMEDIDA'#9'4'#9'Unidade'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clWhite
      DataSource = dsSumario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      UseTFields = False
      OnCalcCellColors = GrdCotacaoCalcCellColors
      OnDblClick = GrdCotacaoDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 401
    Width = 753
    inherited tb97Fundo: TToolbar97
      Left = 345
      DockPos = 610
      inherited sep1: TToolbarSep97
        Left = 328
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 250
        Top = 0
        Blank = True
        SizeHorz = 4
      end
      object ToolbarSep971: TToolbarSep97 [2]
        Left = 124
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 254
        Width = 74
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 330
        Width = 74
        HelpContext = 1130012
      end
      object btnGeraOC: TBitBtn
        Left = 0
        Top = 0
        Width = 124
        Height = 33
        Caption = 'Gerar O.C.'
        Enabled = False
        TabOrder = 2
        OnClick = btnGeraOCClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
      object btnConfSel: TBitBtn
        Left = 126
        Top = 0
        Width = 124
        Height = 33
        Caption = '&Aceita Seleção'
        Enabled = False
        TabOrder = 3
        OnClick = btnConfSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object Panel4: TPanel [2]
    Left = 0
    Top = 339
    Width = 753
    Height = 62
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lblobs: TLabel
      Left = 303
      Top = 1
      Width = 138
      Height = 13
      Caption = 'Observação da Cotação'
      Visible = False
    end
    object Label5: TLabel
      Left = 3
      Top = 2
      Width = 191
      Height = 13
      Caption = 'Justificativa da Ordem de Compra'
      Visible = False
    end
    object wwDBRichEdit1: TwwDBRichEdit
      Left = 300
      Top = 15
      Width = 450
      Height = 42
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoURLDetect = False
      DataField = 'JUSTIFICATIVA'
      DataSource = dsSumario
      PrintJobName = 'Delphi 5'
      ReadOnly = True
      TabOrder = 0
      Visible = False
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        750000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
    end
    object wwDBRichEdit2: TwwDBRichEdit
      Left = 1
      Top = 15
      Width = 292
      Height = 42
      AutoURLDetect = False
      DataField = 'JUSTIFICATIVA'
      DataSource = dsList
      PrintJobName = 'Delphi 5'
      ReadOnly = True
      TabOrder = 1
      Visible = False
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        750000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65515
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'COTACOES.CODPROCESSO'
      'PESSOA.RAZAOSOCIAL'
      'COTACOES.PROPOSTA'
      'PROCXART.CODARTIGO'
      
        'DECODE(PROCXART.IDPRODVARI,NULL,PRODUTO.DESCPROD,PRODVARI.DESCPR' +
        'ODVARI)')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Nº do Processo'
      'Fornecedor'
      'Nº da Proposta'
      'Código do Item'
      'Descrição do Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSO'
      'COTACOES'
      'PROCXART'
      'ARTIGO'
      'PRODUTO'
      'PRODVARI')
    CamposChave.Strings = (
      'COTACOES.CODPROCESSO'
      'COTACOES.IDFORCLI'
      'COTACOES.PROPOSTA'
      'PROCESSO.STATUS')
    Filtro.Strings = (
      'COTACOES.CODPROCESSO  = PROCESSO.CODPROCESSO'
      'COTACOES.IDPROCXART   = PROCXART.IDPROCXART'
      'COTACOES.CODPROCESSO  = PROCXART.CODPROCESSO'
      'COTACOES.IDFORCLI     = PESSOA.IDPESSOA'
      'PROCXART.CODARTIGO    = ARTIGO.CODARTIGO'
      'ARTIGO.CODPRODUTO     = PRODUTO.CODPRODUTO'
      'PROCXART.IDPRODVARI   = PRODVARI.IDPRODVARI(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '10'
      '14'
      '1000')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 335
    Top = 13
  end
  object dsList: TwwDataSource
    AutoEdit = False
    DataSet = cdsList
    OnDataChange = dsListDataChange
    Left = 214
    Top = 104
  end
  object dsSumario: TwwDataSource
    AutoEdit = False
    DataSet = cdsSumario
    Left = 398
    Top = 96
  end
  object cdsList: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 80
  end
  object cdsSumario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 80
  end
  object spRAD: TCMSqlParams
    SQL.Strings = (
      'SELECT CODPROCESSO FROM PROCESSO'
      'WHERE (IDPROCESSO = :IDPROCESSO )')
    ClientDataSet = cdsRAD
    Left = 664
    Top = 120
  end
  object cdsRAD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 664
    Top = 104
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     C.IDFORCLI,'
      '     C.IDPROCXART,'
      '     C.CODPROCESSO,'
      '     C.PROPOSTA,'
      '     C.QTDEFORNECIDA,'
      '     C.PRECO,'
      '     C.CODMEDIDA,'
      '     C.NUMCOT,'
      '     C.DATACOT,'
      '     C.STATUS,'
      '     C.OBS,'
      '     C.MOECODIGO,'
      '     C.TXJUROS,'
      '     C.PRECOAVALORPRES,'
      '     P.RAZAOSOCIAL,'
      '     M.MOESIGLA,'
      '     C.OBS AS JUSTIFICATIVA,'
      '     C.PRECO * C.QTDEFORNECIDA AS PRECOTOTAL'
      'FROM'
      '    PESSOA P,'
      '    COTACOES C,'
      '    MOEDA M'
      'WHERE'
      '      (C.CODPROCESSO  = -1)'
      '  AND (C.IDPROCXART   = -1)'
      '  AND (C.IDFORCLI     = P.IDPESSOA)'
      '  AND (C.MOECODIGO    = M.MOECODIGO(+))'
      '  AND (C.PRECOAVALORPRES IS NOT NULL)'
      'ORDER BY C.PRECOAVALORPRES')
    Left = 496
    Top = 144
  end
  object sqlOc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IT.CODARTIGO, COT.CODPROCESSO, COT.IDITEMOC, OC.NUMOC, OC' +
        '.* FROM COTACOES COT, ITEMOC IT, OC'
      'WHERE COT.CODPROCESSO = :CODPROCESSO AND'
      '               IT.CODARTIGO = :CODARTIGO AND'
      '               COT.IDITEMOC = IT.IDITEMOC AND'
      '               IT.NUMOC = OC.NUMOC ')
    ClientDataSet = cdsOc
    Left = 120
    Top = 320
  end
  object cdsOc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 328
  end
  object dsOc: TwwDataSource
    DataSet = cdsOc
    Left = 184
    Top = 331
  end
  object qryOC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ rule */'
      '      P.RAZAOSOCIAL,'
      '      P.NOME,'
      '      P.NUMDOCUMENTO,'
      '     (E.LOGRADOURO ||'#39' '#39'|| E.NUMERO) AS ENDERECO,'
      '      E.COMPLEMENTO,'
      '      E.BAIRRO,'
      '      E.CEP,'
      '      ES.CODESTADO,'
      '      P.EMAIL,'
      '      DECODE(E.IDCIDADES, NULL, E.CIDADE,C.NOME) AS CIDADE,'
      '      TC.TELEFONE,'
      '      TC.DDD,'
      '      O.NUMOC,'
      '      O.IDFORCLI,'
      '      O.OCATENDIDA,'
      '      O.FLGIMPRESSA,'
      '      O.FLGCOMSEMOC,'
      '      O.FLGCOMSEMCOT,'
      '      O.OBSOC,'
      '      O.DATAOC,'
      '      DECODE(O.FLGTIPOFRETE,1,'#39'CIF'#39','#39'FOB'#39') AS FRETE,'
      '      I.CODARTIGO,'
      '      I.CODMEDIDA,'
      
        '      DECODE(I.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS D' +
        'ESCRICAO,'
      '      I.VALORUN,'
      '      PE.QTDEENTREGA,'
      '      PE.DATAENTREGA,'
      '      PE.PRAZOENTREGA,'
      '      IMP.TOTIMP,'
      '      TOT.TOTITEM,'
      '      (I.VALORUN*PE.QTDEENTREGA) AS VALTOTITEM,'
      
        '      (DECODE(IMP.TOTIMP,NULL,0,IMP.TOTIMP)+TOT.TOTITEM) AS TOTO' +
        'C,'
      '      PR.DESCRCOMPL,'
      '      I.OBSITEMOC,'
      '      O.CONTATO'
      'FROM'
      '     PESSOA P,'
      '     ENDPESS E,'
      '     CIDADES C,'
      '     ESTADO  ES,'
      '     ('
      '      SELECT TP.IDENDERECO, TP.NUMERO AS TELEFONE,TP.DDI,TP.DDD'
      '      FROM  TELENDPESS  TP,'
      '           (SELECT IDENDERECO, MAX(IDTELEFONE) AS IDTELEFONE'
      '            FROM TELENDPESS'
      '            WHERE (TIPO LIKE '#39'%C%'#39')'
      '            GROUP BY IDENDERECO) C'
      '      WHERE (TP.IDENDERECO = C.IDENDERECO) AND'
      '            (TP.IDTELEFONE = C.IDTELEFONE)'
      '      ) TC,'
      '      ITEMOC I,'
      '      OC O,'
      '      ARTIGO A,'
      '      PRODUTO PR,'
      '      PRODVARI PV,'
      '      PRAZOENTREGAOC PE,'
      '      (SELECT I.NUMOC, SUM(I.VALORUN*PE.QTDEENTREGA) AS TOTITEM'
      '       FROM ITEMOC I, PRAZOENTREGAOC PE'
      '       WHERE'
      
        '              ((I.FLGITEMATENDIDO <> '#39'C'#39') OR (I.FLGITEMATENDIDO ' +
        'IS NULL))'
      '          AND  (I.IDITEMOC = PE.IDITEMOC)'
      '       GROUP BY I.NUMOC) TOT,'
      '      ((SELECT AOC.NUMOC,'
      
        '               SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AOC.VLRAGREGTOT*-1' +
        '),AOC.VLRAGREGTOT)) AS TOTIMP'
      '        FROM  AGREGTOTOC AOC,'
      '              TIPOAGRE T'
      '        WHERE'
      '               (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      '           AND (AOC.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '        GROUP BY AOC.NUMOC)'
      '        UNION'
      '       (SELECT I.NUMOC,'
      
        '               SUM(DECODE(T.CODTRATFISCE,'#39'6'#39',(AI.VLRAGREGITEM*-1' +
        '),AI.VLRAGREGITEM)) AS TOTIMP'
      '        FROM  AGREGITEMOC AI,'
      '              TIPOAGRE T,'
      '              ITEMOC I'
      '        WHERE'
      '              (T.CODTRATFISCE IN ('#39'1'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'9'#39','#39'A'#39','#39'6'#39'))'
      
        '          AND ((I.FLGITEMATENDIDO <> '#39'C'#39') OR (I.FLGITEMATENDIDO ' +
        'IS NULL))'
      '          AND (I.IDITEMOC = AI.IDITEMOC)'
      '          AND (AI.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)'
      '        GROUP BY I.NUMOC)) IMP'
      'WHERE (O.IDPESSOA = 2)'
      '   AND (O.NUMOC >= 3674)'
      '   AND (O.NUMOC <= 3675)'
      '   AND (O.OCATENDIDA = '#39'F'#39')'
      '   AND (O.FLGIMPRESSA = '#39'F'#39' )'
      
        '  AND ((I.FLGITEMATENDIDO <> '#39'C'#39') OR (I.FLGITEMATENDIDO IS NULL)' +
        ')'
      '  AND (O.NUMOC = I.NUMOC)'
      '  AND (P.IDPESSOA = O.IDFORCLI)'
      '  AND (I.CODARTIGO = A.CODARTIGO)'
      '  AND (A.CODPRODUTO = PR.CODPRODUTO)'
      '  AND (I.IDPRODVARI = PV.IDPRODVARI(+))'
      '  AND (PE.IDITEMOC = I.IDITEMOC)'
      '  AND (IMP.NUMOC(+) = O.NUMOC)'
      '  AND (TOT.NUMOC = O.NUMOC)'
      '  AND (P.IDPESSOA       = O.IDFORCLI)'
      '  AND (E.IDPESSOA(+)    = P.IDPESSOA)'
      '  AND (E.IDENDERECO(+)  = P.IDENDCOMERCIAL)'
      '  AND (E.IDCIDADES      = C.IDCIDADES(+))'
      '  AND (ES.IDESTADO(+)   = C.IDESTADO)'
      '  AND (TC.IDENDERECO(+) = E.IDENDERECO)'
      'ORDER BY O.NUMOC, I.IDITEMOC')
    ValidateWithMask = True
    Left = 125
    Top = 157
    object qryOCRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryOCNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryOCENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 69
    end
    object qryOCCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryOCBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryOCCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-999;1;_'
      Size = 8
    end
    object qryOCCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryOCEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qryOCCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryOCTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object qryOCDDD: TStringField
      FieldName = 'DDD'
      Size = 5
    end
    object qryOCNUMOC: TFloatField
      FieldName = 'NUMOC'
    end
    object qryOCIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryOCOCATENDIDA: TStringField
      FieldName = 'OCATENDIDA'
      Size = 1
    end
    object qryOCFLGIMPRESSA: TStringField
      FieldName = 'FLGIMPRESSA'
      Size = 1
    end
    object qryOCFLGCOMSEMOC: TStringField
      FieldName = 'FLGCOMSEMOC'
      Size = 1
    end
    object qryOCFLGCOMSEMCOT: TStringField
      FieldName = 'FLGCOMSEMCOT'
      Size = 1
    end
    object qryOCOBSOC: TStringField
      FieldName = 'OBSOC'
      Size = 250
    end
    object qryOCDATAOC: TDateTimeField
      FieldName = 'DATAOC'
    end
    object qryOCCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryOCVALORUN: TFloatField
      FieldName = 'VALORUN'
    end
    object qryOCQTDEENTREGA: TFloatField
      FieldName = 'QTDEENTREGA'
    end
    object qryOCDATAENTREGA: TDateTimeField
      FieldName = 'DATAENTREGA'
    end
    object qryOCPRAZOENTREGA: TFloatField
      FieldName = 'PRAZOENTREGA'
    end
    object qryOCTOTIMP: TFloatField
      FieldName = 'TOTIMP'
    end
    object qryOCTOTITEM: TFloatField
      FieldName = 'TOTITEM'
    end
    object qryOCVALTOTITEM: TFloatField
      FieldName = 'VALTOTITEM'
    end
    object qryOCTOTOC: TFloatField
      FieldName = 'TOTOC'
    end
    object qryOCNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qryOCCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
    object qryOCDESCRCOMPL: TMemoField
      FieldName = 'DESCRCOMPL'
      BlobType = ftMemo
      Size = 500
    end
    object qryOCOBSITEMOC: TStringField
      FieldName = 'OBSITEMOC'
      Size = 200
    end
    object qryOCCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qryOCFRETE: TStringField
      FieldName = 'FRETE'
      Size = 3
    end
    object qryOCDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object dsOC_X: TwwDataSource
    DataSet = qryOC
    Left = 111
    Top = 256
  end
  object bdeOC: TppBDEPipeline
    DataSource = dsOc
    UserName = 'bdeOC'
    Left = 69
    Top = 254
    object bdeOCppField1: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object bdeOCppField2: TppField
      FieldAlias = 'CODPROCESSO'
      FieldName = 'CODPROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object bdeOCppField3: TppField
      FieldAlias = 'IDITEMOC'
      FieldName = 'IDITEMOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object bdeOCppField4: TppField
      FieldAlias = 'NUMOC'
      FieldName = 'NUMOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object bdeOCppField5: TppField
      FieldAlias = 'NUMOC_1'
      FieldName = 'NUMOC_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object bdeOCppField6: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object bdeOCppField7: TppField
      FieldAlias = 'IDPROCESSO'
      FieldName = 'IDPROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object bdeOCppField8: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object bdeOCppField9: TppField
      FieldAlias = 'OCATENDIDA'
      FieldName = 'OCATENDIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object bdeOCppField10: TppField
      FieldAlias = 'FLGIMPRESSA'
      FieldName = 'FLGIMPRESSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object bdeOCppField11: TppField
      FieldAlias = 'FLGCOMSEMOC'
      FieldName = 'FLGCOMSEMOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object bdeOCppField12: TppField
      FieldAlias = 'FLGCOMSEMCOT'
      FieldName = 'FLGCOMSEMCOT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object bdeOCppField13: TppField
      FieldAlias = 'DATAOC'
      FieldName = 'DATAOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object bdeOCppField14: TppField
      FieldAlias = 'OBSOC'
      FieldName = 'OBSOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object bdeOCppField15: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object bdeOCppField16: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object bdeOCppField17: TppField
      FieldAlias = 'FLGTIPOFRETE'
      FieldName = 'FLGTIPOFRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object bdeOCppField18: TppField
      FieldAlias = 'CONTATO'
      FieldName = 'CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object ppOC: TppReport
    AutoStop = False
    DataPipeline = bdeOC
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 150
    Top = 192
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'bdeOC'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppOCDBText11: TppDBText
        UserName = 'ppOCDBText11'
        DataField = 'CODARTIGO'
        DataPipeline = bdeOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object ppOCDBText13: TppDBText
        UserName = 'ppOCDBText13'
        AutoSize = True
        DataField = 'CODMEDIDA'
        DataPipeline = bdeOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3260
        mmLeft = 97631
        mmTop = 0
        mmWidth = 4106
        BandType = 4
      end
      object ppOCDBText15: TppDBText
        UserName = 'ppOCDBText15'
        DataField = 'QTDEENTREGA'
        DataPipeline = bdeOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppOCDBText16: TppDBText
        UserName = 'ppOCDBText16'
        DataField = 'VALORUN'
        DataPipeline = bdeOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3704
        mmLeft = 137319
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppOCDBText17: TppDBText
        UserName = 'ppOCDBText17'
        DataField = 'VALTOTITEM'
        DataPipeline = bdeOC
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppOCDBText18: TppDBText
        UserName = 'ppOCDBText18'
        DataField = 'PRAZOENTREGA'
        DataPipeline = bdeOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppOCLabel16: TppLabel
        UserName = 'ppOCLabel16'
        Caption = 'dia(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 189442
        mmTop = 0
        mmWidth = 7408
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'DESCRICAO'
        DataPipeline = bdeOC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'bdeOC'
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 0
        mmWidth = 70115
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 28575
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 15875
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
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
        mmTop = 16404
        mmWidth = 48154
        BandType = 8
      end
      object ppReport1Line8: TppLine
        UserName = 'ppReport1Line8'
        ReprintOnOverFlow = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 3704
        mmTop = 7408
        mmWidth = 60325
        BandType = 8
      end
      object ppRepLbl1: TppLabel
        UserName = 'ppRepLbl1'
        ReprintOnOverFlow = True
        AutoSize = False
        Caption = 'Coordenador de Compras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 7938
        mmWidth = 60325
        BandType = 8
      end
      object ppReport1Line9: TppLine
        UserName = 'ppReport1Line9'
        ReprintOnOverFlow = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 67998
        mmTop = 7408
        mmWidth = 60325
        BandType = 8
      end
      object ppRepLbl2: TppLabel
        UserName = 'ppRepLbl2'
        ReprintOnOverFlow = True
        AutoSize = False
        Caption = 'Controller'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67998
        mmTop = 7938
        mmWidth = 60325
        BandType = 8
      end
      object ppReport1Line10: TppLine
        UserName = 'ppReport1Line10'
        ReprintOnOverFlow = True
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 132292
        mmTop = 7408
        mmWidth = 60325
        BandType = 8
      end
      object ppRepLbl3: TppLabel
        UserName = 'ppRepLbl3'
        ReprintOnOverFlow = True
        AutoSize = False
        Caption = 'Gerente Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 132292
        mmTop = 7938
        mmWidth = 60325
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 69850
        mmTop = 16404
        mmWidth = 68263
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
        mmTop = 16404
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NUMOC'
      DataPipeline = bdeOC
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'bdeOC'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 85990
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'ppLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 84402
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel1: TppLabel
          UserName = 'ppOCLabel1'
          Caption = '  Itens  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 82021
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppOCShape1: TppShape
          UserName = 'ppOCShape1'
          mmHeight = 42863
          mmLeft = 529
          mmTop = 17992
          mmWidth = 97631
          BandType = 3
          GroupNo = 0
        end
        object ppOCShape2: TppShape
          UserName = 'ppOCShape2'
          mmHeight = 42863
          mmLeft = 97367
          mmTop = 17992
          mmWidth = 97631
          BandType = 3
          GroupNo = 0
        end
        object ppOCLine1: TppLine
          UserName = 'ppOCLine1'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 97896
          mmTop = 40481
          mmWidth = 97102
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel2: TppLabel
          UserName = 'ppOCLabel2'
          AutoSize = False
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 15875
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel3: TppLabel
          UserName = 'ppOCLabel3'
          AutoSize = False
          Caption = 'Endereço de Entrega'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 101865
          mmTop = 15875
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel4: TppLabel
          UserName = 'ppOCLabel4'
          AutoSize = False
          Caption = 'Endereço de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 101600
          mmTop = 38365
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText2: TppDBText
          UserName = 'ppOCDBText2'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 20638
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText3: TppDBText
          UserName = 'ppOCDBText3'
          DataField = 'ENDERECO'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 25400
          mmWidth = 94986
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText4: TppDBText
          UserName = 'ppOCDBText4'
          DataField = 'BAIRRO'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 29898
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText5: TppDBText
          UserName = 'ppOCDBText5'
          DataField = 'CIDADE'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 34396
          mmWidth = 79375
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText6: TppDBText
          UserName = 'ppOCDBText6'
          AutoSize = True
          DataField = 'CEP'
          DataPipeline = bdeOC
          DisplayFormat = '00000-999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3260
          mmLeft = 1323
          mmTop = 38365
          mmWidth = 13462
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText7: TppDBText
          UserName = 'ppOCDBText7'
          DataField = 'CODESTADO'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 17727
          mmTop = 38365
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel7: TppLabel
          UserName = 'ppOCLabel7'
          Caption = 'CGC/MF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 38365
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText8: TppDBText
          UserName = 'ppOCDBText8'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 38365
          mmTop = 38365
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel8: TppLabel
          UserName = 'ppOCLabel8'
          Caption = 'Telefone :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 42598
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText9: TppDBText
          UserName = 'ppOCDBText9'
          DataField = 'DDD'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 16140
          mmTop = 42598
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel9: TppLabel
          UserName = 'ppOCLabel9'
          Caption = '(      )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 42598
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText10: TppDBText
          UserName = 'ppOCDBText10'
          DataField = 'TELEFONE'
          DataPipeline = bdeOC
          DisplayFormat = '000-0000;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 23548
          mmTop = 42598
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel10: TppLabel
          UserName = 'ppOCLabel10'
          Caption = 'Contato :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2117
          mmTop = 46567
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel11: TppLabel
          UserName = 'ppOCLabel11'
          AutoSize = False
          Caption = 'Unid.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 94456
          mmTop = 82021
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel12: TppLabel
          UserName = 'ppOCLabel12'
          AutoSize = False
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 108215
          mmTop = 82021
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel13: TppLabel
          UserName = 'ppOCLabel13'
          AutoSize = False
          Caption = 'Valor Unit.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 131498
          mmTop = 82021
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel14: TppLabel
          UserName = 'ppOCLabel14'
          AutoSize = False
          Caption = 'Valor Tot.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 154782
          mmTop = 82021
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel15: TppLabel
          UserName = 'ppOCLabel15'
          AutoSize = False
          Caption = 'Entrega'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          TextAlignment = taCentered
          mmHeight = 3969
          mmLeft = 179123
          mmTop = 82021
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label23: TppLabel
          UserName = 'ppReport1Label23'
          Caption = 'Data da Ordem de Compra:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 61648
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label21: TppLabel
          UserName = 'ppReport1Label21'
          Caption = 'Prezados Senhores,'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 66146
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppMemFat: TppMemo
          UserName = 'ppMemFat'
          Caption = 'ppMemFat'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Lines.Strings = (
            
              #9#9'Solicitamos fornecer o material abaixo descriminado, faturado ' +
              'em nome e por conta de')
          Stretch = True
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 70115
          mmWidth = 157957
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppOCDBText14: TppDBText
          UserName = 'ppOCDBText14'
          DataField = 'DATAOC'
          DataPipeline = bdeOC
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 39952
          mmTop = 61648
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel17: TppLabel
          UserName = 'ppOCLabel17'
          Caption = 'ppOCLabel17'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 74348
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object LbEndEnt: TppLabel
          UserName = 'LbEndEnt'
          AutoSize = False
          Caption = 'LbEndEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98954
          mmTop = 20638
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object LbCompEnt: TppLabel
          UserName = 'LbCompEnt'
          AutoSize = False
          Caption = 'LbCompEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98954
          mmTop = 25400
          mmWidth = 34131
          BandType = 3
          GroupNo = 0
        end
        object LbBairroEnt: TppLabel
          UserName = 'LbBairroEnt'
          AutoSize = False
          Caption = 'LbBairroEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 135996
          mmTop = 25400
          mmWidth = 57944
          BandType = 3
          GroupNo = 0
        end
        object LbCidadeEnt: TppLabel
          UserName = 'LbCidadeEnt'
          AutoSize = False
          Caption = 'LbCidadeEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98954
          mmTop = 29633
          mmWidth = 76465
          BandType = 3
          GroupNo = 0
        end
        object LbUFEnt: TppLabel
          UserName = 'LbUFEnt'
          AutoSize = False
          Caption = 'LbUFEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 177800
          mmTop = 29633
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object LbCepEnt: TppLabel
          UserName = 'LbCepEnt'
          AutoSize = False
          Caption = 'LbCepEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98954
          mmTop = 33867
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object LbNumDocEnt: TppLabel
          UserName = 'LbNumDocEnt'
          AutoSize = False
          Caption = 'LbNumDocEnt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 153459
          mmTop = 33867
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object LbEndCob: TppLabel
          UserName = 'LbEndCob'
          AutoSize = False
          Caption = 'LbEndCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98690
          mmTop = 42863
          mmWidth = 95250
          BandType = 3
          GroupNo = 0
        end
        object LbCompCob: TppLabel
          UserName = 'LbCompCob'
          AutoSize = False
          Caption = 'LbCompCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98690
          mmTop = 47625
          mmWidth = 34131
          BandType = 3
          GroupNo = 0
        end
        object LbCidadeCob: TppLabel
          UserName = 'LbCidadeCob'
          AutoSize = False
          Caption = 'LbCidadeCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98690
          mmTop = 51858
          mmWidth = 76465
          BandType = 3
          GroupNo = 0
        end
        object LbCepCob: TppLabel
          UserName = 'LbCepCob'
          AutoSize = False
          Caption = 'LbCepCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 98690
          mmTop = 56092
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object LbBairroCob: TppLabel
          UserName = 'LbBairroCob'
          AutoSize = False
          Caption = 'LbBairroCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 135732
          mmTop = 47625
          mmWidth = 57944
          BandType = 3
          GroupNo = 0
        end
        object LbUFCob: TppLabel
          UserName = 'LbUFCob'
          AutoSize = False
          Caption = 'LbUFCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 177536
          mmTop = 51858
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object LbNumDocCob: TppLabel
          UserName = 'LbNumDocCob'
          AutoSize = False
          Caption = 'LbNumDocCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 153194
          mmTop = 56092
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText21: TppDBText
          UserName = 'ppOCDBText21'
          DataField = 'CONTATO'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 3704
          mmLeft = 15346
          mmTop = 46831
          mmWidth = 80169
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'ppLabel4'
          Caption = 'Ordem de Compra Nº '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5292
          mmLeft = 2117
          mmTop = 8467
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'ppLabel5'
          Caption = 'LblEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 14
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5821
          mmLeft = 84138
          mmTop = 1588
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object ppOCDBText1: TppDBText
          UserName = 'ppOCDBText1'
          DataField = 'NUMOC'
          DataPipeline = bdeOC
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'bdeOC'
          mmHeight = 5027
          mmLeft = 46567
          mmTop = 8467
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel5: TppLabel
          UserName = 'ppOCLabel5'
          Caption = 'Fatura para '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 5027
          mmLeft = 74083
          mmTop = 8467
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppOCLabel6: TppLabel
          UserName = 'ppOCLabel6'
          Caption = 'ppOCLabel6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 99484
          mmTop = 8202
          mmWidth = 25135
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 60325
        mmPrintPosition = 0
        object ppOCSubReport1: TppSubReport
          UserName = 'ppOCSubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'bdeAgregOC'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppOCAgreg: TppChildReport
            AutoStop = False
            DataPipeline = DtmRelCompras.bdeAgregOC
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
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'bdeAgregOC'
            object ppOCAgregHeaderBand1: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object ppOCAgregLine1: TppLine
                UserName = 'ppOCAgregLine1'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 5027
                mmWidth = 197300
                BandType = 0
              end
              object ppOCAgregLabel2: TppLabel
                UserName = 'ppOCAgregLabel2'
                AutoSize = False
                Caption = 'Aliquota'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold, fsItalic]
                TextAlignment = taCentered
                mmHeight = 3969
                mmLeft = 97367
                mmTop = 2910
                mmWidth = 16140
                BandType = 0
              end
              object ppOCAgregLabel3: TppLabel
                UserName = 'ppOCAgregLabel3'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold, fsItalic]
                TextAlignment = taCentered
                mmHeight = 3969
                mmLeft = 131234
                mmTop = 2910
                mmWidth = 12700
                BandType = 0
              end
              object ppOCAgregLabel1: TppLabel
                UserName = 'ppOCAgregLabel1'
                AutoSize = False
                Caption = 'Custos Agregados'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold, fsItalic]
                TextAlignment = taCentered
                mmHeight = 3969
                mmLeft = 2646
                mmTop = 2910
                mmWidth = 34396
                BandType = 0
              end
            end
            object ppOCAgregDetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppOCAgregDBText1: TppDBText
                UserName = 'ppOCAgregDBText1'
                AutoSize = True
                DataField = 'DESCCUSTAGREG'
                DataPipeline = DtmRelCompras.bdeAgregOC
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'bdeAgregOC'
                mmHeight = 3175
                mmLeft = 5821
                mmTop = 0
                mmWidth = 25929
                BandType = 4
              end
              object ppOCAgregDBText2: TppDBText
                UserName = 'ppOCAgregDBText2'
                DataField = 'ALIQUOTA'
                DataPipeline = DtmRelCompras.bdeAgregOC
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'bdeAgregOC'
                mmHeight = 3704
                mmLeft = 95515
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object ppOCAgregDBText3: TppDBText
                UserName = 'ppOCAgregDBText3'
                DataField = 'TOTIMP'
                DataPipeline = DtmRelCompras.bdeAgregOC
                DisplayFormat = '#,0.00;-#,0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'bdeAgregOC'
                mmHeight = 3704
                mmLeft = 125942
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
            end
          end
        end
        object RgSumOC: TppRegion
          UserName = 'RgSumOC'
          Caption = 'RgSumOC'
          Pen.Style = psClear
          ShiftRelativeTo = ppOCSubReport1
          Stretch = True
          mmHeight = 51594
          mmLeft = 0
          mmTop = 6615
          mmWidth = 196586
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppOCLabel21: TppLabel
            UserName = 'ppOCLabel21'
            AutoSize = False
            Caption = 'Observações da Ordem de Compras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold, fsItalic]
            TextAlignment = taCentered
            mmHeight = 3969
            mmLeft = 3704
            mmTop = 38365
            mmWidth = 57944
            BandType = 5
            GroupNo = 0
          end
          object LbCondPag: TppLabel
            UserName = 'LbCondPag'
            Caption = 'Condições de Pagamento :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 4233
            mmTop = 12171
            mmWidth = 38894
            BandType = 5
            GroupNo = 0
          end
          object ppOCLabel19: TppLabel
            UserName = 'ppOCLabel19'
            Caption = 'Comprador :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 4233
            mmTop = 16404
            mmWidth = 18256
            BandType = 5
            GroupNo = 0
          end
          object LbPrazoPag: TppLabel
            UserName = 'LbPrazoPag'
            Caption = '30 dias'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 43921
            mmTop = 12171
            mmWidth = 9260
            BandType = 5
            GroupNo = 0
          end
          object ppOCLabel23: TppLabel
            UserName = 'ppOCLabel23'
            AutoSize = False
            Caption = 'Totais'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = [fsBold, fsItalic]
            TextAlignment = taCentered
            mmHeight = 3969
            mmLeft = 130704
            mmTop = 7938
            mmWidth = 14817
            BandType = 5
            GroupNo = 0
          end
          object ppOCLabel22: TppLabel
            UserName = 'ppOCLabel22'
            Caption = 'Parcial :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 134938
            mmTop = 12171
            mmWidth = 11113
            BandType = 5
            GroupNo = 0
          end
          object ppOCLabel24: TppLabel
            UserName = 'ppOCLabel24'
            Caption = 'Encargos:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 134938
            mmTop = 16140
            mmWidth = 14288
            BandType = 5
            GroupNo = 0
          end
          object ppOCLabel25: TppLabel
            UserName = 'ppOCLabel25'
            Caption = 'Geral:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 134938
            mmTop = 20373
            mmWidth = 8467
            BandType = 5
            GroupNo = 0
          end
          object ppOCDBCalc1: TppDBCalc
            UserName = 'ppOCDBCalc1'
            AutoSize = True
            DataField = 'VALTOTITEM'
            DataPipeline = bdeOC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'bdeOC'
            mmHeight = 3260
            mmLeft = 150263
            mmTop = 11906
            mmWidth = 28067
            BandType = 5
            GroupNo = 0
          end
          object ppOCDBText19: TppDBText
            UserName = 'ppOCDBText19'
            DataField = 'TOTIMP'
            DataPipeline = bdeOC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'bdeOC'
            mmHeight = 3704
            mmLeft = 162454
            mmTop = 16140
            mmWidth = 15875
            BandType = 5
            GroupNo = 0
          end
          object lbTotGeralOC: TppDBText
            UserName = 'lbTotGeralOC'
            DataField = 'TOTOC'
            DataPipeline = bdeOC
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'bdeOC'
            mmHeight = 3704
            mmLeft = 162454
            mmTop = 20373
            mmWidth = 15875
            BandType = 5
            GroupNo = 0
          end
          object hhghgfhfg: TppDBText
            UserName = 'hhghgfhfg'
            AutoSize = True
            DataField = 'NOMEUSUARIO'
            DataPipeline = DtmRelCompras.bdeCompOC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            Transparent = True
            DataPipelineName = 'bdeCompOC'
            mmHeight = 3260
            mmLeft = 43921
            mmTop = 16140
            mmWidth = 21378
            BandType = 5
            GroupNo = 0
          end
          object ppOCLine5: TppLine
            UserName = 'ppOCLine5'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 61383
            mmTop = 40481
            mmWidth = 133615
            BandType = 5
            GroupNo = 0
          end
          object ppOCLine3: TppLine
            UserName = 'ppOCLine3'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 1058
            mmTop = 10319
            mmWidth = 129382
            BandType = 5
            GroupNo = 0
          end
          object ppOCLine2: TppLine
            UserName = 'ppOCLine2'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 145521
            mmTop = 10319
            mmWidth = 50006
            BandType = 5
            GroupNo = 0
          end
          object ppOCLine4: TppLine
            UserName = 'ppOCLine4'
            Weight = 0.75
            mmHeight = 2381
            mmLeft = 1058
            mmTop = 40481
            mmWidth = 2381
            BandType = 5
            GroupNo = 0
          end
          object LbTotOC: TppLabel
            UserName = 'LbTotOC'
            Caption = 'Total por Extenso :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3704
            mmLeft = 4233
            mmTop = 25665
            mmWidth = 26988
            BandType = 5
            GroupNo = 0
          end
          object LbValTot1: TppLabel
            UserName = 'LbValTot1'
            AutoSize = False
            Caption = 'LbValTot1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 31750
            mmTop = 25665
            mmWidth = 160867
            BandType = 5
            GroupNo = 0
          end
          object LbValTot2: TppLabel
            UserName = 'LbValTot2'
            AutoSize = False
            Caption = 'LbValTot1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3704
            mmLeft = 31750
            mmTop = 29898
            mmWidth = 160867
            BandType = 5
            GroupNo = 0
          end
          object memObsOC: TppMemo
            UserName = 'memObsOC'
            Caption = 'memObsOC'
            CharWrap = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Stretch = True
            Transparent = True
            mmHeight = 14288
            mmLeft = 5821
            mmTop = 42598
            mmWidth = 188384
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
