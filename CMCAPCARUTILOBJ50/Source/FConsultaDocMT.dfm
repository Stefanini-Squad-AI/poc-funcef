inherited frmConsultaDocMT: TfrmConsultaDocMT
  Left = 62
  Top = 99
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'Consulta Documentos'
  ClientHeight = 467
  ClientWidth = 788
  FormStyle = fsNormal
  Visible = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel [0]
    Left = 31
    Top = 146
    Width = 120
    Height = 13
    Caption = 'Forma de Pagamento'
  end
  object Label11: TLabel [1]
    Left = 31
    Top = 136
    Width = 65
    Height = 13
    Caption = 'Fornecedor'
  end
  inherited pnlFundo: TPanel
    Width = 788
    Height = 428
    object Panel2: TPanel
      Left = 1
      Top = 398
      Width = 786
      Height = 29
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      object sBtnContabilizacao: TSpeedButton
        Left = 112
        Top = 2
        Width = 119
        Height = 25
        GroupIndex = 1
        Caption = '&Contabilizações'
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777770000000000000007777777770999999000000007777
          7777709999990000000077777777700000000000000070000000007777777000
          000070FFFFFF007777777000000070F87777F07000077000000070FFFFFFF070
          AA077000000070F88777F000AA000000000070FFFFFFF0AAAAAA0000000070F8
          877770AAAAAA0000000070FFFF000000AA000000000070F887070770AA077000
          000070FFFF007770000770000000700000077777777770000000777777777777
          777770000000}
        OnClick = sBtnContabilizacaoClick
      end
      object SbtParcelas: TSpeedButton
        Left = 446
        Top = 2
        Width = 104
        Height = 25
        GroupIndex = 1
        Caption = '&Parcelas'
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00778888888880
          000000000000778777777770FFFF000000000000000007708777000000000FFF
          FFFF0770FFFF000000000F77777F07707777000000000FFFFFFF0880FF000000
          00000F87777F07708707700000000FFFFFFF07700007700000000F88777F0777
          7777700000000FFFFFFF07700000000000000F8877770770FFFF000000000FFF
          F00008808777000000000F8870707770FFFF000000000FFFF000777077770000
          0000000000777770FF0000000000787777777770870770000000788888888880
          000770000000}
        OnClick = SbtParcelasClick
      end
      object spdLancto: TSpeedButton
        Left = 2
        Top = 2
        Width = 107
        Height = 25
        GroupIndex = 1
        Down = True
        Caption = '&Lançamentos'
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777777777777700000007777
          7777777777777000000077777777777777777000000070000000007777777000
          000070FFFFF0207777777000000070F77702200000077000000070FFF0222222
          22077000000070F88702200000077000000070FFFFF0207777777000000070F8
          8777007777777000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        OnClick = spdLanctoClick
      end
      object SbtRateio: TSpeedButton
        Left = 233
        Top = 2
        Width = 105
        Height = 25
        GroupIndex = 1
        Caption = '&Rateios'
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777777777777700000007777
          70000000007770000000777770FFFFF0207770000000777770F7770220000000
          0000777770FFF022222200000000777700F887022000000000007777090FFFF0
          207770000000000009908777007770000000099999990F000077700000000000
          099087070777700000007777090FFF0077777000000077770000000777777000
          0000777777777777777770000000777777777777777770000000777777777777
          777770000000}
        OnClick = SbtRateioClick
      end
      object SbtEmissoes: TSpeedButton
        Left = 339
        Top = 2
        Width = 105
        Height = 25
        GroupIndex = 1
        Caption = '&Emissões'
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007777777777770777700000007777
          7777777700777000000077777777000009077000000070000000099999907000
          000070FFFFFF000009077000000070F87777F07700777000000070FFFFFFF077
          07777000000070F88777F07777777000000070FFFFFFF07777777000000070F8
          8777707777777000000070FFFF00007777777000000070F88707077777777000
          000070FFFF007777777770000000700000077777777770000000777777777777
          777770000000}
        OnClick = SbtEmissoesClick
      end
      object SpeedButton1: TSpeedButton
        Left = 552
        Top = 2
        Width = 124
        Height = 25
        GroupIndex = 1
        Caption = 'Contas de Bai&xa'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
          00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
          00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
          F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
          F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
          FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
          0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
          00337777FFFF77FF7733EEEE0000000003337777777777777333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 678
        Top = 3
        Width = 105
        Height = 25
        GroupIndex = 1
        Caption = '&Eventos'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
          000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
          FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
          00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
          FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
          0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
          05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
          55557F7777777555555500000005555555557777777555555555}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 786
      Height = 397
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 786
        Height = 171
        ActivePage = TabSheet1
        Align = alTop
        MultiLine = True
        TabOrder = 0
        TabPosition = tpRight
        object TabSheet1: TTabSheet
          Caption = 'Dados Gerais'
          object Label1: TLabel
            Left = 132
            Top = 0
            Width = 65
            Height = 13
            Caption = 'Documento'
          end
          object Label2: TLabel
            Left = 268
            Top = 0
            Width = 39
            Height = 13
            Caption = 'Compl.'
          end
          object Label9: TLabel
            Left = 405
            Top = 0
            Width = 51
            Height = 13
            Caption = 'Situação'
          end
          object Label7: TLabel
            Left = 638
            Top = 0
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label8: TLabel
            Left = 638
            Top = 39
            Width = 33
            Height = 13
            Caption = 'Saldo'
          end
          object LblForneCedor: TLabel
            Left = 3
            Top = 78
            Width = 65
            Height = 13
            Cursor = 1
            Caption = 'Fornecedor'
          end
          object Label3: TLabel
            Left = 3
            Top = 39
            Width = 47
            Height = 13
            Caption = 'Emissão'
          end
          object Label4: TLabel
            Left = 131
            Top = 39
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label5: TLabel
            Left = 268
            Top = 39
            Width = 68
            Height = 13
            Caption = 'Programada'
          end
          object LblFormaPag: TLabel
            Left = 401
            Top = 39
            Width = 120
            Height = 13
            Cursor = 1
            Caption = 'Forma de Pagamento'
          end
          object Label10: TLabel
            Left = 253
            Top = 15
            Width = 7
            Height = 20
            Caption = '-'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblTipoDoc: TLabel
            Left = 401
            Top = 78
            Width = 112
            Height = 13
            Cursor = 1
            Caption = 'Tipo de Documento'
          end
          object Label15: TLabel
            Left = 401
            Top = 118
            Width = 44
            Height = 13
            Caption = 'Usuário'
          end
          object lblModulo: TLabel
            Left = 556
            Top = 118
            Width = 104
            Height = 13
            Caption = 'Sistema de origem'
          end
          object bbtnSeleciona: TSpeedButton
            Left = 4
            Top = 8
            Width = 112
            Height = 25
            Caption = 'Procurar'
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
              840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
              FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
              0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF0000008400FF00
              FF00FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF000000FFFF
              FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
              8400FF00FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00000084000000
              840000008400FF00FF0084848400FFFFFF00FFFFFF00FF000000FF000000FF00
              0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF000000
              8400000084000000840000000000000000000000000000000000FFFFFF00FFFF
              FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
              FF000000840000000000FFFF0000FF00FF00FFFF0000FF00FF00000000008484
              0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
              FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
              0000FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF00FF00FF00FF00
              FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
              0000FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FFFF0000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF000000
              000084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF0000000000FF00FF00FFFF0000FF00FF00FFFF0000FF00FF00FFFF00000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000000000FF00FF00FFFF0000FF00FF00FFFF000000000000FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            OnClick = bbtnSelecionaClick
          end
          object wwDBEdit1: TwwDBEdit
            Left = 132
            Top = 15
            Width = 112
            Height = 21
            DataField = 'NODOCUMENTO'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit2: TwwDBEdit
            Left = 268
            Top = 15
            Width = 53
            Height = 21
            DataField = 'COMPLDOCUMENTO'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edValor: TRealEdit
            Left = 638
            Top = 15
            Width = 115
            Height = 21
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
          end
          object edSaldo: TRealEdit
            Left = 638
            Top = 54
            Width = 115
            Height = 21
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
          end
          object wwDBEdit5: TwwDBEdit
            Left = 3
            Top = 92
            Width = 380
            Height = 21
            Cursor = 1
            DataField = 'FORNECEDOR'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBDateEdit1: TCMDateTimePicker
            Left = 3
            Top = 54
            Width = 115
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAEMISSAO'
            DataSource = dsDocs
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
            ReadOnly = True
            ShowButton = True
            TabOrder = 5
          end
          object DBDateEdit2: TCMDateTimePicker
            Left = 131
            Top = 54
            Width = 115
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAVENCTO'
            DataSource = dsDocs
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
            ReadOnly = True
            ShowButton = True
            TabOrder = 6
          end
          object DBDateEdit3: TCMDateTimePicker
            Left = 268
            Top = 54
            Width = 115
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAPROGRAMADA'
            DataSource = dsDocs
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
            ReadOnly = True
            ShowButton = True
            TabOrder = 7
          end
          object wwDBEdit3: TwwDBEdit
            Left = 401
            Top = 54
            Width = 224
            Height = 21
            Cursor = 1
            DataField = 'DESCRFORMARP'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 8
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEdit5: TDBEdit
            Left = 402
            Top = 15
            Width = 223
            Height = 21
            Color = 12648447
            DataField = 'DESCSTATUSDOC'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 9
          end
          object dbedTipodoc: TwwDBEdit
            Left = 402
            Top = 92
            Width = 351
            Height = 21
            DataField = 'TIPODOC'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 10
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbchkBoxFiscal: TDBCheckBox
            Left = 544
            Top = -2
            Width = 81
            Height = 17
            Caption = 'Doc Fiscal'
            DataField = 'FLGDOCFISCAL'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 11
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object grBoxRAD: TGroupBox
            Left = 3
            Top = 122
            Width = 381
            Height = 31
            Caption = 'RAD'
            TabOrder = 12
            Visible = False
            object dbtxtNumProc: TDBText
              Left = 105
              Top = 13
              Width = 80
              Height = 13
              AutoSize = True
              DataField = 'idprocesso'
              DataSource = dsProcesso
            end
            object lblProcesso: TLabel
              Left = 7
              Top = 13
              Width = 93
              Height = 13
              Caption = 'Nº do Processo:'
            end
            object Label19: TLabel
              Left = 215
              Top = 13
              Width = 41
              Height = 13
              Caption = 'Status:'
            end
            object dbtxtStatusProc: TDBText
              Left = 261
              Top = 13
              Width = 91
              Height = 13
              AutoSize = True
              DataField = 'status'
              DataSource = dsProcesso
            end
          end
          object DBEdit1: TDBEdit
            Left = 401
            Top = 132
            Width = 144
            Height = 21
            Color = clBtnFace
            DataField = 'NOMEUSUARIO'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 13
          end
          object DBEdit2: TDBEdit
            Left = 556
            Top = 132
            Width = 197
            Height = 21
            Color = clBtnFace
            DataField = 'NOMEMODULO'
            DataSource = dsDocs
            ReadOnly = True
            TabOrder = 14
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Dados Bancários'
          object Label13: TLabel
            Left = 12
            Top = 98
            Width = 149
            Height = 13
            Caption = 'Código de Barras - Leitora'
          end
          object Label14: TLabel
            Left = 371
            Top = 98
            Width = 195
            Height = 13
            Caption = 'Código de Barras - Linha Digitável'
          end
          object GpConta: TGroupBox
            Left = 12
            Top = 18
            Width = 728
            Height = 75
            Anchors = [akLeft, akTop, akRight]
            Caption = ' Conta Bancária '
            TabOrder = 0
            object LblBanco: TLabel
              Left = 13
              Top = 18
              Width = 54
              Height = 13
              Caption = 'LblBanco'
            end
            object LblAgencia: TLabel
              Left = 13
              Top = 34
              Width = 54
              Height = 13
              Caption = 'LblBanco'
            end
            object LblConta: TLabel
              Left = 13
              Top = 50
              Width = 54
              Height = 13
              Caption = 'LblBanco'
            end
            object LblTipoConta: TLabel
              Left = 304
              Top = 50
              Width = 54
              Height = 13
              Caption = 'LblBanco'
            end
          end
          object wwDBEdit4: TwwDBEdit
            Left = 12
            Top = 115
            Width = 309
            Height = 21
            DataField = 'NUMDIGCODBARRAS'
            DataSource = dsDocs
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit6: TwwDBEdit
            Left = 370
            Top = 115
            Width = 344
            Height = 21
            DataField = 'NUMLEITCODBARRAS'
            DataSource = dsDocs
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object tabObs: TTabSheet
          Caption = 'Observação'
          ImageIndex = 2
          object MemObs: TDBMemo
            Left = 0
            Top = 0
            Width = 744
            Height = 161
            Align = alClient
            DataField = 'OBS'
            DataSource = dsDocs
            MaxLength = 1000
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object pnlDetalhe: TPanel
        Left = 0
        Top = 171
        Width = 786
        Height = 226
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object NtbConsDoc: TNotebook
          Left = 0
          Top = 0
          Width = 786
          Height = 226
          Align = alClient
          TabOrder = 0
          object TPage
            Left = 0
            Top = 0
            Caption = 'Lancamentos'
            object DbgLancamentos: TwwDBGrid
              Left = 0
              Top = 0
              Width = 786
              Height = 226
              Selected.Strings = (
                'NUMLANCTO'#9'10'#9'Lançamento'
                'PLNCODIGO'#9'10'#9'Cód. Contábil'
                'DATALANCTO'#9'10'#9'Data'
                'OPERACAO'#9'2'#9'Operação'
                'VALOR'#9'15'#9'Valor'
                'DEBCRE'#9'5'#9'D/C'
                'DATAPROGRAMADA'#9'15'#9'Dt. Programada'
                'DATAVENCTO'#9'15'#9'Dt. Vencimento'
                'DATACFLOAT'#9'10'#9'Data c/ Float'
                'HIST'#9'20'#9'Tipo'
                'HISTORICOCOMPL'#9'40'#9'Histórico'
                'CODALTERADOR'#9'8'#9'Alterador'
                'ESTORNO'#9'8'#9'Estorno'
                'CHEQUE'#9'15'#9'Nº Cheque/Borderô'
                'DESCRICAO'#9'30'#9'Descrição'
                'RAZAOSOCIAL'#9'40'#9'Fornecedor/Cliente'
                'NUMAPGR'#9'10'#9'Num. AP'
                'NUMLOTE'#9'8'#9'Lote'
                'CODLANCFINANC'#9'10'#9'Cod. Lanc. Finan.'
                'NUMOP'#9'15'#9'N. OP'
                'NUMSLIP'#9'15'#9'SLIP')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsDocs
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = dbgrdContabCalcCellColors
              OnTitleButtonClick = DbgLancamentosTitleButtonClick
              IndicatorColor = icBlack
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Contabilizacoes'
            object dbgrdContab: TwwDBGrid
              Left = 0
              Top = 0
              Width = 786
              Height = 226
              Selected.Strings = (
                'PLNDATDIA'#9'10'#9'Data lançamento'
                'PLNPLANIL'#9'8'#9'Planilha'
                'PLNCODIGO'#9'10'#9'Código'
                'LACNUMLAN'#9'5'#9'Lanc.'
                'LACDEBCRE'#9'4'#9'D/C'
                'PLACONTA'#9'18'#9'Conta Contábil'
                'OPERACAO'#9'7'#9'Operação'
                'LACVALOR'#9'10'#9'Valor'
                'CODCENTROCUSTO'#9'10'#9'Cód.C.Custo'
                'NOMECC'#9'30'#9'Centro de Custo'
                'PLANO'#9'30'#9'Plano'
                'PATRO'#9'30'#9'Patrocinadora'
                'NOMEAP'#9'25'#9'Atividade/Projeto'
                'NOMESUBCONTA'#9'30'#9'SubConta'#9'F'
                'IDSEGREGACONTR'#9'10'#9'Contr. Segreg.'
                'DESCRICAO'#9'40'#9'Critério de Segregação'
                'HISTLANCAMENTOCONTABIL'#9'100'#9'Histórico')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsContab
              Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = dbgrdContabCalcCellColors
              OnTitleButtonClick = dbgrdContabTitleButtonClick
              IndicatorColor = icBlack
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Rateios'
            object dbgRateio: TwwDBGrid
              Left = 0
              Top = 0
              Width = 740
              Height = 122
              Selected.Strings = (
                'NOME_1'#9'20'#9'Atividade/Projeto'#9'F'
                'CODCENTRORESPON'#9'10'#9'Código C.Resp.'#9'F'
                'NOME'#9'20'#9'Centro Responsabilidade'#9'F'
                'DESCRICAO'#9'20'#9'Tipo Desembolso'#9'F'
                'VALOR'#9'10'#9'Valor'#9'F'
                'CODTIPRECDES'#9'8'#9'Código Atv/Projeto'#9'F'
                'CODCENTROCUSTO'#9'10'#9'Cód.C.Custo'#9'F'
                'CENTROCUSTO'#9'20'#9'Centro Custo'#9'F'
                'IDRESERVAORCAMEN'#9'10'#9'Comp. Orcamen.'#9'F'
                'PLANO'#9'30'#9'Plano'#9'F'
                'PATRO'#9'30'#9'Patrocinadora'#9'F'
                'DESCPROGRAMA'#9'20'#9'Programa'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsRateio
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = True
              OnCalcCellColors = dbgrdContabCalcCellColors
              OnTitleButtonClick = dbgRateioTitleButtonClick
              IndicatorColor = icBlack
              object dbgRateioIButton: TwwIButton
                Left = 0
                Top = 0
                Width = 13
                Height = 25
                AllowAllUp = True
              end
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Emissoes'
            object DbgLote: TwwDBGrid
              Left = 0
              Top = 0
              Width = 740
              Height = 122
              Selected.Strings = (
                'NUMLOTE'#9'10'#9'Lote Nº'
                'NUMCHQBORDERO'#9'14'#9'Nº Cheque Borderô'
                'FAVORECIDO'#9'20'#9'Favorecido'
                'DATAEMISSAO'#9'10'#9'Emissão'
                'DATAPROGRAMADA'#9'15'#9'Dt Programada'
                'DATAVENCTO'#9'15'#9'Dt Vencimento'
                'FLGBAIXA'#9'5'#9'Status'
                'VALOR'#9'16'#9'Valor'
                'DESCRICAO'#9'50'#9'Descrição'
                'NUMOP'#9'15'#9'N. OP')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DsLote
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = dbgrdContabCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = dbgrdContabTopRowChanged
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Parcelas'
            object GrdParcelas: TwwDBGrid
              Left = 0
              Top = 0
              Width = 786
              Height = 226
              Hint = 
                'Dê um duplo click para carregar os dados do documento selecionad' +
                'o'
              Selected.Strings = (
                'NODOCUMENTO'#9'15'#9'Documento'#9'F'
                'COMPLDOCUMENTO'#9'4'#9'Comp'#9'F'
                'HISTORICOCOMPL'#9'29'#9'Historico'#9'F'
                'DATALANCTO'#9'9'#9'Data Lanc'#9'F'
                'VALOR'#9'18'#9'Valor'#9'F'
                'NUMSLIP'#9'15'#9'SLIP'
                'NUMOP'#9'15'#9'N. OP')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DsParcelas
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ParentShowHint = False
              PopupMenu = pmnParcelas
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleAlignment = taCenter
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnDblClick = GrdParcelasDblClick
              IndicatorColor = icBlack
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'PagCCBaixas'
            object dbgCCBaixas: TwwDBGrid
              Left = 0
              Top = 0
              Width = 786
              Height = 226
              Selected.Strings = (
                'PATROCINADORA'#9'22'#9'Patrocinadora'
                'PLANPREVCONTABIL'#9'24'#9'Plano'
                'SEGREGACRITER'#9'25'#9'Critério Segregação'
                'PLACONTA'#9'18'#9'Conta'
                'VALOR'#9'10'#9'Valor')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsCCBaixasXDocum
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = dbgrdContabCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = dbgrdContabTopRowChanged
            end
          end
          object TPage
            Left = 0
            Top = 0
            Caption = 'Eventos'
            object dbgEventos: TwwDBGrid
              Left = 0
              Top = 0
              Width = 786
              Height = 245
              Selected.Strings = (
                'DATAEVENTO'#9'13'#9'Data do Evento'
                'DESC_TIPOEVENTO'#9'38'#9'Tipo do Evento'
                'NOME_USUARIO'#9'53'#9'Usuário')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alTop
              DataSource = dsEventos
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
              ReadOnly = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnCalcCellColors = dbgrdContabCalcCellColors
              IndicatorColor = icBlack
              OnTopRowChanged = dbgrdContabTopRowChanged
            end
            object dbDescricao: TDBMemo
              Left = 0
              Top = 158
              Width = 786
              Height = 68
              Align = alBottom
              DataField = 'DESCRICAO'
              DataSource = dsEventos
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 788
    inherited tb97Fundo: TToolbar97
      Left = 566
      DockPos = 566
      inherited sep1: TToolbarSep97
        Left = 166
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 85
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 971
    Top = 7
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object msDoc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Documento'
    Colunas.Strings = (
      'P.NOME'
      'DATAPROGRAMADA'
      'round(L.VALOR,2)'
      'L.HISTORICOCOMPL'
      'NODOCUMENTO'
      'COMPLDOCUMENTO'
      'D.NUMAPGR'
      'DATAEMISSAO'
      'DATAVENCTO'
      'PT.DESCRICAO'
      'L.DATALANCTO'
      'D.NOSSONUMERO'
      'S.SALDO'
      'P.RAZAOSOCIAL'
      'D.IDPROCESSO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C'
      'N'
      'C'
      'N'
      'D'
      'D'
      'C'
      'D'
      'C'
      'N'
      'C'
      'N')
    Descricao.Strings = (
      'Fornecedor'
      'Programada'
      'Valor'
      'Histórico'
      'Documento'
      'Compl'
      'Nº Ap/Gr'
      'Emissao'
      'Vencimento'
      'Portador x Forma'
      'Data Lançamento'
      'Nosso Número'
      'Saldo'
      'Razão Social'
      'Nº Proc. R.A.D')
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
      'N')
    Tabelas.Strings = (
      'DOCUMENTO D'
      'PESSOA P'
      'LANCTODOCUM L'
      'PORTADORFORMA PT'
      'TIPODOCRECPAG'
      
        '(SELECT D.CODDOCUMENTO, SUM(DECODE(D.RECPAG,'#39'R'#39',DECODE(L.DEBCRE,' +
        #39'D'#39',L.VALOR,L.VALOR*-1), DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1)' +
        ')) AS SALDO FROM DOCUMENTO D, LANCTODOCUM L WHERE (D.CODDOCUMENT' +
        'O = L.CODDOCUMENTO) GROUP BY D.CODDOCUMENTO) S')
    CamposChave.Strings = (
      'D.CODDOCUMENTO'
      'D.NUMFATURA'
      'D.IDPROCESSO')
    Filtro.Strings = (
      'D.IDFORCLI = P.IDPESSOA'
      'D.CODDOCUMENTO = L.CODDOCUMENTO'
      'D.OPERACAO = L.OPERACAO'
      'D.CODPORTFORMA = PT.CODPORTFORMA(+)'
      'D.OPERACAO IN (1,2,3,10,11,13,14,15,16,17)'
      
        '((RTRIM(L.HISTORICOCOMPL) <> '#39'ESTORNO'#39') OR (L.HISTORICOCOMPL IS ' +
        'NULL))'
      'TIPODOCRECPAG.CODTIPDOC=D.CODTIPDOC'
      'D.CODDOCUMENTO = S.CODDOCUMENTO')
    Mascaras.Strings = (
      ''
      'DD/MM/YYYY'
      '#,##0.00'
      ''
      ''
      ''
      ''
      'DD/MM/YYYY'
      'DD/MM/YYYY'
      ''
      'DD/MM/YYYY'
      ''
      '#,##0.00'
      ''
      '')
    Larguras.Strings = (
      '25'
      '10'
      '10'
      '30'
      '15'
      '3'
      '10'
      '10'
      '50'
      '10'
      '20'
      '10'
      '60'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
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
    Left = 715
    Top = 65517
  end
  object dsDocs: TwwDataSource
    DataSet = CdsDocs
    Left = 198
    Top = 335
  end
  object dsContab: TwwDataSource
    DataSet = CdsContab
    Left = 253
    Top = 335
  end
  object dsRateio: TwwDataSource
    DataSet = CdsRateio
    Left = 627
    Top = 319
  end
  object DsParcelas: TwwDataSource
    DataSet = CdsParcelas
    Left = 517
    Top = 319
  end
  object DsLote: TwwDataSource
    DataSet = CdsLote
    Left = 568
    Top = 319
  end
  object SqlRateio: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.IDRESERVAORCAMEN,'
      '   PRG.DESCPROGRAMA,'
      '   PRV.NOME AS PLANO,'
      '   P.NOME AS PATRO,'
      '   R.CODDOCUMENTO,'
      '   R.CODTIPRECDES,'
      '   R.RECPAG,'
      '   R.IDPESSOA,'
      '   C.CODEXTERNO AS CODCENTRORESPON,'
      '   CC.CODEXTERNO AS CODCENTROCUSTO,'
      '   CC.NOME AS CENTROCUSTO,'
      '   R.UNIDNEGOC,'
      '   R.MOECODIGO,'
      '   R.VALOR,'
      '   R.VALOROUTRAMOEDA,'
      '   C.NOME,T.DESCRICAO,'
      '   U.NOME,'
      '   U.UNECODIGO'
      'FROM'
      '   RATEIODOCUM R,'
      '   PESSOA P,'
      '   PLANPREVCONTABIL PRV,'
      '   CENTRESPON C,'
      '   CENTCUST CC,'
      '   TIPORECEBDESEMB T,'
      '   PROGRAMA PRG,   '
      '   UNIDNEGOCIO U'
      'WHERE'
      '   (R.CODDOCUMENTO    = :CODDOCUMENTO) AND'
      '   (R.IDPROGRAMA      = PRG.IDPROGRAMA(+)) AND'
      '   (R.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+)) AND'
      '   (R.IDEMPRESA       = CC.IDEMPRESA(+)) AND'
      '   (R.IDPATRO         = P.IDPESSOA) AND'
      '   (R.IDPLANOPREV     = PRV.IDPLANOPREV) AND'
      '   (R.IDPESSOA        = C.IDPESSOA(+)) AND'
      '   (R.CODCENTRORESPON = C.CODCENTRORESPON(+)) AND'
      '   (R.IDPESSOA        = T.IDPESSOA(+)) AND'
      '   (R.CODTIPRECDES    = T.CODTIPRECDES(+)) AND'
      '   (R.RECPAG          = T.RECPAG(+)) AND'
      '   (R.IDPESSOA        = U.IDPESSOA(+)) AND'
      '   (R.UNIDNEGOC       = U.UNIDNEGOC(+))'
      ''
      ''
      ''
      ' '
      ' ')
    ClientDataSet = CdsRateio
    Left = 629
    Top = 230
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 629
    Top = 254
  end
  object CdsLote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 565
    Top = 262
  end
  object SqlLote: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   LX.NUMLOTE,LX.VALOR,LX.FLGBAIXA,LP.DATAEMISSAO, LP.NUMCHQBORD' +
        'ERO, LP.FAVORECIDO,'
      
        '   decode(LP.FLAGEMISSAO,'#39'1'#39','#39'Emitido'#39','#39'Pendente'#39') as emissao ,p' +
        'f.descricao  ,'
      
        '   LP.FLAGEMISSAO, D.DATAVENCTO, D.DATAPROGRAMADA, LP.NUMSLIP NU' +
        'MOP'
      'FROM'
      '   LOTEXDOCUM LX, LOTEPAGTO LP, DOCUMENTO D ,portadorforma pf'
      'WHERE'
      '   D.CODDOCUMENTO = :CODDOCUMENTO AND'
      '   lp.codportforma= pf.codportforma(+) and'
      '   LX.NUMLOTE = LP.NUMLOTE AND'
      '   LX.CODDOCUMENTO = D.CODDOCUMENTO'
      'ORDER BY'
      '   LX.NUMLOTE, LX.FLGBAIXA'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsLote
    Left = 565
    Top = 230
  end
  object CdsParcelas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 509
    Top = 262
  end
  object SqlParcelas: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '   DP.NODOCUMENTO, DP.CODDOCUMENTO, DP.IDPROCESSO, DP.COMPLDOCUM' +
        'ENTO, DOC.DATAVENCTO, DOC.DATAPROGRAMADA,'
      '   LP.VALOR, LP.DEBCRE, LP.DATALANCTO, DP.NUMFATURA,'
      
        '   LP.HISTORICOCOMPL, DP.NUMSLIP, '#39'           '#39' NUMOP, DP.CODDOC' +
        'UMENTO'
      'FROM'
      '   DOCUMENTO DP, DOCUMENTO DOC, LANCTODOCUM LP'
      'WHERE'
      '  (DOC.CODDOCUMENTO    = LP.CODDOCUMENTO) AND'
      '  (DOC.NUMFATURA       = DP.NUMFATURA)    AND'
      '  (DOC.OPERACAO        = LP.OPERACAO)     AND'
      '  (DP.CODDOCUMENTO    = LP.CODDOCUMENTO) AND'
      '  (DP.OPERACAO        = LP.OPERACAO)     AND'
      '  (RTRIM(DP.OPERACAO) = :OPERACAO)       AND'
      '  (DOC.NUMFATURA       = :NUMFATURA)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsParcelas
    Left = 509
    Top = 238
  end
  object CdsContab3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 381
    Top = 294
  end
  object SqlContab3: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '    LACDEBCRE,'
      '    PLACONTA,'
      '    LACVALOR,'
      '    NOMECC,'
      '    NOMEAP,'
      '    NOMESUBCONTA,'
      '    HISTLANCAMENTOCONTABIL,'
      '    PLNCODIGO,'
      '    PLNPLANIL'
      'FROM'
      '  (SELECT'
      '      Q2.LACDEBCRE,'
      '      Q2.PLACONTA,'
      '      ((Q1.VALOR * Q2.LACVALOR)/ Q3.VALOR) AS LACVALOR,'
      '      Q2.NOMECC,'
      '      Q2.NOMEAP,'
      '      Q2.NOMESUBCONTA,'
      '      Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL,'
      '      Q2.PLNCODIGO,'
      '      Q2.PLNPLANIL'
      '   FROM'
      '     (SELECT'
      
        '         LAN.VALOR, DOC.NUMFATURA, '#39'LANÇAMENTO DO DOCUMENTO '#39' ||' +
        ' DOC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL A' +
        'S HISTORICOCOMPL'
      '      FROM'
      '         PESSOA P,'
      '         DOCUMENTO DOC,'
      '         LANCTODOCUM LAN'
      '      WHERE'
      '        (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '        ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '        (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '        (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '     (SELECT'
      
        '         DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,' +
        ' LAN.VALOR,'
      
        '         CC.NOME AS NOMECC, AP.NOME AS NOMEAP, SC.NOMESUBCONTA, ' +
        'LC.PLNCODIGO,'
      
        '         LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST' +
        '4 || LC.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '         PL.PLNPLANIL'
      '      FROM'
      '         DOCUMENTO DOC,'
      '         LANCTODOCUM LAN,'
      '         LANCAMENTO LC,'
      '         SUBCONTA SC,'
      '         CENTCUST CC,'
      '         UNIDNEGOCIO AP,'
      '         PLANILHA PL'
      '      WHERE'
      '         (LAN.OPERACAO = '#39'1'#39')                       AND'
      '         (PL.PLNCODIGO = LC.PLNCODIGO)              AND'
      '         (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)      AND'
      '         (AP.UNIDNEGOC(+) = LC.UNIDNEGOC)           AND'
      '         (AP.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '         (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND'
      '         (SC.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '         (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '         (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND'
      '         (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2,'
      
        '      (SELECT D.NUMFATURA, SUM(L.VALOR) AS VALOR FROM LANCTODOCU' +
        'M L, DOCUMENTO D'
      '       WHERE (L.OPERACAO = '#39'1'#39') AND'
      '             (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '             (D.OPERACAO = L.OPERACAO)'
      '             GROUP BY D.NUMFATURA) Q3'
      
        '  WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUM' +
        'FATURA)'
      ' UNION ALL'
      '  SELECT'
      '    DEBCRE AS LACDEBCRE,'
      '    CONTACONTABIL AS PLACONTA,'
      '    VALOR AS LACVALOR,'
      '    NOMECC,'
      '    NOMEAP,'
      '    NOMESUBCONTA,'
      '    HISTORICO AS HISTLANCAMENTOCONTABIL,'
      '    PLNCODIGO,'
      '    PLNPLANIL'
      '  FROM'
      '   (SELECT'
      '       PC.PLACONTA AS CONTACONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       '#39#39' AS NOMESUBCONTA,'
      '       '#39#39' AS NOMEAP,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '       L.VALOR, PL.PLNCODIGO, PL.PLNPLANIL'
      '    FROM'
      '       PESSOA PB,'
      '       PESSOA PD,  '
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       TIPODOCRECPAG TD,'
      '       CENTCUST CC,'
      '      (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '       FROM'
      '           LANCTODOCUM'
      '       WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.STATUS = '#39'2'#39') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))' +
        ') AND'
      '       (D.CODDOCUMENTO = :CODDOCUMENTO)           AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO)       AND'
      '       (D.IDFORCLI = PD.IDPESSOA)                 AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)                AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)          AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'          AND'
      '       (B.IDPESSOA = PB.IDPESSOA)                 AND'
      '       (D.IDFORCLI = E.IDFORCLI)                  AND'
      '       (D.IDPESSOA = E.IDPESSOA)                  AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)           AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)               AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)               AND'
      '       (CC.CODCENTROCUSTO(+) = PC.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = PC.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      '  UNION'
      '    SELECT'
      
        '       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTAC' +
        'ONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       SC.NOMESUBCONTA,'
      '       '#39#39' AS NOMEAP,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       L.DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNCODIGO,'
      '       PL.PLNPLANIL'
      '    FROM'
      '       PESSOA PB,'
      '       PESSOA PD,'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       TIPODOCRECPAG TD,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '        FROM'
      '           LANCTODOCUM'
      '        WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.STATUS = '#39'2'#39') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))' +
        ') AND'
      '       (D.CODDOCUMENTO = :CODDOCUMENTO)     AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '       (D.IDFORCLI = PD.IDPESSOA)           AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)          AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'    AND'
      '       (B.IDPESSOA = PB.IDPESSOA)           AND'
      '       (D.IDFORCLI = E.IDFORCLI)            AND'
      '       (D.IDPESSOA = E.IDPESSOA)            AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)         AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '       (SC.CODSUBCONTA(+) = D.CODSUBCONTA)       AND'
      '       (SC.IDPESSOA(+) = D.IDPESSOA)             AND'
      '       (CC.CODCENTROCUSTO(+) = D.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = D.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      '     ))'
      'ORDER BY LACDEBCRE'
      ''
      ''
      '')
    ClientDataSet = CdsContab3
    Left = 381
    Top = 246
  end
  object CdsContabLanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 541
    Top = 190
  end
  object SqlContabLanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    LACDEBCRE,'
      '    PLACONTA,'
      '    LACVALOR,'
      '    PLNCODIGO,'
      '    PLNPLANIL,'
      '    NOMECC,'
      '    NOMEAP,'
      '    NOMESUBCONTA,'
      '    HISTLANCAMENTOCONTABIL,'
      '    OPERACAO'
      'FROM'
      '(SELECT'
      '  LC.LACDEBCRE,'
      '  LC.PLACONTA,'
      '  LC.LACVALOR,'
      '  LC.PLNCODIGO,'
      '  PL.PLNPLANIL,'
      '  CC.NOME AS NOMECC,'
      '  AP.NOME AS NOMEAP,'
      '  SC.NOMESUBCONTA,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '  LAN.OPERACAO'
      ' FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC,'
      '  PLANILHA PL,'
      '  SUBCONTA SC,'
      '  CENTCUST CC,'
      '  UNIDNEGOCIO AP'
      ' WHERE'
      '  (DOC.CODDOCUMENTO = :CODDOCUMENTO)         AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)      AND'
      '  (LAN.PLNCODIGO    = LC.PLNCODIGO)          AND'
      '  (AP.UNIDNEGOC(+) = LC.UNIDNEGOC)           AND'
      '  (AP.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '  (SC.CODSUBCONTA(+) = LC.CODSUBCONTA)       AND'
      '  (SC.IDPESSOA(+) = LC.IDPESSOA)             AND'
      '  (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO) AND'
      '  (CC.IDEMPRESA(+) = LC.IDEMPRESA)           AND'
      '  (PL.PLNCODIGO = LC.PLNCODIGO)'
      'UNION ALL'
      'SELECT'
      '    DEBCRE AS LACDEBCRE,'
      '    CONTACONTABIL AS PLACONTA,'
      '    VALOR AS LACVALOR,'
      '    PLNCODIGO,'
      '    PLNPLANIL,'
      '    NOMECC,'
      '    NOMEAP,'
      '    NOMESUBCONTA,'
      '    HISTORICO AS HISTLANCAMENTOCONTABIL,'
      '    OPERACAO'
      'FROM'
      '   (SELECT'
      '       PC.PLACONTA AS CONTACONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       '#39#39' AS NOMESUBCONTA,'
      '       '#39#39' AS NOMEAP,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNCODIGO,'
      '       PL.PLNPLANIL,'
      '       L.OPERACAO'
      '    FROM'
      '       PESSOA PB,'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       TIPODOCRECPAG TD,'
      '       PESSOA PD,'
      '       CENTCUST CC,'
      '      (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '       FROM'
      '           LANCTODOCUM'
      '       WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.STATUS = '#39'2'#39') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))' +
        ') AND'
      '       (D.CODDOCUMENTO = :CODDOCUMENTO)           AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO)       AND'
      '       (D.IDFORCLI = PD.IDPESSOA)                 AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)                AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)          AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)          AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'          AND'
      '       (B.IDPESSOA = PB.IDPESSOA)                 AND'
      '       (D.IDFORCLI = E.IDFORCLI)                  AND'
      '       (D.IDPESSOA = E.IDPESSOA)                  AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)           AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)               AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)               AND'
      '       (CC.CODCENTROCUSTO(+) = PC.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = PC.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      ''
      'UNION'
      '    SELECT'
      
        '       DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTAC' +
        'ONTABIL,'
      '       CC.NOME AS NOMECC,'
      '       SC.NOMESUBCONTA,'
      '       '#39#39' AS NOMEAP,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       L.DEBCRE,'
      '       L.VALOR,'
      '       PL.PLNCODIGO,'
      '       PL.PLNPLANIL,'
      '       L.OPERACAO'
      '    FROM'
      '       PESSOA PB,'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       EMPRESAFORN E,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA P,'
      '       PORTADORCONTA PC,'
      '       PLANILHA PL,'
      '       AGENCIABANCARIA AG,'
      '       BANCO B,'
      '       TIPODOCRECPAG TD,'
      '       PESSOA PD,'
      '       SUBCONTA SC,'
      '       CENTCUST CC,'
      '       (SELECT'
      '           VALOR,CODDOCUMENTO, DATALANCTO'
      '        FROM'
      '           LANCTODOCUM'
      '        WHERE OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39')) LANC'
      '    WHERE'
      
        '       ((D.STATUS = '#39'2'#39') OR ((D.STATUS = 0) AND (L.ESTORNO > 0))' +
        ') AND'
      '       (D.CODDOCUMENTO = :CODDOCUMENTO)     AND'
      '       (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '       (D.IDFORCLI = PD.IDPESSOA)           AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.NUMLANCTO = L.NUMLANCTO)          AND'
      '       (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '       (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '       (PC.IDBANCO = B.IDPESSOA)'#9'    AND'
      '       (B.IDPESSOA = PB.IDPESSOA)           AND'
      '       (D.IDFORCLI = E.IDFORCLI)            AND'
      '       (D.IDPESSOA = E.IDPESSOA)            AND'
      '       (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '       (PL.PLNCODIGO = L.PLNCODIGO)         AND'
      '       (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '       (SC.CODSUBCONTA(+) = D.CODSUBCONTA)       AND'
      '       (SC.IDPESSOA(+) = D.IDPESSOA)             AND'
      '       (CC.CODCENTROCUSTO(+) = D.CODCENTROCUSTO) AND'
      '       (CC.IDEMPRESA(+) = D.IDEMPRESA)           AND'
      '       (TD.CODTIPDOC = D.CODTIPDOC)'
      '     ))'
      'ORDER BY LACDEBCRE'
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsContabLanc
    Left = 741
    Top = 198
  end
  object CdsDocs: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 197
    Top = 286
  end
  object SqlDocs: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '       D.CODDOCUMENTO,'
      '       D.NODOCUMENTO,'
      '       D.COMPLDOCUMENTO,'
      '       D.IDFORCLI,'
      '       D.DATAPROGRAMADA,'
      '       D.DATAEMISSAO,'
      '       D.DATAVENCTO,'
      '       D.OPERACAO AS OPERDOC,'
      '       M.NOMEMODULO,'
      '       US.NOMEUSUARIO,'
      '       L.NUMLANCTO,'
      '       L.ESTORNO,'
      '       L.PLNCODIGO,'
      '       R.CODLANCFINANC,     '
      '       L.CODALTERADOR,'
      '       R.NUMLOTE,'
      '       R.DATACFLOAT,'
      '       D.NUMAPGR,'
      ''
      '       L.VALOR,'
      
        '       DECODE (P.RAZAOSOCIAL,NULL,P.NOME,P.RAZAOSOCIAL) AS FORNE' +
        'CEDOR,'
      '       D.STATUS,'
      ''
      ''
      
        '       DECODE (D.STATUS,0, -- Documento em aberto aguardando um ' +
        'pagamento'
      
        '                          DECODE(RTRIM(D.OPERACAO),'#39'11'#39','#39'Previsã' +
        'o a Parcelar'#39','
      
        '                                                   '#39'13'#39','#39'Parcela' +
        ' de Previsão'#39','
      
        '                                                   '#39'12'#39','#39'Previsã' +
        'o que não será Parcelada'#39','
      
        '                                                   '#39'1'#39', '#39'Documen' +
        'to a Parcelar'#39','
      
        '                                                   '#39'3'#39', DECODE((' +
        'SELECT COUNT(NUMFATURA)FROM DOCUMENTO WHERE NUMFATURA = D.NUMFAT' +
        'URA),1,'#39'Parcela de Documento'#39','
      
        '                                                                ' +
        '                                                                ' +
        '       '#39'Documento Englobado'#39'),'
      
        '                                                   '#39'14'#39','#39'Prev. A' +
        'diantamento'#39','
      '                                                   '#39'Em Aberto'#39'),'
      ''
      ''
      ''
      
        '                        1, -- Documento em aberto aguardando um ' +
        'recebimento. Opção mais utilizada no CAR'
      
        '                          DECODE(RTRIM(D.OPERACAO),'#39'11'#39','#39'Previsã' +
        'o a Parcelar'#39','
      
        '                                                   '#39'13'#39','#39'Parcela' +
        ' de Previsão'#39','
      
        '                                                   '#39'12'#39','#39'Previsã' +
        'o que não será Parcelada'#39','
      
        '                                                   '#39'1'#39', '#39'Documen' +
        'to a Parcelar'#39','
      
        '                                                   '#39'3'#39', DECODE((' +
        'SELECT COUNT(NUMFATURA)FROM DOCUMENTO WHERE NUMFATURA = D.NUMFAT' +
        'URA),1,'#39'Parcela de Documento'#39','
      
        '                                                                ' +
        '                                                                ' +
        '       '#39'Documento Englobado'#39'),'
      
        '                                                   '#39'14'#39','#39'Prev. A' +
        'diantamento'#39','
      '                                                   '#39'Em Aberto'#39'),'
      ''
      '                        2, -- Documento baixado'
      
        '                          DECODE(RTRIM(D.OPERACAO),'#39'2'#39', '#39'Liquida' +
        'do'#39','
      
        '                                                   '#39'10'#39','#39'Liquida' +
        'do'#39','
      
        '                                                   '#39'3'#39',DECODE((S' +
        'ELECT COUNT(NUMFATURA)FROM DOCUMENTO WHERE NUMFATURA = D.NUMFATU' +
        'RA),1,'#39'Parcela de Documento Liquidada'#39','
      
        '                                                                ' +
        '                                                                ' +
        '      '#39'Documento Englobado Liquidado'#39'),'
      
        '                                                   '#39'15'#39','#39'Adianta' +
        'mento Baixado'#39','
      
        '                                                   '#39'17'#39','#39'Adianta' +
        'mento Regularizado'#39','
      
        '                                                   '#39'1'#39', '#39'Parcela' +
        'do'#39','
      
        '                                                   '#39'11'#39','#39'Previsã' +
        'o Parcelada'#39','
      
        '                                                   '#39'12'#39','#39'Previsã' +
        'o Liquidada'#39','
      
        '                                                   '#39'13'#39','#39'Previsã' +
        'o da Parcela Liquidada'#39')) AS DESCSTATUSDOC,'
      ''
      ''
      ''
      '       L.NUMLANCTO,'
      '       L.CODALTERADOR,'
      '       L.PLNCODIGO,'
      '       L.DATALANCTO,'
      '       L.VALOR,'
      '       L.VALOROUTRAMOEDA,'
      '       L.DEBCRE,'
      '       L.OPERACAO AS OPERLANC,'
      '       L.HISTORICOCOMPL,'
      '       L.ESTORNO,'
      '       LTRIM (RTRIM (R.NUMCHQBORDERO)) AS CHEQUE,'
      
        '       DECODE (PF.DESCRICAO,NULL,TA.DESCRICAO,PF.DESCRICAO) AS D' +
        'ESCRICAO,'
      '       DECODE (L.OPERACAO,'#39'2'#39', '#39'Lançamento'#39','
      '                          '#39'5'#39', '#39'Pagamento'#39','
      '                          '#39'3'#39', '#39'Parcelas'#39','
      '                          '#39'4'#39', '#39'Alterador'#39','
      '                          '#39'14'#39','#39'Prev. Adiantamento'#39','
      '                          '#39'15'#39','#39'Adiantamento'#39','
      '                          '#39'16'#39','#39'Alterador de Adianto'#39','
      '                          '#39'1'#39', '#39'Origem de Parcelas'#39','
      '                          '#39'17'#39','#39'Regulariz. Adianto'#39','
      '                          '#39'11'#39','#39'Origem de Parcelas de Previsao'#39','
      '                          '#39'12'#39','#39'Previsão de Documento'#39','
      '                          '#39'13'#39','#39'Parcelas de Previsão'#39','
      
        '                          '#39'10'#39','#39'Lança e Baixa Automática'#39','#39#39') AS' +
        ' HIST,'
      '       FRP.DESCRICAO AS DESCRFORMARP,'
      '       D.NUMLEITCODBARRAS,'
      '       D.NUMDIGCODBARRAS,'
      '       P.RAZAOSOCIAL,'
      '       D.NUMFATURA,'
      '       L.OPERACAO,'
      '       D.NUMSLIP,'
      '       '#39'          '#39' NUMOP,'
      '       TP.DESCRICAO AS TIPODOC,'
      '       NVL(TP.FLGDOCFISCAL, '#39'S'#39')  AS FLGDOCFISCAL,'
      '       D.OBS'
      '  FROM'
      '       PESSOA P,'
      '       DOCUMENTO D,'
      '       LANCTODOCUM L,'
      '       RECBTOPAGTO R,'
      '       PORTADORFORMA PF,'
      '       TIPOALTERADOR TA,'
      '       FORMARECPAG FRP,'
      '       TIPODOCRECPAG TP,'
      '       MODULO M,'
      '       USUARIOSISTEMA US'
      ''
      ''
      ' WHERE (D.CODDOCUMENTO      = :CODDOCUMENTO)'
      '   AND (D.IDUSUARIOINCLUSAO = US.IDUSUARIO)'
      '   AND (D.IDMODULO          = M.IDMODULO)'
      '   AND (D.IDFORCLI          = P.IDPESSOA)'
      '   AND (D.CODDOCUMENTO      = L.CODDOCUMENTO)'
      '   AND (L.NUMLANCTO         = R.NUMLANCTO (+))'
      '   AND (L.CODDOCUMENTO      = R.CODDOCUMENTO (+))'
      '   AND (R.CODPORTFORMA      = PF.CODPORTFORMA (+))'
      '   AND (L.CODALTERADOR      = TA.CODALTERADOR (+))'
      '   AND (D.CODFORMA          = FRP.CODFORMA (+))'
      '   AND (D.CODTIPDOC         = TP.CODTIPDOC)'
      ' ORDER BY'
      '    L.OPERACAO'
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
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDocs
    Left = 197
    Top = 238
  end
  object sSql: TCMSqlParams
    ClientDataSet = Cds
    Left = 677
    Top = 230
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 677
    Top = 278
  end
  object SqlContab: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    LD.CODDOCUMENTO,'
      '    LD.NUMLANCTO,'
      ''
      '    P.PLNDATDIA,'
      '    P.PLNPLANIL,'
      '    LC.PLNCODIGO,'
      '    LC.LACNUMLAN,'
      '    LC.LACDEBCRE,'
      '    LC.PLACONTA,'
      '    LD.OPERACAO,'
      '    LC.LACVALOR,'
      '    CC.CODEXTERNO AS CODCENTROCUSTO,'
      '    CC.NOME AS NOMECC,'
      '    PRV.NOME AS PLANO,'
      '    PS.NOME AS PATRO,'
      '    AP.NOME AS NOMEAP,'
      '    SC.NOMESUBCONTA,'
      '    LC.IDSEGREGACONTR,'
      '    S.DESCRICAO,'
      
        '    LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || ' +
        'LC.LACHIST5 AS HISTLANCAMENTOCONTABIL     '
      '    '
      'FROM'
      '    PLANILHA P,'
      '    LANCAMENTO LC,'
      '    LANCTODOCUM LD,'
      '    CENTCUST CC,'
      '    UNIDNEGOCIO AP,'
      '    PESSOA PS,'
      '    SUBCONTA SC,'
      '    PLANPREVCONTABIL PRV,'
      '    SEGREGACRITER S'
      ''
      ''
      'WHERE'
      '       (P.PLNCODIGO          = LC.PLNCODIGO)'
      '   AND (PS.IDPESSOA          = LC.IDPATRO)'
      '   AND (PRV.IDPLANOPREV      = LC.IDPLANOPREV)'
      ''
      
        '   AND ( (LC.PLNCODIGO         = LD.PLNCODIGO)  OR  (LD.PLNANTEC' +
        'IPA = LC.PLNCODIGO) )'
      ''
      '   AND (CC.CODCENTROCUSTO(+) = LC.CODCENTROCUSTO)'
      '   AND (CC.IDEMPRESA(+)      = LC.IDEMPRESA)'
      '   AND (AP.UNIDNEGOC(+)      = LC.UNIDNEGOC)'
      '   AND (AP.IDPESSOA(+)       = LC.IDPESSOA)'
      '   AND SC.CODSUBCONTA(+)     = LC.CODSUBCONTA'
      '   AND SC.IDPESSOA(+)        = LC.IDPESSOA'
      '   AND LC.IDSEGREGACRITER    = S.IDSEGREGACRITER(+)'
      '   AND LD.CODDOCUMENTO       = :CODDOCUMENTO'
      ''
      'ORDER BY'
      '   LD.CODDOCUMENTO, LC.LACNUMLAN, LD.NUMLANCTO'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = CdsContab
    Left = 253
    Top = 238
  end
  object CdsContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 286
  end
  object SqlRad: TCMSqlParams
    ClientDataSet = cdsRAD
    Left = 448
    Top = 320
  end
  object cdsRAD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 240
  end
  object CdsCCBaixasXDocum: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 119
    Top = 286
  end
  object dsCCBaixasXDocum: TwwDataSource
    AutoEdit = False
    DataSet = CdsCCBaixasXDocum
    Left = 119
    Top = 335
  end
  object sqlCCBaixasXDocum: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  PT.NOME AS PATROCINADORA, PL.NOME AS PLANPREVCONTABIL, S.DESCR' +
        'ICAO AS SEGREGACRITER,'
      '  CC.PLACONTA, CC.VALOR,'
      
        '  CC.IDPATRO, CC.IDPLANOPREV, CC.IDSEGREGACRITER, CC.PLANO, CC.U' +
        'NIDNEGOC, CC.IDPESSOA'
      'FROM'
      '  CCBAIXASXDOCUM CC, PESSOA PT, PATRO PA, PLANPREVCONTABIL PL,'
      '  SEGREGACRITER S'
      'WHERE'
      '  CC.CODDOCUMENTO = :CODDOCUMENTO'
      '  AND ( CC.IDPATRO = PA.IDPESSOA )'
      '  AND ( PA.IDPESSOA = PT.IDPESSOA )'
      '  AND ( CC.IDPLANOPREV = PL.IDPLANOPREV )'
      '  AND ( CC.IDSEGREGACRITER = S.IDSEGREGACRITER(+) )'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsCCBaixasXDocum
    Left = 118
    Top = 239
  end
  object DsRAD: TwwDataSource
    DataSet = cdsRAD
    Left = 440
    Top = 271
  end
  object sqlProcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  IDPROCESSO, '
      
        '  DECODE(FLGOK, '#39'N'#39', '#39'PENDENTE'#39', '#39'S'#39', '#39'AUTORIZADO'#39', '#39'E'#39', '#39'EXCLUÍ' +
        'DO'#39', '#39'R'#39', '#39'RECUSADO'#39') AS STATUS '
      'FROM RADINSTPROCESSO '
      'WHERE IDPROCESSO = :idprocesso')
    ClientDataSet = cdsProcesso
    Left = 318
    Top = 246
  end
  object cdsProcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 318
    Top = 293
  end
  object dsProcesso: TwwDataSource
    DataSet = cdsProcesso
    Left = 319
    Top = 338
  end
  object pmnParcelas: TPopupMenu
    TrackButton = tbLeftButton
    Left = 689
    Top = 338
    object mnuSelDocumento: TMenuItem
      Caption = 'Selecionar documento'
      OnClick = GrdParcelasDblClick
    end
  end
  object SqlEventos: TCMSqlParams
    SQL.Strings = (
      'SELECT  '
      '        PU.NOME AS NOME_USUARIO, '
      '        ED.IDEVENTOXDOCUM,    '
      '        ED.CODDOCUMENTO,      '
      '        ED.IDTIPOEVENTODOCUM, '
      '        ED.IDUSUARIO,         '
      '        ED.DATAEVENTO,        '
      '        ED.DESCRICAO,         '
      '        P.NOME,               '
      '        P.RAZAOSOCIAL,        '
      '        T.DESCRICAO AS DESC_TIPOEVENTO,'
      
        '        RTRIM(TO_CHAR(D.NODOCUMENTO)) || '#39' '#39' || D.COMPLDOCUMENTO' +
        ' AS DOCCOMPL, '
      '        D.DATAPROGRAMADA      '
      
        '  FROM  EVENTOXDOCUM ED, PESSOA P, DOCUMENTO D, TIPOEVENTODOCUM ' +
        'T,'
      '        PESSOA PU '
      ' WHERE  '
      
        '        D.CODDOCUMENTO         = :CODDOCUMENTO                 A' +
        'ND'
      
        '        D.IDFORCLI                        = P.IDPESSOA          ' +
        '                  AND'
      '        ED.CODDOCUMENTO       = D.CODDOCUMENTO              AND'
      '        T.IDTIPOEVENTODOCUM = ED.IDTIPOEVENTODOCUM  AND'
      
        '        PU.IDPESSOA                     = ED.IDUSUARIO          ' +
        '           AND'
      ' '
      '        T.FLGATIVO                         = 1                '
      '  ORDER BY ED.DESCRICAO                                  ')
    ClientDataSet = CdsEventos
    Left = 26
    Top = 240
  end
  object CdsEventos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 27
    Top = 287
  end
  object dsEventos: TwwDataSource
    AutoEdit = False
    DataSet = CdsEventos
    Left = 27
    Top = 336
  end
end
