inherited frmGeraCalc: TfrmGeraCalc
  Left = 14
  Top = 104
  HelpContext = 210067
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cálculo e Geração da Folha de Pagamento'
  ClientHeight = 412
  ClientWidth = 767
  OnShow = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 111
    Width = 767
    Height = 262
    BevelOuter = bvNone
    TabOrder = 3
    object pnlResult: TPanel
      Left = 4
      Top = 4
      Width = 759
      Height = 254
      Align = alClient
      Caption = 'pnlResult'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object memResult: TMemo
        Left = 1
        Top = 1
        Width = 410
        Height = 252
        Align = alLeft
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 464
        Top = 8
        Width = 119
        Height = 83
        Caption = 'Panel1'
        Color = clBlack
        TabOrder = 1
        object bbtnSalvar: TBitBtn
          Left = 2
          Top = 42
          Width = 116
          Height = 40
          Caption = 'S&alvar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = bbtnSalvarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
            7700333333337777777733333333008088003333333377F73377333333330088
            88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
            000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
            FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
            99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
            99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
            99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
            93337FFFF7737777733300000033333333337777773333333333}
          NumGlyphs = 2
        end
        object bbtnVoltar: TBitBtn
          Left = 2
          Top = 2
          Width = 116
          Height = 40
          Caption = '&Voltar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bbtnVoltarClick
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000E0000000E0000000100
            0400000000007000000000000000000000001000000010000000000000000000
            BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
            DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
            4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
            DD00DDDDDDDDDDDDDD00}
        end
      end
    end
  end
  object pnlOpcoes: TPanel [1]
    Left = 0
    Top = 111
    Width = 767
    Height = 262
    Align = alClient
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object pnlTituControles: TPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object fcLabel1: TfcLabel
        Left = 7
        Top = 3
        Width = 177
        Height = 31
        AutoSize = False
        Caption = 'Opções da Folha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.LineSpacing = 1
        TextOptions.Shadow.Enabled = True
        TextOptions.Shadow.XOffset = 2
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
        Transparent = True
      end
      object bbtnVerResultado: TBitBtn
        Left = 669
        Top = 5
        Width = 90
        Height = 30
        Hint = 'Ir para tela de resultado '
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnVerResultadoClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DD4444DDDDDDDD00DDD444DDDDDDDD00DD4444DDDD44DD00DD44D4DDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDDDD44DD00DD444DDDD444DD00DDD44444444DDD00DDDDD4444DDD
          DD00DDDDDDDDDDDDDD00}
      end
      object gbxDtFerias: TGroupBox
        Left = 258
        Top = 0
        Width = 249
        Height = 37
        Caption = 'Período do Início do Gozo das Férias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        object Label2: TLabel
          Left = 8
          Top = 15
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label3: TLabel
          Left = 128
          Top = 15
          Width = 6
          Height = 13
          Caption = 'a'
        end
        object dtFeriasIni: TCMDateTimePicker
          Left = 27
          Top = 13
          Width = 94
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
        end
        object dtFeriasFim: TCMDateTimePicker
          Left = 143
          Top = 13
          Width = 94
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 1
        end
      end
    end
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 38
      Width = 765
      Height = 223
      ActivePage = tbsEmpresas
      Align = alClient
      TabOrder = 0
      OnChange = pgctrlOpcoesChange
      object tbsRubricas: TTabSheet
        Caption = 'Seleção de Rubricas e Empregados'
        object Label6: TLabel
          Left = 7
          Top = 1
          Width = 42
          Height = 13
          Caption = 'Rubricas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 447
          Top = 1
          Width = 59
          Height = 13
          Caption = 'Empregados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object chklstRubrica: TCheckListBox
          Left = 7
          Top = 15
          Width = 300
          Height = 135
          OnClickCheck = chklstRubricaClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstRubricaDrawItem
        end
        object chklstEmpregado: TCheckListBox
          Left = 447
          Top = 15
          Width = 300
          Height = 135
          OnClickCheck = chklstRubricaClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 1
          OnDrawItem = chklstRubricaDrawItem
        end
        object gbxTipContra: TGroupBox
          Left = 314
          Top = 10
          Width = 125
          Height = 140
          Caption = 'Tipo de Contrato'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          object cbxEfetivos: TCheckBox
            Left = 9
            Top = 16
            Width = 85
            Height = 13
            Caption = 'Efetivos'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbxTemporarios: TCheckBox
            Left = 9
            Top = 51
            Width = 85
            Height = 13
            Caption = 'Temporários'
            TabOrder = 1
          end
          object cbxEstagiarios: TCheckBox
            Left = 9
            Top = 68
            Width = 85
            Height = 13
            Caption = 'Estagiários'
            TabOrder = 2
          end
          object cbxTerceiros: TCheckBox
            Left = 9
            Top = 120
            Width = 85
            Height = 13
            Caption = 'Terceiros'
            TabOrder = 3
          end
          object cbxAutonomos: TCheckBox
            Left = 9
            Top = 85
            Width = 85
            Height = 13
            Caption = 'Autônomos'
            TabOrder = 4
          end
          object cbxProprietarios: TCheckBox
            Left = 9
            Top = 102
            Width = 112
            Height = 13
            Caption = 'Prop/Dir s/ Vinc'
            TabOrder = 5
          end
          object cbxEspeciais: TCheckBox
            Left = 9
            Top = 34
            Width = 109
            Height = 13
            Caption = 'Efetivos Especiais'
            Checked = True
            State = cbChecked
            TabOrder = 6
          end
        end
        object bbtnSelTudo: TBitBtn
          Left = 7
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Seleciona Todas as Rubricas'
          Caption = '   Seleciona Tudo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bbtnSelTudoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnInverte: TBitBtn
          Left = 159
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção das Rubricas'
          Caption = '   Inverte Seleção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bbtnInverteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnSelPessoa: TBitBtn
          Left = 447
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Seleciona Todos os Estabelecimentos'
          Caption = '   Seleciona Todos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bbtnSelPessoaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnInvPessoa: TBitBtn
          Left = 600
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção dos Estabelecimentos'
          Caption = '   Inverte Seleção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = bbtnInvPessoaClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
      object tbsEmpresas: TTabSheet
        Caption = 'Seleção de Empresas, Estabelecimentos e Prévia'
        object Label5: TLabel
          Left = 1
          Top = 1
          Width = 52
          Height = 13
          Caption = 'Empresa(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 456
          Top = 1
          Width = 89
          Height = 13
          Caption = 'Estabelecimento(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object chklstEmpre: TCheckListBox
          Left = 1
          Top = 15
          Width = 300
          Height = 135
          OnClickCheck = chklstEmpreClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstRubricaDrawItem
        end
        object chklstEstab: TCheckListBox
          Left = 455
          Top = 15
          Width = 300
          Height = 135
          OnClickCheck = chklstEstabClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 1
          OnDrawItem = chklstRubricaDrawItem
        end
        object bbtnSelEmpr: TBitBtn
          Left = 1
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Seleciona Todas as Empresas'
          Caption = '   Seleciona Todas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = bbtnSelEmprClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnInvEmpr: TBitBtn
          Left = 153
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção das Empresas'
          Caption = '   Inverte Seleção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = bbtnInvEmprClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object bbtnSelEstab: TBitBtn
          Left = 454
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Seleciona Todos os Estabelecimentos'
          Caption = '   Seleciona Todos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = bbtnSelEstabClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object BitBtn5: TBitBtn
          Left = 607
          Top = 158
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção dos Estabelecimentos'
          Caption = '   Inverte Seleção'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = bbtnInvEstabClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object rgOpcaoPrevia: TRadioGroup
          Left = 307
          Top = 0
          Width = 138
          Height = 190
          Caption = 'Opção da Prévia'
          ItemIndex = 0
          Items.Strings = (
            'Apaga Tudo'
            'Apaga Tipos de Folha'
            'Apaga Pessoas'
            'Apaga Tipos/Pessoas'
            'Deixa Tudo')
          TabOrder = 6
        end
      end
      object tbshRetroativo: TTabSheet
        Caption = 'Cálculo Retroativo'
        object gbxRetroSelec: TGroupBox
          Left = 1
          Top = 42
          Width = 752
          Height = 154
          TabOrder = 2
          Visible = False
          object Label12: TLabel
            Left = 5
            Top = 8
            Width = 101
            Height = 13
            Caption = 'Rubricas da Empresa'
          end
          object Label13: TLabel
            Left = 243
            Top = 8
            Width = 69
            Height = 13
            Caption = 'Rubricas Base'
          end
          object Label14: TLabel
            Left = 408
            Top = 8
            Width = 123
            Height = 13
            Caption = 'Rubricas Complementares'
          end
          object Label15: TLabel
            Left = 573
            Top = 8
            Width = 101
            Height = 13
            Caption = 'Rubricas Resultantes'
          end
          object sbtnAssociarTodosBase: TSpeedButton
            Left = 213
            Top = 58
            Width = 25
            Height = 25
            Hint = 'Associar todas as rubricas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
              66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
              66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
              660878F877887788887887E6F666F666608887F87888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociarTodosBaseClick
          end
          object sbtnAssociarBase: TSpeedButton
            Left = 213
            Top = 28
            Width = 25
            Height = 25
            Hint = 'Associar rubrica selecionada'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociarBaseClick
          end
          object sbtnDesassociarBase: TSpeedButton
            Left = 213
            Top = 88
            Width = 25
            Height = 25
            Hint = 'Desassociar rubrica selecionada'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociarBaseClick
          end
          object sbtnDesassociarTodosBase: TSpeedButton
            Left = 213
            Top = 118
            Width = 25
            Height = 25
            Hint = 'Desassociar todas as rubricas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
              66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
              66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
              660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociarTodosBaseClick
          end
          object sbtnAssociarComplem: TSpeedButton
            Left = 377
            Top = 28
            Width = 25
            Height = 25
            Hint = 'Associar rubrica selecionada'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociarComplemClick
          end
          object sbtnAssociarTodosComplem: TSpeedButton
            Left = 377
            Top = 58
            Width = 25
            Height = 25
            Hint = 'Associar todas as rubricas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
              66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
              66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
              660878F877887788887887E6F666F666608887F87888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociarTodosComplemClick
          end
          object sbtnDesassociarComplem: TSpeedButton
            Left = 377
            Top = 88
            Width = 25
            Height = 25
            Hint = 'Desassociar rubrica selecionada'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociarComplemClick
          end
          object sbtnDesassociarTodosComplem: TSpeedButton
            Left = 377
            Top = 118
            Width = 25
            Height = 25
            Hint = 'Desassociar todas as rubricas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
              66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
              66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
              660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociarTodosComplemClick
          end
          object sbtnAssociarResult: TSpeedButton
            Left = 542
            Top = 28
            Width = 25
            Height = 25
            Hint = 'Associar rubrica selecionada'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
              66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
              66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
              660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociarResultClick
          end
          object sbtnAssociarTodosResult: TSpeedButton
            Left = 542
            Top = 58
            Width = 25
            Height = 25
            Hint = 'Associar todas as rubricas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
              66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
              66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
              660878F877887788887887E6F666F666608887F87888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnAssociarTodosResultClick
          end
          object sbtnDesassociarResult: TSpeedButton
            Left = 542
            Top = 88
            Width = 25
            Height = 25
            Hint = 'Desassociar rubrica selecionada'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88880666666666088888788888F88878F880E6666F6666
              608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
              66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
              66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
              660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
              6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociarResultClick
          end
          object sbtnDesassociarTodosResult: TSpeedButton
            Left = 542
            Top = 118
            Width = 25
            Height = 25
            Hint = 'Desassociar todas as rubricas'
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
              66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
              66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
              660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnDesassociarTodosResultClick
          end
          object dbgrdRubEmpre: TwwDBGrid
            Left = 7
            Top = 21
            Width = 200
            Height = 127
            Selected.Strings = (
              'DESCRICAO'#9'130'#9'DESCRICAO')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            DataSource = dsRubrica
            Options = [dgEditing, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            TitleLines = 1
            TitleButtons = False
            OnKeyPress = dbgrdRubEmpreKeyPress
            IndicatorColor = icBlack
          end
          object lstbxBase: TColorListBox
            Left = 243
            Top = 21
            Width = 127
            Height = 127
            ItemHeight = 13
            TabOrder = 1
            FieldsWidth.Strings = (
              '25'
              '250'
              '70')
            FieldKeyPos = 3
            FieldsVisibleCount = 3
            FieldOffset = 3
            ItemSelectedColor = clTeal
            LinesType = [ltBottom, ltBeetwenCols]
          end
          object lstbxComplem: TColorListBox
            Left = 408
            Top = 21
            Width = 127
            Height = 127
            ItemHeight = 13
            TabOrder = 2
            FieldsWidth.Strings = (
              '25'
              '250'
              '70')
            FieldKeyPos = 3
            FieldsVisibleCount = 3
            FieldOffset = 3
            ItemSelectedColor = clTeal
            LinesType = [ltBottom, ltBeetwenCols]
          end
          object lstbxResult: TColorListBox
            Left = 573
            Top = 21
            Width = 125
            Height = 127
            ItemHeight = 13
            TabOrder = 3
            FieldsWidth.Strings = (
              '25'
              '250'
              '70')
            FieldKeyPos = 4
            FieldsVisibleCount = 3
            FieldOffset = 3
            ItemSelectedColor = clTeal
            LinesType = [ltBottom, ltBeetwenCols]
          end
          object lstbxTipoCalc: TColorListBox
            Left = 705
            Top = 21
            Width = 40
            Height = 127
            ItemHeight = 13
            TabOrder = 4
            LinesType = []
          end
        end
        object rgOpcRetro: TRadioGroup
          Left = 1
          Top = 2
          Width = 127
          Height = 37
          Caption = 'Processa Retroativo?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 0
          OnClick = rgOpcRetroClick
        end
        object gbxRetroOpc: TGroupBox
          Left = 135
          Top = -4
          Width = 618
          Height = 49
          TabOrder = 1
          Visible = False
          object Label16: TLabel
            Left = 6
            Top = 20
            Width = 31
            Height = 13
            Caption = 'Meses'
          end
          object Label17: TLabel
            Left = 210
            Top = 20
            Width = 35
            Height = 13
            Caption = 'Base %'
          end
          object lblTipoCalc: TLabel
            Left = 440
            Top = 8
            Width = 74
            Height = 13
            Caption = 'Tipo de Cálculo'
          end
          object bbtnNenhumaRubCompl: TBitBtn
            Left = 312
            Top = 15
            Width = 89
            Height = 25
            Hint = 'Para Não Indicar Rubrica Complementar'
            Caption = '  Nenhuma'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = bbtnNenhumaRubComplClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888777778888888888F777778FF888888771111177
              88888887788888778F88887111111111088888788888F88878F88791111F1111
              108887F888878F8887F8879111FFF11110888788887778F8878F79111FFFFF11
              11087F888777778F887F7911FFFFFFF111087F8877777778F87F791FFFFFFFFF
              11087F8777777777887F791111FFF11111087F8888777F88887F791111FFF111
              110878F888777F888878879111FFF111108887F888777F8887F8879111FFF111
              1088878F88777888878888799111111108888878FF8888887888888009999900
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            Spacing = 0
          end
          object speQtMeses: TSpinEdit
            Left = 40
            Top = 16
            Width = 45
            Height = 22
            MaxLength = 2
            MaxValue = 99
            MinValue = 1
            TabOrder = 0
            Value = 1
          end
          object bbtnNenhumaBase: TBitBtn
            Left = 111
            Top = 15
            Width = 89
            Height = 25
            Hint = 'Para Não Indicar Rubrica Base'
            Caption = '  Nenhuma'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = bbtnNenhumaBaseClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888777778888888888F777778FF888888771111177
              88888887788888778F88887111111111088888788888F88878F88791111F1111
              108887F888878F8887F8879111FFF11110888788887778F8878F79111FFFFF11
              11087F888777778F887F7911FFFFFFF111087F8877777778F87F791FFFFFFFFF
              11087F8777777777887F791111FFF11111087F8888777F88887F791111FFF111
              110878F888777F888878879111FFF111108887F888777F8887F8879111FFF111
              1088878F88777888878888799111111108888878FF8888887888888009999900
              8888888778FFFF77888888888000008888888888877777888888}
            NumGlyphs = 2
            Spacing = 0
          end
          object rePercRetro: TRealEdit
            Left = 248
            Top = 16
            Width = 50
            Height = 22
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cmbTipoCalc: TComboBox
            Left = 440
            Top = 22
            Width = 124
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 4
            Items.Strings = (
              '1. Dif. Valor'
              '2. Base %'
              '3. Regra')
          end
          object BitBtn1: TBitBtn
            Left = 572
            Top = 21
            Width = 39
            Height = 22
            Caption = '   '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            TabStop = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              333333333333333333333333333333333333333333333333FFF3333333333333
              00333333333333FF77F3333333333300903333333333FF773733333333330099
              0333333333FF77337F3333333300999903333333FF7733337333333700999990
              3333333777333337F3333333099999903333333373F333373333333330999903
              33333333F7F3337F33333333709999033333333F773FF3733333333709009033
              333333F7737737F3333333709073003333333F77377377F33333370907333733
              33333773773337333333309073333333333337F7733333333333370733333333
              3333377733333333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
      end
      object tbshSelecRetro: TTabSheet
        Caption = 'Seleção de Pessoas para o Retroativo'
        ImageIndex = 3
        object rgSelecRetro: TRadioGroup
          Left = 1
          Top = 1
          Width = 80
          Height = 56
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Todos'
            'Seleciona')
          TabOrder = 0
          OnClick = rgSelecRetroClick
        end
        object gbxFiltroCCusto: TGroupBox
          Left = 437
          Top = 1
          Width = 308
          Height = 103
          Caption = 'Centros de Custo'
          TabOrder = 2
          Visible = False
          object chklstCCusto: TCheckListBox
            Left = 8
            Top = 13
            Width = 292
            Height = 58
            OnClickCheck = chklstCCustoClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubricaDrawItem
            OnExit = chklstCCustoExit
          end
          object bbtnSelTodosCCusto: TBitBtn
            Left = 8
            Top = 73
            Width = 141
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosCCustoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnInverteSelCCusto: TBitBtn
            Left = 159
            Top = 73
            Width = 141
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelCCustoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
        object gbxFunc: TGroupBox
          Left = 100
          Top = 1
          Width = 318
          Height = 190
          Caption = 'Empregados'
          TabOrder = 1
          Visible = False
          object Paginas: TPageControl
            Left = 6
            Top = 15
            Width = 305
            Height = 170
            ActivePage = tbshListaFunc
            HotTrack = True
            TabOrder = 0
            object tbshListaFunc: TTabSheet
              Caption = '&Lista'
              object chklstFunc: TCheckListBox
                Left = 2
                Top = 2
                Width = 292
                Height = 111
                OnClickCheck = chklstRubricaClickCheck
                ItemHeight = 13
                Style = lbOwnerDrawFixed
                TabOrder = 0
                OnDrawItem = chklstRubricaDrawItem
              end
              object bbtnSelTodosFunc: TBitBtn
                Left = 2
                Top = 117
                Width = 141
                Height = 25
                Caption = '   Seleciona Todos'
                TabOrder = 1
                TabStop = False
                OnClick = bbtnSelTodosFuncClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333333333333333333333333333333333333333300000
                  0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                  FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                  9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                  00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                  993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                  3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                  3333388888887733333333333333333333333333333333333333}
                NumGlyphs = 2
                Spacing = 0
              end
              object bbtnInverteSelFunc: TBitBtn
                Left = 153
                Top = 117
                Width = 141
                Height = 25
                Caption = '   Inverte Seleção'
                TabOrder = 2
                TabStop = False
                OnClick = bbtnInverteSelFuncClick
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  3333333333333333333333333333000000003333333388888888333333330FFF
                  FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                  FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                  FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                  333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                  00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                  033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                  3333888888877333333333333333333333333333333333333333}
                NumGlyphs = 2
                Spacing = 0
              end
            end
            object tbshFiltroFunc: TTabSheet
              Caption = '&Tipos / Situações'
              object gbxTipContr: TGroupBox
                Left = 4
                Top = 7
                Width = 288
                Height = 75
                Caption = 'Tipo de Contrato'
                TabOrder = 0
                OnEnter = gbxTipContrEnter
                OnExit = gbxTipContrExit
                object cbxEfetivos2: TCheckBox
                  Left = 18
                  Top = 17
                  Width = 64
                  Height = 13
                  Caption = 'Efetivos'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cbxEspeciais2: TCheckBox
                  Left = 18
                  Top = 35
                  Width = 90
                  Height = 13
                  Caption = 'Efet. Especiais'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
                object cbxTemporarios2: TCheckBox
                  Left = 18
                  Top = 52
                  Width = 85
                  Height = 13
                  Caption = 'Temporários'
                  Checked = True
                  State = cbChecked
                  TabOrder = 2
                end
                object cbxEstagiarios2: TCheckBox
                  Left = 115
                  Top = 17
                  Width = 74
                  Height = 13
                  Caption = 'Estagiários'
                  Checked = True
                  State = cbChecked
                  TabOrder = 3
                end
                object cbxAutonomos2: TCheckBox
                  Left = 115
                  Top = 35
                  Width = 75
                  Height = 13
                  Caption = 'Autônomos'
                  Checked = True
                  State = cbChecked
                  TabOrder = 4
                end
                object cbxProprietarios2: TCheckBox
                  Left = 115
                  Top = 52
                  Width = 80
                  Height = 13
                  Caption = 'Proprietários'
                  Checked = True
                  State = cbChecked
                  TabOrder = 5
                end
                object cbxTerceiros2: TCheckBox
                  Left = 202
                  Top = 17
                  Width = 66
                  Height = 13
                  Caption = 'Terceiros'
                  Checked = True
                  State = cbChecked
                  TabOrder = 6
                end
              end
              object gbxSituacao: TGroupBox
                Left = 5
                Top = 89
                Width = 288
                Height = 42
                Caption = 'Situação Funcional'
                TabOrder = 1
                OnEnter = gbxSituacaoEnter
                OnExit = gbxSituacaoExit
                object cbxAtivos: TCheckBox
                  Left = 53
                  Top = 17
                  Width = 52
                  Height = 13
                  Caption = 'Ativos'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cbxAfastados: TCheckBox
                  Left = 167
                  Top = 17
                  Width = 69
                  Height = 13
                  Caption = 'Afastados'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
              end
            end
          end
        end
        object gbxFiltroSindicato: TGroupBox
          Left = 437
          Top = 106
          Width = 308
          Height = 85
          Caption = 'Sindicatos'
          TabOrder = 3
          Visible = False
          object chklstSindicato: TCheckListBox
            Left = 8
            Top = 13
            Width = 292
            Height = 40
            OnClickCheck = chklstSindicatoClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubricaDrawItem
            OnExit = chklstSindicatoExit
          end
          object bbtnSelTodosSindicato: TBitBtn
            Left = 8
            Top = 55
            Width = 141
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosSindicatoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnInverteSelSindicato: TBitBtn
            Left = 159
            Top = 55
            Width = 141
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelSindicatoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 767
    inherited tb97Fundo: TToolbar97
      Left = 597
      DockPos = 605
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 430
      DockPos = 438
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object pnlInformacoes: TPanel [3]
    Left = 0
    Top = 0
    Width = 767
    Height = 111
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object bbtnGeracao: TBitBtn
      Left = 670
      Top = 59
      Width = 90
      Height = 46
      Caption = '&Geração'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bbtnGeracaoClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
      Layout = blGlyphTop
      Spacing = 0
    end
    object GroupBox3: TGroupBox
      Left = 306
      Top = 3
      Width = 355
      Height = 102
      Caption = 'Tipo (Motivo) de Folha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dblcMotivo: TwwDBLookupCombo
        Left = 13
        Top = 71
        Width = 330
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        LookupTable = qryMotivo
        LookupField = 'IDMOTIVO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
      object rgTipoFolha: TRadioGroup
        Left = 13
        Top = 16
        Width = 330
        Height = 45
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'Normal'
          'Férias'
          '13ª Salário'
          'Especial')
        TabOrder = 1
        OnClick = rgTipoFolhaClick
      end
    end
    object PageControl1: TPageControl
      Left = 6
      Top = 3
      Width = 295
      Height = 102
      ActivePage = tbshDatas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object tbshDatas: TTabSheet
        Caption = 'Datas'
        object grpMesRef: TGroupBox
          Left = 0
          Top = 7
          Width = 171
          Height = 51
          Caption = ' Mês e Ano de Referência '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cmbMes: TComboBox
            Left = 7
            Top = 22
            Width = 100
            Height = 21
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object spnedAno: TSpinEdit
            Left = 114
            Top = 22
            Width = 50
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 1
            Value = 0
          end
        end
        object gbxDtPagto: TGroupBox
          Left = 176
          Top = 7
          Width = 110
          Height = 51
          Caption = ' Pagamento em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object dtProcessamento: TCMDateTimePicker
            Left = 8
            Top = 22
            Width = 94
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ShowButton = True
            TabOrder = 0
          end
        end
      end
      object tbshCAP: TTabSheet
        Caption = 'Contas a Pagar'
        object GroupBox4: TGroupBox
          Left = 2
          Top = 15
          Width = 282
          Height = 43
          Caption = 'Tipo de Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dblcTipoDoc: TwwDBLookupCombo
            Left = 7
            Top = 16
            Width = 268
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            LookupTable = qryTipoDoc
            LookupField = 'CODTIPDOC'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnCloseUp = dblcTipoDocCloseUp
          end
        end
      end
    end
    object rgProcesso: TRadioGroup
      Left = 670
      Top = 3
      Width = 90
      Height = 52
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Prévia'
        'Final')
      ParentFont = False
      TabOrder = 3
      OnClick = rgProcessoClick
    end
  end
  object pnlCAP: TPanel [4]
    Left = -80
    Top = 384
    Width = 238
    Height = 285
    BevelInner = bvRaised
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    object Bevel1: TBevel
      Left = 3
      Top = 3
      Width = 232
      Height = 240
      Style = bsRaised
    end
    object Label11: TLabel
      Left = 23
      Top = 42
      Width = 80
      Height = 13
      Caption = 'Data Pagamento'
    end
    object Bevel3: TBevel
      Left = 3
      Top = 239
      Width = 232
      Height = 43
      Style = bsRaised
    end
    object pnlPortForma: TPanel
      Left = 8
      Top = 63
      Width = 221
      Height = 44
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object Label9: TLabel
        Left = 4
        Top = 1
        Width = 72
        Height = 13
        Caption = 'Portador Forma'
      end
      object dblkPortadorForma: TwwDBLookupCombo
        Left = 2
        Top = 17
        Width = 218
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        LookupTable = qryPortadorForma
        LookupField = 'CODPORTFORMA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object pnlNomeArq: TPanel
      Left = 8
      Top = 61
      Width = 221
      Height = 44
      BevelOuter = bvNone
      Locked = True
      ParentColor = True
      TabOrder = 3
      object Label7: TLabel
        Left = -1
        Top = -16
        Width = 30
        Height = 13
        Caption = 'Pasta '
      end
      object Label8: TLabel
        Left = 4
        Top = 1
        Width = 30
        Height = 13
        Caption = 'Pasta '
      end
      object bvLblDiretorio: TBevel
        Left = 2
        Top = 17
        Width = 188
        Height = 21
      end
      object lblDiretorio: TLabel
        Left = 6
        Top = 21
        Width = 179
        Height = 13
        AutoSize = False
        Caption = 'C:\'
      end
      object btnEscolheDir: TBitBtn
        Left = 192
        Top = 17
        Width = 27
        Height = 21
        TabOrder = 0
        OnClick = btnEscolheDirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
          333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
          300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
          333337F373F773333333303330033333333337F3377333333333303333333333
          333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
          333337777F337F33333330330BB00333333337F373F773333333303330033333
          333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
          333377777F77377733330BBB0333333333337F337F33333333330BB003333333
          333373F773333333333330033333333333333773333333333333}
        NumGlyphs = 2
      end
    end
    object chkPagEletronico: TCheckBox
      Left = 31
      Top = 8
      Width = 177
      Height = 17
      Caption = 'Pagamento Eletrônico (Especial)'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = chkPagEletronicoClick
    end
    object dtPagamento: TCMDateTimePicker
      Left = 111
      Top = 38
      Width = 100
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowButton = True
      TabOrder = 1
    end
    object pnlIndiv: TPanel
      Left = 8
      Top = 104
      Width = 221
      Height = 49
      BevelOuter = bvNone
      Locked = True
      ParentColor = True
      TabOrder = 4
      object lblIndiv1: TLabel
        Left = 47
        Top = 23
        Width = 130
        Height = 13
        Caption = 'Criar Documento Individual '
        Enabled = False
      end
      object lblIndiv2: TLabel
        Left = 47
        Top = 36
        Width = 101
        Height = 13
        Caption = '     para cada Pessoa'
        Enabled = False
      end
      object chkCriaIndividual: TCheckBox
        Left = 21
        Top = 27
        Width = 15
        Height = 17
        Caption = 'chkCriaIndividual'
        Enabled = False
        TabOrder = 0
      end
      object chkRateioCC: TCheckBox
        Left = 21
        Top = 6
        Width = 172
        Height = 17
        Caption = '   Ratear por Centro de Custo'
        TabOrder = 1
      end
    end
    object btnOKCap: TBitBtn
      Left = 14
      Top = 246
      Width = 99
      Height = 33
      Caption = '&OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnOKCapClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
    object btnCancelarCAP: TBitBtn
      Left = 126
      Top = 246
      Width = 99
      Height = 33
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 6
      OnClick = btnCancelarCAPClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
        88888887788888778F88887991919191088888788888888878F8879919191919
        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
        190878F877787778887887917F919F71908887F88788878887F8879919191919
        1088878F88888888878888799191919108888878FF88888F7888888779999977
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
    object chkTipoDes: TCheckListBox
      Left = 9
      Top = 159
      Width = 220
      Height = 48
      OnClickCheck = chklstRubricaClickCheck
      ItemHeight = 13
      Style = lbOwnerDrawFixed
      TabOrder = 7
      OnDrawItem = chklstRubricaDrawItem
    end
    object bbtnSelTipo: TBitBtn
      Left = 9
      Top = 210
      Width = 107
      Height = 25
      Caption = '   Sel. Todos'
      TabOrder = 8
      TabStop = False
      OnClick = bbtnSelTipoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333300000
        0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
        FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
        9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
        00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
        993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
        3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
        3333388888887733333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
    end
    object bbtnInvTipo: TBitBtn
      Left = 122
      Top = 210
      Width = 107
      Height = 25
      Caption = '   Inv. Seleção'
      TabOrder = 9
      TabStop = False
      OnClick = bbtnInvTipoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333000000003333333388888888333333330FFF
        FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
        FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
        FFF0333833338FFFFFF833333333000000003333333388888888000000003333
        333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
        00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
        033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
        3333888888877333333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
    end
  end
  object pnlDiretorio: TPanel [5]
    Left = 608
    Top = 384
    Width = 230
    Height = 257
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    Visible = False
    OnExit = pnlDiretorioExit
    object Bevel2: TBevel
      Left = 3
      Top = 3
      Width = 224
      Height = 212
      Style = bsRaised
    end
    object fcLabel2: TfcLabel
      Left = 3
      Top = 5
      Width = 224
      Height = 16
      AutoSize = False
      Caption = 'Selecione o Diretório'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.LineSpacing = 1
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Bevel4: TBevel
      Left = 3
      Top = 211
      Width = 224
      Height = 43
      Style = bsRaised
    end
    object DriveComboBox1: TDriveComboBox
      Left = 10
      Top = 23
      Width = 210
      Height = 19
      DirList = DirectoryListBox1
      TabOrder = 0
    end
    object DirectoryListBox1: TDirectoryListBox
      Left = 10
      Top = 47
      Width = 210
      Height = 160
      ItemHeight = 16
      TabOrder = 1
      OnKeyPress = DirectoryListBox1KeyPress
    end
    object btnOkDir: TBitBtn
      Left = 9
      Top = 218
      Width = 103
      Height = 33
      Caption = '&OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnOkDirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888002222200
        88888887788888778F88887222222222088888788888888878F887A228822222
        208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
        22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
        22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
        220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
        2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
    object btnSairDiretorio: TBitBtn
      Left = 118
      Top = 218
      Width = 103
      Height = 33
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 3
      OnClick = btnSairDiretorioClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888009191900
        88888887788888778F88887991919191088888788888888878F8879919191919
        108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
        19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
        19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
        190878F877787778887887917F919F71908887F88788878887F8879919191919
        1088878F88888888878888799191919108888878FF88888F7888888779999977
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  object pnlProgresso: TPanel [6]
    Left = 104
    Top = 384
    Width = 557
    Height = 129
    BevelInner = bvRaised
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    object lblQtdeFunc: TLabel
      Left = 210
      Top = 78
      Width = 97
      Height = 15
      AutoSize = False
      Caption = 'Qtde: 0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMatrNome: TLabel
      Left = 17
      Top = 56
      Width = 523
      Height = 16
      AutoSize = False
      Caption = 
        'Matr: 1234567890123  Nome: 1234567890123456789012345678901234567' +
        '890123456789'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel9: TBevel
      Left = 16
      Top = 99
      Width = 524
      Height = 19
    end
    object gagTotal: TGauge
      Left = 17
      Top = 100
      Width = 522
      Height = 17
      BorderStyle = bsNone
      Color = clBlack
      ForeColor = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Progress = 50
    end
    object fcLabel3: TfcLabel
      Left = 16
      Top = 1
      Width = 524
      Height = 33
      AutoSize = False
      Caption = 'Gerando Folha de Pagamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.LineSpacing = 1
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Bevel11: TBevel
      Left = 9
      Top = 39
      Width = 538
      Height = 6
      Shape = bsTopLine
      Style = bsRaised
    end
    object lblProcesso: TLabel
      Left = 122
      Top = 44
      Width = 423
      Height = 13
      AutoSize = False
      Caption = 'lblProcesso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lblHoraIni: TLabel
      Left = 17
      Top = 78
      Width = 177
      Height = 15
      AutoSize = False
      Caption = 'Hora de Início: hh:mm:ss'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 327
      Top = 78
      Width = 127
      Height = 15
      AutoSize = False
      Caption = 'Tempo Decorrido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTempoDecorr: TLabel
      Left = 460
      Top = 78
      Width = 77
      Height = 15
      AutoSize = False
      Caption = '00:00:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 351
    Top = 35
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHst2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 167
    Top = 77
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar Resultado da Geração'
    Left = 305
    Top = 36
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ index (PESSOA IDXPESSOA) */'
      '  P.IDPESSOA, P.NOME'
      'FROM'
      '  PESSOA P, FILIALPESSOA FP'
      'WHERE'
      '  (P.IDGRUPO = :IDEMPRESA) AND'
      '  (P.IDPESSOA = FP.IDFILIALPESSOA)'
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 30
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryFunc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 30
    Top = 33
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO '
      'from MOTIVO '
      'where GRUPOMOTIVO = '#39'F'#39' '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 150
    Top = 190
  end
  object tblRubSit: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPROVENTO;IDSITFUNC'
    TableName = 'CM.RUBXSIT'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 412
    Top = 2
  end
  object qryRubEsp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updRubEsp
    ValidateWithMask = True
    Left = 205
    Top = 202
  end
  object tblFerias: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;INIPERIODOFERIAS;NUMSEQ'
    TableName = 'CM.FERIAS'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 436
    Top = 71
  end
  object tblAntec13: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;ANO'
    TableName = 'CM.ANTECIP13'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 492
    Top = 67
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  PD.IDPROVENTO, PD.IDREGRA, SUBSTR(RP.DESCRPROVDESC,1,40) AS DE' +
        'SCRICAO'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (PD.IDPROVENTO = RP.IDRUBRICA) AND'
      '  (RP.IDRUBRICA IS NULL OR RP.IDPESSOA = :IDEMPRESA)'
      'ORDER BY'
      '  UPPER(DESCRICAO)'
      ' ')
    ValidateWithMask = True
    Left = 221
    Top = 261
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA,NOMEEMPRESA'
      'FROM'
      '  EMPRESAPROP'
      'WHERE'
      '  (IDPESSOA = :IDEMPRESA)'
      'ORDER BY'
      '  UPPER(NOMEEMPRESA)')
    ValidateWithMask = True
    Left = 30
    Top = 21
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryHst: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 95
    Top = 61
  end
  object qryAuxContab: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 167
    Top = 60
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC,'
      '  DESCRICAO,'
      '  DEBCRE'
      'FROM TIPODOCRECPAG'
      'WHERE  RECPAG = '#39'P'#39
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 94
    Top = 48
  end
  object qryPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select pfr.codportforma,pfr.codportador,pfr.descricao,pfr.codarq' +
        'uivoremessa,'
      '       pfr.controleremessa,pfr.codformapagto,PFR.FLGEMITEAVISO,'
      '       pfr.CODTIPOPAGTO,pfr.NUMEMPRESABANCO,'
      '       pct.IDBANCO,pct.NOCONTACORR'
      'from PORTADORFORMA pfr,PORTADORCONTA pct'
      'where  pct.codportador=pfr.codportador')
    ValidateWithMask = True
    Left = 168
    Top = 47
  end
  object qryBanco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  AGB.IDBANCO, BPF.CODPORTFORMA,'
      
        '  F.NUMCONTASALARIO AS CONTACORRENTE, AGB.NUMAGENCIA, BAN.NUMBAN' +
        'CO'
      'FROM'
      
        '  FUNCIONARIO F, AGENCIABANCARIA AGB, BANCO BAN, BANCOPORTFORMA ' +
        'BPF'
      'WHERE'
      '  (F.IDPESSOA         = :IDRESPONSAVEL)  AND'
      '  (F.IDAGENCIASALARIO = AGB.IDPESSOA(+)) AND'
      '  (AGB.IDBANCO        = BAN.IDPESSOA(+)) AND'
      '  (AGB.IDBANCO        = BPF.IDBANCO(+))')
    ValidateWithMask = True
    Left = 94
    Top = 35
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryDocTxt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' '#39'123456789012345678'#39' CONTALIQUIDO,'
      ' 0 IDPESSOA,'
      ' '#39'123456789012345678901234567890'#39' NOME,'
      ' '#39'123456789012345678901234567890'#39' RAZAOSOCIAL,'
      ' '#39'123456789012345678'#39' NUMDOCUMENTO,'
      ' '#39'123456789012345'#39' CONTACORRENTE,'
      ' '#39'1234567890'#39' CODBANCOFAVORECIDO,'
      ' '#39'123456789012345'#39' NUMAGENCIA,'
      ' '#39'1234567890123456789012345678901234567890'#39' LOGRADOURO,'
      ' '#39'12345678'#39' NUMERO,'
      ' '#39'12345678901234567890'#39' COMPLEMENTO,'
      ' '#39'12345678901234567890'#39' BAIRRO,'
      ' '#39'12345678901234567890'#39' CIDADE,'
      ' '#39'123'#39' CODESTADO,'
      ' '#39'12345678'#39' CEP,'
      ' 0 IDFORCLI,'
      ' 0 CODDOCUMENTO,'
      ' '#39'1234567890123'#39' LIVRE,'
      ' 0 VALOR,'
      ' 0 VALORDESCONTO,'
      ' 0 VALORJUROS,'
      ' '#39'01/01/1990'#39' DATAVENCTO,'
      ' '#39'01/01/1990'#39' DATAPROGRAMADA,'
      ' 0 TIPOMOEDA,'
      ' 0 NUMLOTE,'
      ' 0 CODPORTFORMA,'
      ' 0 CODFORMAPAGTO,'
      ' 0 CODTIPOPAGTO,'
      ' '#39'0'#39' FLGEMITEAVISO,'
      ' 0 CODARQUIVOREMESSA,'
      ' 0 CODPORTADOR,'
      ' 0 IDBANCO,'
      ' '#39'123456789012345'#39' NOCONTACORR,'
      ' '#39'1234567890'#39' CODBARRA,'
      ' '#39'1234567890'#39' CODBARRAVALOR,'
      ' 0 NODOCUMENTO,'
      ' '#39'123'#39' COMPLDOCUMENTO,'
      ' '#39'1'#39' TIPO,'
      ' '#39'12345678901234567890'#39' NUMEMPRESABANCO,'
      ' '#39'1'#39' DEBCRE, '#39'1'#39' TIPOCONTA'
      'FROM DUAL'
      'WHERE 1 = 2')
    UpdateObject = updDocTxt
    ValidateWithMask = True
    Left = 157
    Top = 247
  end
  object updDocTxt: TUpdateSQL
    Left = 157
    Top = 235
  end
  object qryEndereco: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select end.logradouro,end.numero,end.complemento,'
      '       end.bairro,cidades.nome as cidade,end.codestado,end.cep,'
      '       doc.numdocumento'
      'from   ENDPESS end,DOCPESSOA doc, CIDADES'
      'where end.idpessoa=:IdResponsavel'
      'and   doc.idpessoa=:IdResponsavel'
      'and   CIDADES.IDCIDADES(+) = end.IDCIDADES')
    ValidateWithMask = True
    Left = 30
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdResponsavel'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdResponsavel'
        ParamType = ptUnknown
      end>
  end
  object qryRubRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select * from RUBXRUB'
      'order by IDRUBPRINC, IDRUBSECUND')
    ValidateWithMask = True
    Left = 94
    Top = 23
  end
  object dsRubrica: TwwDataSource
    DataSet = qryRubrica
    Left = 221
    Top = 247
  end
  object qryAuxRetro: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 94
    Top = 9
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 718
    Top = 119
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 718
    Top = 106
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 34
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 168
    Top = 21
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM, IDMOTIVO, IDRUBIRRF,'
      '  IDRUBFGTS, IDRUBINSS, LIMADM, FERIASINI, FERIASFIM'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 168
    Top = 9
  end
  object updRubEsp: TUpdateSQL
    Left = 205
    Top = 190
  end
  object qryRubInd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  RUBRICAINDIV'
      'WHERE'
      '  (FLGTPRUBMANUT = '#39'2'#39') AND'
      '  (FLGPERMANENTE = 1 OR PARCELAS > NUMOCORRENCIAS)'
      'ORDER BY'
      '  IDPESSOA, IDEMPRESA, IDRUBRICA, SEQRUBRICAINDIV')
    ValidateWithMask = True
    Left = 29
    Top = 190
  end
  object qryAuxRubInd: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE RUBRICAINDIV'
      'SET  NumOcorrencias = NumOcorrencias + 1'
      'WHERE IDPESSOA      = :IDPESSOA'
      'AND IDEMPRESA       = :IDEMPRESA'
      'AND IDRUBRICA       = :IDRUBRICA'
      'AND SEQRUBRICAINDIV = :SEQRUBRICAINDIV'
      'AND FLGTPRUBMANUT   = '#39'2'#39)
    ValidateWithMask = True
    Left = 90
    Top = 190
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQRUBRICAINDIV'
        ParamType = ptUnknown
      end>
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTROCUSTO, NOME'
      'FROM'
      '  CENTCUST'
      '  '
      'ORDER BY'
      '  UPPER(NOME)')
    ValidateWithMask = True
    Left = 30
    Top = 237
  end
  object qrySindicato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  P.NOME, P.IDPESSOA'
      'FROM'
      '  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC S'
      'WHERE'
      '  P.IDPESSOA   = PF.IDSINDICATO  AND'
      '  PF.IDPESSOA = F.IDPESSOA         AND'
      '  F.IDSITFUNC  = S.IDSITFUNC        AND'
      '  S.TIPOSIT      <> '#39'D'#39
      'ORDER BY'
      '  UPPER(P.NOME)')
    ValidateWithMask = True
    Left = 86
    Top = 237
  end
  object qryTipoDes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  T.CODTIPRECDES,'
      '  T.DESCRICAO'
      'FROM tiporecebdesemb T, CONTABFOLHA C'
      'WHERE'
      '  C.CODTIPRECDES = T.CODTIPRECDES'
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 265
    Top = 190
  end
  object tblDocumentos: TTable
    Left = 536
    Top = 106
  end
end
