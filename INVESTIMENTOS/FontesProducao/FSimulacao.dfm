object frmSimulacao: TfrmSimulacao
  Left = 2
  Top = 34
  Width = 791
  Height = 476
  Caption = 'Demonstrativo de Operações em Renda Variável'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 449
    Align = alClient
    Caption = 'pnlPrincipal'
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 334
      Width = 268
      Height = 11
      Caption = '* Fonte : Broadcast / Quantidade sujeita a arredondamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlCotacaoBolsa: TPanel
      Left = 2
      Top = 2
      Width = 514
      Height = 55
      TabOrder = 0
      object Label6: TLabel
        Left = 195
        Top = 1
        Width = 113
        Height = 14
        Caption = 'Cotações em BOLSA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 16
        Width = 532
        Height = 22
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'VLRMINIMA'
            Title.Alignment = taCenter
            Title.Caption = 'Mínima'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRMAXIMA'
            Title.Alignment = taCenter
            Title.Caption = 'Máxima'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRMEDIA'
            Title.Alignment = taCenter
            Title.Caption = 'Média'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLRFECHAMENTO'
            Title.Alignment = taCenter
            Title.Caption = 'Fechamento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 124
            Visible = True
          end>
      end
      object DBRealEdit31: TDBRealEdit
        Left = 14
        Top = 36
        Width = 124
        Height = 17
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMINIMA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit32: TDBRealEdit
        Left = 139
        Top = 36
        Width = 124
        Height = 17
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMAXIMA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit33: TDBRealEdit
        Left = 264
        Top = 36
        Width = 124
        Height = 17
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMEDIA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit34: TDBRealEdit
        Left = 388
        Top = 36
        Width = 124
        Height = 17
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRFECHAMENTO'
        DataSource = dsCotacaoAcao
      end
    end
    object pnlControleEstoque: TPanel
      Left = 2
      Top = 57
      Width = 514
      Height = 105
      Caption = 'pnlControleEstoque'
      TabOrder = 1
      object Label7: TLabel
        Left = 16
        Top = 8
        Width = 113
        Height = 14
        Caption = 'Controle de Estoque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBGrid2: TDBGrid
        Left = 0
        Top = 22
        Width = 516
        Height = 22
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Especificação'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Preço médio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Em R$'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 126
            Visible = True
          end>
      end
      object pnlControleEstoque1: TPanel
        Left = 2
        Top = 42
        Width = 510
        Height = 40
        TabOrder = 1
        object Label9: TLabel
          Left = 12
          Top = 4
          Width = 103
          Height = 13
          Caption = 'Estoque inicial n/data'
        end
        object Label10: TLabel
          Left = 12
          Top = 22
          Width = 81
          Height = 13
          Caption = 'Vendas efetuada'
        end
        object DBRealEdit3: TDBRealEdit
          Left = 135
          Top = -1
          Width = 124
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit4: TDBRealEdit
          Left = 135
          Top = 19
          Width = 124
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit5: TDBRealEdit
          Left = 259
          Top = -1
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRMEDIA'
          DataSource = dsCotacaoAcao
        end
        object DBRealEdit6: TDBRealEdit
          Left = 259
          Top = 19
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit7: TDBRealEdit
          Left = 384
          Top = -1
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit8: TDBRealEdit
          Left = 384
          Top = 19
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
      end
      object pnlControleEstoque2: TPanel
        Left = 2
        Top = 82
        Width = 511
        Height = 23
        TabOrder = 2
        object Label11: TLabel
          Left = 12
          Top = 6
          Width = 75
          Height = 13
          Caption = 'Estoque final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBRealEdit9: TDBRealEdit
          Left = 135
          Top = 2
          Width = 124
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit10: TDBRealEdit
          Left = 259
          Top = 2
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VLRMEDIA'
          DataSource = dsCotacaoAcao
        end
        object DBRealEdit11: TDBRealEdit
          Left = 384
          Top = 2
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
      end
    end
    object pnlDemonstrativo: TPanel
      Left = 2
      Top = 160
      Width = 514
      Height = 173
      Caption = 'pnlDemonstrativo'
      TabOrder = 2
      object Label8: TLabel
        Left = 15
        Top = 8
        Width = 216
        Height = 14
        Caption = 'Demonstrativo de quantidade e volume'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlDemonstrativo1: TPanel
        Left = 2
        Top = 24
        Width = 510
        Height = 148
        TabOrder = 0
        object Label12: TLabel
          Left = 12
          Top = 4
          Width = 223
          Height = 13
          Caption = 'Quantidade de ações negociadas no mercado*'
        end
        object Label13: TLabel
          Left = 12
          Top = 24
          Width = 183
          Height = 13
          Caption = 'Quantidade de ações negociadas pela'
        end
        object lbFantasia1: TLabel
          Left = 14
          Top = 44
          Width = 54
          Height = 13
          Caption = 'lbFantasia1'
        end
        object Label16: TLabel
          Left = 12
          Top = 90
          Width = 145
          Height = 13
          Caption = 'Volume total em R$ negociado'
        end
        object Label17: TLabel
          Left = 12
          Top = 110
          Width = 145
          Height = 13
          Caption = 'Volume negociado em R$ pela'
        end
        object lbFantasia3: TLabel
          Left = 12
          Top = 129
          Width = 54
          Height = 13
          Caption = 'lbFantasia3'
        end
        object lbFantasia: TLabel
          Left = 198
          Top = 24
          Width = 48
          Height = 13
          Caption = 'lbFantasia'
        end
        object lbFantasia2: TLabel
          Left = 161
          Top = 110
          Width = 48
          Height = 13
          Caption = 'lbFantasia'
        end
        object DBRealEdit16: TDBRealEdit
          Left = 384
          Top = 2
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object DBRealEdit17: TDBRealEdit
          Left = 384
          Top = 23
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object pnlDemonstrativo2: TPanel
          Left = 1
          Top = 61
          Width = 508
          Height = 25
          TabOrder = 3
          object Label14: TLabel
            Left = 12
            Top = 6
            Width = 141
            Height = 13
            Caption = 'Preço médio do mercado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBRealEdit12: TDBRealEdit
            Left = 384
            Top = 3
            Width = 125
            Height = 19
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLRMEDIA'
            DataSource = dsCotacaoAcao
          end
        end
        object DBRealEdit13: TDBRealEdit
          Left = 384
          Top = 43
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit14: TDBRealEdit
          Left = 384
          Top = 85
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VOLNEGOCIADO'
          DataSource = dsCotacaoAcao
        end
        object DBRealEdit15: TDBRealEdit
          Left = 384
          Top = 106
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
        object DBRealEdit18: TDBRealEdit
          Left = 384
          Top = 126
          Width = 125
          Height = 19
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
      end
    end
    object Panel2: TPanel
      Left = 515
      Top = 3
      Width = 265
      Height = 329
      TabOrder = 4
      object Label2: TLabel
        Left = 6
        Top = 165
        Width = 185
        Height = 14
        Caption = 'Dados sobre a média de mercado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Panel6: TPanel
        Left = 4
        Top = 182
        Width = 259
        Height = 51
        TabOrder = 3
        object Label3: TLabel
          Left = 8
          Top = 20
          Width = 105
          Height = 13
          Caption = 'R$ Total face à média'
        end
        object dbrValPercentual: TDBRealEdit
          Left = 131
          Top = 15
          Width = 124
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
      end
      object Panel7: TPanel
        Left = 4
        Top = 233
        Width = 259
        Height = 46
        TabOrder = 4
        object Label4: TLabel
          Left = 8
          Top = 19
          Width = 53
          Height = 13
          Caption = 'R$ Unitário'
        end
        object DBRealEdit1: TDBRealEdit
          Left = 131
          Top = 13
          Width = 124
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
      end
      object Panel8: TPanel
        Left = 4
        Top = 279
        Width = 259
        Height = 49
        TabOrder = 5
        object Label5: TLabel
          Left = 8
          Top = 20
          Width = 50
          Height = 13
          Caption = '% do Total'
        end
        object DBRealEdit2: TDBRealEdit
          Left = 131
          Top = 14
          Width = 124
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCINDEX'
        end
      end
      object Panel3: TPanel
        Left = 3
        Top = 15
        Width = 259
        Height = 47
        TabOrder = 0
        object Label23: TLabel
          Left = 8
          Top = 16
          Width = 109
          Height = 13
          Caption = 'Data de Operação '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox1: TGroupBox
          Left = 118
          Top = 3
          Width = 137
          Height = 36
          TabOrder = 0
          object lbDtaOperacao: TLabel
            Left = 8
            Top = 13
            Width = 72
            Height = 13
            Caption = 'lbDtaOperacao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object Panel4: TPanel
        Left = 3
        Top = 62
        Width = 259
        Height = 47
        TabOrder = 1
        object Label25: TLabel
          Left = 8
          Top = 17
          Width = 103
          Height = 13
          Caption = 'Tipo de Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox2: TGroupBox
          Left = 118
          Top = 3
          Width = 137
          Height = 36
          TabOrder = 0
          object lbTipoOperacao: TLabel
            Left = 7
            Top = 13
            Width = 76
            Height = 13
            Caption = 'lbTipoOperacao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object Panel5: TPanel
        Left = 3
        Top = 109
        Width = 259
        Height = 47
        TabOrder = 2
        object Label24: TLabel
          Left = 10
          Top = 17
          Width = 30
          Height = 13
          Caption = 'Ação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GroupBox3: TGroupBox
          Left = 118
          Top = 3
          Width = 137
          Height = 36
          TabOrder = 0
          object lbAcao: TLabel
            Left = 8
            Top = 14
            Width = 33
            Height = 13
            Caption = 'lbAcao'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
      end
    end
    object BitBtn2: TBitBtn
      Left = 642
      Top = 373
      Width = 138
      Height = 38
      TabOrder = 6
      Kind = bkCancel
    end
    object bbtnSair: TBitBtn
      Left = 642
      Top = 411
      Width = 138
      Height = 37
      Cancel = True
      Caption = '&Sair'
      TabOrder = 7
      OnClick = bbtnSairClick
      Glyph.Data = {
        F6010000424DF601000000000000760000002800000030000000100000000100
        0400000000008001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777F7F7F700F
        7777777777777887F777777F7F7F7F7F777777F7F7F7F0E0F7F77777777778F8
        7F7777F7F7F7F7F7F7F77F7F7F7F70E60F7F7FFFFFF778F787FFFF7F7F7F7F7F
        7F7F000000F7F0E66000888888F778F778887000000E666660007777708880E6
        60877777787778F778F77777770E666660877777087770E6608777778FF778F7
        78F77777770E666660877777007770E660877777887F78F778F77777770E6666
        60877788060770E7608777FF8F87F8F7F8F77777770E7666608770000E6070E0
        60877888877878F878F77777770E066660870EEEEEE600E660878F77777788F7
        78F77777770E666660870EEEEEE670E6608787FFFF7878F778F77777770E6666
        608776660E6770E6608778888F8F78F778F77777770E666660877777060770E6
        60877777888F787F78F77777770E6666608777770707770E60877777878F7787
        F8F77777770E66666087777777077770E0877777778FFFF8F8F77777770EEEEE
        E087777777000000007777777788888888777777770000000077}
      NumGlyphs = 3
      Spacing = 2
    end
    object Panel1: TPanel
      Left = 2
      Top = 348
      Width = 516
      Height = 100
      TabOrder = 3
      object Label19: TLabel
        Left = 18
        Top = 44
        Width = 97
        Height = 13
        Caption = 'Total com simulação'
      end
      object Label20: TLabel
        Left = 18
        Top = 27
        Width = 49
        Height = 13
        Caption = 'Simulação'
      end
      object Label21: TLabel
        Left = 18
        Top = 63
        Width = 85
        Height = 13
        Caption = 'Mercado ajustado'
      end
      object lbFantasia4: TLabel
        Left = 18
        Top = 82
        Width = 54
        Height = 13
        Caption = 'lbFantasia4'
      end
      object DBGrid3: TDBGrid
        Left = -1
        Top = 2
        Width = 515
        Height = 22
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Especificação'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Preço médio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Em R$'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMaroon
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = []
            Width = 126
            Visible = True
          end>
      end
      object DBRealEdit19: TDBRealEdit
        Left = 137
        Top = 41
        Width = 124
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 4
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit20: TDBRealEdit
        Left = 261
        Top = 41
        Width = 125
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMEDIA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit21: TDBRealEdit
        Left = 386
        Top = 41
        Width = 128
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 6
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit24: TDBRealEdit
        Left = 386
        Top = 22
        Width = 128
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit23: TDBRealEdit
        Left = 261
        Top = 22
        Width = 125
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMEDIA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit22: TDBRealEdit
        Left = 137
        Top = 22
        Width = 124
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit25: TDBRealEdit
        Left = 137
        Top = 60
        Width = 124
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit26: TDBRealEdit
        Left = 261
        Top = 60
        Width = 125
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMEDIA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit27: TDBRealEdit
        Left = 386
        Top = 60
        Width = 128
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 9
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit30: TDBRealEdit
        Left = 386
        Top = 79
        Width = 128
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 12
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
      object DBRealEdit29: TDBRealEdit
        Left = 261
        Top = 79
        Width = 125
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 11
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRMEDIA'
        DataSource = dsCotacaoAcao
      end
      object DBRealEdit28: TDBRealEdit
        Left = 137
        Top = 79
        Width = 124
        Height = 19
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 10
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCINDEX'
      end
    end
    object bt_Imprime: TBitBtn
      Left = 642
      Top = 332
      Width = 138
      Height = 41
      Caption = '&Imprimir'
      TabOrder = 5
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object QryCotacaoAcao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDEMISSOR,'
      'IDBOLSAVALORES,'
      'DATACOTAACAO,'
      'IDACAO,'
      'VLRABERTURA,'
      'VLRFECHAMENTO,'
      'VLRMAXIMA,'
      'VLRMINIMA,'
      'VLRMEDIA,'
      'VOLNEGOCIADO,'
      'QTDELOTE'
      'FROM COTACAOACAO'
      'WHERE IDACAO       =:IDACAO       AND'
      '      DATACOTAACAO =('
      '                     SELECT MAX(DATACOTAACAO)'
      '                     FROM   COTACAOACAO'
      '                     WHERE  DATACOTAACAO <=:DATACOTAACAO)')
    ValidateWithMask = True
    Left = 346
    Top = 26
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTAACAO'
        ParamType = ptUnknown
      end>
    object QryCotacaoAcaoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
    end
    object QryCotacaoAcaoIDBOLSAVALORES: TFloatField
      FieldName = 'IDBOLSAVALORES'
    end
    object QryCotacaoAcaoDATACOTAACAO: TDateTimeField
      FieldName = 'DATACOTAACAO'
    end
    object QryCotacaoAcaoIDACAO: TFloatField
      FieldName = 'IDACAO'
    end
    object QryCotacaoAcaoVLRABERTURA: TFloatField
      FieldName = 'VLRABERTURA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryCotacaoAcaoVLRFECHAMENTO: TFloatField
      FieldName = 'VLRFECHAMENTO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryCotacaoAcaoVLRMAXIMA: TFloatField
      FieldName = 'VLRMAXIMA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryCotacaoAcaoVLRMINIMA: TFloatField
      FieldName = 'VLRMINIMA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryCotacaoAcaoVLRMEDIA: TFloatField
      FieldName = 'VLRMEDIA'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryCotacaoAcaoVOLNEGOCIADO: TFloatField
      FieldName = 'VOLNEGOCIADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryCotacaoAcaoQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
    end
  end
  object dsCotacaoAcao: TwwDataSource
    AutoEdit = False
    DataSet = QryCotacaoAcao
    Left = 426
    Top = 26
  end
end
