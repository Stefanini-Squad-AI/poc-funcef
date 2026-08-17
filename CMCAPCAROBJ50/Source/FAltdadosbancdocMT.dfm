inherited FrmAltdadosbancdocMT: TFrmAltdadosbancdocMT
  Left = 131
  Top = 159
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Alteração de Dados Bancários do Documento'
  ClientHeight = 481
  ClientWidth = 733
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 145
    Top = 47
    Width = 68
    Height = 13
    Caption = 'Doc\Compl:'
  end
  object Label2: TLabel [1]
    Left = 153
    Top = 71
    Width = 68
    Height = 13
    Caption = 'Doc\Compl:'
  end
  inherited pnlFundo: TPanel
    Width = 733
    Height = 442
    object Bevel1: TBevel
      Left = 6
      Top = 90
      Width = 721
      Height = 286
      Shape = bsFrame
    end
    object lblObs: TLabel
      Left = 21
      Top = 250
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object lblNumProc: TLabel
      Left = 21
      Top = 211
      Width = 63
      Height = 13
      Caption = 'Referência'
    end
    object Label3: TLabel
      Left = 374
      Top = 252
      Width = 148
      Height = 13
      Caption = 'Histórico de Lançamentos'
    end
    object Label6: TLabel
      Left = 376
      Top = 304
      Width = 330
      Height = 26
      Caption = 
        'Aviso: Esta descrição de histórico NÃO será replicada no históri' +
        'co Contábil, apenas no documento corrente.'
      WordWrap = True
    end
    object GpDocumento: TGroupBox
      Left = 8
      Top = 5
      Width = 721
      Height = 83
      Caption = ' Dados Do Documento '
      TabOrder = 0
      object LblSisOrigem: TLabel
        Left = 145
        Top = 11
        Width = 110
        Height = 13
        Caption = 'Sistema de Origem:'
      end
      object LblFornCli: TLabel
        Left = 145
        Top = 29
        Width = 44
        Height = 13
        Caption = 'Cliente:'
      end
      object LblDataProg: TLabel
        Left = 337
        Top = 47
        Width = 62
        Height = 13
        Caption = 'Data Prog:'
      end
      object LblDocCompl: TLabel
        Left = 145
        Top = 47
        Width = 68
        Height = 13
        Caption = 'Doc\Compl:'
      end
      object LblSaldo: TLabel
        Left = 513
        Top = 46
        Width = 37
        Height = 13
        Caption = 'Saldo:'
      end
      object lboperacao: TLabel
        Left = 145
        Top = 65
        Width = 60
        Height = 13
        Caption = 'Operação:'
      end
      object BitBtn1: TBitBtn
        Left = 11
        Top = 22
        Width = 127
        Height = 36
        Caption = 'Seleciona'
        TabOrder = 0
        OnClick = BtnSelecionaClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777770000000000000007777777770999999000000007777
          7777709999990000000077777777700000000000000070000000007777777000
          000070FFFFFF007777777000000070F87777F07000077000000070FFFFFFF070
          AA077000000070F88777F000AA000000000070FFFFFFF0AAAAAA0000000070F8
          877770AAAAAA0000000070FFFF000000AA000000000070F887070770AA077000
          000070FFFF007770000770000000700000077777777770000000777777777777
          777770000000}
      end
    end
    object GpBarras: TGroupBox
      Left = 14
      Top = 145
      Width = 709
      Height = 61
      Caption = ' Nº da Ficha de Compensação '
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 16
        Width = 98
        Height = 13
        Caption = 'Código de Barras'
      end
      object Label5: TLabel
        Left = 348
        Top = 17
        Width = 86
        Height = 13
        Caption = 'Linha Digitável'
      end
      object DbeBarras: TwwDBEdit
        Left = 8
        Top = 33
        Width = 321
        Height = 21
        DataField = 'NUMLEITCODBARRAS'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbeLinhaDigit: TwwDBEdit
        Left = 348
        Top = 33
        Width = 350
        Height = 21
        DataField = 'NUMDIGCODBARRAS'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object GroupBox1: TGroupBox
      Left = 14
      Top = 101
      Width = 335
      Height = 45
      Caption = ' Forma de Pagamento '
      TabOrder = 1
      object DblCodForma: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 318
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição')
        DataField = 'CODFORMA'
        DataSource = ds
        LookupTable = cdsFormaPag
        LookupField = 'CODFORMA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object GroupBox2: TGroupBox
      Left = 362
      Top = 101
      Width = 360
      Height = 46
      Caption = ' Contas/Caixas x Forma de Pagamento '
      TabOrder = 2
      object dblcPortadorForma: TwwDBLookupCombo
        Left = 9
        Top = 17
        Width = 344
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO')
        DataField = 'CODPORTFORMA'
        DataSource = ds
        LookupTable = cdsPortForma
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        DropDownWidth = 450
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object GpConta: TGroupBox
      Left = 8
      Top = 379
      Width = 316
      Height = 58
      Caption = ' Conta Bancária '
      TabOrder = 6
      object Label14: TLabel
        Left = 8
        Top = 14
        Width = 37
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 118
        Top = 14
        Width = 52
        Height = 13
        Caption = 'Nº Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 58
        Top = 14
        Width = 47
        Height = 13
        Caption = 'Agência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 173
        Top = 15
        Width = 115
        Height = 13
        DataField = 'DESCTIPOCONTA'
        DataSource = ds
      end
      object BtnBuscaContaCor: TSpeedButton
        Left = 283
        Top = 26
        Width = 25
        Height = 25
        Hint = 'Altera Conta Bancária'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = BtnBuscaContaCorClick
      end
      object DbEdtConta: TwwDBEdit
        Left = 118
        Top = 29
        Width = 163
        Height = 21
        DataField = 'CONTACORRENTE'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbEdtBanco: TwwDBEdit
        Left = 8
        Top = 29
        Width = 44
        Height = 21
        DataField = 'NUMBANCO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbEdtAgencia: TwwDBEdit
        Left = 57
        Top = 29
        Width = 57
        Height = 21
        DataField = 'NUMAGENCIA'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object DbeNumProc: TwwDBEdit
      Left = 21
      Top = 225
      Width = 185
      Height = 21
      DataField = 'REFERENCIA'
      DataSource = ds
      TabOrder = 5
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbmObs: TDBMemo
      Left = 21
      Top = 265
      Width = 337
      Height = 103
      DataField = 'OBS'
      DataSource = ds
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 374
      Top = 266
      Width = 339
      Height = 21
      DataField = 'HISTORICOCOMPL'
      DataSource = dsHistLanc
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 442
    Width = 733
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 114
    Top = 315
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
        'TDBMemo'
        'Text'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = cds
    Left = 517
    Top = 385
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.NODOCUMENTO'
      'LANCTODOCUM.DATALANCTO'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'LANCTODOCUM.VALOR'
      'LANCTODOCUM.HISTORICOCOMPL'
      'TIPODOCRECPAG.DESCRICAO'
      'PORTADORFORMA.DESCRICAO'
      'MODULO.NOMEMODULO')
    TipodeDado.Strings = (
      'C'
      'N'
      'D'
      'D'
      'D'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Razão Social'
      'Número do Documento'
      'Data de Lançamento'
      'Data de Vencimento'
      'Data Programada'
      'Valor Moeda Corrente'
      'Histórico'
      'Número do Cheque/Borderô'
      'Nome'
      'Sistema de Origem')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'LANCTODOCUM'
      'DOCUMENTO'
      'MOEDA'
      'TIPODOCRECPAG'
      'PORTADORFORMA'
      'MODULO'
      'RECBTOPAGTO')
    CamposChave.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'DOCUMENTO.NODOCUMENTO'
      'DOCUMENTO.COMPLDOCUMENTO'
      'DOCUMENTO.DATAPROGRAMADA'
      'PESSOA.RAZAOSOCIAL'
      'DOCUMENTO.IDFORCLI'
      'LANCTODOCUM.DATALANCTO'
      'MODULO.NOMEMODULO'
      'DOCUMENTO.MOECODIGO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA =DOCUMENTO.IDFORCLI'
      'TIPODOCRECPAG.CODTIPDOC=DOCUMENTO.CODTIPDOC'
      'LANCTODOCUM.CODDOCUMENTO=DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.OPERACAO=DOCUMENTO.OPERACAO'
      'DOCUMENTO.IDMODULO=MODULO.IDMODULO(+)'
      'DOCUMENTO.MOECODIGO=MOEDA.MOECODIGO(+)'
      'DOCUMENTO.CODPORTFORMA=PORTADORFORMA.CODPORTFORMA(+)'
      'LANCTODOCUM.CODDOCUMENTO=RECBTOPAGTO.CODDOCUMENTO(+)'
      'LANCTODOCUM.NUMLANCTO=RECBTOPAGTO.NUMLANCTO(+)'
      'LANCTODOCUM.ESTORNO IS NULL'
      'DOCUMENTO.STATUS <> '#39'2'#39)
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '60'
      '1'
      '60'
      '10'
      '10'
      '30'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
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
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 580
    Top = 12
  end
  object cdsPortForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 608
    Top = 111
  end
  object sqlFormaPag: TCMSqlParams
    SQL.Strings = (
      'SELECT CODFORMA, RECPAG, DESCRICAO'
      'FROM FORMARECPAG '
      'WHERE (RECPAG = :PRECPAG) AND'
      '               (IDPESSOA = :PIDPESSOA)'
      ''
      '')
    ClientDataSet = cdsFormaPag
    Left = 138
    Top = 111
  end
  object cdsFormaPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 111
  end
  object sql: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  DECODE(D.OPERACAO, 1,  '#39'Lançamento efetivo que será parcelado.' +
        #39','
      
        '                     2,  '#39'Lançamento efetivo que não será parcel' +
        'ado.'#39','
      '                     3,  '#39'Lançamento da parcela efetivo.'#39','
      
        '                     11, '#39'Lançamento previsto que será parcelado' +
        '.'#39','
      
        '                     12, '#39'Lançamento previsto que não será parce' +
        'lado.'#39','
      '                     13, '#39'Lançamento da parcela previsto.'#39' ,'
      
        '                     14, '#39'Lançamento de adiantamento.'#39') as opera' +
        'cao,'
      ''
      '  D.REFERENCIA,        D.OBS,'
      '  D.CODDOCUMENTO,  D.CODFORMA, D.IDFORCLI, D.IDCBANCARIA,'
      '  D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS, D.CODPORTFORMA,'
      '  C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA,'
      ''
      '  DECODE(C.TIPOCONTA, '#39'1'#39', '#39'Conta Corrente'#39','
      '                      '#39'2'#39', '#39'Cartão Salário'#39','
      
        '                      '#39'3'#39', '#39'Conta Poupança'#39', '#39#39') AS DESCTIPOCONT' +
        'A'
      ''
      'FROM'
      '  DOCUMENTO D,'
      '  CONTABANCARIA C,'
      '  AGENCIABANCARIA A,'
      '  BANCO B'
      ''
      'WHERE (D.CODDOCUMENTO = :CODDOCUMENTO)'
      '  AND (C.IDAGENCIA    = A.IDPESSOA(+))'
      '  AND (A.IDBANCO      = B.IDPESSOA(+))'
      '  AND (D.IDCBANCARIA  = C.IDCBANCARIA(+))'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cds
    Left = 484
    Top = 385
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 454
    Top = 385
  end
  object SqlDadosDelLote: TCMSqlParams
    SQL.Strings = (
      'SELECT NUMLOTE, FLAGCANCEL FROM LOTEPAGTO '
      'WHERE NUMLOTE = (SELECT NVL(MAX(NUMLOTE), 0) AS NUMLOTE'
      
        '                                      FROM LOTEXDOCUM WHERE CODD' +
        'OCUMENTO = :CODDOCUMENTO)'
      ''
      ''
      '')
    ClientDataSet = CdsDadosDelLote
    Left = 598
    Top = 347
  end
  object CdsDadosDelLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 656
    Top = 384
  end
  object sqlStatusDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT STATUS FROM DOCUMENTO WHERE CODDOCUMENTO = :codDocumento')
    ClientDataSet = cdsStatusDoc
    Left = 614
    Top = 168
  end
  object cdsStatusDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 662
    Top = 168
  end
  object cdsHistLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 216
  end
  object sqlHistLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   L.NUMLANCTO,'
      '   L.CODDOCUMENTO,'
      '   L.DATALANCTO,'
      '   L.HISTORICOCOMPL'
      'FROM'
      '   LANCTODOCUM L, DOCUMENTO D'
      'WHERE'
      '   (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '   (L.OPERACAO     = D.OPERACAO) AND'
      '   (L.CODDOCUMENTO = :CODDOCUMENTO)'
      ' ')
    ClientDataSet = cdsHistLanc
    Left = 656
    Top = 208
  end
  object dsHistLanc: TwwDataSource
    DataSet = cdsHistLanc
    Left = 584
    Top = 216
  end
  object sqlVerificaEstornoDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT FLGESTORNO FROM LOTEXDOCUM '
      'WHERE CODDOCUMENTO = :CODDOCUMENTO AND'
      
        '               NUMLOTE = (SELECT NVL(MAX(NUMLOTE), 0)  FROM LOTE' +
        'XDOCUM WHERE CODDOCUMENTO = :CODDOCUMENTO) '
      ''
      ''
      ''
      '')
    ClientDataSet = cdslVerificaEstornoDoc
    Left = 416
    Top = 336
  end
  object cdslVerificaEstornoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 336
  end
end
