inherited frmConsLoteMT: TfrmConsLoteMT
  Left = 103
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Consulta Lote'
  ClientHeight = 466
  ClientWidth = 836
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
    Width = 836
    Height = 427
    object dbgrDocLote: TwwDBGrid
      Left = 1
      Top = 209
      Width = 834
      Height = 217
      Selected.Strings = (
        'STATUSDOC'#9'20'#9'Status'#9'F'
        'NOME'#9'35'#9'Fornecedor'
        'NODOCUMENTO'#9'16'#9'Número do Documento'
        'COMPLDOCUMENTO'#9'5'#9'Compl.'
        'TIPODOC'#9'35'#9'Tipo de Documento'
        'DATAPROGRAMADA'#9'13'#9'Data Programada'
        'DATAVENCTO'#9'15'#9'Data de Vencimento'
        'NUMLEITCODBARRAS'#9'60'#9'Código de Barra - Leitora'
        'NUMDIGCODBARRAS'#9'60'#9'Código de Barra - Digitado'
        'NUMSLIP'#9'11'#9'SLIP'
        'NUMOP'#9'10'#9'N. OP')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
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
    object PlnFixo: TPanel
      Left = 1
      Top = 1
      Width = 834
      Height = 208
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Bevel1: TBevel
        Left = 2
        Top = 2
        Width = 830
        Height = 134
        Align = alClient
      end
      object Bevel2: TBevel
        Left = 2
        Top = 136
        Width = 830
        Height = 57
        Align = alBottom
      end
      object Label4: TLabel
        Left = 13
        Top = 140
        Width = 68
        Height = 13
        Caption = 'Favorecido:'
      end
      object Label5: TLabel
        Left = 13
        Top = 159
        Width = 41
        Height = 13
        Caption = 'Status:'
      end
      object Label11: TLabel
        Left = 12
        Top = 176
        Width = 73
        Height = 13
        Caption = 'Observação:'
      end
      object lbldoc: TLabel
        Left = 2
        Top = 193
        Width = 830
        Height = 13
        Align = alBottom
        Caption = 'Documentos que Compõem o Lote'
      end
      object DBText11: TDBText
        Left = 88
        Top = 141
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'OBSERVACAO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText5: TDBText
        Left = 88
        Top = 159
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'FLAGCANCEL'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText4: TDBText
        Left = 86
        Top = 142
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'FAVORECIDO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 121
        Top = 15
        Width = 95
        Height = 13
        Caption = 'Número do Lote:'
      end
      object lblPortadorForma: TLabel
        Left = 121
        Top = 33
        Width = 220
        Height = 13
        Caption = 'Contas/Caixas &x Forma de Pagamento:'
      end
      object Label2: TLabel
        Left = 121
        Top = 53
        Width = 163
        Height = 13
        Caption = 'Número do Cheque/Borderô:'
      end
      object Label6: TLabel
        Left = 333
        Top = 159
        Width = 55
        Height = 13
        Caption = 'Impresso:'
      end
      object DBText1: TDBText
        Left = 219
        Top = 15
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'NUMLOTE'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dblPortadorForma: TDBText
        Left = 342
        Top = 32
        Width = 100
        Height = 13
        AutoSize = True
        DataField = 'DESCRICAO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText2: TDBText
        Left = 287
        Top = 53
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'NUMCHQBORDERO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText6: TDBText
        Left = 391
        Top = 159
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'FLAGEMISSAO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 120
        Top = 73
        Width = 123
        Height = 13
        Caption = 'Nº do Processo RAD:'
      end
      object Label12: TLabel
        Left = 120
        Top = 96
        Width = 92
        Height = 13
        Caption = 'Valor Total Lote'
      end
      object DBText7: TDBText
        Left = 244
        Top = 73
        Width = 50
        Height = 13
        AutoSize = True
        DataField = 'IDPROCESSO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText12: TDBText
        Left = 120
        Top = 114
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'VALORLOTE'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText13: TDBText
        Left = 286
        Top = 114
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'VALABERTO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText14: TDBText
        Left = 501
        Top = 114
        Width = 57
        Height = 13
        AutoSize = True
        DataField = 'VALPAGO'
        DataSource = dsLote
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 285
        Top = 98
        Width = 124
        Height = 13
        Caption = 'Valor Total Estornado'
      end
      object Label14: TLabel
        Left = 501
        Top = 98
        Width = 96
        Height = 13
        Caption = 'Valor Total Pago'
      end
      object bbtnSelecionaDoc: TBitBtn
        Left = 6
        Top = 6
        Width = 90
        Height = 58
        Caption = 'Seleciona Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
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
  end
  inherited Dock971: TDock97
    Top = 427
    Width = 836
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 707
    Top = 99
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
    MultiSelect = False
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
      'SELECT'
      '       D.CODDOCUMENTO,'
      '       DECODE(L.ESTORNO, NULL,'
      '              DECODE(TRIM(L.OPERACAO),'
      
        '                     '#39'1'#39',  '#39'LANCTO EFETIVO QUE SERÁ PARC.       ' +
        '  '#39','
      
        '                     '#39'2'#39',  '#39'EM ABERTO                           ' +
        '  '#39','
      
        '                     '#39'3'#39',  '#39'LANCTO DE PARCELA EFETIVO           ' +
        '  '#39','
      
        '                     '#39'4'#39',  '#39'LANCTO DE ALTERADOR                 ' +
        '  '#39','
      
        '                     '#39'5'#39',  '#39'BAIXADO                             ' +
        '  '#39','
      
        '                     '#39'10'#39', '#39'LANCTO. E BAIXA SIMULTÂNEA          ' +
        '  '#39','
      
        '                     '#39'11'#39', '#39'LANCTO. DE PREVISTO QUE SERÁ PARC   ' +
        '  '#39','
      
        '                     '#39'12'#39', '#39'LANCTO. DE PREVISTO QUE NÃO SERÁ PAR' +
        'C.'#39','
      
        '                     '#39'13'#39', '#39'LANCTO. DE PARCELA PREVISTO         ' +
        '  '#39','
      
        '                     '#39'14'#39', '#39'LANCTO DE ADIANTAMENTO              ' +
        '  '#39','
      
        '                     '#39'15'#39', '#39'BAIXA DE ADIANTAMENTO               ' +
        '  '#39','
      
        '                     '#39'16'#39', '#39'REGULARIZ. DE ADIANT. PARA ADIANT.  ' +
        '  '#39','
      
        '                     '#39'17'#39', '#39'REGULARIZ. DE ADIANT. PARA O DOC.   ' +
        '  '#39' ),'
      '              '#39'ESTORNADO'#39') AS STATUSDOC,'
      '       D.IDFORCLI,'
      '       SUM(S.SALDO),'
      
        '       D.IDPESSOA,D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAPROGRAMAD' +
        'A,'
      '       D.DATAVENCTO,D.RECPAG,P.RAZAOSOCIAL AS NOME,D.STATUS,'
      '       D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS,'
      '       TD.DESCRICAO AS TIPODOC,'
      '       D.NUMSLIP, '#39'           '#39' NUMOP'
      
        'FROM DOCUMENTO D, PESSOA P, LOTEXDOCUM LD, TIPODOCRECPAG TD, VWS' +
        'ALDODOC S, LANCTODOCUM L'
      'WHERE (LD.NUMLOTE = :PNUMLOTE) AND'
      '      (D.CODDOCUMENTO = LD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (TD.CODTIPDOC = D.CODTIPDOC) AND'
      '      (S.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (L.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      
        '      (L.OPERACAO IN ('#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'10'#39', '#39'11'#39', '#39'12'#39', '#39'13'#39 +
        ', '#39'14'#39', '#39'15'#39', '#39'16'#39', '#39'17'#39') ) AND'
      
        '      (L.NUMLANCTO = (SELECT MAX(NUMLANCTO) AS NUMLANCTO FROM LA' +
        'NCTODOCUM'
      
        '                      WHERE OPERACAO IN ('#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'10' +
        #39', '#39'11'#39', '#39'12'#39', '#39'13'#39', '#39'14'#39', '#39'15'#39', '#39'16'#39', '#39'17'#39')  AND'
      '                      CODDOCUMENTO = L.CODDOCUMENTO ) )'
      'GROUP BY D.IDFORCLI, D.CODDOCUMENTO,'
      
        '         D.IDPESSOA,D.NODOCUMENTO,D.COMPLDOCUMENTO,D.DATAPROGRAM' +
        'ADA,'
      '         D.DATAVENCTO,D.RECPAG,P.RAZAOSOCIAL,D.STATUS,'
      '         D.NUMLEITCODBARRAS, D.NUMDIGCODBARRAS,'
      '         TD.DESCRICAO,'
      '         D.NUMSLIP,'
      '         DECODE(L.ESTORNO, NULL,'
      '                DECODE(TRIM(L.OPERACAO),'
      
        '                       '#39'1'#39',  '#39'LANCTO EFETIVO QUE SERÁ PARC.     ' +
        '    '#39','
      
        '                       '#39'2'#39',  '#39'EM ABERTO                         ' +
        '    '#39','
      
        '                       '#39'3'#39',  '#39'LANCTO DE PARCELA EFETIVO         ' +
        '    '#39','
      
        '                       '#39'4'#39',  '#39'LANCTO DE ALTERADOR               ' +
        '    '#39','
      
        '                       '#39'5'#39',  '#39'BAIXADO                           ' +
        '    '#39','
      
        '                       '#39'10'#39', '#39'LANCTO. E BAIXA SIMULTÂNEA        ' +
        '    '#39','
      
        '                       '#39'11'#39', '#39'LANCTO. DE PREVISTO QUE SERÁ PARC ' +
        '    '#39','
      
        '                       '#39'12'#39', '#39'LANCTO. DE PREVISTO QUE NÃO SERÁ P' +
        'ARC.'#39','
      
        '                       '#39'13'#39', '#39'LANCTO. DE PARCELA PREVISTO       ' +
        '    '#39','
      
        '                       '#39'14'#39', '#39'LANCTO DE ADIANTAMENTO            ' +
        '    '#39','
      
        '                       '#39'15'#39', '#39'BAIXA DE ADIANTAMENTO             ' +
        '    '#39','
      
        '                       '#39'16'#39', '#39'REGULARIZ. DE ADIANT. PARA ADIANT.' +
        '    '#39','
      
        '                       '#39'17'#39', '#39'REGULARIZ. DE ADIANT. PARA O DOC. ' +
        '    '#39' ),'
      '                '#39'ESTORNADO'#39')'
      'ORDER BY D.NODOCUMENTO'
      '')
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
      '       DECODE(L.FLAGCANCEL,'#39'B'#39','#39'BAIXADO'#39','
      
        '       DECODE(L.FLAGCANCEL,'#39'C'#39','#39'CANCELADO'#39',DECODE(L.FLAGCANCEL,'#39 +
        'R'#39','#39'REGERADO'#39')))) AS FLAGCANCEL,'
      '       L.OBSERVACAO,'
      '       P.DESCRICAO, L.IDPROCESSO, L.NUMSLIP NUMOP,'
      '       VAL. VALORLOTE, '
      '       VAL.VALABERTO,'
      '       VAL.VALPAGO'
      
        'FROM LOTEPAGTO L, PORTADORFORMA P, ( SELECT L.NUMLOTE, SUM(VALOR' +
        ') AS VALORLOTE, SUM(VS.SALDO) AS VALABERTO, SUM(VALOR) - SUM(VS.' +
        'SALDO) AS VALPAGO'
      
        '                                                                ' +
        '               FROM LOTEXDOCUM L, VWSALDODOC VS'
      
        '                                                                ' +
        '               WHERE L.NUMLOTE = 10213 AND'
      
        '                                                                ' +
        '                              L.CODDOCUMENTO = VS.CODDOCUMENTO'
      
        '                                                                ' +
        '               GROUP BY L.NUMLOTE ) VAL'
      'WHERE (L.NUMLOTE = :pNUMLOTE) AND'
      '             (L.CODPORTFORMA = P.CODPORTFORMA) AND'
      '             (L.NUMLOTE = VAL.NUMLOTE)'
      ''
      ' ')
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
