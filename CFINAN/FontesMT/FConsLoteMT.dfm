inherited frmConsLoteMT: TfrmConsLoteMT
  Left = 133
  Top = 128
  Caption = 'Consulta Lote'
  ClientHeight = 411
  ClientWidth = 783
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 128
    Top = 36
    Width = 217
    Height = 13
    Caption = 'Bancos/Caixa / Forma de Pagamento:'
  end
  object DBText3: TDBText [1]
    Left = 352
    Top = 36
    Width = 50
    Height = 13
    AutoSize = True
    DataField = 'DESCRICAO'
    DataSource = dsLote
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel [2]
    Left = 16
    Top = 84
    Width = 68
    Height = 13
    Caption = 'Favorecido:'
  end
  object DBText8: TDBText [3]
    Left = 88
    Top = 84
    Width = 50
    Height = 13
    AutoSize = True
    DataField = 'FAVORECIDO'
    DataSource = dsLote
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel [4]
    Left = 24
    Top = 92
    Width = 68
    Height = 13
    Caption = 'Favorecido:'
  end
  object DBText9: TDBText [5]
    Left = 96
    Top = 92
    Width = 50
    Height = 13
    AutoSize = True
    DataField = 'FAVORECIDO'
    DataSource = dsLote
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel [6]
    Left = 32
    Top = 100
    Width = 68
    Height = 13
    Caption = 'Favorecido:'
  end
  object DBText10: TDBText [7]
    Left = 104
    Top = 100
    Width = 57
    Height = 13
    AutoSize = True
    DataField = 'FAVORECIDO'
    DataSource = dsLote
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 783
    Height = 372
    object lbldoc: TLabel
      Left = 8
      Top = 138
      Width = 185
      Height = 13
      Caption = 'Documentos que Compõe o Lote'
    end
    object dblPortadorForma: TDBText
      Left = 352
      Top = 36
      Width = 100
      Height = 13
      AutoSize = True
      DataField = 'DESCRICAO'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPortadorForma: TLabel
      Left = 126
      Top = 36
      Width = 217
      Height = 13
      Caption = 'Bancos/Caixa / Forma de Pagamento:'
    end
    object Label1: TLabel
      Left = 248
      Top = 20
      Width = 95
      Height = 13
      Caption = 'Número do Lote:'
    end
    object DBText1: TDBText
      Left = 352
      Top = 20
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'NUMLOTE'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 180
      Top = 52
      Width = 163
      Height = 13
      Caption = 'Número do Cheque/Borderô:'
    end
    object DBText2: TDBText
      Left = 352
      Top = 52
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'NUMCHQBORDERO'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 21
      Top = 84
      Width = 68
      Height = 13
      Caption = 'Favorecido:'
    end
    object DBText4: TDBText
      Left = 96
      Top = 84
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'FAVORECIDO'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 48
      Top = 100
      Width = 41
      Height = 13
      Caption = 'Status:'
    end
    object DBText5: TDBText
      Left = 96
      Top = 100
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'FLAGCANCEL'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 288
      Top = 100
      Width = 55
      Height = 13
      Caption = 'Impresso:'
    end
    object DBText6: TDBText
      Left = 352
      Top = 100
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'FLAGEMISSAO'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 456
      Top = 100
      Width = 152
      Height = 13
      Caption = 'Número do Processo RAD:'
    end
    object DBText7: TDBText
      Left = 616
      Top = 100
      Width = 50
      Height = 13
      AutoSize = True
      DataField = 'IDPROCESSO'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 16
      Top = 116
      Width = 73
      Height = 13
      Caption = 'Observação:'
    end
    object DBText11: TDBText
      Left = 96
      Top = 116
      Width = 57
      Height = 13
      AutoSize = True
      DataField = 'OBSERVACAO'
      DataSource = dsLote
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 509
      Top = 116
      Width = 96
      Height = 13
      Caption = 'Valor Total Lote:'
    end
    object LbValorTotal: TLabel
      Left = 616
      Top = 116
      Width = 26
      Height = 13
      Caption = '0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgrDocLote: TwwDBGrid
      Left = 5
      Top = 152
      Width = 773
      Height = 215
      Selected.Strings = (
        'NOME'#9'35'#9'Fornecedor'
        'HISTORICOCOMPL'#9'34'#9'Histórico'
        'NODOCUMENTO'#9'16'#9'Número do Documento'
        'COMPLDOCUMENTO'#9'5'#9'Compl.'
        'VALOR'#9'10'#9'Valor Pago'
        'SALDO'#9'10'#9'Saldo'
        'TIPODOC'#9'35'#9'Tipo de Documento'
        'DATAPROGRAMADA'#9'13'#9'Data Programada'
        'DATAVENCTO'#9'15'#9'Data de Vencimento'
        'NUMLEITCODBARRAS'#9'60'#9'Código de Barra - Leitora'
        'NUMDIGCODBARRAS'#9'60'#9'Código de Barra - Digitado')
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
    object bbtnSelecionaDoc: TBitBtn
      Left = 16
      Top = 16
      Width = 105
      Height = 58
      Caption = 'Seleciona Lote'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
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
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 783
  end
  object dsDocLote: TwwDataSource
    DataSet = CdsDocLote
    Left = 624
    Top = 304
  end
  object msLote: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'LOTEPAGTO.NUMLOTE'
      'LOTEPAGTO.DATAEMISSAO'
      'LOTEPAGTO.FAVORECIDO'
      'LOTEPAGTO.FLAGCANCEL'
      'LOTEPAGTO.FLAGEMISSAO'
      'LOTEPAGTO.IDPROCESSO'
      'PORTADORFORMA.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Número do Lote'
      'Data de Emissão'
      'Favorecido'
      'Status (R/C/B/ )'
      'Impresso <0/1>'
      'Número Processo RAD'
      'Banco/Caixa / Forma de Pagamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LOTEPAGTO'
      'PORTADORFORMA')
    CamposChave.Strings = (
      'LOTEPAGTO.NUMLOTE')
    Filtro.Strings = (
      'LOTEPAGTO.CODPORTFORMA=PORTADORFORMA.CODPORTFORMA')
    Mascaras.Strings = (
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
      '60'
      '1'
      '1'
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 504
    Top = 24
  end
  object dsLote: TwwDataSource
    DataSet = CdsLote
    Left = 480
    Top = 304
  end
  object CdsDocLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 184
  end
  object SqlDocLote: TCMSqlParams
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
      'WHERE (LD.NUMLOTE = :pNUMLOTE) AND'
      '      (D.CODDOCUMENTO = LD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (S.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (TD.CODTIPDOC = D.CODTIPDOC) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO)    '
      ''
      ' ')
    ClientDataSet = CdsDocLote
    Left = 624
    Top = 240
  end
  object SqlLote: TCMSqlParams
    SQL.Strings = (
      
        'SELECT L.NUMLOTE, L.CODPORTFORMA, L.DATAEMISSAO, L.NUMCHQBORDERO' +
        ', L.FAVORECIDO,'
      '       DECODE(L.FLAGEMISSAO,1,'#39'SIM'#39','#39'NÃO'#39') AS FLAGEMISSAO,'
      '       DECODE(L.FLAGCANCEL,NULL,'#39'EM ABERTO'#39','
      '              DECODE(L.FLAGCANCEL,'#39'B'#39','#39'BAIXADO'#39','
      
        '              DECODE(L.FLAGCANCEL,'#39'C'#39','#39'CANCELADO'#39',DECODE(L.FLAGC' +
        'ANCEL,'#39'R'#39','#39'REGERADO'#39')))) AS FLAGCANCEL,'
      '       L.OBSERVACAO,'
      '       P.DESCRICAO, L.IDPROCESSO'
      'FROM LOTEPAGTO L, PORTADORFORMA P'
      'WHERE (L.NUMLOTE = :pNUMLOTE) AND'
      '      (L.CODPORTFORMA = P.CODPORTFORMA)'
      '')
    ClientDataSet = CdsLote
    Left = 480
    Top = 248
  end
  object CdsLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 472
    Top = 192
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 216
  end
  object SqlCds: TCMSqlParams
    ClientDataSet = Cds
    Left = 208
    Top = 264
  end
end
