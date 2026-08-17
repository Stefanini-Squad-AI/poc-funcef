inherited frmconsordempago: Tfrmconsordempago
  Left = 139
  Top = 134
  HelpContext = 30085
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
      Left = 5
      Top = 188
      Width = 768
      Height = 157
      Align = alBottom
      TabOrder = 4
      object wwDBGrid2: TwwDBGrid
        Left = 1
        Top = 32
        Width = 766
        Height = 124
        Selected.Strings = (
          'NOME'#9'35'#9'Fornecedor'#9'No'
          'NODOCUMENTO'#9'16'#9'Número do Documento'#9'No'
          'COMPLDOCUMENTO'#9'5'#9'Compl.'#9'No'
          'VALOR'#9'10'#9'Valor Pago'#9'No'
          'SALDO'#9'10'#9'Saldo'#9'No'
          'HISTORICOCOMPL'#9'34'#9'Histórico'#9'No'
          'TIPODOC'#9'35'#9'Tipo de Documento'#9'No'
          'DATAPROGRAMADA'#9'13'#9'Data Programada'#9'No'
          'DATAVENCTO'#9'15'#9'Data de Vencimento'#9'No')
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
        Width = 766
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
      Left = 5
      Top = 66
      Width = 768
      Height = 122
      Align = alBottom
      TabOrder = 5
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 32
        Width = 766
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
        Width = 766
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
    DataSet = qryDocLote
    Left = 352
    Top = 288
  end
  object qryDocLote: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsLote
    SQL.Strings = (
      'SELECT S.SALDO,D.IDFORCLI,D.OPERACAO,D.CODDOCUMENTO,'
      
        '       D.IDPESSOA,D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAPROGRAMAD' +
        'A,'
      '       D.DATAVENCTO,D.RECPAG,P.RAZAOSOCIAL AS NOME,D.STATUS,'
      '       D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS,'
      '       TD.DESCRICAO AS TIPODOC,'
      '       LD.VALOR, L.HISTORICOCOMPL'
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
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO)')
    ValidateWithMask = True
    Left = 216
    Top = 288
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NUMLOTE'
        ParamType = ptUnknown
      end>
    object qryDocLoteNOME: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 35
      FieldName = 'NOME'
      Size = 60
    end
    object qryDocLoteNODOCUMENTO: TFloatField
      DisplayLabel = 'Número do Documento'
      DisplayWidth = 16
      FieldName = 'NODOCUMENTO'
    end
    object qryDocLoteCOMPLDOCUMENTO: TStringField
      DisplayLabel = 'Compl.'
      DisplayWidth = 5
      FieldName = 'COMPLDOCUMENTO'
      Size = 3
    end
    object qryDocLoteVALOR: TFloatField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object qryDocLoteSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 10
      FieldName = 'SALDO'
      DisplayFormat = '#,##0.00'
    end
    object qryDocLoteHISTORICOCOMPL: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 34
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object qryDocLoteTIPODOC: TStringField
      DisplayLabel = 'Tipo de Documento'
      DisplayWidth = 35
      FieldName = 'TIPODOC'
      Size = 35
    end
    object qryDocLoteDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Programada'
      DisplayWidth = 13
      FieldName = 'DATAPROGRAMADA'
    end
    object qryDocLoteDATAVENCTO: TDateTimeField
      DisplayLabel = 'Data de Vencimento'
      DisplayWidth = 15
      FieldName = 'DATAVENCTO'
    end
    object qryDocLoteNUMLEITCODBARRAS: TStringField
      DisplayLabel = 'Código de Barra - Leitora'
      DisplayWidth = 60
      FieldName = 'NUMLEITCODBARRAS'
      Visible = False
      Size = 60
    end
    object qryDocLoteNUMDIGCODBARRAS: TStringField
      DisplayLabel = 'Código de Barra - Digitado'
      DisplayWidth = 60
      FieldName = 'NUMDIGCODBARRAS'
      Visible = False
      Size = 60
    end
    object qryDocLoteIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object qryDocLoteOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Visible = False
      Size = 2
    end
    object qryDocLoteCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Visible = False
    end
    object qryDocLoteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDocLoteRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object qryDocLoteSTATUS: TStringField
      FieldName = 'STATUS'
      Visible = False
      Size = 1
    end
  end
  object dsLote: TwwDataSource
    DataSet = qryLote
    Left = 416
    Top = 288
  end
  object qryLote: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT L.NUMSLIP ,L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NU' +
        'MCHQBORDERO, L.FAVORECIDO,'
      '       DECODE(L.FLAGEMISSAO,1,'#39'SIM'#39','#39'NÃO'#39') AS FLAGEMISSAO, '
      '       DECODE(L.FLAGCANCEL,NULL,'#39'EM ABERTO'#39','
      '              DECODE(L.FLAGCANCEL,'#39'B'#39','#39'BAIXADO'#39','
      
        '              DECODE(L.FLAGCANCEL,'#39'C'#39','#39'CANCELADO'#39',DECODE(L.FLAGC' +
        'ANCEL,'#39'R'#39','#39'CANCELADO'#39')))) AS FLAGCANCEL,'
      
        '       L.OBSERVACAO,  0 as valorretencao,0 as valorlote,0 as vlt' +
        'ot,'
      '       P.DESCRICAO, L.IDPROCESSO'
      'FROM LOTEPAGTO L, PORTADORFORMA P'
      'WHERE (L.NUMLOTE = :pNUMLOTE) AND'
      '      (L.CODPORTFORMA = P.CODPORTFORMA)')
    ValidateWithMask = True
    Left = 264
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pNUMLOTE'
        ParamType = ptUnknown
        Value = 3330
      end>
    object qryLoteNUMSLIP: TStringField
      DisplayLabel = 'Ordem Pagto.'
      DisplayWidth = 11
      FieldName = 'NUMSLIP'
      Size = 11
    end
    object qryLoteFLAGCANCEL: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 9
      FieldName = 'FLAGCANCEL'
      Size = 9
    end
    object qryLoteVALORLOTE: TFloatField
      DisplayLabel = 'Valor Lote'
      DisplayWidth = 10
      FieldName = 'VALORLOTE'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryLoteVALORRETENCAO: TFloatField
      DisplayLabel = 'Valor Ret.'
      DisplayWidth = 10
      FieldName = 'VALORRETENCAO'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryLoteVLTOT: TFloatField
      DisplayLabel = 'Vl. com Ret.'
      DisplayWidth = 10
      FieldName = 'VLTOT'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryLoteNUMLOTE: TFloatField
      DisplayLabel = 'Lote'
      DisplayWidth = 10
      FieldName = 'NUMLOTE'
      Origin = 'LOTEPAGTO.NUMLOTE'
    end
    object qryLoteNUMCHQBORDERO: TStringField
      DisplayLabel = 'Nº Chq/Bordero'
      DisplayWidth = 15
      FieldName = 'NUMCHQBORDERO'
      Origin = 'LOTEPAGTO.NUMCHQBORDERO'
      Size = 15
    end
    object qryLoteFAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      DisplayWidth = 60
      FieldName = 'FAVORECIDO'
      Origin = 'LOTEPAGTO.FAVORECIDO'
      Size = 60
    end
    object qryLoteDESCRICAO: TStringField
      DisplayLabel = 'Bancos/Caixa/ Forma de Pagamento'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLoteDATAEMISSAO: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DATAEMISSAO'
      Origin = 'LOTEPAGTO.DATAEMISSAO'
      Visible = False
    end
    object qryLoteCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'LOTEPAGTO.CODPORTFORMA'
      Visible = False
    end
    object qryLoteOBSERVACAO: TStringField
      DisplayWidth = 80
      FieldName = 'OBSERVACAO'
      Origin = 'LOTEPAGTO.OBSERVACAO'
      Visible = False
      Size = 80
    end
    object qryLoteIDPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPROCESSO'
      Origin = 'LOTEPAGTO.IDPROCESSO'
      Visible = False
    end
    object qryLoteFLAGEMISSAO: TStringField
      DisplayWidth = 3
      FieldName = 'FLAGEMISSAO'
      Visible = False
      Size = 3
    end
  end
end
