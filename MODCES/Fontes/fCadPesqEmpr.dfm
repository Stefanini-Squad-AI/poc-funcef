inherited frmCadPesqEmpr: TfrmCadPesqEmpr
  Left = 116
  Top = 89
  HelpContext = 740021
  Caption = 
    'Pesquisa Salarial: Dados da Empresa ou do Mercado (Frequências e' +
    ' Tendências)'
  ClientHeight = 461
  ClientWidth = 599
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 599
    Height = 375
    inherited pnlMestre: TPanel
      Width = 589
      Height = 90
      object gbxPesquisa: TGroupBox
        Left = 0
        Top = 0
        Width = 589
        Height = 81
        Align = alTop
        Caption = 'Pesquisa Salarial e Cargo'
        TabOrder = 0
        object dbedCodPesqui: TDBEdit
          Left = 15
          Top = 21
          Width = 45
          Height = 21
          TabStop = False
          DataField = 'IDPESQSALAR'
          DataSource = ds
          ReadOnly = True
          TabOrder = 0
        end
        object dbedData: TDBEdit
          Left = 345
          Top = 21
          Width = 90
          Height = 21
          TabStop = False
          DataField = 'DATAREFPESQ'
          DataSource = ds
          ReadOnly = True
          TabOrder = 2
        end
        object dbedCodCargo: TDBEdit
          Left = 15
          Top = 51
          Width = 45
          Height = 21
          TabStop = False
          DataField = 'IDCARGO'
          DataSource = ds
          ReadOnly = True
          TabOrder = 3
        end
        object lstSalNom: TListBox
          Left = 447
          Top = 9
          Width = 40
          Height = 30
          Color = clTeal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          IntegralHeight = True
          ItemHeight = 13
          ParentFont = False
          Sorted = True
          TabOrder = 6
          Visible = False
        end
        object lstSalReal: TListBox
          Left = 510
          Top = 9
          Width = 40
          Height = 30
          Color = clMaroon
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          IntegralHeight = True
          ItemHeight = 13
          ParentFont = False
          Sorted = True
          TabOrder = 7
          Visible = False
        end
        object dblcPesquisa: TwwDBLookupCombo
          Left = 75
          Top = 21
          Width = 259
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEPESQSALAR'#9'40'#9'Nome da Pesquisa'#9'F'
            'DATAREFPESQ'#9'18'#9'Data Ref.'#9'F')
          DataField = 'IDPESQSALAR'
          DataSource = ds
          LookupTable = qryPesqui
          LookupField = 'IDPESQSALAR'
          Options = [loColLines, loTitles]
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
          OnCloseUp = dblcPesquisaCloseUp
        end
        object dblcCargo: TwwDBLookupCombo
          Left = 75
          Top = 51
          Width = 259
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TITULO'#9'40'#9'TITULO'#9'F')
          DataField = 'IDCARGO'
          DataSource = ds
          LookupTable = qryCargo
          LookupField = 'IDCARGO'
          Options = [loColLines, loTitles]
          TabOrder = 4
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
        object dblcEntid: TwwDBLookupCombo
          Left = 345
          Top = 51
          Width = 230
          Height = 21
          DropDownAlignment = taRightJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          DataField = 'IDEMPRESAPARTIC'
          DataSource = ds
          LookupTable = qryEntid
          LookupField = 'IDPESSOA'
          Options = [loColLines, loTitles]
          TabOrder = 5
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = True
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 95
      Width = 589
      Height = 275
      Tabs.Strings = (
        'Dados de Frequências'
        'Valores das Tendências')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 491
        Height = 216
        inherited tbsDet: TTabSheet
          Caption = 'Dados de Frequências'
          inherited pnlControlesDet: TPanel [0]
            Width = 483
            Height = 188
            object Label10: TLabel
              Left = 180
              Top = 34
              Width = 64
              Height = 13
              Caption = 'Frequência'
            end
            object Label11: TLabel
              Left = 180
              Top = 76
              Width = 89
              Height = 13
              Caption = 'Salário Nominal'
            end
            object Label12: TLabel
              Left = 180
              Top = 118
              Width = 70
              Height = 13
              Caption = 'Salário Real'
            end
            object dbreFreq: TDBRealEdit
              Left = 180
              Top = 48
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '         0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'FREQ'
              DataSource = dsDet
            end
            object dbreNom: TDBRealEdit
              Left = 180
              Top = 88
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'NOMINAL'
              DataSource = dsDet
            end
            object dbreReal: TDBRealEdit
              Left = 180
              Top = 132
              Width = 100
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'REAL'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 483
            Height = 188
            Selected.Strings = (
              'FREQ'#9'10'#9'Frequência'
              'NOMINAL'#9'14'#9'Salário Nominal'
              'REAL'#9'14'#9'Salário Real')
          end
        end
        object tbsTend: TTabSheet
          Caption = 'Valores das Tendências'
          ImageIndex = 1
          object Label8: TLabel
            Left = 239
            Top = 5
            Width = 89
            Height = 13
            Caption = 'Salário Nominal'
          end
          object Label9: TLabel
            Left = 341
            Top = 5
            Width = 70
            Height = 13
            Caption = 'Salário Real'
          end
          object Label1: TLabel
            Left = 147
            Top = 21
            Width = 79
            Height = 13
            Caption = 'Menor Salário'
          end
          object Label2: TLabel
            Left = 147
            Top = 46
            Width = 87
            Height = 13
            Caption = 'Primeiro Quartil'
          end
          object Label3: TLabel
            Left = 147
            Top = 70
            Width = 32
            Height = 13
            Caption = 'Moda'
          end
          object Label4: TLabel
            Left = 147
            Top = 94
            Width = 35
            Height = 13
            Caption = 'Média'
          end
          object Label5: TLabel
            Left = 147
            Top = 118
            Width = 49
            Height = 13
            Caption = 'Mediana'
          end
          object Label6: TLabel
            Left = 147
            Top = 142
            Width = 89
            Height = 13
            Caption = 'Terceiro Quartil'
          end
          object Label7: TLabel
            Left = 147
            Top = 166
            Width = 75
            Height = 13
            Caption = 'Maior Salário'
          end
          object Label13: TLabel
            Left = 9
            Top = 77
            Width = 97
            Height = 13
            Caption = 'Frequência Total'
            FocusControl = dbedMenor
          end
          object dbedMenor: TDBRealEdit
            Left = 241
            Top = 19
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MENOR'
            DataSource = ds
          end
          object dbedMenorR: TDBRealEdit
            Left = 336
            Top = 19
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MENOR_R'
            DataSource = ds
          end
          object dbedPrimQ: TDBRealEdit
            Left = 241
            Top = 43
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PRIMQUA'
            DataSource = ds
          end
          object dbedPrimQR: TDBRealEdit
            Left = 336
            Top = 43
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PRIMQUA_R'
            DataSource = ds
          end
          object dbedModa: TDBRealEdit
            Left = 241
            Top = 67
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MODA'
            DataSource = ds
          end
          object dbedModaR: TDBRealEdit
            Left = 336
            Top = 67
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MODA_R'
            DataSource = ds
          end
          object dbedMedia: TDBRealEdit
            Left = 241
            Top = 91
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MEDIA'
            DataSource = ds
          end
          object dbedMediaR: TDBRealEdit
            Left = 336
            Top = 91
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MEDIA_R'
            DataSource = ds
          end
          object dbedMediana: TDBRealEdit
            Left = 241
            Top = 115
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MEDIANA'
            DataSource = ds
          end
          object dbedMedianaR: TDBRealEdit
            Left = 336
            Top = 115
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 9
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MEDIANA_R'
            DataSource = ds
          end
          object dbedTercQ: TDBRealEdit
            Left = 241
            Top = 139
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 10
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'TERCQUA'
            DataSource = ds
          end
          object dbedTercQR: TDBRealEdit
            Left = 336
            Top = 139
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 11
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'TERCQUA_R'
            DataSource = ds
          end
          object dbedMaior: TDBRealEdit
            Left = 241
            Top = 163
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 12
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MAIOR'
            DataSource = ds
          end
          object dbedMaiorR: TDBRealEdit
            Left = 336
            Top = 163
            Width = 84
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            ReadOnly = True
            TabOrder = 13
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'MAIOR_R'
            DataSource = ds
          end
          object dbedFreq: TDBEdit
            Left = 9
            Top = 92
            Width = 97
            Height = 21
            TabStop = False
            DataField = 'FREQ'
            DataSource = ds
            ReadOnly = True
            TabOrder = 14
          end
        end
      end
      inherited Dock973: TDock97
        Width = 581
      end
      inherited Dock974: TDock97
        Left = 495
        Height = 216
      end
    end
  end
  inherited Dock972: TDock97
    Width = 599
    object sbtnGrafico: TToolbarButton97 [0]
      Left = 271
      Top = 2
      Width = 60
      Height = 41
      Hint = 'Mostrar os Dados em Gráfico'
      Caption = '&Gráfico'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300030003
        0003333377737773777333333333333333333FFFFFFFFFFFFFFF770000000000
        0000777777777777777733039993BBB3CCC3337F737F737F737F37039993BBB3
        CCC3377F737F737F737F33039993BBB3CCC33F7F737F737F737F77079997BBB7
        CCC77777737773777377330399930003CCC3337F737F7773737F370399933333
        CCC3377F737F3333737F330399933333CCC33F7F737FFFFF737F770700077777
        CCC77777777777777377330333333333CCC3337F33333333737F370333333333
        0003377F33333333777333033333333333333F7FFFFFFFFFFFFF770777777777
        7777777777777777777733333333333333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnGraficoClick
    end
    object sbtnTendencia: TToolbarButton97 [1]
      Left = 334
      Top = 3
      Width = 65
      Height = 41
      Hint = '(Re)Calcular os Valores de Tendências'
      Caption = '&Tendência'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      Layout = blGlyphTop
      NumGlyphs = 2
      Opaque = False
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnTendenciaClick
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 599
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT TD.*, PQ.DATAREFPESQ '
      'FROM TENDPESQSAL TD, PESQISAL PQ'
      'WHERE TD.IDPESQSALAR = :IDPESQSALAR'
      'AND  PQ.IDPESQSALAR = :IDPESQSALAR'
      'AND  IDCARGO     = :IDCARGO'
      'AND  IDEMPRESAPARTIC = :IDEMPRESAPARTIC    ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESQSALAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESQSALAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRESAPARTIC'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TENDPESQSAL'
      'set'
      '  FREQ = :FREQ,'
      '  MENOR = :MENOR,'
      '  PRIMQUA = :PRIMQUA,'
      '  MEDIA = :MEDIA,'
      '  MODA = :MODA,'
      '  MEDIANA = :MEDIANA,'
      '  TERCQUA = :TERCQUA,'
      '  MAIOR = :MAIOR,'
      '  MENOR_R = :MENOR_R,'
      '  PRIMQUA_R = :PRIMQUA_R,'
      '  MEDIA_R = :MEDIA_R,'
      '  MODA_R = :MODA_R,'
      '  MEDIANA_R = :MEDIANA_R,'
      '  TERCQUA_R = :TERCQUA_R,'
      '  MAIOR_R = :MAIOR_R'
      'where'
      '  IDPESQSALAR = :OLD_IDPESQSALAR and'
      '  IDCARGO = :OLD_IDCARGO and'
      '  IDEMPRESAPARTIC = :OLD_IDEMPRESAPARTIC')
    InsertSQL.Strings = (
      'insert into TENDPESQSAL'
      '  (IDPESQSALAR, IDCARGO, IDEMPRESAPARTIC, FREQ, MENOR, PRIMQUA, '
      'MEDIA, '
      '   MODA, MEDIANA, TERCQUA, MAIOR, MENOR_R, PRIMQUA_R, MEDIA_R, '
      'MODA_R, '
      '   MEDIANA_R, TERCQUA_R, MAIOR_R)'
      'values'
      
        '  (:IDPESQSALAR, :IDCARGO, :IDEMPRESAPARTIC, :FREQ, :MENOR, :PRI' +
        'MQUA, '
      ':MEDIA, '
      
        '   :MODA, :MEDIANA, :TERCQUA, :MAIOR, :MENOR_R, :PRIMQUA_R, :MED' +
        'IA_R, '
      ':MODA_R, '
      '   :MEDIANA_R, :TERCQUA_R, :MAIOR_R)')
    DeleteSQL.Strings = (
      'delete from TENDPESQSAL'
      'where'
      '  IDPESQSALAR = :OLD_IDPESQSALAR and'
      '  IDCARGO = :OLD_IDCARGO and'
      '  IDEMPRESAPARTIC = :OLD_IDEMPRESAPARTIC')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Dados de Pesquisas'
    Colunas.Strings = (
      'PQ.IDPESQSALAR'
      'PQ.NOMEPESQSALAR'
      'PQ.DATAREFPESQ'
      'CG.TITULO'
      'EP.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Número da Pesquisa'
      'Nome da Pesquisa'
      'Data da Pesquisa'
      'Cargo'
      'Empresa Participante')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA EP'
      'TENDPESQSAL TD'
      'PESQISAL PQ'
      'CARGO CG')
    CamposChave.Strings = (
      'TD.IDPESQSALAR'
      'TD.IDCARGO'
      'TD.IDEMPRESAPARTIC')
    Filtro.Strings = (
      'EP.IDPESSOA           = TD.IDEMPRESAPARTIC'
      'TD.IDPESQSALAR    = PQ.IDPESQSALAR'
      'TD.IDCARGO             = CG.IDCARGO')
    Larguras.Strings = (
      '15'
      '40'
      '15'
      '40'
      '60')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DADOPESQSAL'
      'WHERE IDPESQSALAR = :IDPESQSALAR'
      'AND  IDCARGO     = :IDCARGO'
      'AND  IDEMPRPART = :IDEMPRPART    '
      'ORDER BY NOMINAL, REAL')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 185
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESQSALAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDEMPRPART'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DADOPESQSAL'
      'set'
      '  FREQ = :FREQ,'
      '  NOMINAL = :NOMINAL,'
      '  REAL = :REAL'
      'where'
      '  IDPESQSALAR = :OLD_IDPESQSALAR and'
      '  IDCARGO = :OLD_IDCARGO and'
      '  IDEMPRPART = :OLD_IDEMPRPART and'
      '  NUMSEQ = :OLD_NUMSEQ')
    InsertSQL.Strings = (
      'insert into DADOPESQSAL'
      
        '  (IDPESQSALAR, IDCARGO, IDEMPRPART, NUMSEQ, FREQ, NOMINAL, REAL' +
        ')'
      'values'
      
        '  (:IDPESQSALAR, :IDCARGO, :IDEMPRPART, :NUMSEQ, :FREQ, :NOMINAL' +
        ', '
      ':REAL)')
    DeleteSQL.Strings = (
      'delete from DADOPESQSAL'
      'where'
      '  IDPESQSALAR = :OLD_IDPESQSALAR and'
      '  IDCARGO = :OLD_IDCARGO and'
      '  IDEMPRPART = :OLD_IDEMPRPART and'
      '  NUMSEQ = :OLD_NUMSEQ')
    Left = 226
    Top = 106
  end
  object qryPesqui: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PESQISAL'
      'ORDER BY UPPER(NOMEPESQSALAR)')
    ValidateWithMask = True
    Left = 389
    Top = 124
  end
  object qryEntid: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, T.IDPESSOA'
      'FROM PESSOA P, TERCEIRO T'
      'WHERE P.IDPESSOA = T.IDPESSOA'
      'UNION'
      'SELECT NOMEEMPRESA AS NOME, IDPESSOA'
      'FROM EMPRESAPROP'
      'ORDER BY 1')
    ValidateWithMask = True
    Left = 469
    Top = 124
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CARGO'
      'ORDER BY UPPER(TITULO)')
    ValidateWithMask = True
    Left = 309
    Top = 156
  end
end
