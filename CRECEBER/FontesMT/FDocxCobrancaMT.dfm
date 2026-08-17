inherited FrmDocxCobrancaMT: TFrmDocxCobrancaMT
  Left = -1
  Top = 93
  HelpContext = 40036
  ActiveControl = CmbCobranca
  BorderStyle = bsSingle
  Caption = 'Relaciona Documentos com Contas Caixas X Tipo de Cobrança'
  ClientHeight = 468
  ClientWidth = 789
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 789
    Height = 429
    object Panel1: TPanel [0]
      Left = 5
      Top = 5
      Width = 779
      Height = 140
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 661
        Top = 79
        Width = 110
        Height = 50
        Caption = 'Seleciona'
        Glyph.Data = {
          F6060000424DF606000000000000760000002800000063000000200000000100
          0400000000008006000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777777777777777777777777777777777777777777
          7777777778877777777777770000777777777777777777770077777777777777
          7777777777777777788777777777777777777777777777788888877777777777
          000077777777777777777700FF077777777777777777777777777FF887F87777
          77777777777777777777788880088777777777770000777777777777777700FF
          FF0777777777777777777777777FF88777F87777777777777777777777788880
          0FF088777777777000007777777777777700FFFFFFF077777777777777777777
          7FF88777777F877777777777777777777888800FFFF088777777777700007777
          7777788800FFFFFFFFF07777777777777777777FF8877777777F877777777777
          7777777888800FFFFFFF08877777777700007777777744008FFFFFFFFFFF0777
          7777777777777FF8877777777FF7F8777777777777777788800FFFFFFFFF0887
          77777777000077777774224488FFFFFFCCFF077777777777777FF77FF877777F
          F887F877777777777777744008FFFFFFFFFFF088777777770000777777A22224
          488FFFCCFFFFF077777777777FF87777FF877FF887FF7F877777777777774224
          488FFFFFFCCFF08877777777000077777A2222224488CCFFFCCFF07777777777
          7F8777777FF87887FF887F8777777777777A22224488FFFCCFFFFF088777777F
          000077777A22222224488FFCCFFFFF07777777777F87777777FF877F887FF7F8
          7777777777A2222224488CCFFFCCFF0887777777000077777A222222224488CF
          FFCCFF07777777777F877777777FF8787FF887F87777777777A22222224488FF
          CCFFFFF088777777000077777A2222222224488FCCFFFFF0777777777F877777
          7777FF877887FF7F8777777778A222222224488CFFFCCFF08877777700007777
          0A22222222224488FFFCCFF077777777F887777777777FF877FF887F87777777
          88A2222222224488FCCFFFFF0887777700007770FA22222AA22224488CCFFFFF
          0777777F87877777887777FF87887FF7F877777780A22222222224488FFFCCFF
          088777770000770FFA222248AA22224488FFCCFF077777F87787777F7887777F
          F877F887F87777780FA22222AA22224488CCFFFFF08877770000770FFA222248
          CAA22224488CFFFFF07777F87787777F78887777FF8787FF7F877770FFA22224
          8AA22224488FFCCFF088777700007770FA222248FFAA22224488FCCFF077777F
          8787777F77F887777FF87F887F877770FFA222248CAA22224488CFFFFF088777
          000077700AA22248FCCAA2222488CFFFFF07777F8888777F7788887777F8787F
          F7F877770FA222248FFAA22224488FCCFF0887770000777070A2224FFFFFAA22
          24488FCCFF07777F8F88777F777FF88777FF877887F8777700AA22248FCCAA22
          22488CFFFFF088770000770FF7AAAA2FFFCCFAA2224488FFFFF077F877F88888
          77788788777FF877777F8777070A2224FFFFFAA2224488FCCFF088770000770F
          FF70FFF0FFFFFCAA2224488FFFF077F8777F877F8777FF888777FF87777F8770
          FF7AAAA2FFFCCFAA2224488FFFFF0877000070FFFFF70FF0FFFCCFFAA2224488
          FFFF0F877777F87F8777887788777FF87777F870FFF70FFF0FFFFFCAA2224488
          FFFF0887000070FFFFFF70FF0FFFFFCCAA2224488FFF0F8777777F87F8777FF8
          888777FF877FF80FFFFF70FF0FFFCCFFAA2224488FFFF08700007700FFFFF707
          0FFFCCFFFAA222448F0077F8877777F8F87778877788777F8FF8870FFFFFF70F
          F0FFFFFCCAA2224488FFF0770000777700FFFF7070FFFFFFFFAA22240077777F
          F887777F8F87777777788777888777700FFFFF7070FFFCCFFFAA222448F00777
          000077777700FFF700FFFF00007AA224877777777FF88777F887777888878877
          87777777700FFFF7070FFFFFFFFAA2224007777700007777777700FF700FF077
          7707AA2487777777777FF8877F887787777878878777777777700FFF700FFFF0
          0007AA22487777770000777777777700F7000FFFFF707AA27777777777777FF8
          87F8887777778788877777777777700FF700FF0777707AA24877777F00007777
          77777777000FFFFFFFF70777777777777777777FF88877777777787777777777
          777777700F7000FFFFF707AA2777777700007777777777777700000000000777
          77777777777777777FF888888888887777777777777777777000FFFFFFFF7077
          77777777000077777777777777777777777777777777777777777777777FFFFF
          FFFFF77777777777777777777770000000000077777777770000}
        NumGlyphs = 3
        OnClick = SpeedButton1Click
      end
      object GroupBox1: TGroupBox
        Left = 252
        Top = 4
        Width = 119
        Height = 69
        Caption = ' Data de Emissão '
        TabOrder = 0
        object DataEmissIni: TCMDateTimePicker
          Left = 13
          Top = 17
          Width = 96
          Height = 21
          Hint = 'Data Programada para Pagamento'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 0
        end
        object DataEmissFim: TCMDateTimePicker
          Left = 13
          Top = 41
          Width = 96
          Height = 21
          Hint = 'Data Programada para Pagamento'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 374
        Top = 4
        Width = 119
        Height = 69
        Caption = ' Data Programada '
        TabOrder = 1
        object DataProgIni: TCMDateTimePicker
          Left = 11
          Top = 18
          Width = 96
          Height = 21
          Hint = 'Data Programada para Pagamento'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 0
        end
        object DataProgFim: TCMDateTimePicker
          Left = 11
          Top = 42
          Width = 96
          Height = 21
          Hint = 'Data Programada para Pagamento'
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
          ParentShowHint = False
          ShowHint = True
          ShowButton = True
          TabOrder = 1
        end
      end
      object GpTipoCobr: TGroupBox
        Left = 9
        Top = 4
        Width = 240
        Height = 68
        Caption = ' Contas/Caixas x Tipo de Cobrança '
        TabOrder = 2
        object CmbCobranca: TwwDBLookupCombo
          Left = 11
          Top = 18
          Width = 219
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrção')
          LookupTable = cdsFormaPag
          LookupField = 'CODPORTFORMA'
          Style = csDropDownList
          DropDownWidth = 300
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object GroupBox3: TGroupBox
        Left = 500
        Top = 5
        Width = 261
        Height = 68
        Caption = 'Tipo do Cliente'
        TabOrder = 3
        object dblkTipClie: TwwDBLookupCombo
          Left = 8
          Top = 19
          Width = 241
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO')
          DataField = 'IDTIPOCLIENTE'
          LookupTable = cdsTipoClie
          LookupField = 'IDTIPOCLIENTE'
          Options = [loTitles]
          Style = csDropDownList
          DropDownWidth = 300
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object GroupBox4: TGroupBox
        Left = 252
        Top = 74
        Width = 242
        Height = 55
        Caption = ' Mensagens '
        TabOrder = 4
        object CkbMensagens: TCheckBox
          Left = 12
          Top = 13
          Width = 100
          Height = 17
          Caption = 'Rateio\Alter.'
          TabOrder = 0
          OnClick = CkbMensagensClick
        end
        object CkbApaga: TCheckBox
          Left = 114
          Top = 12
          Width = 122
          Height = 17
          Caption = 'Apaga Existentes'
          TabOrder = 1
        end
        object ChkBoxHistoricoMsg: TCheckBox
          Left = 12
          Top = 32
          Width = 99
          Height = 17
          Caption = 'Histórico'
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 500
        Top = 74
        Width = 156
        Height = 55
        Caption = ' Tipo de Documento '
        TabOrder = 5
        object CmbTipoDoc: TwwDBLookupCombo
          Left = 8
          Top = 19
          Width = 138
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'Descrição')
          LookupTable = cdsTipoDoc
          LookupField = 'CODTIPDOC'
          Options = [loTitles]
          Style = csDropDownList
          DropDownWidth = 300
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
    inherited CPForCli: TCMProcuraForCli
      Left = 14
      Top = 79
      Width = 240
      Height = 55
    end
    object PageCobr: TPageControl
      Left = 5
      Top = 145
      Width = 779
      Height = 279
      ActivePage = TbsPend
      Align = alClient
      TabOrder = 2
      object TbsPend: TTabSheet
        Caption = 'Associa Documentos'
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 771
          Height = 121
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Panel5'
          TabOrder = 0
          object dbgrdDocPendentes: TwwDBGrid
            Left = 102
            Top = 25
            Width = 669
            Height = 96
            Selected.Strings = (
              'RAZAOSOCIAL'#9'60'#9'Nome'
              'NODOCUMENTO'#9'14'#9'Documento'
              'COMPLDOCUMENTO'#9'5'#9'Comp.'
              'DATAPROGRAMADA'#9'15'#9'Data Programada'
              'DATAEMISSAO'#9'9'#9'Data Emissão'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDocPendentes
            EditCalculated = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Small Fonts'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            IndicatorColor = icBlack
          end
          object Panel4: TPanel
            Left = 0
            Top = 25
            Width = 102
            Height = 96
            Align = alLeft
            TabOrder = 1
            object bbtnPgto: TBitBtn
              Left = 6
              Top = 13
              Width = 89
              Height = 27
              Caption = 'Inclui'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = bbtnPgtoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F88888888887F887E666666666608887888888F888878F7E66666F6666
                66087F8888878F88887F7E6666FFF66666087F88887778F8887F7E666FFFFF66
                66087F888777778F887F7E66FFFFFFF666087F8877777778887F7E6666666666
                660878F888888888887887E666666666608887F88888888887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              Layout = blGlyphRight
              NumGlyphs = 2
            end
            object bbtnPgtoParcial: TBitBtn
              Left = 6
              Top = 53
              Width = 89
              Height = 27
              Caption = 'Todos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = bbtnPgtoParcialClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888F88878F887E6666F6666
                608887F888878F8887F887E666FFF66660888788887778F8878F7E666FFFFF66
                66087F888777778F887F7E66FFFFFFF666087F8877777778887F7E66666F6666
                66087F8888878F88887F7E6666FFF66666087F88887778F8887F7E666FFFFF66
                660878F88777778F887887E6FFFFFFF6608887F87777777887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              Layout = blGlyphRight
              NumGlyphs = 2
            end
          end
          object Pnldocpendentes: TPanel
            Left = 0
            Top = 0
            Width = 771
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Caption = 'Documentos Pendentes para Cobrança'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 2
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 121
          Width = 771
          Height = 130
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'Panel2'
          TabOrder = 1
          object Label7: TLabel
            Left = 11
            Top = 14
            Width = 39
            Height = 13
            Caption = 'Label7'
          end
          object dbgrdAssoc: TwwDBGrid
            Left = 103
            Top = 26
            Width = 667
            Height = 103
            Selected.Strings = (
              'RAZAOSOCIAL'#9'60'#9'Nome'
              'NODOCUMENTO'#9'14'#9'Documento'
              'COMPLDOCUMENTO'#9'5'#9'Comp.'
              'DATAPROGRAMADA'#9'14'#9'Data Programada'
              'DATAEMISSAO'#9'10'#9'Data Emissão'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsDocAssoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
            ParentFont = False
            TabOrder = 0
            TitleAlignment = taCenter
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'Small Fonts'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = True
            IndicatorColor = icBlack
          end
          object Panel7: TPanel
            Left = 1
            Top = 26
            Width = 102
            Height = 103
            Align = alLeft
            TabOrder = 1
            object bbtnDesfazPgto: TBitBtn
              Left = 7
              Top = 11
              Width = 89
              Height = 27
              Caption = 'Exclui'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = bbtnDesfazPgtoClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F88888888887F887E6666666666088878888888888878F7E6666666666
                66087F888FFFFFFF887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
                66087F8887777788887F7E6666FFF66666087F8888777888887F7E66666F6666
                660878F888878888887887E666666666608887F88888888887F887E666666666
                6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              Layout = blGlyphRight
              NumGlyphs = 2
            end
            object bbtnConfirma: TBitBtn
              Left = 7
              Top = 51
              Width = 89
              Height = 27
              Caption = 'Todos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = bbtnConfirmaClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                8888888888FFFFF8888888888000008888888888F777778FF888888006666600
                88888887788888778F88887666666666088888788888888878F887E666666666
                608887F88FFFFFFF87F887E6FFFFFFF66088878877777778878F7E666FFFFF66
                66087F8887777788887F7E6666FFF66666087F8888777888887F7E66666F6666
                66087F888FF7FFFF887F7E66FFFFFFF666087F8877777778887F7E666FFFFF66
                660878F887777788887887E666FFF666608887F88877788887F887E6666F6666
                6088878F888788888788887EE666666608888878FF88888F788888877EEEEE77
                8888888778FFFF77888888888777778888888888877777888888}
              Layout = blGlyphRight
              NumGlyphs = 2
              Spacing = 2
            end
          end
          object Pnldocpago: TPanel
            Left = 1
            Top = 1
            Width = 769
            Height = 25
            Align = alTop
            BevelInner = bvLowered
            BevelWidth = 2
            Caption = 'Documentos Associados Com a Forma de Cobrança Selecionada'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Arial'
            Font.Style = [fsBold, fsItalic]
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TbsAssoc: TTabSheet
        Caption = 'Consulta'
        object Panel3: TPanel
          Left = 0
          Top = 30
          Width = 771
          Height = 94
          Align = alClient
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Documentos Associados e Pendentes Para Remessa'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 0
        end
        object DbgPendentesAssoc: TwwDBGrid
          Left = 0
          Top = 30
          Width = 771
          Height = 94
          Selected.Strings = (
            'NOME'#9'64'#9'Nome\Razão Social'
            'NODOCUMENTO'#9'20'#9'Documento'
            'COMPLDOCUMENTO'#9'6'#9'Comp.'
            'DATAPROGRAMADA'#9'15'#9'Data Programada'
            'DATAEMISSAO'#9'12'#9'Data Emissão')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = DsDocPendentesAssoc
          EditCalculated = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'Small Fonts'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          IndicatorColor = icBlack
        end
        object Panel6: TPanel
          Left = 0
          Top = 124
          Width = 771
          Height = 30
          Align = alBottom
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Mensagens Cadastradas Para o Documento Selecionado'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 2
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 771
          Height = 30
          Align = alTop
          BevelInner = bvLowered
          BevelWidth = 2
          Caption = 'Documentos Associados e Pendentes Para Remessa'
          Color = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          TabOrder = 3
        end
        object LbCnab: TListBox
          Left = 0
          Top = 154
          Width = 771
          Height = 97
          Align = alBottom
          ItemHeight = 13
          TabOrder = 4
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 429
    Width = 789
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 40036
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 75
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 75
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 78
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 443
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsDocPendentes: TwwDataSource
    AutoEdit = False
    DataSet = cdsDocPendentes
    Left = 281
    Top = 209
  end
  object DsDocAssoc: TwwDataSource
    AutoEdit = False
    DataSet = cdsDocAssoc
    Left = 645
    Top = 332
  end
  object DsDocPendentesAssoc: TwwDataSource
    AutoEdit = False
    DataSet = cdsDocPendentesAssoc
    OnDataChange = DsDocPendentesAssocDataChange
    Left = 281
    Top = 179
  end
  object DsMsg: TwwDataSource
    DataSet = cdsMsg
    Left = 282
    Top = 239
  end
  object cdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 415
    Top = 400
  end
  object cdsRateioDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 355
    Top = 400
  end
  object cdsFormaPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 385
    Top = 400
  end
  object cdsDocPendentes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 250
    Top = 209
  end
  object sqlDocPendentes: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        'P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO,D.D' +
        'ATAPROGRAMADA,D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFO' +
        'RCLI'
      'FROM'
      'PESSOA P, DOCUMENTO D'
      'WHERE 1=2')
    ClientDataSet = cdsDocPendentes
    Left = 221
    Top = 209
  end
  object cdsDocAssoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 615
    Top = 332
  end
  object sqlDocAssoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        'P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO,D.D' +
        'ATAPROGRAMADA,D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFO' +
        'RCLI'
      'FROM'
      'PESSOA P, DOCUMENTO D'
      'WHERE 1=2'
      '')
    ClientDataSet = cdsDocAssoc
    Left = 585
    Top = 332
  end
  object cdsDocPendentesAssoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 250
    Top = 179
  end
  object sqlDocPendentesAssoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        'P.RAZAOSOCIAL, D.NODOCUMENTO, D.COMPLDOCUMENTO,D.DATAEMISSAO,D.D' +
        'ATAPROGRAMADA,D.CODDOCUMENTO, D.EMISBLOQ, D.CODPORTFORMA, D.IDFO' +
        'RCLI'
      'FROM'
      'PESSOA P, DOCUMENTO D'
      'WHERE 1=2'
      '')
    ClientDataSet = cdsDocPendentesAssoc
    Left = 220
    Top = 179
  end
  object cdsTipoClie: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 620
    Top = 20
  end
  object sqlTipoClie: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  IDTIPOCLIENTE, DESCRICAO '
      'FROM '
      '  TIPOCLIENTE '
      'ORDER BY DESCRICAO'
      ''
      '')
    ClientDataSet = cdsTipoClie
    Left = 650
    Top = 20
  end
  object cdsTipoDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 595
    Top = 80
  end
  object sqlMsg: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDMENSAGENSCNAB, CODDOCUMENTO,'
      '  MENSAGEM1, MENSAGEM2, MENSAGEM3,'
      '  MENSAGEM4, MENSAGEM5, MENSAGEM6,'
      '  MENSAGEM7, MENSAGEM8, MENSAGEM9,'
      '  CODGRUPOCNAB'
      'FROM'
      '  MENSAGENSCNAB'
      'WHERE'
      '  CODDOCUMENTO = :CODDOCUMENTO')
    ClientDataSet = cdsMsg
    Left = 222
    Top = 239
  end
  object cdsMsg: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 252
    Top = 239
  end
end
