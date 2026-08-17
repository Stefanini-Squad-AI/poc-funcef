inherited FrmConsOrdemPagoMT: TFrmConsOrdemPagoMT
  Left = 86
  Top = 180
  HelpContext = 30070
  Caption = 'Ordem de Pagamento'
  ClientHeight = 389
  ClientWidth = 778
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 778
    Height = 350
    object Label1: TLabel
      Left = 562
      Top = 20
      Width = 96
      Height = 13
      Caption = 'Ordem de Pagto.'
    end
    object RadioGroup1: TRadioGroup
      Left = 325
      Top = 7
      Width = 228
      Height = 55
      Caption = 'Status'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Cancelados'
        'Baixados'
        'Em Aberto')
      TabOrder = 2
      OnClick = RadioGroup1Click
    end
    object CPForCli: TCMProcuraForCli
      Left = 12
      Top = 8
      Width = 309
      Height = 54
      Caption = 'Fornecedor'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = ' não pode estar em branco'
      Mensagens.NaoExiste = ' não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      OnChange = CPForCliChange
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
      MostraStatusCredito = False
    end
    object msknumslip: TMaskEdit
      Left = 562
      Top = 36
      Width = 101
      Height = 21
      MaxLength = 11
      TabOrder = 1
      OnChange = msknumslipChange
      OnKeyPress = msknumslipKeyPress
    end
    object bbtnSelecionaDoc: TBitBtn
      Left = 673
      Top = 8
      Width = 97
      Height = 56
      Caption = 'Seleciona'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = bbtnSelecionaDocClick
      Glyph.Data = {
        0A030000424D0A03000000000000760000002800000021000000210000000100
        0400000000009402000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777888888888
        888888888877777777777C000000770000000000000000000087777777777700
        000077033333333333333333330877777777760000007703B7B7B7B7B7B7B7B7
        7330877777777200000077037B7B7B7B7B7B7B7B7333087777777E0000007703
        B7B7B7B7B7B7B7B77333308777777000000077037B7BFBFBFBF77B7B73333308
        7777720000007703B7B703333330B7B77333333087777F00000077037B7B0333
        33307B7B733333308777720000007703B7B700000000B7B77333333087777500
        000077037B7B7B7B7B7B7B7B733333308777700000007703B7B7B7B7B7B7B7B7
        733333308777710000007703BBBBBBBBBBBBBBBB733333308777760000007770
        0000000000000000033333308777700000007770777777777777777000333330
        87777000000077700FFFFFFFFFFFFF080803333087777D000000777700FFFFFF
        FFFFFF088080333087777100000077777700FFFFFFFFF0887708033087777D00
        00007777777000FFFFFFF0877FF08030877774000000777777770F00FFFF0887
        FFFF08008777750000007777777770FF00FF087FFFF000007777730000007777
        7777700FFF0087FFFF00877777777E000000777777777700FFFFFFFFF0808777
        7777730000007777777777700FFFFFFF087F0877777777000000777777777770
        F0FFFFF08777087777777E0000007777777777770F0FFF0877FFF07777777D00
        00007777777777770FF0F087FFFFF07777777400000077777777777770FF087F
        FFF0077777777000000077777777777770FFFFFFF00777777777710000007777
        77777777770FFFF007777777777772000000777777777777770FF00777777777
        7777700000007777777777777770077777777777777770000000777777777777
        7777777777777777777777000000}
      Layout = blGlyphTop
    end
    object Panel2: TPanel
      Left = 1
      Top = 192
      Width = 776
      Height = 157
      Align = alBottom
      TabOrder = 4
      object wwDBGrid2: TwwDBGrid
        Left = 1
        Top = 32
        Width = 774
        Height = 124
        Selected.Strings = (
          'NOME'#9'35'#9'Fornecedor'
          'NODOCUMENTO'#9'16'#9'Número do Documento'
          'COMPLDOCUMENTO'#9'5'#9'Compl.'
          'VALOR'#9'10'#9'Valor Pago'
          'SALDO'#9'10'#9'Saldo'
          'HISTORICOCOMPL'#9'34'#9'Histórico'
          'TIPODOC'#9'35'#9'Tipo de Documento'
          'DATAPROGRAMADA'#9'13'#9'Data Programada'
          'DATAVENCTO'#9'15'#9'Data de Vencimento'
          'NUMSLIP'#9'11'#9'SLIP')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = dsDocLote
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object PnlDisplay: TPanel
        Left = 1
        Top = 1
        Width = 774
        Height = 31
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Documentos Contidos Na Ordem de Pagamento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 70
      Width = 776
      Height = 122
      Align = alBottom
      TabOrder = 5
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 32
        Width = 774
        Height = 89
        Selected.Strings = (
          'NUMSLIP'#9'11'#9'Ordem Pagto.'
          'FLAGCANCEL'#9'9'#9'Status'
          'VALORLOTE'#9'10'#9'Valor Lote'
          'VALORRETENCAO'#9'10'#9'Valor Ret.'
          'VLTOT'#9'10'#9'Vl. com Ret.'
          'NUMLOTE'#9'10'#9'Lote'
          'NUMCHQBORDERO'#9'15'#9'Nº Chq/Bordero'
          'FAVORECIDO'#9'60'#9'Favorecido'
          'DESCRICAO'#9'50'#9'Bancos/Caixa/ Forma de Pagamento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alBottom
        DataSource = dsLote
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 774
        Height = 32
        Align = alTop
        BevelInner = bvLowered
        BevelWidth = 2
        Caption = 'Ordem de Pagamento'
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 350
    Width = 778
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 30085
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 83
    Top = 539
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsDocLote: TwwDataSource
    DataSet = CdsDocLote
    Left = 304
    Top = 288
  end
  object dsLote: TwwDataSource
    DataSet = CdsLote
    Left = 416
    Top = 288
  end
  object CdsLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsLoteAfterScroll
    Left = 453
    Top = 106
  end
  object SqlLote: TCMSqlParams
    SQL.Strings = (
      
        'SELECT L.NUMSLIP ,L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NU' +
        'MCHQBORDERO, L.FAVORECIDO,'
      '       DECODE(L.FLAGEMISSAO,1,'#39'SIM'#39','#39'NÃO'#39') AS FLAGEMISSAO, '
      '       DECODE(L.FLAGCANCEL,NULL,'#39'EM ABERTO'#39','
      '              DECODE(L.FLAGCANCEL,'#39'B'#39','#39'BAIXADO'#39','
      
        '              DECODE(L.FLAGCANCEL,'#39'C'#39','#39'CANCELADO'#39',DECODE(L.FLAGC' +
        'ANCEL,'#39'R'#39','#39'CANCELADO'#39')))) AS FLAGCANCEL,'
      
        '       L.OBSERVACAO,  0 as valorretencao,0 as valorlote,0 as vlt' +
        'ot, L.NUMSLIP'
      '       P.DESCRICAO, L.IDPROCESSO'
      'FROM LOTEPAGTO L, PORTADORFORMA P'
      'WHERE (L.NUMLOTE = :pNUMLOTE) AND'
      '      (L.CODPORTFORMA = P.CODPORTFORMA)'
      ' ')
    ClientDataSet = CdsLote
    Left = 464
    Top = 152
  end
  object SqlDocLote: TCMSqlParams
    SQL.Strings = (
      'SELECT S.SALDO,D.IDFORCLI,D.OPERACAO,D.CODDOCUMENTO,'
      
        '       D.IDPESSOA,D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAPROGRAMAD' +
        'A,'
      '       D.DATAVENCTO,D.RECPAG,P.RAZAOSOCIAL AS NOME,D.STATUS,'
      '       D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS,'
      '       TD.DESCRICAO AS TIPODOC,'
      
        '       LD.VALOR, L.HISTORICOCOMPL, D.NUMSLIP, '#39'           '#39' NUMO' +
        'P'
      'FROM DOCUMENTO D, PESSOA P, LOTEXDOCUM LD, TIPODOCRECPAG TD,'
      '     LANCTODOCUM L,'
      
        '     (SELECT L.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,(L.' +
        'VALOR*-1))) AS SALDO'
      '      FROM LANCTODOCUM L'
      '      GROUP BY L.CODDOCUMENTO) S'
      'WHERE (LD.NUMLOTE = :NUMLOTE) AND'
      '      (D.CODDOCUMENTO = LD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (S.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (TD.CODTIPDOC = D.CODTIPDOC) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      ''
      ' '
      ' ')
    ClientDataSet = CdsDocLote
    Left = 304
    Top = 160
  end
  object CdsDocLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 301
    Top = 114
  end
end
