inherited frmSelOrcam: TfrmSelOrcam
  Left = 76
  Top = 101
  Caption = 'Orçamento do Custo de Pessoal'
  ClientHeight = 411
  ClientWidth = 645
  Constraints.MinHeight = 438
  Constraints.MinWidth = 653
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 645
    Height = 372
    inherited pnSelecao: TPanel
      Width = 637
      Height = 364
      inherited pnResult: TPanel
        Width = 635
        Height = 362
        object gbxResult: TGroupBox
          Left = 9
          Top = 5
          Width = 617
          Height = 347
          Hint = 'Valores Limites e Respectivos % de Aumento'
          Caption = 'Resultado'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object Label9: TLabel
            Left = 24
            Top = 71
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 3'
          end
          object Label10: TLabel
            Left = 24
            Top = 93
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 4'
          end
          object Label11: TLabel
            Left = 24
            Top = 115
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 5'
          end
          object Label12: TLabel
            Left = 24
            Top = 137
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 6'
          end
          object Label13: TLabel
            Left = 24
            Top = 159
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 7'
          end
          object Label14: TLabel
            Left = 24
            Top = 181
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 8'
          end
          object Label16: TLabel
            Left = 109
            Top = 11
            Width = 48
            Height = 13
            Caption = 'Pessoas'
          end
          object Label17: TLabel
            Left = 307
            Top = 11
            Width = 62
            Height = 13
            Caption = 'Benefícios'
          end
          object Label18: TLabel
            Left = 419
            Top = 11
            Width = 54
            Height = 13
            Caption = 'Encargos'
          end
          object Label19: TLabel
            Left = 537
            Top = 11
            Width = 30
            Height = 13
            Caption = 'Total'
          end
          object Label20: TLabel
            Left = 24
            Top = 291
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Totais'
          end
          object Label15: TLabel
            Left = 205
            Top = 11
            Width = 46
            Height = 13
            Caption = 'Salários'
          end
          object Label21: TLabel
            Left = 24
            Top = 203
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 9'
          end
          object Label22: TLabel
            Left = 24
            Top = 225
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 10'
          end
          object Label23: TLabel
            Left = 24
            Top = 247
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 11'
          end
          object Label24: TLabel
            Left = 24
            Top = 269
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 12'
          end
          object lblAcum: TLabel
            Left = 24
            Top = 317
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Acumulado'
          end
          object Label25: TLabel
            Left = 24
            Top = 30
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 1'
          end
          object Label26: TLabel
            Left = 24
            Top = 51
            Width = 65
            Height = 13
            AutoSize = False
            Caption = 'Mês 2'
          end
          object ednPes1: TRealEdit
            Tag = 1
            Left = 100
            Top = 26
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal1: TRealEdit
            Tag = 13
            Left = 184
            Top = 26
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal2: TRealEdit
            Tag = 14
            Left = 184
            Top = 48
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes2: TRealEdit
            Tag = 2
            Left = 100
            Top = 48
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal3: TRealEdit
            Tag = 15
            Left = 184
            Top = 70
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes3: TRealEdit
            Tag = 3
            Left = 100
            Top = 70
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal4: TRealEdit
            Tag = 16
            Left = 184
            Top = 92
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes4: TRealEdit
            Tag = 4
            Left = 100
            Top = 92
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal5: TRealEdit
            Tag = 17
            Left = 184
            Top = 114
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes5: TRealEdit
            Tag = 5
            Left = 100
            Top = 114
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal6: TRealEdit
            Tag = 18
            Left = 184
            Top = 136
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes6: TRealEdit
            Tag = 6
            Left = 100
            Top = 136
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal7: TRealEdit
            Tag = 19
            Left = 184
            Top = 158
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes7: TRealEdit
            Tag = 7
            Left = 100
            Top = 158
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal8: TRealEdit
            Tag = 20
            Left = 184
            Top = 180
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes8: TRealEdit
            Tag = 8
            Left = 100
            Top = 180
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen1: TRealEdit
            Tag = 25
            Left = 292
            Top = 26
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen2: TRealEdit
            Tag = 26
            Left = 292
            Top = 48
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen3: TRealEdit
            Tag = 27
            Left = 292
            Top = 70
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen4: TRealEdit
            Tag = 28
            Left = 292
            Top = 92
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen5: TRealEdit
            Tag = 29
            Left = 292
            Top = 114
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen6: TRealEdit
            Tag = 30
            Left = 292
            Top = 136
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen7: TRealEdit
            Tag = 31
            Left = 292
            Top = 158
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen8: TRealEdit
            Tag = 32
            Left = 292
            Top = 180
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc1: TRealEdit
            Tag = 37
            Left = 401
            Top = 26
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc2: TRealEdit
            Tag = 38
            Left = 401
            Top = 48
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc3: TRealEdit
            Tag = 39
            Left = 401
            Top = 70
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc4: TRealEdit
            Tag = 40
            Left = 401
            Top = 92
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc5: TRealEdit
            Tag = 41
            Left = 401
            Top = 114
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 28
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc6: TRealEdit
            Tag = 42
            Left = 401
            Top = 136
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc7: TRealEdit
            Tag = 43
            Left = 401
            Top = 158
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 30
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc8: TRealEdit
            Tag = 44
            Left = 401
            Top = 180
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot1: TRealEdit
            Tag = 49
            Left = 509
            Top = 26
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 32
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot2: TRealEdit
            Tag = 50
            Left = 509
            Top = 48
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 33
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot3: TRealEdit
            Tag = 51
            Left = 509
            Top = 70
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 34
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot4: TRealEdit
            Tag = 52
            Left = 509
            Top = 92
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 35
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot5: TRealEdit
            Tag = 53
            Left = 509
            Top = 114
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 36
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot6: TRealEdit
            Tag = 54
            Left = 509
            Top = 136
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 37
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot7: TRealEdit
            Tag = 55
            Left = 509
            Top = 158
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 38
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot8: TRealEdit
            Tag = 56
            Left = 509
            Top = 180
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 39
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal13: TRealEdit
            Left = 184
            Top = 290
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 40
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen13: TRealEdit
            Left = 292
            Top = 290
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 41
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc13: TRealEdit
            Left = 401
            Top = 290
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 42
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot13: TRealEdit
            Left = 509
            Top = 290
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 43
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes9: TRealEdit
            Tag = 9
            Left = 100
            Top = 202
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 44
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes10: TRealEdit
            Tag = 10
            Left = 100
            Top = 224
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 45
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes11: TRealEdit
            Tag = 11
            Left = 100
            Top = 246
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 46
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes12: TRealEdit
            Tag = 12
            Left = 100
            Top = 268
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 47
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal9: TRealEdit
            Tag = 21
            Left = 184
            Top = 202
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 48
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal10: TRealEdit
            Tag = 22
            Left = 184
            Top = 224
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 49
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal11: TRealEdit
            Tag = 23
            Left = 184
            Top = 246
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 50
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal12: TRealEdit
            Tag = 24
            Left = 184
            Top = 268
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 51
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen9: TRealEdit
            Tag = 33
            Left = 292
            Top = 202
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 52
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen10: TRealEdit
            Tag = 34
            Left = 292
            Top = 224
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 53
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen11: TRealEdit
            Tag = 35
            Left = 292
            Top = 246
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 54
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen12: TRealEdit
            Tag = 36
            Left = 292
            Top = 268
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 55
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc9: TRealEdit
            Tag = 45
            Left = 401
            Top = 202
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 56
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc10: TRealEdit
            Tag = 46
            Left = 401
            Top = 224
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 57
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc11: TRealEdit
            Tag = 47
            Left = 401
            Top = 246
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 58
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc12: TRealEdit
            Tag = 48
            Left = 401
            Top = 268
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 59
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot9: TRealEdit
            Tag = 57
            Left = 509
            Top = 202
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 60
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot10: TRealEdit
            Tag = 58
            Left = 509
            Top = 224
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 61
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot11: TRealEdit
            Tag = 59
            Left = 509
            Top = 246
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 62
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot12: TRealEdit
            Tag = 60
            Left = 509
            Top = 268
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 63
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes13: TRealEdit
            Left = 100
            Top = 290
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clNavy
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 64
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednPes14: TRealEdit
            Left = 100
            Top = 316
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 65
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednVal14: TRealEdit
            Left = 184
            Top = 316
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 66
            WordWrap = False
            IntDigits = 8
            DecDigits = 0
            NumberFormat = fNumber
            Signal = False
          end
          object ednBen14: TRealEdit
            Left = 292
            Top = 316
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 67
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednEnc14: TRealEdit
            Left = 401
            Top = 316
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 68
            WordWrap = False
            IntDigits = 12
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednTot14: TRealEdit
            Left = 509
            Top = 316
            Width = 88
            Height = 21
            Alignment = taRightJustify
            Color = clTeal
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 69
            WordWrap = False
            IntDigits = 8
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
      end
      inherited pgctrlPrincipal: TPageControl
        Width = 635
        Height = 362
        ActivePage = tbshConsulta
        object tbshConsulta: TTabSheet [0]
          Caption = 'Consulta'
          ImageIndex = 4
          object Label27: TLabel
            Left = 53
            Top = 19
            Width = 161
            Height = 13
            Caption = 'Número de Meses a Projetar'
          end
          object spedMeses: TSpinEdit
            Left = 221
            Top = 16
            Width = 40
            Height = 22
            MaxValue = 12
            MinValue = 1
            TabOrder = 0
            Value = 12
            OnChange = spedMesesChange
          end
          object rgEncargo: TRadioGroup
            Left = 20
            Top = 51
            Width = 283
            Height = 120
            Caption = '% Encargos Sociais'
            ItemIndex = 1
            Items.Strings = (
              'Único (a Especificar)'
              'Por Rubrica (Tabela ao Lado)')
            TabOrder = 1
            OnClick = rgEncargoClick
          end
          object rgBenef: TRadioGroup
            Left = 314
            Top = 6
            Width = 283
            Height = 35
            Caption = 'Considera os Benefícios Sociais?'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 2
          end
          object dbgrEncargo: TwwDBGrid
            Left = 314
            Top = 51
            Width = 283
            Height = 120
            Selected.Strings = (
              'DESCRENCARGO'#9'33'#9'Descrição'
              'PERCENCARGO'#9'7'#9'%')
            IniAttributes.Delimiter = ';;'
            TitleColor = clGray
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsEncargo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWhite
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object super: TGroupBox
            Left = 20
            Top = 178
            Width = 283
            Height = 133
            Caption = 'Índice de Variação de Salários'
            TabOrder = 4
            object EditNum1: TRealEdit
              Tag = 1
              Left = 20
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 0
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum2: TRealEdit
              Tag = 2
              Left = 84
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 1
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum3: TRealEdit
              Tag = 3
              Left = 151
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 2
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum4: TRealEdit
              Tag = 4
              Left = 216
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 3
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum5: TRealEdit
              Tag = 5
              Left = 20
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 4
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum6: TRealEdit
              Tag = 6
              Left = 84
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 5
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum7: TRealEdit
              Tag = 7
              Left = 151
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 6
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum8: TRealEdit
              Tag = 8
              Left = 216
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 7
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum9: TRealEdit
              Tag = 9
              Left = 20
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 8
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum10: TRealEdit
              Tag = 10
              Left = 84
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 9
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum11: TRealEdit
              Tag = 11
              Left = 151
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 10
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum12: TRealEdit
              Tag = 12
              Left = 216
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000'
                '0')
              TabOrder = 11
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
          end
          object gbxEfetivo: TGroupBox
            Left = 314
            Top = 178
            Width = 283
            Height = 133
            Caption = 'Índice de Variação do Quadro Efetivo'
            TabOrder = 5
            object EditNum13: TRealEdit
              Tag = 13
              Left = 20
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum14: TRealEdit
              Tag = 14
              Left = 84
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 1
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum15: TRealEdit
              Tag = 15
              Left = 151
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 2
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum16: TRealEdit
              Tag = 16
              Left = 216
              Top = 24
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 3
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum17: TRealEdit
              Tag = 17
              Left = 20
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 4
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum18: TRealEdit
              Tag = 18
              Left = 84
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 5
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum19: TRealEdit
              Tag = 19
              Left = 151
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 6
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum20: TRealEdit
              Tag = 20
              Left = 216
              Top = 63
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 7
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum21: TRealEdit
              Tag = 21
              Left = 20
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 8
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum22: TRealEdit
              Tag = 22
              Left = 84
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 9
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum23: TRealEdit
              Tag = 23
              Left = 151
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 10
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object EditNum24: TRealEdit
              Tag = 24
              Left = 216
              Top = 102
              Width = 46
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1,0000')
              TabOrder = 11
              WordWrap = False
              IntDigits = 1
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
          end
          object ednPerc1: TRealEdit
            Left = 227
            Top = 79
            Width = 64
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            TabOrder = 6
            Visible = False
            WordWrap = False
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object ednPerc2: TRealEdit
            Left = 227
            Top = 130
            Width = 64
            Height = 21
            TabStop = False
            Alignment = taRightJustify
            Lines.Strings = (
              '0,00')
            ReadOnly = True
            TabOrder = 7
            WordWrap = False
            IntDigits = 3
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
        end
        inherited tsDadosFunc: TTabSheet
          inherited gbxTipContra: TGroupBox
            inherited cbxCandidatos: TCheckBox
              Enabled = False
            end
          end
          inherited gbxSituacao: TGroupBox
            inherited cbxDemitidos: TCheckBox
              Enabled = False
            end
          end
          inherited rgSequencia: TGroupBox [2]
          end
          inherited gbxTempAdm: TGroupBox [3]
          end
          inherited gbxTempLot: TGroupBox [4]
          end
          inherited gbxSalario: TGroupBox [5]
          end
          inherited gbxTipoSal: TGroupBox [6]
          end
          inherited gbxTempCar: TGroupBox [7]
          end
        end
        inherited tsDadosPess: TTabSheet
          inherited gbxCep: TGroupBox [2]
          end
          inherited gbxAniv: TGroupBox [3]
          end
          inherited gbxGrauInstr: TGroupBox [4]
          end
          inherited gbxProfis: TGroupBox [5]
          end
        end
        inherited tsDadosOutros: TTabSheet
          inherited rgSelCargo: TRadioGroup [1]
          end
          inherited gbxEstab: TGroupBox [3]
          end
          inherited gbxCargo: TGroupBox [4]
          end
          inherited rgSelRamo: TRadioGroup [5]
          end
          inherited gbxRamo: TGroupBox [6]
          end
          inherited gbxSindi: TGroupBox [7]
          end
        end
        inherited tbsDemit: TTabSheet
          inherited gbxDemitidos: TGroupBox
            Width = 627
            Height = 334
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 645
    inherited tb97Fundo: TToolbar97
      Left = 383
      DockPos = 551
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 216
      DockPos = 217
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      Visible = False
      object ToolbarSep972: TToolbarSep97
        Left = 75
        Top = 0
        Blank = True
      end
      object bbtnGrafico: TBitBtn
        Left = 0
        Top = 0
        Width = 75
        Height = 33
        Hint = 'Mostrar os valores em gráfico'
        Caption = '&Gráfico'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnClick = bbtnGraficoClick
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
        NumGlyphs = 2
      end
      object bbtnOrcamento: TBitBtn
        Left = 81
        Top = 0
        Width = 97
        Height = 33
        Hint = 'Gerar Integração para o Módulo de Orçamento'
        Caption = '&Orçamento'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = False
        OnClick = bbtnOrcamentoClick
        Glyph.Data = {
          F6010000424DF60100000000000076000000280000001E000000180000000100
          0400000000008001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
          0000000000007000000008888888888888888888888807000000070000078800
          000078800000780700000770BBB3770EEEE06770DDD0577070000770BBB3070E
          EEE06070DDD0507707000770BBB3000EEEE06000DDD0500000000770BBB3000E
          EEE06000DDD0500000000770BBB3000EEEE06000DDD0500000000770BBB3000E
          EEE06000DDD0500000000770BBB3000EEEE06000DDD0500000000770BBB3000E
          EEE06000DDD05000000007700003000EEEE06000DDD05000000007770BB0000E
          EEE06000DDD05000000007777000000EEEE06000DDD05000000007777000000E
          EEE06000DDD05000000007777000000EEEE06000DDD05000000007777000000E
          EEE0600000005000000000877000000EEEE0600000000000000000087000000E
          EEE0600000000000000000008000000000006000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 595
    Top = 259
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 544
    Top = 130
  end
  inherited CdsCCusto: TCMClientDataSet
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        Fields = 'TIPO;NOME'
        Options = [ixCaseInsensitive]
      end>
  end
  object CdsEncargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 340
    Top = 130
  end
  object dsEncargo: TwwDataSource
    DataSet = CdsEncargo
    Left = 398
    Top = 130
  end
  object CdsHistorico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 475
    Top = 130
  end
end
