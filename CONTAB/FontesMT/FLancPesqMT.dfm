inherited frmLancPesquisaMT: TfrmLancPesquisaMT
  Left = 26
  Top = 79
  Caption = 'Pesquisa de Lançamentos'
  ClientHeight = 432
  ClientWidth = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 723
    Height = 393
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 721
      Height = 391
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Lançamento'
        object Bevel2: TBevel
          Left = 144
          Top = 46
          Width = 0
          Height = 139
          Shape = bsRightLine
          Style = bsRaised
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 72
          Width = 337
          Height = 145
          Caption = 'Débito'
          TabOrder = 0
          object Label6: TLabel
            Left = 16
            Top = 16
            Width = 34
            Height = 13
            Caption = 'Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 16
            Top = 56
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label26: TLabel
            Left = 16
            Top = 96
            Width = 102
            Height = 13
            Caption = 'Subconta/Auxiliar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbeNomeContaD: TwwDBEdit
            Left = 128
            Top = 32
            Width = 193
            Height = 21
            DataField = 'PLANOME'
            DataSource = dsLancamentos1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeContaD: TwwDBEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            DataField = 'PLACONTA'
            DataSource = dsLancamentos1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeCCusD: TwwDBEdit
            Left = 128
            Top = 72
            Width = 193
            Height = 21
            DataField = 'NOME'
            DataSource = dsLancamentos1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeCCusD: TwwDBEdit
            Left = 16
            Top = 72
            Width = 113
            Height = 21
            DataField = 'CODCENTROCUSTO'
            DataSource = dsLancamentos1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeAuxD: TwwDBEdit
            Left = 128
            Top = 112
            Width = 193
            Height = 21
            DataField = 'NOMESUBCONTA'
            DataSource = dsLancamentos1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbrAuxD: TDBRealEdit
            Left = 16
            Top = 112
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '0')
            ParentFont = False
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'CODSUBCONTA'
            DataSource = dsLancamentos1
          end
        end
        object GroupBox2: TGroupBox
          Left = 351
          Top = 72
          Width = 337
          Height = 145
          Caption = 'Crédito'
          TabOrder = 1
          object Label2: TLabel
            Left = 16
            Top = 16
            Width = 34
            Height = 13
            Caption = 'Conta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 16
            Top = 56
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 16
            Top = 96
            Width = 102
            Height = 13
            Caption = 'Subconta/Auxiliar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbeNomeContaC: TwwDBEdit
            Left = 128
            Top = 32
            Width = 193
            Height = 21
            DataField = 'PLANOME'
            DataSource = dsLancamentos2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeContaC: TwwDBEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            DataField = 'PLACONTA'
            DataSource = dsLancamentos2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeCCusC: TwwDBEdit
            Left = 128
            Top = 72
            Width = 193
            Height = 21
            DataField = 'NOME'
            DataSource = dsLancamentos2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeCCusC: TwwDBEdit
            Left = 16
            Top = 72
            Width = 113
            Height = 21
            DataField = 'CODCENTROCUSTO'
            DataSource = dsLancamentos2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeNomeAuxC: TwwDBEdit
            Left = 128
            Top = 112
            Width = 193
            Height = 21
            DataField = 'NOMESUBCONTA'
            DataSource = dsLancamentos2
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbrAuxC: TDBRealEdit
            Left = 16
            Top = 112
            Width = 113
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Lines.Strings = (
              '0')
            ParentFont = False
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'CODSUBCONTA'
            DataSource = dsLancamentos2
          end
        end
        object Panel1: TPanel
          Left = 16
          Top = 215
          Width = 337
          Height = 130
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 2
          object Memo1: TMemo
            Left = 16
            Top = 14
            Width = 305
            Height = 101
            TabOrder = 0
          end
          object dbeHist3: TwwDBEdit
            Left = 20
            Top = 54
            Width = 297
            Height = 19
            BorderStyle = bsNone
            DataField = 'LACHIST3'
            DataSource = dsLancamentos3
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeHist1: TwwDBEdit
            Left = 20
            Top = 18
            Width = 297
            Height = 19
            BorderStyle = bsNone
            DataField = 'LACHIST1'
            DataSource = dsLancamentos3
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeHist2: TwwDBEdit
            Left = 20
            Top = 36
            Width = 297
            Height = 19
            BorderStyle = bsNone
            DataField = 'LACHIST2'
            DataSource = dsLancamentos3
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeHist4: TwwDBEdit
            Left = 20
            Top = 72
            Width = 297
            Height = 19
            BorderStyle = bsNone
            DataField = 'LACHIST4'
            DataSource = dsLancamentos3
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeHist5: TwwDBEdit
            Left = 20
            Top = 90
            Width = 297
            Height = 19
            BorderStyle = bsNone
            DataField = 'LACHIST5'
            DataSource = dsLancamentos3
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object Panel2: TPanel
          Left = 351
          Top = 215
          Width = 337
          Height = 130
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 3
          object Label7: TLabel
            Left = 16
            Top = 16
            Width = 100
            Height = 13
            Caption = 'Atividade/Projeto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 200
            Top = 64
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblDocumento: TLabel
            Left = 16
            Top = 64
            Width = 65
            Height = 13
            Caption = 'Documento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbeNomeUnid: TwwDBEdit
            Left = 128
            Top = 32
            Width = 193
            Height = 21
            DataField = 'NOME'
            DataSource = dsLancamentos3
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbeUnid: TwwDBEdit
            Left = 16
            Top = 32
            Width = 113
            Height = 21
            DataField = 'UNECODIGO'
            DataSource = dsLancamentos3
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbrValor: TDBRealEdit
            Left = 200
            Top = 80
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '')
            ParentFont = False
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALOR'
            DataSource = dsLancamentos3
          end
          object dbeDocumento: TwwDBEdit
            Left = 16
            Top = 80
            Width = 169
            Height = 21
            DataField = 'LACNUMDOC'
            DataSource = dsLancamentos3
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object Panel3: TPanel
          Left = 8
          Top = 8
          Width = 689
          Height = 65
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 4
          object imgParDob: TImage
            Left = 608
            Top = 8
            Width = 67
            Height = 48
            AutoSize = True
            Picture.Data = {
              07544269746D617036070000424D360700000000000076000000280000004300
              0000300000000100040000000000C00600000000000000000000100000001000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888888888888888888888888888888888888888888888888888888888
              8888888000008888888888888888888888888888888888888888888888888888
              8888888888888880000088888888888888888888880000000000000000000000
              000888888888888888888880000088888888888888888888880F777777777777
              77777777770888888888888888888880000088888888888888888888880F8888
              8888888888888888870888888888888888888880000088888888888888888888
              8880F88888888888888888887088888888888888888888800000888888888888
              888888888888000000000F870000000008888888888888888888888000008888
              88888888888888888888888888880F8808888888888888888888888888888880
              0000888888888888888888888888888888880F88088888888888888888888888
              888888800000888888888888888888888888888888880F880888888888888888
              88888888888888800000888888888888888888888888888888880F8808888888
              8888888888888888888888800000888888888888888888888888888888880F88
              0888888888888888888888888888888000008888888888888888888888888888
              8888888888888888888888888888888888888880000088888808880808080880
              8808008808088880088800880008080808080088080888800000888888008800
              0800888088080808000888808080880808080088000808080008888000008888
              8808080808080880880808080808888080808808008808080808080808088880
              0000888888008880880088000808008880888880088800880088008880880088
              8088888000008888888888888888888888888888888888888888888888888888
              88888888888888800000888888888888888888888888888888880F8808888888
              8888888888888888888888800000888880000000000000000088888888880F88
              08888888888000000000000000008880000088880FF888888888888888088888
              88880F880888888888077777777777777777088000008880FFFFFFFFFFFFFFFF
              FFF0888888880F88088888888088888888888888888770800000888000000000
              000000000000888888880F880888888880000000000000000000008000008888
              87888888333888888788888888880F8808888888888788888833388888878880
              0000888888888883838388888888888888880F88088888888888888883838388
              888888800000888888788888838388887888888888880F880888888888887888
              88838388887888800000888888888888333888888888888888880F8808888888
              8888888888333888888888800000888888878883838888878888888888880F88
              0888888888888788838388888788888000008888888888838383888888888888
              88880F8808888888888888888383838888888880000088888888788833388878
              8888888888880F88088888888888887888333888788888800000888888888888
              838888888888888888880F880888888888888888888388888888888000008888
              88888788888887888888888888880F8808888888888888878888888788888880
              0000888888888888888888888888888888880000088888888888888888888888
              8888888000008888888888788888788888888888888808770888888888888888
              7888887888888880000088888888800000000000000000000000888870000000
              0000000000000000888888800000888888880F88888888888888888888888808
              877777777777777777777777088888800000888888880FFFFFFFFFFFFFFFFFFF
              FFFF880888888888888888888888888708888880000088888888800000000000
              000000000000F888800000000000000000000000888888800000888888888888
              888888888888888888880FF80888888888888888888888888888888000008888
              8888888888888888888888888888000008888888888888888888888888888880
              0000888888888888888888888888888888880F88088888888888888888888888
              888888800000888888888888888888888888888888880F880888888888888888
              88888888888888800000888888888888888888888888888888880F8808888888
              8888888888888888888888800000888888888888888888888888888888880F88
              0888888888888888888888888888888000008888888888888888888888888888
              88880F8808888888888888888888888888888880000088888888888888888888
              8888888888880F88088888888888888888888888888888800000888888888888
              8888888888888888888880008888888888888888888888888888888000008888
              8888888888888888888888888888888888888888888888888888888888888880
              0000}
            Visible = False
          end
          object imgCredito: TImage
            Left = 608
            Top = 8
            Width = 67
            Height = 48
            AutoSize = True
            Picture.Data = {
              07544269746D617036070000424D360700000000000076000000280000004300
              0000300000000100040000000000C00600000000000000000000100000001000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888888888888888888888888888888888888888888888888888888888
              8888888000008888888888888888888888888888888888888888888888888888
              8888888888888880000088888888888888888888880000000000000000000000
              000888888888888888888880000088888888888888888888880F777777777777
              77777777770888888888888888888880000088888888888888888888880F8888
              8888888888888888870888888888888888888880000088888888888888888888
              8880F88888888888888888887088888888888888888888800000888888888888
              888888888888000000000F870000000008888888888888888888888000008888
              88888888888888888888888888880F8808888888888888888888888888888880
              0000888888888888888888888888888888880F88088888888888888888888888
              888888800000884484848444844884884884488888880F880888888888888888
              888888888888888000008488844884C8848484884848848888880F8808888888
              8888888888888888888888800000848884848488848484884848848888880F88
              0888888888888888888888888888888000008844844884448448848444844888
              88880F8808888888888888888888888888888880000088888888888888888888
              8888888888880F88088888888888888888888888888888800000888888888888
              888888888888888888880F880888888888888888888888888888888000008888
              80000000000000000088888888880F8808888888888888888888888888888880
              000088880FF88888888888888808888888880F88088888888888888888888888
              8888888000008880FFFFFFFFFFFFFFFFFFF0888888880F880888888888888888
              88888888888888800000888000000000000000000000888888880F8808888888
              8888888888888888888888800000888887888888444888888788888888880F88
              0888888881188111811181881881188000008888888888848484888888888888
              88880F8808888888818181988181818818188180000088888878888884848888
              7888888888880F88088888888181818881188188181881800000888888888888
              444888888888888888880F880888888881188111811881811181188000008888
              88878884848888878888888888880F8808888888888888888888888888888880
              0000888888888884848488888888888888880F88088888888888888888888888
              888888800000888888887888444888788888888888880F880888888888800000
              00000000000088800000888888888888848888888888888888880F8808888888
              8807777777777777777708800000888888888788888887888888888888880F88
              0888888880888888888888888887708000008888888888888888888888888888
              88880F8808888888800000000000000000000080000088888888887800007888
              8888888888880F88088888888887888888888888888788800000888888888880
              F88800008888888888880F880888888888888888888888888888888000008888
              88888880FFFF88880000888888880F8808888888888878888888888888788880
              00008888888888880000FFFF8888000088880000088888888888888888888888
              88888880000088888888888888880000FFFF8888000088770888888888888788
              88888888878888800000888888888888888888880000FFFF8888888870888888
              88888888888888888888888000008888888888888888888888880000FFFF8808
              7000088888888878888888887888888000008888888888888888888888888888
              0000F80887777000088888888888888888888880000088888888888888888888
              888888888880F888888887777000088788888887888888800000888888888888
              888888888888888888880FF88000088887777000088888888888888000008888
              8888888888888888888888888888000008888000088887777000087888888880
              0000888888888888888888888888888888880F88088888888000088887777088
              888888800000888888888888888888888888888888880F880888888888888000
              08887088888888800000888888888888888888888888888888880F8808888888
              8888888880000888888888800000888888888888888888888888888888880F88
              0888888888888888888888888888888000008888888888888888888888888888
              88880F8808888888888888888888888888888880000088888888888888888888
              8888888888880F88088888888888888888888888888888800000888888888888
              8888888888888888888880008888888888888888888888888888888000008888
              8888888888888888888888888888888888888888888888888888888888888880
              0000}
            Visible = False
          end
          object imgDebito: TImage
            Left = 608
            Top = 8
            Width = 67
            Height = 48
            AutoSize = True
            Picture.Data = {
              07544269746D617036070000424D360700000000000076000000280000004300
              0000300000000100040000000000C00600000000000000000000100000001000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888888888888888888888888888888888888888888888888888888888
              8888888000008888888888888888888888888888888888888888888888888888
              8888888888888880000088888888888888888888880000000000000000000000
              000888888888888888888880000088888888888888888888880F777777777777
              77777777770888888888888888888880000088888888888888888888880F8888
              8888888888888888870888888888888888888880000088888888888888888888
              8880F88888888888888888887088888888888888888888800000888888888888
              888888888888000000000F870000000008888888888888888888888000008888
              88888888888888888888888888880F8808888888888888888888888888888880
              0000888888888888888888888888888888880F88088888888888888888888888
              888888800000888888888888888888888888888888880F880888888881188111
              81118188188118800000888888888888888888888888888888880F8808888888
              8181819881818188181881800000888888888888888888888888888888880F88
              0888888881818188811881881818818000008888888888888888888888888888
              88880F8808888888811881118118818111811880000088888888888888888888
              8888888888880F88088888888888888888888888888888800000888888888888
              888888888888888888880F880888888888888888888888888888888000008888
              88888888888888888888888888880F8808888888888000000000000000008880
              0000888888888888888888888888888888880F88088888888807777777777777
              777708800000888888888888888888888888888888880F880888888880888888
              88888888888770800000888888888888888888888888888888880F8808888888
              8000000000000000000000800000884484848444844884884884488888880F88
              0888888888878888881118888887888000008488844884C88484848848488488
              88880F8808888888888888888181818888888880000084888484848884848488
              4848848888880F88088888888888788888818188887888800000884484488444
              844884844484488888880F880888888888888888881118888888888000008888
              88888888888888888888888888880F8808888888888887888181888887888880
              0000888888888888888888888888888888880F88088888888888888881818188
              888888800000888880000000000000000088888888880F880888888888888878
              8811188878888880000088880FF88888888888888808888888880F8808888888
              88888888888188888888888000008880FFFFFFFFFFFFFFFFFFF0888888880F88
              0888888888888887888888878888888000008880000000000000000000008888
              88880F8808888888888888888888888888888880000088888788888888888888
              8788888888880F88088888888888888870000878888888800000888888888888
              888888888888888888880F880888888888888000077770888888888000008888
              88788888888888887888888888880F8808888888800007777888708888888880
              0000888888888888888888888888888888880000088880000777788880000888
              8888888000008888888788888888888788888888888808877000077778888000
              0888888888888880000088888888888888888888888888888880888887777888
              8000088888888888888888800000888888887888888888788888888800008808
              8888800008888888888888888888888000008888888888888888888888880000
              8888880880000888888888888888888888888880000088888888878888888788
              00008888FFFF8888808888888888888888888888888888800000888888888888
              888800008888FFFF0000FFF80888888888888888888888888888888000008888
              8888887800008888FFFF00008888000008888888888888888888888888888880
              0000888888888880F888FFFF0000888888880F88088888888888888888888888
              888888800000888888888880FFFF00008888888888880F880888888888888888
              88888888888888800000888888888888000088888888888888880F8808888888
              8888888888888888888888800000888888888888888888888888888888880F88
              0888888888888888888888888888888000008888888888888888888888888888
              88880F8808888888888888888888888888888880000088888888888888888888
              8888888888880F88088888888888888888888888888888800000888888888888
              8888888888888888888880008888888888888888888888888888888000008888
              8888888888888888888888888888888888888888888888888888888888888880
              0000}
            Visible = False
          end
          object imgIgual: TImage
            Left = 608
            Top = 8
            Width = 67
            Height = 48
            AutoSize = True
            Picture.Data = {
              07544269746D617036070000424D360700000000000076000000280000004300
              0000300000000100040000000000C00600000000000000000000100000001000
              0000000000000000800000800000008080008000000080008000808000008080
              8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF00888888888888888888888888888888888888888888888888888888888888
              8888888000008888888888888888888888888888888888888888888888888888
              8888888888888880000088888888888888888888880000000000000000000000
              000888888888888888888880000088888888888888888888880F777777777777
              77777777770888888888888888888880000088888888888888888888880F8888
              8888888888888888870888888888888888888880000088888888888888888888
              8880F88888888888888888887088888888888888888888800000888888888888
              888888888888000000000F870000000008888888888888888888888000008888
              88888888888888888888888888880F8808888888888888888888888888888880
              0000888888888888888888888888888888880F88088888888888888888888888
              888888800000888888888888888888888888888888880F880888888888888888
              88888888888888800000888888888888888888888888888888880F8808888888
              8888888888888888888888800000888888888888888888888888888888880F88
              0888888888888888888888888888888000008888888888888888888888888888
              88880F8808888888888888888888888888888880000088448484844484488488
              4884488888880F880888888881188111811181881881188000008488844884C8
              848484884848848888880F880888888881818198818181881818818000008488
              84848488848484884848848888880F8808888888818181888118818818188180
              0000884484488444844884844484488888880F88088888888118811181188181
              118118800000888888888888888888888888888888880F880888888888888888
              88888888888888800000888888888888888888888888888888880F8808888888
              8888888888888888888888800000888880000000000000000088888888880F88
              08888888888000000000000000008880000088880FF888888888888888088888
              88880F880888888888077777777777777777088000008880FFFFFFFFFFFFFFFF
              FFF0888888880F88088888888088888888888888888770800000888000000000
              000000000000888888880F880888888880000000000000000000008000008888
              87888888444888888788888888880F8808888888888788888811188888878880
              0000888888888884848488888888888888880F88088888888888888881818188
              888888800000888888788888848488887888888888880F880888888888887888
              88818188887888800000888888888888444888888888888888880F8808888888
              8888888888111888888888800000888888878884848888878888888888880F88
              0888888888888788818188888788888000008888888888848484888888888888
              88880F8808888888888888888181818888888880000088888888788844488878
              8888888888880F88088888888888887888111888788888800000888888888888
              848888888888888888880F880888888888888888888188888888888000008888
              88888788888887888888888888880F8808888888888888878888888788888880
              0000888888888888888888888888888888880000088888888888888888888888
              8888888000008888888888788888788888888888888808770888888888888888
              7888887888888880000088888888800000000000000000000000888870000000
              0000000000000000888888800000888888880F88888888888888888888888808
              877777777777777777777777088888800000888888880FFFFFFFFFFFFFFFFFFF
              FFFF880888888888888888888888888708888880000088888888800000000000
              000000000000F888800000000000000000000000888888800000888888888888
              888888888888888888880FF80888888888888888888888888888888000008888
              8888888888888888888888888888000008888888888888888888888888888880
              0000888888888888888888888888888888880F88088888888888888888888888
              888888800000888888888888888888888888888888880F880888888888888888
              88888888888888800000888888888888888888888888888888880F8808888888
              8888888888888888888888800000888888888888888888888888888888880F88
              0888888888888888888888888888888000008888888888888888888888888888
              88880F8808888888888888888888888888888880000088888888888888888888
              8888888888880F88088888888888888888888888888888800000888888888888
              8888888888888888888880008888888888888888888888888888888000008888
              8888888888888888888888888888888888888888888888888888888888888880
              0000}
          end
          object Label17: TLabel
            Left = 8
            Top = 16
            Width = 69
            Height = 13
            Caption = 'Nº do Lanç.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 296
            Top = 16
            Width = 103
            Height = 13
            Caption = 'Módulo de Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label19: TLabel
            Left = 184
            Top = 16
            Width = 95
            Height = 13
            Caption = 'Data da Planilha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 88
            Top = 16
            Width = 72
            Height = 13
            Caption = 'Cód.Planilha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbeModulo: TwwDBEdit
            Left = 296
            Top = 32
            Width = 297
            Height = 21
            DataField = 'NOMEMODULO'
            DataSource = dsLancamentos3
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbtDataPlanilha: TCMDateTimePicker
            Left = 184
            Top = 32
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'PLNDATDIA'
            DataSource = dsLancamentos3
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
          end
          object dbrLanc: TDBRealEdit
            Left = 8
            Top = 32
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '0')
            ParentFont = False
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'LACNUMLAN'
            DataSource = dsLancamentos3
          end
          object dbrPlanilha: TDBRealEdit
            Left = 88
            Top = 32
            Width = 81
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'PLNPLANIL'
            DataSource = dsLancamentos3
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Valores'
        object GroupBox3: TGroupBox
          Left = 16
          Top = 8
          Width = 337
          Height = 273
          Caption = 'Débito'
          TabOrder = 0
          object lbConvOfDeb: TLabel
            Left = 16
            Top = 24
            Width = 101
            Height = 13
            Caption = 'Conversão Oficial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbConvG1Deb: TLabel
            Left = 16
            Top = 72
            Width = 130
            Height = 13
            Caption = 'Conversão Gerencial 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label24: TLabel
            Left = 16
            Top = 216
            Width = 126
            Height = 13
            Caption = 'Valor Moeda Histórica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbValG1Deb: TLabel
            Left = 192
            Top = 72
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbValOfDeb: TLabel
            Left = 192
            Top = 24
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbConvG2Deb: TLabel
            Left = 16
            Top = 120
            Width = 130
            Height = 13
            Caption = 'Conversão Gerencial 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbConvG3Deb: TLabel
            Left = 16
            Top = 168
            Width = 130
            Height = 13
            Caption = 'Conversão Gerencial 3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbValG3Deb: TLabel
            Left = 192
            Top = 168
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbValG2Deb: TLabel
            Left = 192
            Top = 120
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbcmbConvOfD: TwwDBComboBox
            Left = 16
            Top = 40
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVOFICIAL'
            DataSource = dsLancamentos1
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbcmbConvG1D: TwwDBComboBox
            Left = 16
            Top = 88
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVGER'
            DataSource = dsLancamentos1
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbcmbConvG2D: TwwDBComboBox
            Left = 16
            Top = 136
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVGEREN1'
            DataSource = dsLancamentos1
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbcmbConvG3D: TwwDBComboBox
            Left = 16
            Top = 184
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVGEREN2'
            DataSource = dsLancamentos1
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object dbrOfD: TDBRealEdit
            Left = 192
            Top = 40
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALOFICIAL'
            DataSource = dsLancamentos1
          end
          object dbrG1D: TDBRealEdit
            Left = 192
            Top = 88
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALGERENCIAL'
            DataSource = dsLancamentos1
          end
          object dbrG2D: TDBRealEdit
            Left = 192
            Top = 136
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALGEREN1'
            DataSource = dsLancamentos1
          end
          object dbrG3D: TDBRealEdit
            Left = 192
            Top = 184
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALGEREN2'
            DataSource = dsLancamentos1
          end
          object dbrValHistD: TDBRealEdit
            Left = 16
            Top = 232
            Width = 161
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALHIST'
            DataSource = dsLancamentos1
          end
        end
        object GroupBox4: TGroupBox
          Left = 351
          Top = 8
          Width = 337
          Height = 273
          Caption = 'Crédito'
          TabOrder = 1
          object Label10: TLabel
            Left = 16
            Top = 216
            Width = 126
            Height = 13
            Caption = 'Valor Moeda Histórica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 192
            Top = 72
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 192
            Top = 24
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 192
            Top = 168
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 192
            Top = 120
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 16
            Top = 168
            Width = 130
            Height = 13
            Caption = 'Conversão Gerencial 3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 16
            Top = 120
            Width = 130
            Height = 13
            Caption = 'Conversão Gerencial 2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 16
            Top = 72
            Width = 130
            Height = 13
            Caption = 'Conversão Gerencial 1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 16
            Top = 24
            Width = 101
            Height = 13
            Caption = 'Conversão Oficial'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbcmbConvOfC: TwwDBComboBox
            Left = 16
            Top = 40
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVOFICIAL'
            DataSource = dsLancamentos2
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object dbcmbConvG1C: TwwDBComboBox
            Left = 16
            Top = 88
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVGER'
            DataSource = dsLancamentos2
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object dbcmbConvG2C: TwwDBComboBox
            Left = 16
            Top = 136
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVGEREN1'
            DataSource = dsLancamentos2
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object dbcmbConvG3C: TwwDBComboBox
            Left = 16
            Top = 184
            Width = 163
            Height = 21
            ShowButton = True
            Style = csDropDown
            MapList = True
            AllowClearKey = False
            DataField = 'LACTIPCONVGEREN2'
            DataSource = dsLancamentos2
            DropDownCount = 8
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 0
            Items.Strings = (
              'Não Converte'#9'N'
              'Histórico Médio'#9'H'
              'Diário'#9'D'
              'Moeda Corrente do Último Dia'#9'C'
              'Manual'#9'M')
            ParentFont = False
            Sorted = False
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object dbrOfC: TDBRealEdit
            Left = 192
            Top = 40
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALOFICIAL'
            DataSource = dsLancamentos2
          end
          object dbrG1C: TDBRealEdit
            Left = 192
            Top = 88
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 5
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALGERENCIAL'
            DataSource = dsLancamentos2
          end
          object dbrG2C: TDBRealEdit
            Left = 192
            Top = 136
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 6
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALGEREN1'
            DataSource = dsLancamentos2
          end
          object dbrG3C: TDBRealEdit
            Left = 192
            Top = 184
            Width = 129
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 7
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALGEREN2'
            DataSource = dsLancamentos2
          end
          object dbrValHistC: TDBRealEdit
            Left = 16
            Top = 232
            Width = 161
            Height = 21
            Alignment = taRightJustify
            Enabled = False
            Lines.Strings = (
              '      0,00')
            TabOrder = 8
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'LACVALHIST'
            DataSource = dsLancamentos2
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 723
    inherited tb97Fundo: TToolbar97
      Left = 469
      DockPos = 471
      inherited sep1: TToolbarSep97
        Left = 167
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 81
        Top = 0
        Blank = True
        SizeHorz = 5
      end
      inherited bbtnSair: TBitBtn
        Left = 86
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 169
      end
      object btnBusca: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Cancel = True
        Caption = '&Procurar'
        TabOrder = 2
        OnClick = btnBuscaClick
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
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANILHA.PLNPLANIL'
      'PLANILHA.PLNDATDIA'
      'LANCAMENTO.LACNUMLAN'
      'LANCAMENTO.LACDEBCRE'
      'LANCAMENTO.LACVALOR'
      'LANCAMENTO.PLACONTA'
      'PLANOCONTA.PLANOME'
      'LANCAMENTO.LACHIST1'
      'LANCAMENTO.LACHIST2'
      'LANCAMENTO.LACHIST3'
      'LANCAMENTO.LACHIST4'
      'LANCAMENTO.LACHIST5'
      'LANCAMENTO.HITCODHIST'
      'LANCAMENTO.LACNUMDOC'
      'MODULO.NOMEMODULO'
      'PLANILHA.PLNDATDIA'
      'LANCAMENTO.LACVALOR')
    TipodeDado.Strings = (
      'N'
      'D'
      'N'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Planilha'
      'Data Inicial'
      'N° Lanç.'
      'D/C'
      'Valor Inicial'
      'N° da Conta'
      'Nome da Conta'
      'Histórico 1'
      'Histórico 2'
      'Histórico 3'
      'Histórico 4'
      'Histórico 5'
      'Cód.Histórico'
      'Num.Documento'
      'Módulo'
      'Data Final'
      'Valor Final')
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
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANILHA'
      'LANCAMENTO'
      'PLANOCONTA'
      'MODULO')
    CamposChave.Strings = (
      'LANCAMENTO.PLNCODIGO'
      'LANCAMENTO.LACNUMLAN')
    Filtro.Strings = (
      'LANCAMENTO.PLNCODIGO = PLANILHA.PLNCODIGO'
      'LANCAMENTO.PLACONTA = PLANOCONTA.PLACONTA'
      'LANCAMENTO.PLANO = PLANOCONTA.PLANO'
      'LANCAMENTO.IDMODULO = MODULO.IDMODULO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '###,###,###,##0.00'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,##0.00')
    Larguras.Strings = (
      '10'
      '10'
      '9'
      '1'
      '15'
      '18'
      '40'
      '40'
      '40'
      '40'
      '40'
      '40'
      '4'
      '15'
      '50'
      '10'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 496
    Top = 24
  end
  object dsLancamentos1: TwwDataSource
    DataSet = cdsLancamentos1
    Left = 304
    Top = 272
  end
  object dsLancamentos2: TwwDataSource
    DataSet = cdsLancamentos2
    Left = 264
    Top = 216
  end
  object dsLancamentos3: TwwDataSource
    DataSet = cdsLancamentos3
    Left = 56
    Top = 248
  end
  object cdsLancamentos3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 57
    Top = 213
  end
  object sqlLancamentos3: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '   L.PLNCODIGO, P.PLNPLANIL, L.LACNUMLAN, L.LACDEBCRE,'
      '   L.LACNUMDOC , U.UNECODIGO,  L.LACHIST1,'
      '   L.LACHIST2, L.LACHIST3, L.LACHIST4, L.LACHIST5,'
      '   L.LACVALOR, P.PLNDATDIA, M.NOMEMODULO, U.NOME'
      'FROM'
      '   LANCAMENTO L , PLANILHA P, MODULO M, UNIDNEGOCIO U'
      'WHERE'
      '   ( L.PLNCODIGO = P.PLNCODIGO ) AND'
      '   ( L.IDMODULO = M.IDMODULO ) AND'
      '   ( L.UNIDNEGOC = U.UNIDNEGOC (+) )  AND'
      '   ( L.IDPESSOA = U.IDPESSOA (+) )  AND'
      '   ( L.PLNCODIGO=:PLNCODIGO AND'
      '     L.LACNUMLAN=:LACNUMLAN )')
    ClientDataSet = cdsLancamentos3
    Left = 57
    Top = 269
  end
  object sqlLancamentos2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   L.IDPESSOA, L.CODSUBCONTA,'
      '   L.CODCENTROCUSTO, L.PLACONTA, L.PLANO,'
      '   L.LACTIPCONVOFICIAL, L.LACVALOFICIAL,'
      '   L.LACTIPCONVGER, L.LACVALGERENCIAL,'
      '   L.LACTIPCONVGEREN1, L.LACVALGEREN1,'
      '   L.LACTIPCONVGEREN2, L.LACVALGEREN2,'
      '   L.LACVALHIST, C.PLANOME, CC.NOME,'
      '   S.NOMESUBCONTA'
      'FROM'
      '   LANCAMENTO L , CENTCUST CC,'
      '   SUBCONTA S, PLANOCONTA C'
      'WHERE'
      '   ( L.PLACONTA = C.PLACONTA ) AND'
      '   ( L.PLANO = C.PLANO ) AND'
      '   ( L.CODSUBCONTA = S.CODSUBCONTA (+) ) AND'
      '   ( L.IDPESSOA = S.IDPESSOA (+) ) AND'
      '   ( L.CODCENTROCUSTO = CC.CODCENTROCUSTO (+) ) AND'
      '   ( L.IDEMPRESA = CC.IDEMPRESA (+) ) AND'
      '   ( L.PLNCODIGO=:PLNCODIGO AND'
      '     L.LACNUMLAN=:LACNUMLAN AND'
      '     L.LACDEBCRE=:LACDEBCRE )')
    ClientDataSet = cdsLancamentos2
    Left = 297
    Top = 213
  end
  object cdsLancamentos2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 233
    Top = 213
  end
  object sqlLancamentos1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   L.IDPESSOA, L.CODSUBCONTA,  '
      '   L.CODCENTROCUSTO, L.PLACONTA, L.PLANO, '
      '   L.LACTIPCONVOFICIAL, L.LACVALOFICIAL, '
      '   L.LACTIPCONVGER, L.LACVALGERENCIAL, '
      '   L.LACTIPCONVGEREN1, L.LACVALGEREN1,'
      '   L.LACTIPCONVGEREN2, L.LACVALGEREN2,'
      '   L.LACVALHIST, C.PLANOME, CC.NOME,'
      '   S.NOMESUBCONTA'
      'FROM'
      '   LANCAMENTO L , CENTCUST CC,'
      '   SUBCONTA S, PLANOCONTA C'
      'WHERE'
      '   ( L.PLACONTA = C.PLACONTA ) AND'
      '   ( L.PLANO = C.PLANO ) AND'
      '   ( L.CODSUBCONTA = S.CODSUBCONTA (+) ) AND'
      '   ( L.IDPESSOA = S.IDPESSOA (+) ) AND'
      '   ( L.CODCENTROCUSTO = CC.CODCENTROCUSTO (+) ) AND'
      '   ( L.IDEMPRESA = CC.IDEMPRESA (+) ) AND'
      '   ( L.PLNCODIGO=:PLNCODIGO AND'
      '     L.LACNUMLAN=:LACNUMLAN AND'
      '     L.LACDEBCRE=:LACDEBCRE ) ')
    ClientDataSet = cdsLancamentos1
    Left = 265
    Top = 268
  end
  object cdsLancamentos1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 217
    Top = 260
  end
end
