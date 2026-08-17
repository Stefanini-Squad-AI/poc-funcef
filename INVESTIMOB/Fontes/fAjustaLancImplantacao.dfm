inherited frmAjustaLancImplantacao: TfrmAjustaLancImplantacao
  Left = 105
  Top = 125
  Caption = 'Lançamentos de Ajuste de Implantação'
  ClientHeight = 375
  ClientWidth = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 557
    Height = 336
    object Label2: TLabel
      Left = 160
      Top = 72
      Width = 60
      Height = 13
      Caption = 'Data Base'
    end
    object Label26: TLabel
      Left = 16
      Top = 8
      Width = 25
      Height = 13
      Caption = 'Bem'
    end
    object lblPlaca: TLabel
      Left = 16
      Top = 72
      Width = 33
      Height = 13
      Caption = 'Placa'
    end
    object pgctlValores: TPageControl
      Left = 5
      Top = 120
      Width = 547
      Height = 211
      ActivePage = TabBem
      Align = alBottom
      TabOrder = 2
      object TabBem: TTabSheet
        Caption = 'BEM'
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Custo'
        end
        object Label4: TLabel
          Left = 272
          Top = 8
          Width = 112
          Height = 13
          Caption = 'Depreciação Acum.'
        end
        object Label5: TLabel
          Left = 400
          Top = 8
          Width = 103
          Height = 13
          Caption = 'C.M. Depreciação'
        end
        object Label3: TLabel
          Left = 144
          Top = 8
          Width = 63
          Height = 13
          Caption = 'C.M. Custo'
        end
        object DBRealEdit1: TDBRealEdit
          Left = 16
          Top = 24
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,0000')
          TabOrder = 0
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORG'
          DataSource = dsSelbem
        end
        object DBRealEdit3: TDBRealEdit
          Left = 272
          Top = 24
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,0000')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'DEPLANC'
          DataSource = dsSelbem
        end
        object DBRealEdit4: TDBRealEdit
          Left = 400
          Top = 24
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,0000')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'CMDEP'
          DataSource = dsSelbem
        end
        object DBRealEdit2: TDBRealEdit
          Left = 144
          Top = 24
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,0000')
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 4
          NumberFormat = fNumber
          Signal = False
          DataField = 'CMBEM'
          DataSource = dsSelbem
        end
        object gbxBem: TGroupBox
          Left = 8
          Top = 72
          Width = 521
          Height = 73
          Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
          Caption = ' Valores do Ajuste '
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          object Label7: TLabel
            Left = 8
            Top = 16
            Width = 33
            Height = 13
            Caption = 'Custo'
          end
          object Label9: TLabel
            Left = 264
            Top = 16
            Width = 112
            Height = 13
            Caption = 'Depreciação Acum.'
          end
          object Label8: TLabel
            Left = 136
            Top = 16
            Width = 63
            Height = 13
            Caption = 'C.M. Custo'
          end
          object Label10: TLabel
            Left = 392
            Top = 16
            Width = 103
            Height = 13
            Caption = 'C.M. Depreciação'
          end
          object edValOrg: TRealEdit
            Left = 8
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = True
          end
          object edDepLanc: TRealEdit
            Left = 264
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = True
          end
          object edCmBem: TRealEdit
            Left = 136
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = True
          end
          object edCmDep: TRealEdit
            Left = 392
            Top = 32
            Width = 121
            Height = 21
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = True
          end
        end
      end
      object TabReavaliacao: TTabSheet
        Caption = 'REAVALIACAO'
        Enabled = False
        ImageIndex = 1
        object pnlDetReaval: TPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label6: TLabel
            Left = 16
            Top = 8
            Width = 33
            Height = 13
            Caption = 'Custo'
          end
          object Label11: TLabel
            Left = 144
            Top = 8
            Width = 63
            Height = 13
            Caption = 'C.M. Custo'
          end
          object Label12: TLabel
            Left = 272
            Top = 8
            Width = 112
            Height = 13
            Caption = 'Depreciação Acum.'
          end
          object Label13: TLabel
            Left = 400
            Top = 8
            Width = 103
            Height = 13
            Caption = 'C.M. Depreciação'
          end
          object DBRealEdit5: TDBRealEdit
            Left = 16
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORG'
            DataSource = dsReavaliacao
          end
          object DBRealEdit6: TDBRealEdit
            Left = 144
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMBEM'
            DataSource = dsReavaliacao
          end
          object DBRealEdit7: TDBRealEdit
            Left = 272
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'DEPLANC'
            DataSource = dsReavaliacao
          end
          object DBRealEdit8: TDBRealEdit
            Left = 400
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMDEP'
            DataSource = dsReavaliacao
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 72
            Width = 521
            Height = 73
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Caption = ' Valores do Ajuste '
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            object Label14: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Custo'
            end
            object Label15: TLabel
              Left = 264
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Depreciação Acum.'
            end
            object Label16: TLabel
              Left = 136
              Top = 16
              Width = 63
              Height = 13
              Caption = 'C.M. Custo'
            end
            object Label17: TLabel
              Left = 392
              Top = 16
              Width = 103
              Height = 13
              Caption = 'C.M. Depreciação'
            end
            object edReavValOrg: TRealEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
            object edReavCmBem: TRealEdit
              Left = 136
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
            object edReavDepLanc: TRealEdit
              Left = 264
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
            object edReavCmDep: TRealEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
          end
          object bbtnOkReavaliacao: TBitBtn
            Left = 328
            Top = 144
            Width = 90
            Height = 33
            TabOrder = 5
            OnClick = bbtnOkReavaliacaoClick
            Kind = bkOK
            Spacing = 2
          end
          object bbtnCancReavaliacao: TBitBtn
            Left = 424
            Top = 144
            Width = 90
            Height = 33
            Caption = 'Cancelar'
            TabOrder = 6
            OnClick = bbtnCancReavaliacaoClick
            Kind = bkCancel
            Spacing = 2
          end
        end
        object pnlGrdReaval: TPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object dbgReavaliacao: TwwDBGrid
            Left = 1
            Top = 32
            Width = 537
            Height = 150
            Selected.Strings = (
              'DATAREAVALIACAO'#9'11'#9'Data Laudo'#9'F'
              'VALORG'#9'15'#9'Valor Saldo'#9'F'
              'CMBEM'#9'14'#9'Correção Monet.'#9'F'
              'DEPLANC'#9'15'#9'Depreciação'#9'F'
              'CMDEP'#9'13'#9'Correção Monet.'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsReavaliacao
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Dock973: TDock97
            Left = 1
            Top = 1
            Width = 537
            Height = 31
            AllowDrag = False
            Background.Data = {
              760F0000424D760F0000000000007600000028000000800000003C0000000100
              040000000000000F000000000000000000001000000000000000000000008080
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777777777777171717777777777777177771777777777777777077F7FF7FFFF7
              77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
              777777777771717717777777777777777717777777777777777777777FFFFF7F
              7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
              77777777777777171777777777777777717777777777777777777777777FF7FF
              7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
              7777777777771771777777777777777771777777777777777777777777777FFF
              FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
              777777777777771777777777777777777777777777777777777777777777777F
              F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
              7777777777777777777777777777777777777777777777777777777777777771
              77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
              7777777777777177777777777777777777777777777777777777777777777777
              777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
              7777777777777777771777777777777777777777777777777777777777777777
              7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
              7777777777777717771777777777777777777777777777777777777777777777
              77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
              7777777777777771777777777777777777777777777777777777777777777777
              777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
              7777777777777777777777777777777777777777777777777777777777777777
              777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
              7777777777777777177777777777777777777777777777777777777777777777
              7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
              7777777777777777717777777777777777777777777777777777777777777777
              7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
              7777777777777777777771777777777777777777777777777777777777777777
              7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
              F7F7777777777777771777777777177777777777777777777777777777777777
              77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
              777F7F7777777777777177177771717777777777777777777777777777777777
              77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
              77777F7F77777777777717771777777777777777777777777777777777777777
              777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
              1777777777777777777771717717777177777777777777777777777777777777
              777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
              7777777777771777777777177771777777777777777777777777777777777777
              77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
              7777777777777777777771777777777777777777777777777777777777777777
              777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
              7777777777171777777717777777777777777777777777777777777777777777
              77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
              7777777777777177777771777777777777777777777777777777777777777777
              777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
              7777777777777777777771177777777777777777777777777777777777777777
              7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
              7777777777777777777771717777777777777777777777777777777777777777
              777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
              7777777777777777777777171777777777777777777777777777777777777777
              71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
              7777777777777777777777177777777777777777777777777777777777777717
              77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
              77777777777777777777777777777777777F7777777777777777777777777171
              7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
              771777777777777777777777777777777177F777777777777777777777777717
              171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
              7777777777777777777777777777777777777F77777777777777777777777777
              77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
              7177777177777777777777777777777777777FF7F77771777777777777777777
              1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
              7777777717777777777777777777777777777777777777777777777777777777
              717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
              7177777777777777777777777777777777771777777777777777777777777777
              77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
              777777F777777777777777777777777777777777717177717777777777777777
              77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
              171777F7F7777777777777177777777777777777777777777777777777777777
              777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
              7777777F77777777777777777777777777777777777777777777777777777777
              77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
              7717777F77777777777777717177777777777777777777777777777777777777
              7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
              777777777F777777777777777717777777777777777777777777777777777777
              777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
              7777777777777777777777771777777777777777777777777777777777777777
              77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
              7777777777777777777777777717177777777771777777777777777777777777
              7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
              7777777777777177777777777777777777777717177777777777777777777777
              77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
              7777777777717777777777777717177777777777777777777777777777777777
              777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
              777777777717171717777777777777777777777771777777777F777777777777
              777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
              77777777171777777777777777777777777777777777777777F7F77777777777
              77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
              7777777777171777777777777777777777777777777777777777777777777777
              777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
              7777777717177777777777777777777777777777777777777777777777777777
              77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
              7777777777171777777777777777777777777777777777777777777777777777
              7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
              77777777777777777F7F77777717777777777777777777777777777771777777
              7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
              77777777777777777F7F7F777777777777777777777777777777771777777777
              77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
              777777777777777777FFF77F7777717777777777777777777777777777177777
              77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
              77F7777777777777777777F77777777777777777777777777777777777777777
              77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
              F77777777777777777777777F7F7777777777777777777777777777777777777
              777777777717777777777777777777777777717777777777777F7F7F7F77F77F
              77F77777777F77777717777777F7777777777777777777777777777777777777
              77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
              7F77F77777777F77777717777777777777777777777777777777777777777777
              7777777777771777777777777777777777777777777777777F77F7F7F777F777
              F77F777777777777771771777777771777777777777777777777777777777777
              777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
              F7F7777777777777777717171777777777777777777777777777777777777777
              77777777777771777777777777777177777777777771777777777777F777F777
              7777777777777777777171717177771777777777777777777777777777777777
              77777777777777777777777777777777777777777777777777777F7F7F7F7777
              F77F77F777777777777771771717177777777777777777777777777777777777
              7777777777777777777777777777777777777777777177777777}
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object tb97BotoesDetalhe: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnAltReaval: TToolbarButton97
                Left = 0
                Top = 0
                Width = 79
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                Caption = 'Alterar'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
                  77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
                  7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
                  077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
                  F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
                  FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
                  077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
                  FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
                  777777777787FF88777777777778887777777777777888777777}
                ImageIndex = 1
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = bbtnAltReavalClick
              end
            end
          end
        end
      end
      object TabAcrescimo: TTabSheet
        Caption = 'ACRESCIMOVALOR'
        ImageIndex = 2
        object pnlDetAcresc: TPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object Label18: TLabel
            Left = 16
            Top = 8
            Width = 33
            Height = 13
            Caption = 'Custo'
          end
          object Label19: TLabel
            Left = 144
            Top = 8
            Width = 63
            Height = 13
            Caption = 'C.M. Custo'
          end
          object Label20: TLabel
            Left = 272
            Top = 8
            Width = 112
            Height = 13
            Caption = 'Depreciação Acum.'
          end
          object Label21: TLabel
            Left = 400
            Top = 8
            Width = 103
            Height = 13
            Caption = 'C.M. Depreciação'
          end
          object DBRealEdit9: TDBRealEdit
            Left = 16
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'VALORG'
            DataSource = dsReavaliacao
          end
          object DBRealEdit10: TDBRealEdit
            Left = 144
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 1
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMBEM'
            DataSource = dsReavaliacao
          end
          object DBRealEdit11: TDBRealEdit
            Left = 272
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'DEPLANC'
            DataSource = dsReavaliacao
          end
          object DBRealEdit12: TDBRealEdit
            Left = 400
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'CMDEP'
            DataSource = dsReavaliacao
          end
          object GroupBox2: TGroupBox
            Left = 8
            Top = 72
            Width = 521
            Height = 73
            Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
            Caption = ' Valores do Ajuste '
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            object Label22: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Custo'
            end
            object Label23: TLabel
              Left = 264
              Top = 16
              Width = 112
              Height = 13
              Caption = 'Depreciação Acum.'
            end
            object Label24: TLabel
              Left = 136
              Top = 16
              Width = 63
              Height = 13
              Caption = 'C.M. Custo'
            end
            object Label25: TLabel
              Left = 392
              Top = 16
              Width = 103
              Height = 13
              Caption = 'C.M. Depreciação'
            end
            object edAcresValOrg: TRealEdit
              Left = 8
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
            object edAcresCmBem: TRealEdit
              Left = 136
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
            object edAcresDepLanc: TRealEdit
              Left = 264
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
            object edAcresCmDep: TRealEdit
              Left = 392
              Top = 32
              Width = 121
              Height = 21
              Hint = ' Coloque o sinal - se for baixa de valor | Exemplo : -3.200,00'
              Alignment = taRightJustify
              Lines.Strings = (
                '0,0000')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              WordWrap = False
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = True
            end
          end
          object bbtnOkAcrescimo: TBitBtn
            Left = 328
            Top = 144
            Width = 90
            Height = 33
            TabOrder = 5
            OnClick = bbtnOkAcrescimoClick
            Kind = bkOK
            Spacing = 2
          end
          object bbtnCancAcrescimo: TBitBtn
            Left = 424
            Top = 144
            Width = 90
            Height = 33
            Caption = 'Cancelar'
            TabOrder = 6
            OnClick = bbtnCancAcrescimoClick
            Kind = bkCancel
            Spacing = 2
          end
        end
        object pnlGrdAcresc: TPanel
          Left = 0
          Top = 0
          Width = 539
          Height = 183
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Dock972: TDock97
            Left = 1
            Top = 1
            Width = 537
            Height = 31
            AllowDrag = False
            Background.Data = {
              760F0000424D760F0000000000007600000028000000800000003C0000000100
              040000000000000F000000000000000000001000000000000000000000008080
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              777777777777171717777777777777177771777777777777777077F7FF7FFFF7
              77F77F77F7F7F7F7F7F7F7F7F777777777771777177777777777777777777777
              777777777771717717777777777777777717777777777777777777777FFFFF7F
              7F7F77F7F7F7F7F7F7F7F7F77777777777777717177777777777777777777777
              77777777777777171777777777777777717777777777777777777777777FF7FF
              7F77777777F7F7FF7F7F77F77F77777777777777177777777777777777777777
              7777777777771771777777777777777771777777777777777777777777777FFF
              FF7F7777F7F7F7F7F7F77F777777777777777771717777777777777777777777
              777777777777771777777777777777777777777777777777777777777777777F
              F7F7F7F777F7F7F7F7F7F7F7F777777777777777177777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              FFFF7F7F7F7F7F7F7F7F777777777F7777777777777777777777777777777777
              7777777777777777777777777777777777777777777777777777777777777777
              7FF7F7F7F7F7F7FFFFF7F7F7F7F7777777777777717717177777777777777777
              7777777777777777777777777777777777777777777777777777777777777771
              77FFFFF7F7777F77F7F7F77F77777F7777777777777171777777777777777777
              7777777777777177777777777777777777777777777777777777777777777777
              777FFFFFF7F7F77F7F7FF7F7F77F777777777777777777177777777777777777
              7777777777777777771777777777777777777777777777777777777777777777
              7177FFFF7F7F77F7F7FF7FF7F7F7F77F77777777777171717777777777777777
              7777777777777717771777777777777777777777777777777777777777777777
              77777FFFFF7F7777F7F7FF7FF7F77F7777777777777777777777771777777777
              7777777777777771777777777777777777777777777777777777777777777777
              777777FFFF7F77F7F7F7F7F7F7F7F77F7F777777777771717771777177177777
              7777777777777777777777777777777777777777777777777777777777777777
              777777FFFFFF7F77F7F7F7FF7FF7F7F7777F7777777777771717717777777777
              7777777777777777177777777777777777777777777777777777777777777777
              7777777FFFF7F7F777F7F7F7F7F7F777F7777F77777777717771777777777777
              7777777777777777717777777777777777777777777777777777777777777777
              7777777F7FFF7F77F7F77F7FFF7F7F7F777F7777777777171717717777777F77
              7777777777777777777771777777777777777777777777777777777777777777
              7777777FFFF7F7777777F7F7F7F7F7F77F77F7777777777771771777777F7777
              F7F7777777777777771777777777177777777777777777777777777777777777
              77777177FFFFF7F777F77F7F7FF7F7F7F77F77F777777777171717177777F777
              777F7F7777777777777177177771717777777777777777777777777777777777
              77777777FFFF7F777777F7F7FF7F7F7F7F7F7F77777777777771717717777777
              77777F7F77777777777717771777777777777777777777777777777777777777
              777777177FFFF7F7F77F7F7FF7F7FF7F7F7F7F7F777777777717177177777777
              1777777777777777777771717717777177777777777777777777777777777777
              777777777FFFF7F77777777F7F7FF7F7F7F7F777F77777777771771717777771
              7777777777771777777777177771777777777777777777777777777777777777
              77777771777F7F7F77777F7F7F7F7F7F7F7F7F7F777777777777771717717717
              7777777777777777777771777777777777777777777777777777777777777777
              777777777777F7F7F7F77F7F7F7F7F7F7F7F7777777F77777777717717171717
              7777777777171777777717777777777777777777777777777777777777777777
              77777777777777F7F77777777F7F7F7F7F7F7F7F7F7777777777777777717777
              7777777777777177777771777777777777777777777777777777777777777777
              777777777777777F7F77777F7F7F7F7F7F7F7F777777F77F7777771777717777
              7777777777777777777771177777777777777777777777777777777777777777
              7177777777777777F7F7777777F77F7F7FF7F7F7F7F777777777777777717777
              7777777777777777777777777777777777777777777777777777777777777777
              7777777777777777777777777F77F7F7F7F7F7F77777F7777777777771777777
              7777777777777777777771717777777777777777777777777777777777777777
              777777177777771777777777777F7F7F7F7F7F7F7F7F777F7777777777717777
              7777777777777777777777171777777777777777777777777777777777777777
              71777777777777777777777777F7F7F7F7F7F7F7F7F77F777777777777177777
              7777777777777777777777177777777777777777777777777777777777777717
              77777777777777717777777777777F77F7F7F7F7F7F7F7777777777777777777
              77777777777777777777777777777777777F7777777777777777777777777171
              7171777777777777171777777777F77F7F7F7F7F7F7F7F777777777777777777
              771777777777777777777777777777777177F777777777777777777777777717
              171777177777777717771777777777F7F7F7F7FF7F7F77F77777777777777171
              7777777777777777777777777777777777777F77777777777777777777777777
              77717177777777777171717177777F77F7F7F7F7F7F7F77F7777777777777171
              7177777177777777777777777777777777777FF7F77771777777777777777777
              1717777777777777771777777777777F7F7F7F7F7F7F77F7F777777777777777
              7777777717777777777777777777777777777777777777777777777777777777
              717777777777777777777777717777F77F7F7F7F7F7F7F7F77F7777777777771
              7177777777777777777777777777777777771777777777777777777777777777
              77177777777777777777777777777777F7F77F7F7F7F7F7FF777F77777777717
              777777F777777777777777777777777777777777717177717777777777777777
              77177777777777777777777771777777777F77F7F7F7F7F777F7777777777777
              171777F7F7777777777777177777777777777777777777777777777777777777
              777777777777777777777777177177777F77F7F7F7F7F7F7F7F7F7F777777777
              7777777F77777777777777777777777777777777777777777777777777777777
              77777777777777777777777771777777777F77F7F7F7F7F7F7F77777F7777777
              7717777F77777777777777717177777777777777777777777777777777777777
              7777777777777777777777777717777777777F7F7F7F7F7F7777F7F777777777
              777777777F777777777777777717777777777777777777777777777777777777
              777777777777777777777777777777777777F7F7F7F7F7F7F7F7F77777777777
              7777777777777777777777771777777777777777777777777777777777777777
              77777777777777777777777777717771777777F7F77F7F7F7F7F77F777777777
              7777777777777777777777777717177777777771777777777777777777777777
              7777777777777777777777777777177777777F7F77F7F7F7F7F77F777F777777
              7777777777777177777777777777777777777717177777777777777777777777
              77777777777777777177777777717171777777777F7F7FF7F7F7F77F77777777
              7777777777717777777777777717177777777777777777777777777777777777
              777777777777777777177777777711717777777F7F7F7F7F7F77F7F7F7F77777
              777777777717171717777777777777777777777771777777777F777777777777
              777777777777777777777777777117117777777777F77F7F7F7F77F77777F777
              77777777171777777777777777777777777777777777777777F7F77777777777
              77777777777777777771777777771117177777777F77F7F7F777F7F7F7F77777
              7777777777171777777777777777777777777777777777777777777777777777
              777777777777777777777777777771777777777777F77F7F7F7F7F7F777F7777
              7777777717177777777777777777777777777777777777777777777777777777
              77777777777777777777777777777777777177777777F77F7F77F7F7F7F77F77
              7777777777171777777777777777777777777777777777777777777777777777
              7777777777777777777777777777777777177777777F7F7F7F7F7F7F777F7777
              77777777777777777F7F77777717777777777777777777777777777771777777
              7777777777777777777777777777777777717777777777F7F7F77F7F7F7F77F7
              77777777777777777F7F7F777777777777777777777777777777771777777777
              77777777177777777777777777771777777717777777F7F7F77F7F7F7F77F777
              777777777777777777FFF77F7777717777777777777777777777777777177777
              77777777777777777777777777771777777771777777777777F7F7F7F77F77F7
              77F7777777777777777777F77777777777777777777777777777777777777777
              77777777777777777777777777777777777777171777777F7F77F7F7F7F77F77
              F77777777777777777777777F7F7777777777777777777777777777777777777
              777777777717777777777777777777777777717777777777777F7F7F7F77F77F
              77F77777777F77777717777777F7777777777777777777777777777777777777
              77777777777177777777777777777777777777777177777777F7F7F77F7F77F7
              7F77F77777777F77777717777777777777777777777777777777777777777777
              7777777777771777777777777777777777777777777777777F77F7F7F777F777
              F77F777777777777771771777777771777777777777777777777777777777777
              777777777777777771777777777777777777777777177777777F7F7F7F7F77F7
              F7F7777777777777777717171777777777777777777777777777777777777777
              77777777777771777777777777777177777777777771777777777777F777F777
              7777777777777777777171717177771777777777777777777777777777777777
              77777777777777777777777777777777777777777777777777777F7F7F7F7777
              F77F77F777777777777771771717177777777777777777777777777777777777
              7777777777777777777777777777777777777777777177777777}
            BoundLines = [blTop, blBottom, blLeft, blRight]
            object Toolbar971: TToolbar97
              Left = 0
              Top = 0
              Caption = 'tb97BotoesDetalhe'
              DockPos = 0
              TabOrder = 0
              object bbtnAltAcresc: TToolbarButton97
                Left = 0
                Top = 0
                Width = 79
                Height = 25
                Hint = 'Alterar'
                AllowAllUp = True
                GroupIndex = 2
                Caption = 'Alterar'
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777770007
                  77777777777F8887F77777777788FF08777777777F887778F777777788FFFFF0
                  7777777788777FF8F7777778FFFF88F077777778F77F88F87F777778FF00F0FF
                  077777787F8878F78F77777700FFF0FF0777777F8877787F87F77700FFFFFF0F
                  F077778877777F8F787F778FFFFFCF0FFF07778F77FF8787F787778FFCCCFFF0
                  FFF07787F88877F8F7F87778FFFFFCF0F8877778F77FF87878877778FFCCCFFF
                  077777787F88877F87F777778FFFFFCFF07777778F77FF87787F77778FFCCCFF
                  FF07777787F888777F87777778FFFFFF88777777787F777F88777777778FFF88
                  777777777787FF88777777777778887777777777777888777777}
                ImageIndex = 1
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = bbtnAltAcrescClick
              end
            end
          end
          object dbgAcrescimo: TwwDBGrid
            Left = 1
            Top = 32
            Width = 537
            Height = 150
            Selected.Strings = (
              'DATAACRESCIMO'#9'10'#9'Data Evento'
              'VALORG'#9'15'#9'Valor'
              'CMBEM'#9'15'#9'Correção'
              'DEPLANC'#9'15'#9'Depreciação'
              'CMDEP'#9'15'#9'Correção')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAcrescimo
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
    end
    object dbeDesBem: TwwDBRichEdit
      Left = 16
      Top = 24
      Width = 498
      Height = 41
      AutoURLDetect = False
      DataField = 'DESBEM'
      DataSource = dsSelbem
      PrintJobName = 'Delphi 5'
      TabOrder = 3
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
        7F0000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331342064626544657342656D5C7061720D0A7D
        0D0A00}
    end
    object bbtnSelBem: TBitBtn
      Left = 515
      Top = 24
      Width = 21
      Height = 41
      TabOrder = 0
      OnClick = bbtnSelBemClick
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
      NumGlyphs = 2
    end
    object edDataBase: TCMDateTimePicker
      Left = 160
      Top = 88
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 1
      OnChange = edDataBaseChange
    end
    object dbePlaca: TwwDBEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 21
      DataField = 'PLACA'
      DataSource = dsSelbem
      TabOrder = 4
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 557
    inherited tb97Fundo: TToolbar97
      Left = 211
      DockPos = 262
      inherited sep1: TToolbarSep97
        Left = 260
      end
      inherited bbtnSair: TBitBtn
        Left = 180
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 262
      end
      object bbtnCancelar: TBitBtn
        Left = 90
        Top = 0
        Width = 90
        Height = 33
        Caption = '&Estornar'
        TabOrder = 2
        OnClick = bbtnCancelarClick
        Kind = bkCancel
        Spacing = 2
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 90
        Height = 33
        Caption = '&Executar'
        TabOrder = 3
        OnClick = bbtnConfirmarClick
        Kind = bkOK
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 731
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryRemHistMovBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (DATAMOVIMENTACAO = :DATAMOV)'
      
        '  AND ((IDTIPOMOVIMENTACAO >= 41) AND (IDTIPOMOVIMENTACAO <= 52)' +
        ')'
      ' ')
    ValidateWithMask = True
    Left = 648
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
  end
  object qryHistMovBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,IDTIPOMOVIMENTACAO,VALOFI,IDREAVALACRESC,'
      '       IDMOVIMENTACAO, FLGNCAF'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (DATAMOVIMENTACAO = :DATAMOV)'
      
        '  AND ((IDTIPOMOVIMENTACAO >= 41) AND (IDTIPOMOVIMENTACAO <= 52)' +
        ')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 648
    Top = 19
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end>
  end
  object qrySelBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, IDBEM, PLACA, DESBEM,'
      '       VALORG, CMBEM, DEPLANC, CMDEP'
      'FROM BEM'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '/*  AND (BAIXATOTAL <> '#39'S'#39') */'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 104
    Top = 24
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsSelbem: TwwDataSource
    AutoEdit = False
    DataSet = qrySelBem
    Left = 104
    Top = 11
  end
  object qryAtuBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.VALORG, B.CMBEM, B.DEPLANC, B.CMDEP, B.PLACA,'
      
        '       (NVL(BEMACUM.VALBEMACUM,0) - NVL(BXBEMACUM.BXVALBEMACUM,0' +
        ')) AS VALORG0,'
      
        '       (NVL(CMBEMACUM.VALCMBEMACUM,0) - NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) - NVL(BXDEPBEMACUM.BXVAL' +
        'DEPBEMACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) - NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0)) AS CMDEP0'
      ''
      'FROM BEM B,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (01,41,07))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (6,13))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM'
      ''
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '')
    UpdateObject = updAtuBem
    ValidateWithMask = True
    Left = 552
    Top = 424
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updAtuBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM')
    InsertSQL.Strings = (
      'insert into BEM'
      '  (VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM')
    Left = 552
    Top = 408
  end
  object qryRemSaldoContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 64
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,'
      '       DATASLDBEM,'
      '       VALORG,'
      '       CMBEM,'
      '       DEPLANC,'
      '       CMDEP,'
      '       REAVVALORG,'
      '       REAVCMBEM,'
      '       REAVDEPLANC,'
      '       REAVCMDEP,'
      '       ULTREAVVALORG,'
      '       ULTREAVCMBEM,'
      '       ULTREAVDEPLANC,'
      '       ULTREAVCMDEP,'
      '       IDGRUPO,'
      '       IDLOCALIZACAO,'
      '       IDRESPONSAVEL'
      'FROM SALDOCONTABBEM'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      'ORDER BY DATASLDBEM  '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 424
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qrySaldoContabBemIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'BASEDADOS.SALDOCONTABBEM.IDBEM'
    end
    object qrySaldoContabBemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.SALDOCONTABBEM.IDPESSOA'
    end
    object qrySaldoContabBemDATASLDBEM: TDateTimeField
      FieldName = 'DATASLDBEM'
      Origin = 'BASEDADOS.SALDOCONTABBEM.DATASLDBEM'
    end
    object qrySaldoContabBemVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = 'BASEDADOS.SALDOCONTABBEM.VALORG'
    end
    object qrySaldoContabBemCMBEM: TFloatField
      FieldName = 'CMBEM'
      Origin = 'BASEDADOS.SALDOCONTABBEM.CMBEM'
    end
    object qrySaldoContabBemDEPLANC: TFloatField
      FieldName = 'DEPLANC'
      Origin = 'BASEDADOS.SALDOCONTABBEM.DEPLANC'
    end
    object qrySaldoContabBemCMDEP: TFloatField
      FieldName = 'CMDEP'
      Origin = 'BASEDADOS.SALDOCONTABBEM.CMDEP'
    end
    object qrySaldoContabBemREAVVALORG: TFloatField
      FieldName = 'REAVVALORG'
      Origin = 'BASEDADOS.SALDOCONTABBEM.REAVVALORG'
    end
    object qrySaldoContabBemREAVCMBEM: TFloatField
      FieldName = 'REAVCMBEM'
      Origin = 'BASEDADOS.SALDOCONTABBEM.REAVCMBEM'
    end
    object qrySaldoContabBemREAVDEPLANC: TFloatField
      FieldName = 'REAVDEPLANC'
      Origin = 'BASEDADOS.SALDOCONTABBEM.REAVDEPLANC'
    end
    object qrySaldoContabBemREAVCMDEP: TFloatField
      FieldName = 'REAVCMDEP'
      Origin = 'BASEDADOS.SALDOCONTABBEM.REAVCMDEP'
    end
    object qrySaldoContabBemULTREAVVALORG: TFloatField
      FieldName = 'ULTREAVVALORG'
      Origin = 'BASEDADOS.SALDOCONTABBEM.ULTREAVVALORG'
    end
    object qrySaldoContabBemULTREAVCMBEM: TFloatField
      FieldName = 'ULTREAVCMBEM'
      Origin = 'BASEDADOS.SALDOCONTABBEM.ULTREAVCMBEM'
    end
    object qrySaldoContabBemULTREAVDEPLANC: TFloatField
      FieldName = 'ULTREAVDEPLANC'
      Origin = 'BASEDADOS.SALDOCONTABBEM.ULTREAVDEPLANC'
    end
    object qrySaldoContabBemULTREAVCMDEP: TFloatField
      FieldName = 'ULTREAVCMDEP'
      Origin = 'BASEDADOS.SALDOCONTABBEM.ULTREAVCMDEP'
    end
    object qrySaldoContabBemIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.SALDOCONTABBEM.IDGRUPO'
    end
    object qrySaldoContabBemIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'BASEDADOS.SALDOCONTABBEM.IDLOCALIZACAO'
    end
    object qrySaldoContabBemIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Origin = 'BASEDADOS.SALDOCONTABBEM.IDRESPONSAVEL'
    end
  end
  object qryMovContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT'
      '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO,'
      ''
      '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM -'
      
        '       VBEM.BXVALBEMACUM + VBEM.BXVALACRESACUM)                 ' +
        '        AS VALORG,'
      '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM  -'
      
        '       VBEM.BXVALCMBEMACUM  - VBEM.BXVALCMACRESACUM)            ' +
        '        AS CMBEM,'
      '   SUM(VBEM.VALDEPBEMACUM  + VBEM.VALDEPACRESACUM -'
      
        '       VBEM.BXVALDEPBEMACUM  - VBEM.BXVALDEPACRESACUM)          ' +
        '        AS DEPLANC,'
      '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM -'
      
        '       VBEM.BXVALCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM)       ' +
        '        AS CMDEP,'
      ''
      
        '   SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)                   ' +
        '        AS REAVVALORG,'
      
        '   SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)               ' +
        '        AS REAVCMBEM,'
      
        '   SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)             ' +
        '        AS REAVDEPLANC,'
      
        '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM)         ' +
        '        AS REAVCMDEP,'
      ''
      
        '   SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)             ' +
        '        AS ULTREAVVALORG,'
      
        '   SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)         ' +
        '        AS ULTREAVCMBEM,'
      
        '   SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)       ' +
        '        AS ULTREAVDEPLANC,'
      
        '   SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM)   ' +
        '        AS ULTREAVCMDEP'
      ''
      'FROM'
      '  ((SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(HM.VALOFI,0),'
      '                                            41,NVL(HM.VALOFI,0),'
      
        '                                            07,NVL(HM.VALOFI,0),' +
        '0)) AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,0),'
      
        '                                            49,NVL(HM.VALOFI,0),' +
        '0)) AS  VALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.VALOFI,0),'
      
        '                                            42,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,0),'
      
        '                                            50,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.VALOFI,0),'
      '                                            17,NVL(HM.VALOFI,0),'
      
        '                                            43,NVL(HM.VALOFI,0),' +
        '0)) AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,0),'
      
        '                                            51,NVL(HM.VALOFI,0),' +
        '0)) AS  VALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(HM.VALOFI,0),'
      
        '                                            44,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,0),'
      
        '                                            52,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(HM.VALOFI,0),'
      
        '                                            13,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALCMREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALDEPACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALCMDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM'
      '    WHERE (HM.IDBEM    = :IDBEM)'
      '      AND (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      ''
      '   ((SELECT'
      '            HM.IDBEM,'
      '            HM.IDPESSOA,'
      '            HM.DATAMOVIMENTACAO,'
      
        '            (0)                                                 ' +
        '     AS  VALBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             32,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             45,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             46,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             33,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             47,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             48,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTCMDEPREAVACUM'
      '     FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '     WHERE (HM.IDBEM    = :IDBEM)'
      '       AND (HM.IDPESSOA = :IDPESSOA)'
      '       AND (R.FLGULTREAVAL = 0)'
      '       AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '     GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      ''
      '    (SELECT'
      '            HM.IDBEM,'
      '            HM.IDPESSOA,'
      '            HM.DATAMOVIMENTACAO,'
      
        '            (0)                                                 ' +
        '     AS  VALBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPACRESACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             32,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             45,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             46,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTCMREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             33,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             47,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             48,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTCMDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTCMREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTCMDEPREAVACUM'
      '     FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '     WHERE (HM.IDBEM    = :IDBEM)'
      '       AND (HM.IDPESSOA = :IDPESSOA)'
      '       AND (R.FLGULTREAVAL = 1)'
      '       AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '     GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO))'
      '  )  VBEM'
      ''
      'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 408
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryMovContabBemIDBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBEM'
    end
    object qryMovContabBemIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
    end
    object qryMovContabBemDATAMOVIMENTACAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryMovContabBemVALORG: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORG'
    end
    object qryMovContabBemCMBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'CMBEM'
    end
    object qryMovContabBemDEPLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'DEPLANC'
    end
    object qryMovContabBemCMDEP: TFloatField
      DisplayWidth = 10
      FieldName = 'CMDEP'
    end
    object qryMovContabBemREAVVALORG: TFloatField
      DisplayWidth = 10
      FieldName = 'REAVVALORG'
    end
    object qryMovContabBemREAVCMBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'REAVCMBEM'
    end
    object qryMovContabBemREAVDEPLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'REAVDEPLANC'
    end
    object qryMovContabBemREAVCMDEP: TFloatField
      DisplayWidth = 10
      FieldName = 'REAVCMDEP'
    end
    object qryMovContabBemULTREAVVALORG: TFloatField
      DisplayWidth = 10
      FieldName = 'ULTREAVVALORG'
    end
    object qryMovContabBemULTREAVCMBEM: TFloatField
      DisplayWidth = 10
      FieldName = 'ULTREAVCMBEM'
    end
    object qryMovContabBemULTREAVDEPLANC: TFloatField
      DisplayWidth = 10
      FieldName = 'ULTREAVDEPLANC'
    end
    object qryMovContabBemULTREAVCMDEP: TFloatField
      DisplayWidth = 10
      FieldName = 'ULTREAVCMDEP'
    end
  end
  object qryDelSaldoContabBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from SALDOCONTABBEM'
      'where'
      '  IDBEM = :PIDBEM and'
      '  IDPESSOA = :PIDPESSOA and'
      '  DATASLDBEM = :PDATASLDBEM'
      ' ')
    ValidateWithMask = True
    Left = 294
    Top = 434
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSaldoContabBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  REAVVALORG = :REAVVALORG,'
      '  REAVCMBEM = :REAVCMBEM,'
      '  REAVDEPLANC = :REAVDEPLANC,'
      '  REAVCMDEP = :REAVCMDEP,'
      '  ULTREAVVALORG = :ULTREAVVALORG,'
      '  ULTREAVCMBEM = :ULTREAVCMBEM,'
      '  ULTREAVDEPLANC = :ULTREAVDEPLANC,'
      '  ULTREAVCMDEP = :ULTREAVCMDEP,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDBEM = :IDBEM and'
      '  IDPESSOA = :IDPESSOA and'
      '  DATASLDBEM = :DATASLDBEM'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 294
    Top = 419
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryInsSaldoContabBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into SALDOCONTABBEM'
      
        '  (IDBEM, IDPESSOA, DATASLDBEM, VALORG, CMBEM, DEPLANC, CMDEP, R' +
        'EAVVALORG, '
      
        '   REAVCMBEM, REAVDEPLANC, REAVCMDEP, ULTREAVVALORG, ULTREAVCMBE' +
        'M, ULTREAVDEPLANC, '
      '   ULTREAVCMDEP, IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :DATASLDBEM, :VALORG, :CMBEM, :DEPLANC, :C' +
        'MDEP, :REAVVALORG,'
      
        '   :REAVCMBEM, :REAVDEPLANC, :REAVCMDEP, :ULTREAVVALORG, :ULTREA' +
        'VCMBEM,'
      
        '   :ULTREAVDEPLANC, :ULTREAVCMDEP, :IDGRUPO, :IDLOCALIZACAO, :ID' +
        'RESPONSAVEL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 294
    Top = 405
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qrySCBTransf: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      
        'SELECT SC.IDBEM, SC.IDPESSOA, SC.DATASLDBEM, SC.IDGRUPO, SC.IDLO' +
        'CALIZACAO, SC.IDRESPONSAVEL'
      'FROM SALDOCONTABBEM SC'
      'WHERE (SC.IDBEM = :IDBEM)'
      '  AND (SC.IDPESSOA = :IDPESSOA)'
      'ORDER BY IDBEM, IDPESSOA, DATASLDBEM DESC'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 424
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBemAtual: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT B.IDGRUPO, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM BEM B,'
      '     CONJUNTO C'
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 488
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMovTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBEM, IDPESSOA, DATAMOVIMENTACAO, IDMOVIMENTACAO, IDTIPO' +
        'MOVIMENTACAO,'
      '       IDGRUPANT, IDLOCALANT, IDRESPANT'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDTIPOMOVIMENTACAO = 05) OR'
      '       (IDTIPOMOVIMENTACAO = 11) OR'
      '       (IDTIPOMOVIMENTACAO = 12))'
      'ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 488
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAtuReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT R.IDBEM, R.IDREAVALIACAO, R.VALORG, R.CMBEM, R.DEPLANC, R' +
        '.CMDEP, B.PLACA,'
      
        '       (NVL(REAVACUM.VALREAVACUM,0) - NVL(BXREAVACUM.BXVALREAVAC' +
        'UM,0)) AS VALORG0,'
      
        '       (NVL(CMREAVACUM.VALCMREAVACUM,0) - NVL(BXCMREAVACUM.BXVAL' +
        'CMREAVACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPREAVACUM.VALDEPREAVACUM,0) - NVL(BXDEPREAVACUM.BX' +
        'VALDEPREAVACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) - NVL(BXCMDEPREAVA' +
        'CUM.BXVALCMDEPREAVACUM,0)) AS CMDEP0'
      ''
      'FROM REAVALIACAO R, BEM B, '
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) REAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMREAVACU' +
        'M,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) DEPREAVAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMDEPREAV' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXREAVACU' +
        'M,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMREAVA' +
        'CUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXDEPREAV' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPRE' +
        'AVACUM'
      ''
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      
        '  AND ((R.DATAREAVALIACAO <= :PDATAMOV) OR (R.DATAREAVALIACAO IS' +
        ' NULL))'
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (R.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = REAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = DEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMDEPREAVACUM.IDREAVALACRESC(+))'
      '')
    UpdateObject = updAtuReavaliacao
    ValidateWithMask = True
    Left = 640
    Top = 424
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
  end
  object updAtuReavaliacao: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      '  (VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 640
    Top = 408
  end
  object qryAtuAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT A.IDBEM, A.IDACRESCIMO, A.VALORG, A.CMBEM, A.DEPLANC, A.C' +
        'MDEP, B.PLACA,'
      
        '       (NVL(ACRESACUM.VALACRESACUM,0) - NVL(BXACRESACUM.BXVALACR' +
        'ESACUM,0)) AS VALORG0,'
      
        '       (NVL(CMACRESACUM.VALCMACRESACUM,0) - NVL(BXCMACRESACUM.BX' +
        'VALCMACRESACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPACRESACUM.VALDEPACRESACUM,0) - NVL(BXDEPACRESACUM' +
        '.BXVALDEPACRESACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) - NVL(BXCMDEPACR' +
        'ESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0'
      ''
      'FROM ACRESCIMOVALOR A, BEM B,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO, SUM(HM.VALO' +
        'FI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO) ACRESACUM' +
        ','
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMACRESAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) DEPACRESA' +
        'CUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMDEPACRE' +
        'SACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXACRESAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMACRES' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXDEPACRE' +
        'SACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDBEM = :IDBEM)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPAC' +
        'RESACUM'
      ''
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      
        '  AND ((A.DATAACRESCIMO <= :PDATAMOV) OR (A.DATAACRESCIMO IS NUL' +
        'L))'
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (A.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (A.IDMOVIMENTACAO = ACRESACUM.IDMOVIMENTACAO(+))'
      '  AND (A.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = DEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMDEPACRESACUM.IDREAVALACRESC(+))'
      '')
    UpdateObject = updAtuAcrescimo
    ValidateWithMask = True
    Left = 736
    Top = 424
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
  end
  object updAtuAcrescimo: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      '  (IDBEM, IDACRESCIMO, VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:IDBEM, :IDACRESCIMO, :VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 736
    Top = 408
  end
  object qryUpdSCBTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDBEM = :IDBEM and'
      '  IDPESSOA = :IDPESSOA and'
      '  DATASLDBEM = :DATASLDBEM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryGrupoExiste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.IDGRUPO = :IDGRUPO)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 507
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryLocalExiste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'WHERE (IDLOCALIZACAO = :IDLOCALIZACAO)'
      '  AND (IDPESSOA      = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 494
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRespExiste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRESPONSAVEL'
      'FROM RESPONSAVEL R,'
      '     PESSOA P'
      'WHERE (R.IDRESPONSAVEL = :IDRESPONSAVEL)'
      '  AND (R.IDRESPONSAVEL = P.IDPESSOA)     ')
    ValidateWithMask = True
    Left = 208
    Top = 482
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryUltMovBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTMOV'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 176
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryReavaliacao: TwwQuery
    CachedUpdates = True
    AfterScroll = qryReavaliacaoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREAVALIACAO,IDBEM,IDPESSOA,IDMOVIMENTACAO,'
      '       DATAREAVALIACAO,VALORG,CMBEM,VALFIS,VALGER,'
      '       DEPLANC,CMDEP,DEPFIS,DEPGER,DATAULTDEP,'
      '       FLGDEPREC,TAXADEP,FLGULTREAVAL,'
      '       (0) AS VALORG0,'
      '       (0) AS CMBEM0,'
      '       (0) AS DEPLANC0,'
      '       (0) AS CMDEP0'
      'FROM    REAVALIACAO'
      'WHERE (IDPESSOA = :IDPESSOA)'
      '      AND (IDBEM        = :IDBEM)'
      'ORDER BY FLGULTREAVAL, IDREAVALIACAO'
      ' ')
    UpdateObject = updReavaliacao
    ControlType.Strings = (
      'FLGULTREAVAL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 360
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryAcrescimo: TwwQuery
    CachedUpdates = True
    AfterScroll = qryAcrescimoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDACRESCIMO,IDPESSOA,IDBEM,IDMOVIMENTACAO,'
      '       DATAACRESCIMO,VALORG,CMBEM,VALFIS,VALGER,'
      '       TAXADEP,DEPLANC,CMDEP,DEPFIS,DEPGER,DATAULTDEP,'
      '       FLGDEPREC,'
      '       (0) AS VALORG0,'
      '       (0) AS CMBEM0,'
      '       (0) AS DEPLANC0,'
      '       (0) AS CMDEP0'
      'FROM   ACRESCIMOVALOR'
      'WHERE (IDPESSOA = :IDPESSOA)'
      '  AND (IDBEM    = :IDBEM)'
      'ORDER BY DATAACRESCIMO,IDACRESCIMO       '
      ' '
      ' '
      ' ')
    UpdateObject = updAcrescimo
    ValidateWithMask = True
    Left = 440
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end>
  end
  object dsReavaliacao: TwwDataSource
    AutoEdit = False
    DataSet = qryReavaliacao
    Left = 360
    Top = 43
  end
  object dsAcrescimo: TwwDataSource
    AutoEdit = False
    DataSet = qryAcrescimo
    Left = 440
    Top = 43
  end
  object updReavaliacao: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  IDBEM = :IDBEM,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAREAVALIACAO = :DATAREAVALIACAO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  TAXADEP = :TAXADEP,'
      '  FLGULTREAVAL = :FLGULTREAVAL,'
      '  VALORG0 = :VALORG0,'
      '  CMBEM0 = :CMBEM0,'
      '  DEPLANC0 = :DEPLANC0,'
      '  CMDEP0 = :CMDEP0'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      
        '  (IDREAVALIACAO, IDBEM, IDPESSOA, IDMOVIMENTACAO, DATAREAVALIAC' +
        'AO, VALORG, '
      
        '   CMBEM, VALFIS, VALGER, DEPLANC, CMDEP, DEPFIS, DEPGER, DATAUL' +
        'TDEP, FLGDEPREC, '
      '   TAXADEP, FLGULTREAVAL, VALORG0, CMBEM0, DEPLANC0, CMDEP0)'
      'values'
      
        '  (:IDREAVALIACAO, :IDBEM, :IDPESSOA, :IDMOVIMENTACAO, :DATAREAV' +
        'ALIACAO, '
      
        '   :VALORG, :CMBEM, :VALFIS, :VALGER, :DEPLANC, :CMDEP, :DEPFIS,' +
        ' :DEPGER, '
      
        '   :DATAULTDEP, :FLGDEPREC, :TAXADEP, :FLGULTREAVAL, :VALORG0, :' +
        'CMBEM0, '
      '   :DEPLANC0, :CMDEP0)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 360
    Top = 30
  end
  object updAcrescimo: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBEM = :IDBEM,'
      '  IDMOVIMENTACAO = :IDMOVIMENTACAO,'
      '  DATAACRESCIMO = :DATAACRESCIMO,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  VALFIS = :VALFIS,'
      '  VALGER = :VALGER,'
      '  TAXADEP = :TAXADEP,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  DEPFIS = :DEPFIS,'
      '  DEPGER = :DEPGER,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  FLGDEPREC = :FLGDEPREC,'
      '  VALORG0 = :VALORG0,'
      '  CMBEM0 = :CMBEM0,'
      '  DEPLANC0 = :DEPLANC0,'
      '  CMDEP0 = :CMDEP0'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      
        '  (IDACRESCIMO, IDPESSOA, IDBEM, IDMOVIMENTACAO, DATAACRESCIMO, ' +
        'VALORG, '
      
        '   CMBEM, VALFIS, VALGER, TAXADEP, DEPLANC, CMDEP, DEPFIS, DEPGE' +
        'R, DATAULTDEP, '
      '   FLGDEPREC, VALORG0, CMBEM0, DEPLANC0, CMDEP0)'
      'values'
      
        '  (:IDACRESCIMO, :IDPESSOA, :IDBEM, :IDMOVIMENTACAO, :DATAACRESC' +
        'IMO, :VALORG, '
      
        '   :CMBEM, :VALFIS, :VALGER, :TAXADEP, :DEPLANC, :CMDEP, :DEPFIS' +
        ', :DEPGER, '
      
        '   :DATAULTDEP, :FLGDEPREC, :VALORG0, :CMBEM0, :DEPLANC0, :CMDEP' +
        '0)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 440
    Top = 30
  end
end
