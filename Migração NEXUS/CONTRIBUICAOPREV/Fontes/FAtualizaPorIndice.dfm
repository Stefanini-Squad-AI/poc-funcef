inherited frmAtualizaPorIndice: TfrmAtualizaPorIndice
  Left = 232
  Top = 112
  HelpContext = 160059
  Caption = 'Atualização de Reservas por Índice'
  ClientHeight = 411
  ClientWidth = 747
  PixelsPerInch = 96
  TextHeight = 13
  object pnlProgresso: TPanel [0]
    Left = 127
    Top = 105
    Width = 458
    Height = 126
    BevelWidth = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Visible = False
    object LblPlano: TLabel
      Left = 10
      Top = 7
      Width = 425
      Height = 15
      AutoSize = False
      Caption = 'Plano:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object pBar: TGauge
      Left = 10
      Top = 68
      Width = 440
      Height = 20
      Progress = 0
      ShowText = False
    end
    object LblReserva: TLabel
      Left = 10
      Top = 29
      Width = 433
      Height = 15
      AutoSize = False
      Caption = 'Reserva:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 10
      Top = 99
      Width = 145
      Height = 16
      Caption = 'Registros Processados:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblcontador: TLabel
      Left = 162
      Top = 99
      Width = 129
      Height = 16
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object btncancelaprogress: TBitBtn
      Left = 361
      Top = 92
      Width = 89
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inherited pnlFundo: TPanel
    Width = 747
    Height = 372
    object pnlResult: TPanel
      Left = 1
      Top = 111
      Width = 745
      Height = 260
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object memResult: TMemo
        Left = 9
        Top = 30
        Width = 581
        Height = 234
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 2
      end
      object bbtnVoltar: TBitBtn
        Left = 597
        Top = 15
        Width = 115
        Height = 38
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
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
      object bbtnSalvar: TBitBtn
        Left = 597
        Top = 59
        Width = 115
        Height = 38
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
      end
      object StaticText3: TStaticText
        Left = 8
        Top = 3
        Width = 99
        Height = 22
        AutoSize = False
        Caption = 'Resultado'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 3
      end
    end
    object pnlOpcoes: TPanel
      Left = 1
      Top = 111
      Width = 745
      Height = 260
      Align = alClient
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object pgctrlReserva: TPageControl
        Left = 1
        Top = 29
        Width = 743
        Height = 230
        ActivePage = tbsPrincipal
        Align = alBottom
        TabOrder = 2
        object tbsPrincipal: TTabSheet
          Caption = ' Opções Básicas'
          object lbPatro: TLabel
            Left = 3
            Top = 11
            Width = 71
            Height = 13
            Caption = 'Patrocinadoras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 183
            Top = 10
            Width = 107
            Height = 13
            Caption = 'Planos Previdenciários'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 160
            Top = 186
            Width = 447
            Height = 13
            Caption = 
              'ATENÇÃO : Apenas as reservas SEM contribuição associada serão in' +
              'dexadas.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 367
            Top = 10
            Width = 45
            Height = 13
            Caption = 'Reservas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 551
            Top = 10
            Width = 116
            Height = 13
            Caption = 'Situação do Participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object chklstPatro: TCheckListBox
            Left = 3
            Top = 25
            Width = 174
            Height = 158
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
          object chklstPlano: TCheckListBox
            Left = 183
            Top = 25
            Width = 178
            Height = 158
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 1
          end
          object chkResult: TCheckBox
            Left = 7
            Top = 186
            Width = 121
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Exibir exceções ...'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object chklstReserva: TCheckListBox
            Left = 367
            Top = 25
            Width = 178
            Height = 158
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 3
          end
          object chklstSitPart: TCheckListBox
            Left = 551
            Top = 25
            Width = 178
            Height = 158
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 4
          end
        end
        object tbshtpart: TTabSheet
          Caption = 'Seleção de Participantes'
          ImageIndex = 1
          object lblParticip: TLabel
            Left = 11
            Top = 55
            Width = 71
            Height = 16
            Caption = 'Participante'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object pnlSelecaoIndividual: TPanel
            Left = 0
            Top = 40
            Width = 735
            Height = 162
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object lblMatricula: TLabel
              Left = 320
              Top = 64
              Width = 54
              Height = 16
              Caption = 'Matrícula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label3: TLabel
              Left = 320
              Top = 16
              Width = 125
              Height = 16
              Caption = 'Plano Previdenciário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object lblPatro: TLabel
              Left = 8
              Top = 64
              Width = 85
              Height = 16
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 8
              Top = 16
              Width = 125
              Height = 16
              Caption = 'Plano Previdenciário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object grpInfo: TGroupBox
              Left = 8
              Top = 112
              Width = 553
              Height = 36
              Caption = ' Informações para o desfazer  '
              TabOrder = 0
              object lbInfo: TLabel
                Left = 8
                Top = 17
                Width = 537
                Height = 13
                AutoSize = False
              end
            end
            object edMatricula: TEdit
              Left = 320
              Top = 80
              Width = 238
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object edPatro: TEdit
              Left = 8
              Top = 80
              Width = 304
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edNome: TEdit
              Left = 8
              Top = 32
              Width = 304
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object dblkpPlanoParticip: TwwDBLookupCombo
              Left = 320
              Top = 32
              Width = 237
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'50'#9'Nome'#9'F'
                'FLGDESATIVADO'#9'10'#9'Situação'#9'F')
              LookupTable = qryPlanoParticip
              LookupField = 'NOME'
              Enabled = False
              TabOrder = 4
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              OnChange = dblkpPlanoParticipChange
            end
            object edPlano: TEdit
              Left = 320
              Top = 32
              Width = 238
              Height = 24
              Color = clSilver
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              Visible = False
            end
            object bbtnProcurar: TBitBtn
              Left = 596
              Top = 26
              Width = 125
              Height = 47
              Hint = 'Procurar participante'
              Caption = '&Procurar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 6
              OnClick = bbtnProcurarClick
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            end
            object btndesfazselec: TBitBtn
              Left = 596
              Top = 98
              Width = 125
              Height = 47
              Hint = 'Procurar participante'
              Caption = 'Limpar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 7
              OnClick = btndesfazselecClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              NumGlyphs = 2
            end
          end
          object pnlListaArquivo: TPanel
            Left = 0
            Top = 40
            Width = 735
            Height = 162
            BevelOuter = bvNone
            TabOrder = 2
            object lblListaPessoas: TLabel
              Left = 8
              Top = 40
              Width = 283
              Height = 13
              Caption = 'Selecione o arquivo com a lista ( máximo de 200 )'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object sbtnListaPessoas: TSpeedButton
              Left = 496
              Top = 56
              Width = 23
              Height = 22
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
                5555555555555555555555555555555555555555555555555555555555555555
                555555555555555555555555555555555555555FFFFFFFFFF555550000000000
                55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
                B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
                000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
                555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
                55555575FFF75555555555700007555555555557777555555555555555555555
                5555555555555555555555555555555555555555555555555555}
              NumGlyphs = 2
              OnClick = sbtnListaPessoasClick
            end
            object edtListaPessoas: TEdit
              Left = 8
              Top = 56
              Width = 490
              Height = 21
              TabOrder = 0
            end
          end
          object rgrTipo: TRadioGroup
            Left = 0
            Top = 0
            Width = 321
            Height = 41
            Caption = '  Tipo de Seleção  '
            Columns = 2
            Items.Strings = (
              'Seleção Individual'
              'Lista de arquivos')
            TabOrder = 0
            OnClick = rgrTipoClick
          end
        end
      end
      object StaticText2: TStaticText
        Left = 7
        Top = 3
        Width = 167
        Height = 27
        Caption = 'Opções do cálculo'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object bbtnVerResultado: TBitBtn
        Left = 596
        Top = 5
        Width = 115
        Height = 39
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
        TabOrder = 1
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
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 745
      Height = 110
      Align = alTop
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object StaticText1: TStaticText
        Left = 8
        Top = 3
        Width = 262
        Height = 27
        Caption = 'Informações para atualização'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = 28
        Width = 421
        Height = 75
        Caption = ' Atualizar ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 231
          Top = 39
          Width = 19
          Height = 13
          Caption = 'até'
        end
        object dtpAtualizaAte: TCMDateTimePicker
          Left = 258
          Top = 37
          Width = 118
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
          TabOrder = 0
        end
        object rgrpTipoAtualiza: TRadioGroup
          Left = 12
          Top = 15
          Width = 211
          Height = 55
          ItemIndex = 0
          Items.Strings = (
            'Da Última Data Atualizada'
            'Da Data ')
          TabOrder = 1
          OnClick = rgrpTipoAtualizaClick
        end
        object dtInicioAtualiza: TCMDateTimePicker
          Left = 93
          Top = 46
          Width = 118
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
          TabOrder = 2
          Visible = False
        end
      end
      object bbtnEnviar: TBitBtn
        Left = 596
        Top = 6
        Width = 115
        Height = 38
        Caption = 'Processar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = bbtnEnviarClick
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
      end
      object bbtnDesfazer: TBitBtn
        Left = 596
        Top = 48
        Width = 115
        Height = 38
        Caption = '&Desfazer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = bbtnDesfazerClick
        Glyph.Data = {
          06010000424D060100000000000076000000280000000B000000120000000100
          0400000000009000000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
          0000333333338330000033333338803000003333338800300000333338809030
          0000333388099030000033388079703000003388099990300000388097979030
          0000330999999030000033307979703000003333099990300000333330979030
          0000333333099030000033333330703000003333333300300000333333333030
          00003333333333300000}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 372
    Width = 747
    inherited tb97Fundo: TToolbar97
      Left = 370
      DockPos = 370
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 92
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 92
        Caption = '&Processar'
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 95
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 515
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGIVEL'
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PARTPREVPLAN.IDPLANOPREV'
      'PLANPREV.NOME'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=ELEGIVEL.IDPESSOA'
      'ELEGIVEL.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '30'
      '10'
      '60')
    OperComparador.Strings = (
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
    Left = 550
    Top = 55
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar cálculo de Reservas de Participantes'
    Left = 550
    Top = 6
  end
  object qryReservaxPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ RULE*/ DISTINCT'
      '  RP.IDTIPORESERVA,'
      '  RP.NOME ,'
      '  PL.IDPLANOPREV,'
      '  PL.NOME NOMEPLANO,'
      '  RP.FLGCOLETIVA,'
      '  PL.FLGRESERVAULTCOT,'
      '  RP.FLGCONTROLE,'
      '  RC.IDCONTRIBUICAO,'
      '  RC.PERCENTUAL,'
      '  C.NOME AS NOMECONTRIBUICAO,'
      '  CT.FLGPARCELAMENTO'
      ''
      'FROM'
      '  PLANPREV PL,'
      '  CONTPREV CT,'
      '  RESERVAXPLANO RP,'
      '  CONTRIBUICAO C,'
      '  RESERVAXCONTRIB RC,'
      '  HSTCONTRIBPREV H'
      ''
      'WHERE (RP.ANALITICOSINTETI = '#39'A'#39')'
      '  AND (H.IDPLANOPREV       = RC.IDPLANOPREV)'
      '  AND (H.IDPLANOPREV       = :IDPLANO)'
      '  AND (RC.IDPLANOPREV      = RP.IDPLANOPREV)'
      '  AND (RC.IDTIPORESERVA    = RP.IDTIPORESERVA)'
      '  AND (RC.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)'
      '  AND (CT.IDPLANOPREV      = PL.IDPLANOPREV)'
      '  AND (CT.IDCONTRIBUICAO   = C.IDCONTRIBUICAO)'
      '  AND (H.MESCOBRANCA      <= :MESCOBRANCA)'
      '  AND (H.IDPESSJUR         = :IDPESSJUR)'
      '  AND (H.IDPLANOPREV       = PL.IDPLANOPREV)'
      '  AND (H.IDCONTRIBUICAO    = RC.IDCONTRIBUICAO)'
      '  AND (NVL(H.VALORRECEBIDO,0) > 0)'
      ''
      'ORDER BY RC.IDCONTRIBUICAO, RP.NOME'
      ' ')
    ValidateWithMask = True
    Left = 25
    Top = 368
    ParamData = <
      item
        DataType = ftString
        Name = 'IdPlano'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object qryReservasACalcular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT :IDPLANOPREV, :IDCONTRIBUICAO, :FLGCALCRESERVA1, :FLGCALC' +
        'RESERVA2,'
      ':IDTIPORESERVA'
      'FROM   DUAL'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 481
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCALCRESERVA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FLGCALCRESERVA2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPORESERVA'
        ParamType = ptUnknown
      end>
  end
  object qryIndices: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COTDATA, COTVALOR'
      'FROM   COTACAOMOEDA'
      'WHERE  MOECODIGO = :MOECODIGO'
      'AND    COTDATA > :ULTIMADATA'
      'AND    COTDATA <= :DATALIMITE'
      'ORDER BY COTDATA')
    ValidateWithMask = True
    Left = 107
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ULTIMADATA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATALIMITE'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 562
    Top = 366
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PESSOA.IDPESSOA,    PESSOA.NOME'
      'FROM   PESSOA, PATRO'
      'WHERE  PESSOA.IDPESSOA=PATRO.IDPESSOA'
      'AND    PATRO.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 48
    Top = 250
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 233
    Top = 250
  end
  object qryPlanoParticip: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select pl.IDPLANOPREV, pl.nome,  pp.idpessjur,'
      
        '       Decode(pp.flgdesativado, 0, '#39'Ativo'#39', '#39'Desativado'#39') flgdes' +
        'ativado'
      'from partprevplan pp,'
      '     planprev     pl      '
      'where pp.IDPLANOPREV = pl.IDPLANOPREV and '
      '       idpessoa = :idpessoa and'
      '       idpessjur = :idpessjur'
      'order by pp.flgdesativado'#9)
    ValidateWithMask = True
    Left = 462
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idpessjur'
        ParamType = ptUnknown
      end>
  end
  object wwDataSource1: TwwDataSource
    DataSet = qryPlanoParticip
    Left = 462
    Top = 110
  end
  object qryReserva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  RP.IDPLANOPREV,     RP.CODHIERARQUIA,'
      '  RP.IDTIPORESERVA,   RP.NOME ,           RP.FLGCONTROLE,'
      '  RP.INDICECORRECAO,  RP.FLGCOLETIVA,     RP.IDREGRAPAGTORESE,'
      '  PL.IDPLANOPREV,     PL.NOME NOMEPLANO,  PL.FLGRESERVAULTCOT'
      'FROM'
      '  PLANPREV PL,    RESERVAXPLANO RP'
      'WHERE (RP.ANALITICOSINTETI = '#39'A'#39')'
      '  AND (RP.FLGMODATUALIZACAO = 1 )'
      '  AND (PL.IDPLANOPREV       = RP.IDPLANOPREV)'
      '  AND (RP.IDTIPORESERVA NOT IN ('
      '                                 SELECT RC.IDTIPORESERVA'
      '                                 FROM RESERVAXCONTRIB RC'
      
        '                                 WHERE RC.IDPLANOPREV = RP.IDPLA' +
        'NOPREV'
      
        '                                   AND RC.IDTIPORESERVA = RP.IDT' +
        'IPORESERVA'
      '                               ) )'
      'ORDER BY RP.IDPLANOPREV, RP.CODHIERARQUIA '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 441
    Top = 250
  end
  object qrySitPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPART, DESCRICAO NOME, FLGINTERNO'
      'FROM SITPART'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 633
    Top = 250
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivo de Texto|*.txt|Todos os Arquivos|*.*'
    InitialDir = 'C:\'
    Title = 'Matrículas para Atualização de Reservas'
    Left = 704
    Top = 112
  end
end
