inherited frmGeraCalc: TfrmGeraCalc
  Left = 348
  Top = 251
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
    Top = 103
    Width = 767
    Height = 270
    TabOrder = 3
    object pnlResult: TPanel
      Left = 1
      Top = 1
      Width = 765
      Height = 268
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
        Height = 266
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
    Top = 103
    Width = 767
    Height = 270
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
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object fcLabel1: TfcLabel
        Left = 7
        Top = 7
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
        TextOptions.Shadow.XOffset = 1
        TextOptions.Shadow.YOffset = 2
        TextOptions.VAlignment = vaTop
        Transparent = True
      end
      object bbtnVerResultado: TBitBtn
        Left = 648
        Top = 5
        Width = 112
        Height = 35
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
        Left = 317
        Top = 2
        Width = 249
        Height = 41
        Caption = ' Período do Início do Gozo das Férias '
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
          Top = 16
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label3: TLabel
          Left = 128
          Top = 17
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
      object chkLOG: TCheckBox
        Left = 201
        Top = 15
        Width = 92
        Height = 17
        Caption = 'Gerar Log'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object chkETL: TCheckBox
        Left = 576
        Top = 15
        Width = 53
        Height = 17
        Caption = 'ETL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = chkETLClick
      end
    end
    object pgctrlOpcoes: TPageControl
      Left = 1
      Top = 46
      Width = 765
      Height = 223
      ActivePage = tbsRubricas
      Align = alClient
      TabOrder = 0
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
        object chklstRubrica: TColorCheckListBox
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
          OnKeyDown = chklstRubricaKeyDown
        end
        object chklstFunc: TColorCheckListBox
          Left = 447
          Top = 15
          Width = 300
          Height = 119
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
          OnKeyDown = chklstRubricaKeyDown
        end
        object gbxTipContr: TGroupBox
          Left = 314
          Top = 10
          Width = 126
          Height = 140
          Caption = ' Tipo de Contrato '
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          OnEnter = gbxTipContrEnter
          OnExit = gbxTipContrExit
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
          object cbxPropDirSemVinc: TCheckBox
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
          Top = 137
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
          Top = 137
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
        object cbxTmpDesc: TCheckBox
          Left = 314
          Top = 166
          Width = 132
          Height = 13
          Hint = 'Plano Contábil e Patrocinadora devem ser mantidos da TmpDesc'
          Caption = 'Plano/Patro=TmpDesc'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
        end
        object edtSelEmpregados: TEdit
          Left = 448
          Top = 172
          Width = 239
          Height = 21
          Hint = 
            'Digite aqui o código das Rubricas a procurar separados por vírgu' +
            'la'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object btnSelEmpregados: TBitBtn
          Left = 688
          Top = 169
          Width = 68
          Height = 25
          Caption = '   &Marcar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 9
          TabStop = False
          OnClick = btnSelEmpregadosClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888888FF8888888888888778888888888888F77F8888888888800F08
            8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
            88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
            08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
            F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
            FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
            788877F77FF878F7788889999991777888888777777787788888889999988888
            8888887777788888888888888888888888888888888888888888}
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
          Left = 455
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
        object chklstEmpresa: TColorCheckListBox
          Left = 1
          Top = 15
          Width = 300
          Height = 135
          OnClickCheck = chklstEmpresaClickCheck
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
          OnKeyDown = chklstEmpresaKeyDown
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
          TabOrder = 1
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
          TabOrder = 2
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
        object rgOpcaoPrevia: TRadioGroup
          Left = 309
          Top = 15
          Width = 138
          Height = 156
          Caption = ' Opção da Prévia '
          ItemIndex = 0
          Items.Strings = (
            'Apaga Tudo'
            'Apaga Tipos de Folha'
            'Apaga Pessoas'
            'Apaga Tipos/Pessoas'
            'Deixa Tudo')
          TabOrder = 3
        end
        object chklstEstab: TColorCheckListBox
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
          TabOrder = 4
          OnDrawItem = chklstRubricaDrawItem
          OnKeyDown = chklstEstabKeyDown
        end
        object bbtnSelEstab: TBitBtn
          Left = 455
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
          TabOrder = 6
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
            KeyOptions = []
            Options = [dgEditing, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
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
          Caption = ' Processar Retroativo? '
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
          Caption = ' Centros de Custo '
          TabOrder = 2
          Visible = False
          object chklstCCusto: TColorCheckListBox
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
          Caption = ' Empregados '
          TabOrder = 1
          Visible = False
          object pgctrlFuncRetro: TPageControl
            Left = 6
            Top = 15
            Width = 305
            Height = 170
            ActivePage = tbshListaFunc
            HotTrack = True
            TabOrder = 0
            object tbshListaFunc: TTabSheet
              Caption = '&Lista'
              object chklstFuncRetro: TColorCheckListBox
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
              object gbxTipContr2: TGroupBox
                Left = 4
                Top = 7
                Width = 288
                Height = 75
                Caption = ' Tipo de Contrato '
                TabOrder = 0
                OnEnter = gbxTipContr2Enter
                OnExit = gbxTipContr2Exit
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
                object cbxPropDirSemVinc2: TCheckBox
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
                Caption = ' Situação Funcional '
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
          Caption = ' Sindicatos '
          TabOrder = 3
          Visible = False
          object chklstSindicato: TColorCheckListBox
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
      Left = 599
      DockPos = 605
    end
  end
  object pnlInformacoes: TPanel [3]
    Left = 0
    Top = 0
    Width = 767
    Height = 103
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object bbtnGeracao: TBitBtn
      Left = 648
      Top = 49
      Width = 112
      Height = 48
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
      Left = 317
      Top = 3
      Width = 324
      Height = 94
      Caption = ' Tipo (Motivo) de Folha '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object dblckMotivo: TwwDBLookupCombo
        Left = 8
        Top = 66
        Width = 308
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        LookupTable = CdsMotivo
        LookupField = 'IDMOTIVO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
        OnChange = dblckMotivoChange
      end
      object rgTipoFolha: TRadioGroup
        Left = 8
        Top = 16
        Width = 308
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
    object pgctrlDoc: TPageControl
      Left = 6
      Top = 3
      Width = 304
      Height = 94
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
          Left = 3
          Top = 7
          Width = 172
          Height = 51
          Caption = ' Mês e Ano de Referência '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dbedMes: TwwDBEdit
            Left = 12
            Top = 18
            Width = 90
            Height = 19
            BorderStyle = bsNone
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Frame.Enabled = True
            Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
            Frame.NonFocusStyle = efsFrameSingle
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedAno: TwwDBEdit
            Left = 114
            Top = 18
            Width = 45
            Height = 19
            BorderStyle = bsNone
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Frame.Enabled = True
            Frame.NonFocusBorders = [efLeftBorder, efTopBorder, efRightBorder, efBottomBorder]
            Frame.NonFocusStyle = efsFrameSingle
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object gbxDtPagto: TGroupBox
          Left = 182
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
          object dtDataPagFolha: TCMDateTimePicker
            Left = 8
            Top = 18
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
        object gbxTipoDoc: TGroupBox
          Left = 3
          Top = 7
          Width = 289
          Height = 51
          Caption = ' Tipo de Documento '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object dblckTipoDoc: TwwDBLookupCombo
            Left = 7
            Top = 18
            Width = 275
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            LookupTable = CdsTipoDoc
            LookupField = 'CODTIPDOC'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
            OnCloseUp = dblckTipoDocCloseUp
          end
        end
      end
    end
    object rgProcesso: TRadioGroup
      Left = 648
      Top = 3
      Width = 112
      Height = 41
      Caption = ' Processo '
      Columns = 2
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 529
    Top = 367
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar Resultado da Geração'
    Left = 473
    Top = 367
  end
  object dsRubrica: TwwDataSource
    AutoEdit = False
    DataSet = CdsRubrica
    Left = 295
    Top = 367
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 26
    Top = 367
  end
  object CdsRubrica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 234
    Top = 367
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 162
    Top = 367
  end
  object CdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 90
    Top = 367
  end
  object spAtualizaValTabGener: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PR_ATUALIZAVALTABGER'
    ValidateWithMask = True
    Left = 385
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'PLISTAPESSOAS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end>
  end
  object spAtualizaHstContribPrev: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PR_ATUALIZAHSTCONTRIBPREV'
    ValidateWithMask = True
    Left = 385
    Top = 321
    ParamData = <
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLISTAPESSOAS'
        ParamType = ptInput
      end>
  end
  object spAjudadeCusto: TwwStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'CM.PCK_FP_AJUDA_DE_CUSTO.SP_AJUDA_DE_CUSTO'
    ValidateWithMask = True
    Left = 383
    Top = 287
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PLISTAPESSOAS'
        ParamType = ptInput
      end>
  end
  object cdsAuxETL: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 29
    Top = 317
  end
end
